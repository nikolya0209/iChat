//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by MacBookPro on 07.05.2021.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let fillImageView = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstrints()
    }
    
    
}
//MARK: - setup constrints
extension SetupProfileViewController {
    private func setupConstrints() {
        
        fillImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fillImageView)
        
        
        NSLayoutConstraint.activate([
            
            fillImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fillImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
        ])
        
    }
}


//MARK: - SwiftUI
    import SwiftUI

    struct SetupProfileViewControllerProvider: PreviewProvider {
        static var previews: some View {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
        
        struct ContainerView: UIViewControllerRepresentable {
            let setupProfileViewController = SetupProfileViewController()
            
            func makeUIViewController(context: Context) -> some UIViewController {
                return setupProfileViewController
            }
            func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
                
            }
        }
    }
