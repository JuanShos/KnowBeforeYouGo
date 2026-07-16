//
//  ViewController.swift
//  KnowBeforeYouGo
//
//  Created by Juanito Martinon on 7/15/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        // Create the tab bar controller
        let tabBarController = UITabBarController()
        
        // Create Map view controller
        let mapViewController = MapOfViewController()
        mapViewController.view.backgroundColor = .systemBackground
        mapViewController.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 0)
        
        // Create List view controller
        let listViewController = ListOfViewController()
        listViewController.view.backgroundColor = .systemBackground
        listViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "list.bullet"), tag: 1)
        
        // Add view controllers to tab bar
        tabBarController.viewControllers = [mapViewController, listViewController]
        
        // Add tab bar controller as a child
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.view.frame = view.bounds
        tabBarController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tabBarController.didMove(toParent: self)
    }
}
