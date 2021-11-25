//
//  FavouriteTableVC.swift
//  AbsoluteMinds
//
//  Created by بندر عبيد ثاري الرشيدي on 18/04/1443 AH.
//

import UIKit

class FavouriteTableVC: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var result = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    // Create
    func saveData(){
        do {
    } catch {
    print("Unable to save")
      }
    }
    
    //Update
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //self.result[indexPath.row].name = textBox?.text
        self.saveData()
        self.fetchDataFromDB()
        do { try! self.context.save(); self.fetchDataFromDB()}
        
    }
    
    
   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
    
    
    //Read
    func fetchDataFromDB(){
    let request = Book.fetchRequest()
        do {
        result = try! context.fetch(request)
        //TDOD: if you want to display data in tableView Reload tableview tableView.reloadData()
        }
   }
    
    
    // Delete
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { let actionDelete = UIContextualAction(style: .destructive, title: "Delete") { _, _, handler in
    let itemToDelete = self.result[indexPath.row]
    self.context.delete(itemToDelete)
    self.saveData()
    self.fetchDataFromDB()
    }
    return UISwipeActionsConfiguration(actions: [actionDelete]) }
}


