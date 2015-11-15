//
//  AssetTableViewController.swift
//  InCaseBeta
//
//  Created by Javid Beykzadeh on 11/11/15.
//  Copyright © 2015 JavidCode. All rights reserved.
//

import UIKit

class AssetTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var assets = [Asset]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // Load any saved meals, otherwise load sample data.
        if let savedAssets = loadAssets() {
            assets += savedAssets
        } else {
            // Load the sample data.
            loadSampleAssets()
        }
    }

        func loadSampleAssets() {
            
            let photo1 = UIImage(named: "meal1")!
            let meal1 = Asset(name: "Caprese Salad", desc: "Good food", photo: photo1)!
            
            let photo2 = UIImage(named: "meal2")!
            let meal2 = Asset(name: "Chicken and Potatoes", desc: "Good food", photo: photo2)!
            
            let photo3 = UIImage(named: "meal3")!
            let meal3 = Asset(name: "Pasta with Meatballs", desc: "Good food", photo: photo3)!
            
            assets += [meal1, meal2, meal3]
        }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return assets.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "AssetTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AssetTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let asset = assets[indexPath.row]

        
        cell.nameLabel.text = asset.name
        cell.descBox.text = asset.desc
        cell.photoImageView.image = asset.photo
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            assets.removeAtIndex(indexPath.row)
            saveAssets()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let assetDetailViewController = segue.destinationViewController as!
            AssetViewController
            
            // Get the cell that generated this segue.
            if let selectedAssetCell = sender as? AssetTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedAssetCell)!
                let selectedAsset = assets[indexPath.row]
                assetDetailViewController.asset = selectedAsset
                
                
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new asset.")
        }
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AssetViewController, asset = sourceViewController.asset {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing asset.
                assets[selectedIndexPath.row] = asset
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                // Add a new asset.
                let newIndexPath = NSIndexPath(forRow: assets.count, inSection: 0)
                assets.append(asset)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
                    // Save the meals.
                    saveAssets()
        }
    }
    // MARK: NSCoding
    func saveAssets() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(assets, toFile: Asset.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save assets...")
        }
        
    }
        func loadAssets() -> [Asset]? {
            return NSKeyedUnarchiver.unarchiveObjectWithFile(Asset.ArchiveURL.path!) as? [Asset]
        
    }
    
}



















