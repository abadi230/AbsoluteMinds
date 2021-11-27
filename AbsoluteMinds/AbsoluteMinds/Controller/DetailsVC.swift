//
//  DetailsVC.swift
//  AbsoluteMinds
//
//  Created by Mohammed Mabruk on 18/04/1443 AH.
//

import UIKit

class DetailsVC: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var result = [Book]()
    var  bookTitle : String = " book"
    var  bookAuthors  : String = " New Authors "
    var bookDate : String = "12/2.2022"
    var bookDescription: String = ""

    var bookImage : UIImage?
    var bookURLImage : String?
    
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
        imageVeiw.image = bookImage
        scrollLable.text = bookDescription
        


    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
        let newBook = Book(context: context)
        newBook.detail = bookDescription
        newBook.title = bookTitle
        newBook.publishedData = bookDate
        newBook.authors = bookAuthors
        newBook.imageLinks = bookURLImage
        
        do {
            
        }
        
    }
    

}

