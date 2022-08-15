//
//  CountriesTableViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 09/08/2022.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    var sport: Sport?
    
    var countries: [Country] = []
    
    var selectedCountry: Country?
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let files = Files(archiveURL: .Sports)
//
//        let sports = files.loadModels(Array<Sport>.self)
//        if let sports = sports {
//            print(sports)
//            print("done")
//        }else{
//            print("errrrr")
//        }
        
        nextButton.isEnabled = false
        
            Task{
                do{
                    let countriesRequest = try await ContriesRequest().featchData()
                    
                    countries = countriesRequest.countries
                    
                    let files = Files(archiveURL: .Countries)
                    
                    files.saveToFiles(countries)
                    
                    tableView.reloadData()
                    
                }catch{
                    
                }
            }
        

    }


    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIBarButtonItem) {
        let leaguesVC = storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController
        
        leaguesVC.sport = sport
        leaguesVC.country = selectedCountry
        
        navigationController?.pushViewController(leaguesVC, animated: true)
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableViewCell", for: indexPath) as! CountriesTableViewCell
        let country = countries[indexPath.row]
        
        cell.selectionStyle = .none
        cell.countryLabel.text = country.name
        // Configure the cell...
        
        if let selectedCountry = selectedCountry{
            if selectedCountry.name == country.name{
                print(selectedCountry.name)
                cell.isSportSelected = true
            }else{
                cell.isSportSelected = false
            }
        }
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = countries[indexPath.row]
        nextButton.isEnabled = true

        tableView.reloadData()

        

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
