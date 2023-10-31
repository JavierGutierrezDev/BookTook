//
//  UpdateBookView.swift
//  BookTok
//
//  Created by Javier Gutierrez on 31/10/23.
//

import SwiftUI
import PhotosUI
struct UpdateBookView: View {
    @Environment (\.dismiss) var dismiss
    @Bindable var book : Book
    @State private var selectedPhoto : PhotosPickerItem?

    var body: some View {
        List{
            TextField("Title", text: $book.title)
            TextField("Author", text: $book.author)
            TextEditor(text: $book.bookDescription)
            //ImagePicker para la imagen del libro
            
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
            Button {
                dismiss()
            } label: {
                Label("Save changes", systemImage: "square.and.arrow.down.on.square")
                
            }
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                book.image = data
            }
        }
    }
}

