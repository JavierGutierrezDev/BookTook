//
//  ContentView.swift
//  BookTok
//
//  Created by Javier Gutierrez on 30/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State var showCreateView : Bool = false
    @State private var editBook : Book?
    @Query(sort: \Book.author,order: .forward, animation: .smooth) private var books: [Book]

    var body: some View {
        NavigationStack{
            List{
                ForEach(books){ book in
                    HStack{
                        if let dataImage = book.image,
                           let uiImage = UIImage(data: dataImage){
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                
                        }
                        VStack(alignment: .leading){
                            
                            Text(book.title)
                                .font(.title2)
                                .foregroundStyle(.primary)
                            Text(book.author)
                                .font(.headline)
                                .foregroundStyle(.secondary)
                            
                            Text(book.bookDescription)
                                .font(.caption)
                            
                            
                            
                        }
                        .swipeActions{
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                context.delete(book)
                                
                            }
                        }
                        Spacer()
                        
                        Button {
                            editBook = book
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }

                    }
                }
                    
            }
            .navigationTitle("My books 📖")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem {
                    Button(action: {
                        showCreateView.toggle()
                    }, label: {
                       Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(width: 30, height: 30)
                }
            })
            .sheet(isPresented: $showCreateView, content: {
                CreateBookView()
                
            })
            .sheet(item: $editBook, onDismiss: {
                editBook = nil
            }) { editBook in
                UpdateBookView(  book: editBook)
            }
            

            
        }
    }
}

#Preview {
    ContentView()
}
