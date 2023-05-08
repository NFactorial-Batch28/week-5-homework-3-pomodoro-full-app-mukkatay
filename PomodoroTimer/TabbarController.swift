//
//  TabbarController.swift
//  PomodoroTimer
//
//  Created by Akyl Mukatay  on 06.05.2023.
//

import UIKit

class TabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        tabBar.tintColor = .green
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            wrapInNavigationController(with: MainView(), tabTitle: "Search", tabImage: UIImage(systemName: "magnifyingglass")!.withTintColor(.white)),
            wrapInNavigationController(with: SettingsView(), tabTitle: "Home", tabImage: UIImage(systemName: "house")!),
            wrapInNavigationController(with: HistoryView(), tabTitle: "Profile", tabImage: UIImage(systemName: "person")!)
        ]
    }

    func wrapInNavigationController(with rootViewController: UIViewController,
                                    tabTitle: String,
                                    tabImage: UIImage) -> UINavigationController
    {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.tabBarItem.image = tabImage
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationController?.title = tabTitle
        return navigationController
    }
}
