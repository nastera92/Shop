//
//  CategoriesTableViewController.swift
//  Task.3.Shop
//
//  Created by Natalia Kapusta on 25/05/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    
    @IBAction func unwindToCategories(segue: UIStoryboardSegue) {
    }
    
    private var categorySet:[Category] = [Category(name:"HIP-HOP", image:"category_image_0.jpg"),
                                          Category(name:"POP", image:"category_image_1.jpg"),
                                          Category(name:"JAZZ", image:"category_image_2.jpg"),
                                          Category(name:"ELECTRONIC", image:"category_image_3.jpg"),]
    
    private var songSet0:[Song] = [Song(title: "Ironic", artist: "Alanis Morisette",price:0.99, image: "song_image_0.jpg", song: "song_0.mp3"),
                                   Song(title: "The Scientist", artist: "Coldplay",price:1.99, image: "song_image_1.jpg", song: "song_1.mp3"),
                                   Song(title: "Grenade", artist: "Bruno Mars",price:0.99, image: "song_image_2.jpg", song: "song_2.mp3"),
                                   Song(title: "1973", artist: "James Blunt",price:2.99, image: "song_image_3.jpg", song: "song_3.mp3")]
    
    private var songSet1:[Song] = [Song(title: "Kiss Me", artist: "Sixpence None the Richer",price:2.99, image: "song_image_4.jpg", song: "song_4.mp3"),
                                   Song(title: "Sleeping Satellite", artist: "Tasmin Archer",price:0.99, image: "song_image_5.jpg", song: "song_5.mp3"),
                                   Song(title: "Walk", artist: "Kwabs",price:1.99, image: "song_image_6.jpg", song: "song_6.mp3"),
                                   Song(title: "Pumpin Blood", artist: "NONONO",price:2.99, image: "song_image_7.jpg", song: "song_7.mp3")]
   
    private var songSet2:[Song] = [Song(title: "Be the One", artist: "Dua Lipa",price:0.99, image: "song_image_8.jpg", song: "song_8.mp3"),
                                   Song(title: "Monday", artist: "Matt Corby",price:0.99, image: "song_image_9.jpg", song: "song_9.mp3"),
                                   Song(title: "Wasn't Expecting That", artist: "Jamie Lawson",price:1.99, image: "song_image_10.jpg", song: "song_10.mp3"),
                                   Song(title: "Sugar", artist: "Francesco Yates",price:2.99, image: "song_image_11.jpg", song: "song_11.mp3")]
    
    private var songSet3:[Song] = [Song(title: "Kiss Me", artist: "Sixpence None the Richer",price:0.99, image: "song_image_4.jpg", song: "song_4.mp3"),
                                   Song(title: "Sleeping Satellite", artist: "Tasmin Archer",price:1.99, image: "song_image_5.jpg", song: "song_5.mp3"),
                                   Song(title: "Walk", artist: "Kwabs",price:1.99, image: "song_image_6.jpg", song: "song_6.mp3"),
                                   Song(title: "Pumpin Blood", artist: "NONONO",price:1.99, image: "song_image_7.jpg", song: "song_7.mp3")]
    



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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categorySet.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoriesTableViewCell
        cell.categoryNameLabel?.text = categorySet[indexPath.row].name
        cell.categoryImageView?.image = UIImage(named: categorySet[indexPath.row].image)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseCategory"{
            if let indexPaths = tableView?.indexPathForSelectedRow{
                let destinationController = segue.destination as! SongsTableViewController
                switch indexPaths.row{
                case 0:
                    destinationController.songSet = songSet0
                    destinationController.category = categorySet[0].name
                case 1:
                    destinationController.songSet = songSet1
                    destinationController.category = categorySet[1].name
                case 2:
                    destinationController.songSet = songSet2
                    destinationController.category = categorySet[2].name
                case 3:
                    destinationController.songSet = songSet3
                    destinationController.category = categorySet[3].name
                default: break
                }
            }
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
