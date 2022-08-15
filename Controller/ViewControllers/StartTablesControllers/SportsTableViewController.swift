//
//  SportsTableViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 09/08/2022.
//

import UIKit

class SportsTableViewController: UITableViewController {
    // MARK: - IBOutlets

    @IBOutlet weak var nextBarButton: UIBarButtonItem!
    
    
    var sports: [Sport] = []
    
    
    var selectedSport: Sport! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sports you May Prefer"
        nextBarButton.isEnabled = false

        sportsNerWorkRequest()
        
        
    }
    
    // MARK: - IBAction
    
  
    @IBAction func backBarButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBarButtonAction(_ sender: UIBarButtonItem) {
        let countriesVC = storyboard?.instantiateViewController(withIdentifier: "countriesTableViewController") as! CountriesTableViewController
        
        countriesVC.sport = selectedSport
        
        navigationController?.pushViewController(countriesVC, animated: true)
        
    }
    
    // Mark: - Helper Functions
    
    func sportsNerWorkRequest(){
        Task{
            do{
                let sportsRequest = try await SportsRequest().featchData()
                self.sports = sportsRequest.sports
                for sportIndex in 0...sports.count-1{
                    Task{
                        do{
                            let sport = sports[sportIndex]
                            sports[sportIndex].images.icon = try await Request.featchImage(from: sport.iconUrl)
                            
                            let files = Files(archiveURL: .Sports)
                            
                            files.saveToFiles(sports)
                            
                            tableView.reloadRows(at: [IndexPath(row: sportIndex, section: 0)], with: .none)

                            
                        }catch{
                            sports[sportIndex].images.icon = nil
                        }
                    }
                }
                
                
                self.tableView.reloadData()
            }catch{
                
            }
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sports.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsTableViewCell", for: indexPath) as! SportsTableViewCell


        // Configure the cell...
        let sport = sports[indexPath.row]
        cell.sportNameLabel.text = sport.name
        cell.selectionStyle = .none
        if let image = sport.images.icon{
            cell.sportImage.image = image
        }else{
            cell.sportImage.image = UIImage(systemName: "exclamationmark.icloud")
        }
        
        if let selectedSport = selectedSport{
            if selectedSport.name == sport.name{
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
        tableView.deselectRow(at: indexPath, animated: true)
            selectedSport = sports[indexPath.row]
            nextBarButton.isEnabled = true
//            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        
    }
    

}
