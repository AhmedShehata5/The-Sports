//
//  PreferedLeaguesTableViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 10/08/2022.
//

import UIKit

class PreferedLeaguesTableViewController: UITableViewController {
    
    var preferedLeagues: [League] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let files = Files(archiveURL: .PreferedLeagues)
        guard let leagues = files.loadModels(Array<League>.self), leagues.count != 0 else {
            return
            
        }
        
        preferedLeagues = leagues

 
        for leagueIndex in 0...preferedLeagues.count-1 {
            Task{
                let banner = preferedLeagues[leagueIndex].banner
                if let banner = banner{
                    let bannerRequest = try await Request.featchImage(from: banner)

                    preferedLeagues[leagueIndex].images.banner = bannerRequest
//                                files.saveToFiles(leagues)

                    tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                    
                }
                
            }
            
            Task{
                let badge = preferedLeagues[leagueIndex].badge
                if let badge = badge{
                    let badgeRequest = try await Request.featchImage(from: badge)

                    preferedLeagues[leagueIndex].images.badge = badgeRequest
//                                files.saveToFiles(leagues)

                    tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                    
                }
                
            }
            
            Task{
                let logo = preferedLeagues[leagueIndex].logo
                if let logo = logo{
                    let logoRequest = try await Request.featchImage(from: logo)

                    preferedLeagues[leagueIndex].images.logo = logoRequest
//                                files.saveToFiles(leagues)

                    tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                    
                }
                
            }
            
            Task{
                let poster = preferedLeagues[leagueIndex].poster
                if let poster = poster{
                    let posterRequest = try await Request.featchImage(from: poster)

                    preferedLeagues[leagueIndex].images.poster = posterRequest
                    
//                                files.saveToFiles(leagues)
                    tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                    
                }
                
            }
            
            Task{
                let trophy = preferedLeagues[leagueIndex].trophy
                if let trophy = trophy{
                    let trophyRequest = try await Request.featchImage(from: trophy)

                    preferedLeagues[leagueIndex].images.trophy = trophyRequest
//                                files.saveToFiles(leagues)

                    tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                    
                }
                
            }

            
            
            
        }
        
        tableView.reloadData()
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        
    }



    @IBAction func addPreferedLeague(_ sender: UIBarButtonItem) {
        let sportsVC = storyboard?.instantiateViewController(withIdentifier: "SportsViewController") as! SportsTableViewController
        
        navigationController?.pushViewController(sportsVC, animated: true)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return preferedLeagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreferedLeaguesCell", for: indexPath) as! PreferedLeagueTableViewCell

        // Configure the cell...
        let league = preferedLeagues[indexPath.row]
        
        cell.leageNameLabel.text = league.name
        cell.leagueAletenateLabel.text = league.alternate
        print(league.images.badge)
        cell.leagueImage.image = league.images.badge
            
        
//        else{
//            cell.leagueImage.image = UIImage(systemName: "camera.macro")
//            cell.leagueImage.tintColor = .white
//        }

        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            preferedLeagues.remove(at: indexPath.row)
            let files = Files(archiveURL: .PreferedLeagues)
            
            files.saveToFiles(preferedLeagues)

            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let preferedLeague = preferedLeagues[indexPath.row]
        
        let leagueVC = storyboard?.instantiateViewController(withIdentifier: "LeagueDatailsVC") as! LeagueDetailsTableViewController
        leagueVC.league = preferedLeague
        
        navigationController?.pushViewController(leagueVC, animated: true)
        
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
