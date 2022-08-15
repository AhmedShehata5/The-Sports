//
//  SportsTableViewCell.swift
//  TheSports
//
//  Created by Ahmed Shehata on 09/08/2022.
//

import UIKit

class SportsTableViewCell: UITableViewCell {

    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportNameLabel: UILabel!
    
    
    @IBOutlet weak var selectionImage: UIImageView!
    
    var isSportSelected = false{
        didSet{
            if isSportSelected{
                selectionImage.image = UIImage(systemName: "checkmark.circle")
                selectionImage.tintColor = .systemGreen

                
            }else{
                selectionImage.image = nil //UIImage(systemName: "circle")
//                selectionImage.tintColor = .white


            }
            
        }
    }


    
}
