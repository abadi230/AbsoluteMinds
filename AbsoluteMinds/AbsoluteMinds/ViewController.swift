//
//  ViewController.swift
//  AbsoluteMinds
//
//  Created by Abdullah Bajaman on 21/11/2021.
//

import UIKit
import CoreData


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let api = Api()
    var photos : [UIImage] = []

    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        api.getData()
    }


    // function from protocol UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    // function from protocol UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookID", for: indexPath) as! bookCollectionCell
        
        return cell
    }


}

