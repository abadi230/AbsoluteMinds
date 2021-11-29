//
//  DetailsVC.swift
//  AbsoluteMinds
//
//  Created by Mohammed Mabruk on 18/04/1443 AH.
//

import UIKit
import CoreData

class DetailsVC: UIViewController {
    
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  var result = [Book]()
    
  var bookTitle : String = " book"
  var bookAuthors : String = " New Authors "
  var bookDate : String = "12/2.2022"
  var bookDescription: String = ""
  var bookImage : UIImage?
  var bookImgData : Data?
    
  @IBOutlet weak var scrollLable: UILabel!
  @IBOutlet weak var titlelLable: UILabel!
  @IBOutlet weak var authorLable: UILabel!
  @IBOutlet weak var dateLable: UILabel!
  @IBOutlet weak var imageVeiw: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
   titlelLable.text = bookTitle
    authorLable.text = bookAuthors
    dateLable.text = bookDate
      if let bookImgData = bookImgData {
          imageVeiw.image = UIImage(data: bookImgData)

      }
    scrollLable.text = bookDescription
  }
  @IBAction func btnAdd(_ sender: Any) {
      // save book image in CoreData
    let newBook = Book(context: context)
    newBook.detail = bookDescription
    newBook.title = bookTitle
    newBook.publishedData = bookDate
    newBook.authors = bookAuthors
//    newBook.imageLinks = image
    do {
      try context.save()
    }catch{
      print("Unable to Save")
    }

    performSegue(withIdentifier: "segFav", sender: self)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segFav"{
//      let favVC = segue.destination as! FavVC
//      favVC.result.append(result.last ?? nil)
    }
  }

}
