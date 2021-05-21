//
//  MainTabBarController.swift
//  iChat
//
//  Created by MacBookPro on 08.05.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    private let currentUser: MUser
    init(currentUser: MUser = MUser(username: "ssa",
                                    email: "ssa",
                                    avatarStringURL: "ssa",
                                    description: "ssa",
                                    sex: "ssa",
                                    id: "ssa")) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController(currentUser: currentUser)
        let peopleViewController = PeopleViewController(currentUser: currentUser)
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)!
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!

        viewControllers = [
        
            generaiteNavigationController(rootviewController: peopleViewController, title: "People", image: peopleImage),
            generaiteNavigationController(rootviewController: listViewController, title: "Conversations", image: convImage)
            
            
        ]
    }
    
    private func generaiteNavigationController(rootviewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootviewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
    
}
