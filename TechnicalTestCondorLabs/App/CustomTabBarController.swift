//
//  CustomTabBarController.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let breedsController = ListOfBreedsViewController(viewModel: (AppDelegate.shared?.dependencyInjector.container.resolve(BreedsViewModel.self)!)!)
        let mainNavController = UINavigationController(rootViewController: breedsController)
        mainNavController.tabBarItem.title = "Breeds"
        
        let likesViewController = LikesViewController(viewModel: (AppDelegate.shared?.dependencyInjector.container.resolve(LikesViewModel.self)!)!)
        let likesNavController = UINavigationController(rootViewController: likesViewController)
        likesNavController.tabBarItem.title = "Likes"
        
        viewControllers = [mainNavController, likesNavController]
    }

}
