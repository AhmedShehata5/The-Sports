//
//  SportsCollectionViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 11/08/2022.
//

import UIKit

private let reuseIdentifier = "SportsCollectionViewCell"

class SportsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var sports: [Sport] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let files = Files(archiveURL: .Sports)
        let sports = files.loadModels(Array<Sport>.self)
        if let sports = sports {
            self.sports = sports
            
            for sportIndex in 0...self.sports.count-1{
                Task{
                    do{
                        let sport = self.sports[sportIndex]
                        self.sports[sportIndex].images.icon = try await Request.featchImage(from: sport.iconUrl)
                        self.sports[sportIndex].images.image = try await Request.featchImage(from: sport.imageUrl)

                        let files = Files(archiveURL: .Sports)
                        
                        files.saveToFiles(sports)
                        
//                        collectionView.reloadRows(at: [IndexPath(row: sportIndex, section: 0)])

                        
                    }catch{
                        self.sports[sportIndex].images.icon = nil
                    }
                    collectionView.reloadData()

                }
            }
            
            
            
        }
        // Uncomment the following line to preserve selection between presentations

    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sports.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SportsCollectionViewCell
    
        let sport = sports[indexPath.row]
        // Configure the cell
        cell.backgroundColor = .none
        
        cell.cellImage.image = sport.images.icon
        cell.cellLabel.text = sport.name
        
        
    
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (SCREENWIDTH / 3) - 20, height: (SCREENHEIGHT/6) - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sport = sports[indexPath.row]
        
        let showSportVC = storyboard?.instantiateViewController(withIdentifier: "ShowSportDeatials") as! SportDeatailsTableViewController
        
        showSportVC.sport = sport
        
        navigationController?.pushViewController(showSportVC, animated: true)
    }
    
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
