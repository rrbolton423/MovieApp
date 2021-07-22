//
//  MoviesView.swift
//  MovieApp
//
//  Created by Romell Bolton on 7/22/21.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var network = Network()
    
    var body: some View {
        NavigationView {
            VStack {
                List(network.movies.results) { movie in
                    NavigationLink(
                        destination: MovieDetailView(movie: movie)) {
                            MovieRow(movie: movie)
                        }
                }
            }
            .navigationTitle(Text("Movies"))
            .alert(isPresented: self.$network.showNetworkError, content: {
                Alert(title: Text("Error"), message: Text(self.network.confirmationMessage), dismissButton: .default(Text("OK")))
            })
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
