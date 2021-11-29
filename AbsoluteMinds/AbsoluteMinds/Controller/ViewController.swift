//  ViewController.swift
//  AbsoluteMinds
//
//  Created by Abdullah Bajaman on 21/11/2021.
//

import UIKit
import CoreData



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    var library = Library()
    var books : [Source] = []
    var booksInfo : [BookInfo] = []
    
    
//    var photos : [UIImage] = []
    var photos : [Data] = []
    private var observation : NSKeyValueObservation?
    
    deinit {
        print("Deinit observation")
        observation?.invalidate()
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "BookCVCell", bundle: nil), forCellWithReuseIdentifier: "BookCell")
        
        getData()
        
        collectionView.reloadData()
        
    }
    
    
    // function from protocol UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return books.count
    }
    // function from protocol UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create nip with custom cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as! BookCVCell
        // avoid out of range
        if (photos.indices.contains(0) && indexPath.row < photos.count){
//            cell.bookImage.image = photos[indexPath.row]
            cell.bookImage.image = UIImage(data: photos[indexPath.row])

        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bookDetails = (storyboard?.instantiateViewController(withIdentifier: "bookDetails")) as! DetailsVC
        
        let book = booksInfo[indexPath.row]
        
        if (photos.indices.contains(0) && indexPath.row < photos.count){
//            bookDetails.bookImage = UIImage(data: photos[indexPath.row])
            bookDetails.bookImgData = photos[indexPath.row]

        }
        
        bookDetails.bookTitle = book.title
        bookDetails.bookAuthors = (book.authors.map{$0}?.joined(separator: ", "))!
        bookDetails.bookDate = book.publishedDate ?? "-"
        bookDetails.bookDescription = book.description ?? "-"
        
        self.navigationController?.show(bookDetails, sender: nil)
    }
    
    @IBAction func longTapGesture(_ sender: UILongPressGestureRecognizer) {
        let cgPoint = sender.location(in: collectionView)

        guard let itemIndex = collectionView.indexPathForItem(at: cgPoint) else { return  }
        showAlert(cgPoint, itemIndex)
    }
    func addFavourite(_ index: IndexPath){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Save the image in core data
        
        let newBook = Book(context: context)
        let b = booksInfo[index.row]
        
        
        newBook.title = b.title
        newBook.authors = b.authors?.joined(separator: ", ")
        newBook.detail = b.description
        newBook.publishedData = b.publishedDate
//        newBook.image = photos[index.row]
        newBook.imageData = photos[index.row]
        
        
        
        do {
             try context.save()
        }catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        debugPrint("Book Added to you favourite")
        
    }
    
    func showAlert(_ cgPoint: CGPoint, _ itemIndex: IndexPath){
        let alert = UIAlertController(title: "Add to Favourite", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {_ in
            self.addFavourite(itemIndex)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        DispatchQueue.main.async {
            self.present(alert, animated: false, completion: nil)
        }
    }
    
    func getData() {
        
        let headers = [
            "x-rapidapi-host": "google-books.p.rapidapi.com",
            "x-rapidapi-key": "ef0d0f69cbmsh71b92f587dcbfbfp1a7701jsn5f5fae649978"
        ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "google-books.p.rapidapi.com"
        urlComponents.path = "/volumes"
        
        
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.allHTTPHeaderFields = headers
        
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: urlRequest as URLRequest) { (data: Data?, res: URLResponse?, err: Error?) in
            do {
                // After you get all the info from API
                
                // Decode
                let jsonDecoder = JSONDecoder()
                if let data = data {
//                    print(String(data: data, encoding: .utf8))
                    let decodedRes = try jsonDecoder.decode(Library.self, from: data)
                    // Fill the local array / object
                    self.books = decodedRes.items

                } else {
                    print("No data")
                }
                
                
//                UIProgressView
                
                
                // Reload the UI to show the new data fetched from API
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    print("Books loaded to view: \(self.books.count)")
                }
                for book in self.books {
                    self.booksInfo.append(book.volumeInfo)
                    if let bookImageString = book.volumeInfo.imageLinks?["thumbnail"] {
                        self.getBookImg(bookImage: bookImageString)
                    }
                }
                
            }catch {
                print("data not found \(error)")
            }
        }
        task.resume()
        observation = task.progress.observe(\.fractionCompleted) { progress, _ in
            print("Loading progress: \(progress.fractionCompleted)")
            print("Error: \(task.error?.localizedDescription)")
            // output: Error: Optional("The Internet connection appears to be offline.")

            print("Status: \(progress.localizedDescription)")
        }
    }
    
    func getBookImg(bookImage: String?) {
        
        // to avoid forse unwrap
        if let bookImage = bookImage {
            // change scheme
            var bookImageURLComp = URLComponents(string: bookImage)
            bookImageURLComp?.scheme = "https"
            let urlImageSession = URLSession.shared
            // send request
            let imageTask = urlImageSession.dataTask(with: (bookImageURLComp?.url)!) { (data: Data?, res: URLResponse?, err: Error?) in
                // model responds
                if let data = data {
                    do {
//                      let imageBook = UIImage(data: data!)
                        let imageBook = data
                        // assign it to array
                        
                        self.photos.append(imageBook)
                        
                        // update ui to show one pic
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }

            }
            imageTask.resume()
        }
        
    }
}
