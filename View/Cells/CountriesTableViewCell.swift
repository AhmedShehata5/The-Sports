//
//  CountriesTableViewCell.swift
//  TheSports
//
//  Created by Ahmed Shehata on 09/08/2022.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    
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
