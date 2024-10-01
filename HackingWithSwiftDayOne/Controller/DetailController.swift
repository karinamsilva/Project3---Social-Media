//
//  DetailCell.swift
//  HackingWithSwiftDayOne
//
//  Created by Karina on 16/09/24.
//

import UIKit

class DetailController: UIViewController {
    weak var coordinator: Coordinator?
    
    var imageName = String()
    
    let stormImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func setTitle(total: Int, current: Int) {
        title = "Picture \(current) of \(total)"
    }
    
    func setupImage(using text: String) {
        stormImage.image = UIImage(named: text)
        navigationItem.largeTitleDisplayMode = .never
        imageName = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    
    @objc func shareTapped() {
        guard let image = stormImage.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
            
        }
        
        let controller = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        controller.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(controller, animated: true)
    }
    
    private func setupView() {
        view.addSubview(stormImage)
        
        stormImage.topAnchor(to: view.topAnchor)
        stormImage.leadingAnchor(to: view.leadingAnchor, constant: 5)
        stormImage.trailingAnchor(to: view.trailingAnchor)
        stormImage.bottomAnchor(to: view.bottomAnchor)
    }
}
