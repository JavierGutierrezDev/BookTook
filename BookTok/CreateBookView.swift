//
//  CreateBookView.swift
//  BookTok
//
//  Created by Javier Gutierrez on 31/10/23.
//

import SwiftUI
import SwiftData
import PhotosUI
struct CreateBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var book = Book()
    var body: some View {
        Form(content: {
            TextField("Title", text: $book.title)
            TextField("Author", text: $book.author)
            TextEditor(text: $book.bookDescription)
                
            //ImagePicker para la imagen del libro
            Button {
                context.insert(book)
                dismiss()
            } label: {
                Label("Add Book", systemImage: "book.closed")
                
            }


        })
    }
}


