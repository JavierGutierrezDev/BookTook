//
//  Book.swift
//  BookTok
//
//  Created by Javier Gutierrez on 30/10/23.
//

import Foundation
import SwiftData
@Model
class Book {
    var title : String
    var author : String
    var bookDescription : String
    @Attribute(.externalStorage) var image : Data?
    
    init(title: String = "", author: String = "", bookDescription: String = "", image: Data? = nil) {
        self.title = title
        self.author = author
        self.bookDescription = bookDescription
        self.image = image
    }
}
