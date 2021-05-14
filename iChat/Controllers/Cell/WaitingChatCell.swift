//
//  WaitingChatCell.swift
//  iChat
//
//  Created by MacBookPro on 14.05.2021.
//

import UIKit



class WaitingChatCell: UICollectionViewCell, SelfconfiguringCell {
    static var reuseId: String = "WaitingChatCell"

    let friendImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .yellow

        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        setupConstraints()
    }

    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
    }

    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)

        NSLayoutConstraint.activate([

            friendImageView.topAnchor.constraint(equalTo: self.topAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SwiftUI
import SwiftUI

struct WaitingChatCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let mainTabBarController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return mainTabBarController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
