//
//  FavVC.swift
//  AbsoluteMinds
//

//  Created by بندر عبيد ثاري الرشيدي on 28/11/2021.
//
import UIKit
import CoreData

class FavVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var result = [Book?]()
    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell", for: indexPath) as! FavBookCell

        cell.bookTitle.text = result[indexPath.row]?.title
//        cell.bookImage.image = result[indexPath.row]?.image
        if let imageData = result[indexPath.row]?.imageData {
        cell.bookImage.image = UIImage(data: imageData)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
        tableView.register(UINib(nibName: "FavBookCell", bundle: nil), forCellReuseIdentifier: "FavCell")
        fetchDataFromDB()
//        for (index, book) in result.enumerated() {
//            print("i: \(index), \(book?.title)")
//
//        }
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    //Read
    func fetchDataFromDB(){
        //fetch the saved image from the core data
        let request = Book.fetchRequest()

        do {
            result = try! context.fetch(request)
        }
        
        tableView.reloadData()

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

