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
    @State private var selectedPhoto : PhotosPickerItem?
    var body: some View {
        Form(content: {
            TextField("Title", text: $book.title)
            TextField("Author", text: $book.author)
            TextEditor(text: $book.bookDescription)
            
                
            if let bookImage = book.image,
                    let uiImage = UIImage(data: bookImage){
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                }
                
                
                PhotosPicker(selection: $selectedPhoto,
                             matching: .images,
                             photoLibrary: .shared()
                ) {
                    Label(" \((book.image != nil) ? "Replace" : "Add") image of the book", systemImage: "photo")
                }
            
            Section{
                Button {
                    context.insert(book)
                    dismiss()
                } label: {
                    Label("Add Book", systemImage: "book.closed")
                    
                }
                
            }

        })
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                book.image = data
            }
        }
    }
}


