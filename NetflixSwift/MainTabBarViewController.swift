//
//  ViewController.swift
//  NetflixSwift
//
//  Created by Marcelo de Araújo on 22/12/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: UpcomingVC())
        let vc3 = UINavigationController(rootViewController: SearchVC())
        let vc4 = UINavigationController(rootViewController: DownloadsVC())
        
        vc1.title = "Home"
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.title = "Upcoming"
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.title = "Search"
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.title = "Downloads"
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

