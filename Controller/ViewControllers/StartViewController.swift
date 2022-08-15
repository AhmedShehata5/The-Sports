//
//  ViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - IBOuetlets
    @IBOutlet weak var topConstrant: NSLayoutConstraint!
    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var heyLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    // MARK: - views
    
    
    override func viewWillAppear(_ animated: Bool) {
        let files = Files(archiveURL: .PreferedLeagues)
        let preferedLeagues = files.loadModels(Array<League>.self)
        
        if let preferedLeagues = preferedLeagues, preferedLeagues.count > 0{
            let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
            
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC, animated: true)
            return
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateView()
       
                
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape{
            topConstrant.constant = SCREENWIDTH / 4
            print("tanslate")

        }else{
            topConstrant.constant = SCREENHEIGHT / 4
            print("not translate")

        }
    }
    
    // MARK: - IBActions

    @IBAction func StartButtonTapped(_ sender: UIButton) {
        
        let sportsVC = storyboard?.instantiateViewController(withIdentifier: "SportsViewController") as! SportsTableViewController
        
        navigationController?.pushViewController(sportsVC, animated: true)
        
    }
    
    
    
    
    // MARK: - Helper Functions

    func updateView(){
        topConstrant.constant = SCREENHEIGHT
        
        superView.alpha = 0
        
        UIView.animate(withDuration: 2) {
            self.topConstrant.constant = SCREENHEIGHT / 5
            self.startButton.layer.cornerRadius = self.startButton.frame.height / 3
            self.startButton.layer.borderWidth = 2
            self.startButton.layer.borderColor = UIColor.white.cgColor
            
            self.superView.alpha = 1
            
            self.view.layoutIfNeeded()
        }
    }
}

