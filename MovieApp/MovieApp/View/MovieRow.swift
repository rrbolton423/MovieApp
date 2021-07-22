//
//  MovieRow.swift
//  MovieApp
//
//  Created by Romell Bolton on 7/22/21.
//

import SwiftUI
import URLImage

struct MovieRow: View {
    var movie: Movie
    var baseImageUrl = "https://image.tmdb.org/t/p/original/"
    var body: some View {
        HStack {
            URLImage(URL(string: "\(self.baseImageUrl)\(self.movie.posterPath)")!) { image in
                image.resizable()
            }
            .frame(width: 90, height: 120)
            
            VStack {
                HStack {
                    Text(self.movie.title)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                    Spacer()
                }
                .padding(.bottom)
                HStack {
                    Text(self.movie.releaseDate)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Rate: \(self.movie.voteAverage.format())")
                }
                HStack {
                    Text("Vote count: \(self.movie.voteCount)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text("Popularity: \(self.movie.popularity)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                Spacer()
            }
        }.frame(height: 130)
    }
}

extension Float {
    func format() -> String {
        return String(format: "%.2f", self)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie(popularity: 6952.15, voteCount: 3002, id: 497698, voteAverage: 8, title: "Black Widow", posterPath: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg", originalLanguage: "en", originalTitle: "Black Widow", adult: false, overview: "Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.", releaseDate: "2021-07-07"), baseImageUrl: "https://image.tmdb.org/t/p/original/")
    }
}
