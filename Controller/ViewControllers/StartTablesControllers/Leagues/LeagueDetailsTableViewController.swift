//
//  LeagueDetailsTableViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 11/08/2022.
//

import UIKit

import SafariServices

class LeagueDetailsTableViewController: UITableViewController {

    @IBOutlet weak var leagueBannar: UIImageView!
    @IBOutlet weak var leagueBadge: UIImageView!
    
    @IBOutlet weak var colletionView: UICollectionView!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var alternateLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var sportLbl: UILabel!
    @IBOutlet weak var currentSeasonLbl: UILabel!
    @IBOutlet weak var eventDateLbl: UILabel!
    
    var league: League?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.isUserInteractionEnabled = false
        tableView.allowsSelection = false
        colletionView.delegate = self
        colletionView.dataSource = self
        guard let league = league else {
            return
        }

        if let banner = league.images.banner{
            leagueBannar.image = banner
        }
        if let badge = league.images.badge{
            leagueBadge.image = badge
        }
        
        
        nameLbl.text = league.name
        alternateLbl.text = league.alternate
        genderLbl.text = league.gender
        countryLbl.text = league.country
        sportLbl.text = league.sport
        currentSeasonLbl.text = league.currentSeason
        eventDateLbl.text = league.firstEventDate
        
//        self.colletionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "leagueCollectionViewCell")
//        

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == IndexPath(row: 0, section: 0){
            return 200
        }else if indexPath == IndexPath(row: 1, section: 0){
            return 45
        }
        
        return tableView.estimatedRowHeight
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsTableViewCell", for: indexPath) as! SportsTableViewCell
//
//    }
//
//

}

extension LeagueDetailsTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leagueCollectionViewCell", for: indexPath) as! LeagueWebsitesCollectionViewCell
        
        let link = league?.links[indexPath.row]
        
        if !link!["link"]!.isEmpty{
            cell.siteImage.image = UIImage(named: link!["image"]!)
        }else{
            cell.siteImage.image = nil
        }
        
        return cell
    }
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colletionView{
            return (league?.links.count)!

        }
        return 0
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let link = league?.links[indexPath.row]
        
        if link!["link"]!.isEmpty{
            return CGSize(width: 0, height: 0)
        }
            
        return CGSize(width: 35, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5 , left: 2, bottom: 5, right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let link = league?.links[indexPath.row]
        
        if link!["link"]!.isEmpty{
            return
        }
        var weblink = URLComponents(string: link!["link"]!)
        
        weblink?.scheme = "https"
        if let url = weblink?.url{
            let safaiVC = SFSafariViewController(url: url)
            present(safaiVC, animated: true)
            
        }
        
    }
    
    
    
}
