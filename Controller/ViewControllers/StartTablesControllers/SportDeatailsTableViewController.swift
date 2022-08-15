//
//  SportDeatailsTableViewController.swift
//  TheSports
//
//  Created by Ahmed Shehata on 11/08/2022.
//

import UIKit

class SportDeatailsTableViewController: UITableViewController {

    @IBOutlet weak var sportImage: UIImageView!
    
    @IBOutlet weak var sportIcon: UIImageView!
    
    @IBOutlet weak var sportName: UILabel!
    
    @IBOutlet weak var sportFormat: UILabel!
    
    @IBOutlet weak var sportDescription: UILabel!
    
    var sport: Sport?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sport = sport {
            navigationItem.title = sport.name
            navigationItem.leftBarButtonItem?.title = "Sports"
            print(sport)
            
            if let image = sport.images.image{
            sportImage.image = image
            }
            
            if let icon = sport.images.icon{
                sportIcon.image = icon
                sportIcon.layer.cornerRadius = sportIcon.frame.height / 2
                
            }
            
            
            sportName.text = sport.name
            sportFormat.text = sport.formate
            
            sportDescription.text = sport.description
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

  

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == IndexPath(row: 0, section: 0){
            return  200
            
        }else if indexPath == IndexPath(row: 1, section: 0){
            return 70
        }

        return tableView.estimatedRowHeight
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
