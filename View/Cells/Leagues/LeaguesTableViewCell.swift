//
//  LeaguesTableViewCell.swift
//  TheSports
//
//  Created by Ahmed Shehata on 10/08/2022.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var selectionImage: UIImageView!
    
    
    var isSportSelected = false{
        didSet{
            if isSportSelected{
                selectionImage.image = UIImage(systemName: "checkmark.circle")
                selectionImage.tintColor = .systemGreen

                
            }else{
                selectionImage.image = UIImage(systemName: "circle")
                selectionImage.tintColor = .white


            }

            
        }
    }

    
    
}
