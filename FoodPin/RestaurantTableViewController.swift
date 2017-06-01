//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 7/7/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurantNames = ["Hygiene", "Hands", "Beauty", "Health"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "teakha.jpg", "teakha.jpg"]
    
    var restaurantLocations = ["Lv 1", "Lv 2", "Lv 3", "Lv 1", "Lv 2"]
    
    var restaurantTypes = ["Boh", "Boh", "Boh", "A", "S"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
       // cell.locationLabel.text = restaurantLocations[indexPath.row]
       // cell.typeLabel.text = restaurantTypes[indexPath.row]

        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // Add Call action
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
            
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        // Check-in action
        // Determine the check in title. If the selected restaurant has been checked (i.e.
        // restaurantIsVisited[indexPath.row] returns true), the title will be set to "Undo Check in".
        let checkInTitle = restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            // Toggle check-in and undo-check-in
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
        })
        optionMenu.addAction(checkInAction)
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        // Display the menu
        present(optionMenu, animated: true, completion: nil)
    }
    */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            restaurantNames.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
        }
        
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        print("Total item: \(restaurantNames.count)")
        for name in restaurantNames {
            print(name)
        }
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
            
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            // Delete the row from the data source
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 255.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 50.0/255.0, green: 250.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowRecipeDetail"{
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let destinationController = segue.destination as! DetailViewController
                destinationController.restaurantImageName = restaurantImages[indexPath.row]
                
                let nameDestinationController = segue.destination as! DetailViewController
                nameDestinationController.restaurantDetailName = restaurantNames[indexPath.row]
                
                let locationDestinationController = segue.destination as! DetailViewController
                locationDestinationController.restaurantDetailLocation = restaurantLocations[indexPath.row]
                
                let typeDestinationController = segue.destination as! DetailViewController
                typeDestinationController.restaurantDetailType = restaurantTypes[indexPath.row]
                
              }
            
            
         }
        
    }
      
}
