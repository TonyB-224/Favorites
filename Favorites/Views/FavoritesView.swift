//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                
                if favoriteCities.isEmpty && favoriteHobbies.isEmpty && favoriteBooks.isEmpty {
                    Text("No favorites yet")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    
                    if !favoriteCities.isEmpty {
                        sectionTitle("Cities")
                        
                        ForEach(favoriteCities) { city in
                            CityCardView(city: city)
                        }
                    }
                    
                    if !favoriteHobbies.isEmpty {
                        sectionTitle("Hobbies")
                        
                        ForEach(favoriteHobbies) { hobby in
                            HobbyRowView(hobby: hobby)
                        }
                    }
                    
                    if !favoriteBooks.isEmpty {
                        sectionTitle("Books")
                        
                        ForEach(favoriteBooks) { book in
                            BookRowView(book: book)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    private var favoriteCities: [CityModel] {
        favorites.cities.filter { $0.isFavorite }
    }
    
    private var favoriteHobbies: [HobbyModel] {
        favorites.hobbies.filter { $0.isFavorite }
    }
    
    private var favoriteBooks: [BookModel] {
        favorites.books.filter { $0.isFavorite }
    }
    
    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
