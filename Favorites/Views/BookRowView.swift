import SwiftUI

struct BookRowView: View {
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(book.bookTitle)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(book.bookAuthor)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button {
                favorites.toggleFavoriteBook(book: book)
            } label: {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .font(.title3)
                    .foregroundColor(book.isFavorite ? .red : .gray)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
    }
}

#Preview {
    BookRowView(
        book: BookModel(
            id: 1,
            bookTitle: "Sample Book",
            bookAuthor: "Sample Author",
            isFavorite: false
        )
    )
    .environmentObject(FavoritesViewModel())
}
