//
//  UpdateBookView.swift
//  BookTok
//
//  Created by Javier Gutierrez on 31/10/23.
//

import SwiftUI

struct UpdateBookView: View {
    @Environment (\.dismiss) var dismiss
    @Bindable var book : Book
    var body: some View {
        List{
            TextField("Title", text: $book.title)
            TextField("Author", text: $book.author)
            TextEditor(text: $book.bookDescription)
            //ImagePicker para la imagen del libro
            Button {
                dismiss()
            } label: {
                Label("Save changes", systemImage: "square.and.arrow.down.on.square")
                
            }
        }
    }
}

