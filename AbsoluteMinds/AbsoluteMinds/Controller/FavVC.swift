//
//  FavVC.swift
//  AbsoluteMinds
//

//  Created by بندر عبيد ثاري الرشيدي on 28/11/2021.
//
import UIKit

class FavVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var result = [Book?]()

    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellBook", for: indexPath) as? BookCell
        cell?.titelLabel.text =  result[indexPath.row]?.title
//        cell?.ImageBook.image = bookPhotos[indexPath.row]
//        longperrs = indexPath.row
        
        return cell!
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { let actionDelete = UIContextualAction(style: .destructive, title: "Delete") { _, _, handler in
        let itemToDelete = self.result[indexPath.row]
        self.context.delete(itemToDelete!)
        self.saveData()
        self.fetchDataFromDB()
    }
        return UISwipeActionsConfiguration(actions: [actionDelete])

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self


        fetchDataFromDB()
    }


    //Read
    func fetchDataFromDB(){
        let request = Book.fetchRequest()
        do {
            result = try! context.fetch(request)
            tableView.reloadData()
        }
    }

    func saveData(){
        do {
            try context.save()
        } catch {
            print("Unable to save")
        }
        fetchDataFromDB()
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


class BookCell: UITableViewCell {

    @IBOutlet weak var ImageBook: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!

}
