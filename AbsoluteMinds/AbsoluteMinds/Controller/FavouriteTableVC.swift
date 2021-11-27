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
    
    let fackTitles = [
        "Ear, Nose, Throat, and Tracheobronchial Diseases in Dogs and Cats",
        "All Eye Cats",
        "Valentine Cappu & Cats",
        "Very British Cats",
        "I love Happy Cats",
        "Black CATS - Im Netz des Todes",
        "Vom Tod berührt - Die Black-Cats-Trilogie Socks, Gods, Cats and Demons - zweisprachige Ausgabe.",
        "Dr. Pitcairn's Complete Guide to Natural",
        "Health for Dogs & Cats",
        "Hemingway's Cats"
    ]
    let bookPhotos : [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        for item in fackTitles {
//            let newBook = Book(context: context)
//            newBook.title = item
//        }
//        for item in fakeImage {
//            let newBook = Book(context: context)
//            newBook.detail = item
//        }
        self.saveData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fackTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellBook", for: indexPath) as? BookCell
        cell?.titelLabel.text =  fackTitles[indexPath.row]
        cell?.ImageBook.image = bookPhotos[indexPath.row]
        
        return cell!
    }
    
    // Create
    
    func saveData(){
        do {
            try context.save()
        } catch {
            print("Unable to save")
        }
        fetchDataFromDB()
        tableView.reloadData()
    }
    
    //Update
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let alert = UIAlertController(title: "Edit", message: nil, preferredStyle: .alert)
       // self.result[indexPath.row].name = DisLabl?.text
        self.saveData()
        self.fetchDataFromDB()
        do { try! self.context.save(); self.fetchDataFromDB()
            
        }
        
      //alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
      //  DispatchQueue.main.async {
           // self.present(alert, animated: true, completion: nil)
        
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
    
    
    //Read
    func fetchDataFromDB(){
        let request = Book.fetchRequest()
        do {
            result = try! context.fetch(request)
            
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


class BookCell: UITableViewCell {
    
    
   // @IBOutlet weak var titelLabel: UILabel!
    
    @IBOutlet weak var ImageBook: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
//    @IBOutlet weak var titalDetal: UILabel!
}
