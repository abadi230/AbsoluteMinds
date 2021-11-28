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
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellBook", for: indexPath) as? BookCell
        let alert = UIAlertController(title: "Edit", message: "Are you sure you want to update the title", preferredStyle: .alert)
        alert.addTextField()
        let textBox = alert.textFields![0]
        
        
//        alert.addTextField { textField in
//            textField.placeholder = "Enter Book Title"
//            print("text: \(textField.text!) placeHolder: \(textField.placeholder)")
//            var textBox = textField.text![0]

        
        
        alert.addAction(UIAlertAction(title: "Submit", style: .destructive, handler: { UIAlertAction in
            self.result[indexPath.row]?.title = textBox.text
            
            self.saveData()
            self.fetchDataFromDB()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
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
}


class BookCell: UITableViewCell {

    @IBOutlet weak var ImageBook: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    
    
}
