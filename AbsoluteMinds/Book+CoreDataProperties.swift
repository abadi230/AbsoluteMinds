//
//  Book+CoreDataProperties.swift
//  AbsoluteMinds
//
//  Created by بندر عبيد ثاري الرشيدي on 19/04/1443 AH.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var authors: String?
    @NSManaged public var detail: String?
    @NSManaged public var imageLinks: String?
    @NSManaged public var publishedData: String?
    @NSManaged public var title: String?

}

extension Book : Identifiable {

}
