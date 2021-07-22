//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Romell Bolton on 7/22/21.
//

import SwiftUI
import URLImage

struct MovieDetailView: View {
    var movie: Movie
    let baseImageUrl = "https://image.tmdb.org/t/p/original/"
    var body: some View {
        VStack {
            URLImage(URL(string: "\(self.baseImageUrl)\(self.movie.posterPath)")!) { image in
                image.resizable()
            }
            .frame(width: UIScreen.main.bounds.height / 8 * 3, height: UIScreen.main.bounds.height / 2)
            
            HStack {
                Text("Description:")
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(self.movie.overview)
                .lineLimit(nil)
                .padding(.bottom)
            HStack {
                Text("Popularity:")
                    .foregroundColor(.gray)
                Text(String(self.movie.popularity))
                    .lineLimit(nil)
                Spacer()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(self.movie.title, displayMode: .inline)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(popularity: 6952.15, voteCount: 3002, id: 497698, voteAverage: 8, title: "Black Widow", posterPath: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg", originalLanguage: "en", originalTitle: "Black Widow", adult: false, overview: "Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.", releaseDate: "2021-07-07"))
    }
}
