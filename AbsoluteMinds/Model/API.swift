//
//  API.swift
//  AbsoluteMinds
//
//  Created by Abdullah Bajaman on 23/11/2021.
//

import Foundation
import UIKit

class Library : Codable {
var items : [Source] = []
//var totalItems : Double

}


struct Source: Codable{
var volumeInfo : BookInfo
var id : String
}

struct BookInfo : Codable{
var title: String
var authors : [String]?
var publishedDate : String?
var description: String?
var imageLinks: [String: String]?
}


    
    
