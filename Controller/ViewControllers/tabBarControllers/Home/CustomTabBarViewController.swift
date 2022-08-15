//
//  CustomTabBarViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 10/08/2022.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.selectedIndex = 0
        self.tabBar.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }

    
}

class CustomTabBar: UITabBar{

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.selectedItem =  self.items?[1]
        
        if let item = self.items?[1]{
            
            item.image = UIImage(systemName: "sportscourt")
            item.selectedImage = UIImage(systemName: "sportscourt.fill")
            
            
        }
        if let item = self.items?[0]{
            item.image = UIImage(systemName: "house")
            item.selectedImage = UIImage(systemName: "house.fill")
            
        }
        
        
       
    }

}

