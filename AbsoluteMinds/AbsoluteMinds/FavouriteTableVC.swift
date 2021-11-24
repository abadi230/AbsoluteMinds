//
//  FavouriteTableVC.swift
//  AbsoluteMinds
//
//  Created by بندر عبيد ثاري الرشيدي on 18/04/1443 AH.
//

import UIKit

class FavouriteTableVC: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // instance from public class Book: NSManagedObject
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let b = alert.textFields![0]
       // textBox.text = resuit[indexPath.row].name
        
        let saveAtion = UIAlertAction(title: "save", style: .default, handler: {
            action in
          //  self.resuit[indexPath.row].name = textBox.text
            
            do { try!
                self.context.save()
                self.fetchDataFromDB()
                
            }
        })
        let cancelAtion = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(saveAtion)
        alert.addAction(cancelAtion)
        present(alert, animated: false, completion: nil)
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
    func fetchDataFromDB(){ // get the context
   // configure the request - NSFetchRequest
    let request = Book.fetchRequest()
   // sort data
   let sorting = NSSortDescriptor(key: "name", ascending: true)
   request.sortDescriptors = [sorting]
   // fetchREquest do {
   result = try! context.fetch(request)
   // TDOD: if you want to display data in tableView Reload tableview tableView.reloadData()
   }
}


