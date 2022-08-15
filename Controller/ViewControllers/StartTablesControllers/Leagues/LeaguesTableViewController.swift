//
//  LeaguesTableViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 09/08/2022.
//

import UIKit

class LeaguesTableViewController: UITableViewController {
    
    @IBOutlet weak var nextBarButton: UIBarButtonItem!

    
    
    var sport: Sport?
    var country: Country?
    
    var leagues:[League] = []
    
    var selectedLeague: League?

    override func viewDidLoad() {
        super.viewDidLoad()
        nextBarButton.isEnabled = false
//        let files = Files(archiveURL: .Countries)
//        let countries = files.loadModels(Array<Country>.self)
//
//        if let countries = countries {
//            print(countries)
//        }
        
        if let sport = sport, let country = country {
//            navigationItem.title
            Task{
                do{
                    let leaguesOfCountryRequest = LeaguesOfCountryRequest(country: country.name, sport: sport.name)
                    let leaguesRequest = try await leaguesOfCountryRequest.featchData()
                    leagues = leaguesRequest.leagues
                    
//                    let files = Files(archiveURL: .Leagues)

                    
                    for leagueIndex in 0...leagues.count-1 {
                        Task{
                            let banner = leagues[leagueIndex].banner
                            if let banner = banner{
                                let bannerRequest = try await Request.featchImage(from: banner)

                                leagues[leagueIndex].images.banner = bannerRequest
//                                files.saveToFiles(leagues)

                                tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                                
                            }
                            
                        }
                        
                        Task{
                            let badge = leagues[leagueIndex].badge
                            if let badge = badge{
                                let badgeRequest = try await Request.featchImage(from: badge)

                                leagues[leagueIndex].images.badge = badgeRequest
//                                files.saveToFiles(leagues)

                                tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                                
                            }
                            
                        }
                        
                        Task{
                            let logo = leagues[leagueIndex].logo
                            if let logo = logo{
                                let logoRequest = try await Request.featchImage(from: logo)

                                leagues[leagueIndex].images.logo = logoRequest
//                                files.saveToFiles(leagues)

                                tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                                
                            }
                            
                        }
                        
                        Task{
                            let poster = leagues[leagueIndex].poster
                            if let poster = poster{
                                let posterRequest = try await Request.featchImage(from: poster)

                                leagues[leagueIndex].images.poster = posterRequest
                                
//                                files.saveToFiles(leagues)
                                tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                                
                            }
                            
                        }
                        
                        Task{
                            let trophy = leagues[leagueIndex].trophy
                            if let trophy = trophy{
                                let trophyRequest = try await Request.featchImage(from: trophy)

                                leagues[leagueIndex].images.trophy = trophyRequest
//                                files.saveToFiles(leagues)

                                tableView.reloadRows(at: [IndexPath(row: leagueIndex, section: 0)], with: .none)
                                
                            }
                            
                        }

                        
                        
                        
                    }
                    
                    tableView.reloadData()
                    
                }catch{
                    
                }
            }
            
        }

            }
    
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIBarButtonItem) {
        
//        if let selectedLeague = selectedLeague {
        let files = Files(archiveURL: .PreferedLeagues)
        
        let preferedLeagues = files.loadModels(Array<League>.self)
        if var preferedLeagues = preferedLeagues {
            preferedLeagues.append(selectedLeague!)
            files.saveToFiles(preferedLeagues)


        }else{
            files.saveToFiles([selectedLeague])

        }
        

//        }
        
        
        let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell

        // Configure the cell...
        cell.selectionStyle = .none
        
        let league = leagues[indexPath.row]
        
        cell.leagueName.text = league.name
        
        if let leagueImage = league.images.badge{
            cell.leagueImage.image = leagueImage
        }else{
            cell.leagueImage.image = UIImage(systemName: "exclamationmark.icloud")
        }
        
        
        if let selectedLeague = selectedLeague {
            if selectedLeague.name == league.name{
                cell.isSportSelected = true
            }else{
                cell.isSportSelected = false
            }
        
        }
        


        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLeague = leagues[indexPath.row]
        print("did \(selectedLeague)")
        nextBarButton.isEnabled = true
        tableView.reloadData()
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
