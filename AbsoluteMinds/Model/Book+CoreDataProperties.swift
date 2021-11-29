//
//  Book+CoreDataProperties.swift
//  AbsoluteMinds
//
//  Created by Abdullah Bajaman on 29/11/2021.
//
//

import UIKit
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var authors: String?
    @NSManaged public var detail: String?
    @NSManaged public var imageData: Data?
    @NSManaged public var publishedData: String?
    @NSManaged public var title: String?
    @NSManaged public var image: UIImage?

}

extension Book : Identifiable {

}
