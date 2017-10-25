//
//  CartTableViewController.swift
//  Task.3.Shop
//
//  Created by Natalia Kapusta on 26/05/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    @IBOutlet var globalPrice:UILabel!

    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func closeCartPopover(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    class func priceCalc(instance:CartTableViewController){
        var global:Double = 0.0
        
        for (song, quant) in zip(Songs.shared.songsToBuy, Songs.shared.quantity){
            global += song.price*Double(quant)
        }
        instance.changeGlobalPrice(global: global)
    }
    
    func changeGlobalPrice(global:Double){
        globalPrice.text = "RAZEM " + String(global) + "$"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        CartTableViewController.priceCalc(instance: self)
        

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Songs.shared.songsToBuy.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        let song__ = Songs.shared.songsToBuy[indexPath.row]
        cell.artistL.text = song__.artist
        cell.titleL.text = song__.title
        cell.index = indexPath.row
        cell.price = song__.price
        cell.stepper.value = Double(Songs.shared.quantity[indexPath.row])
        cell.quantityL.text = "Ilość - " + String(Songs.shared.quantity[indexPath.row])
        let price_ = song__.price*Double(Songs.shared.quantity[indexPath.row])
        cell.priceL.text = String(price_) + "$"
        CartTableViewController.priceCalc(instance: self)
        cell.cart = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            Songs.shared.songsToBuy.remove(at: indexPath.row)
            Songs.shared.quantity.remove(at: indexPath.row)
            CartTableViewController.priceCalc(instance: self)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
