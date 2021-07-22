//
//  Network.swift
//  MovieApp
//
//  Created by Romell Bolton on 7/22/21.
//

import Foundation

class Network: ObservableObject {
    @Published var movies = MovieList(results: [])
    @Published var showNetworkError = false
    @Published var confirmationMessage = ""
    
    private let apiKey = "8fd4ef3265d93db37099c1422dc5f6d9"
    private let apiUrlBase = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="
    
    init() {
        loadData()
    }
    
    private func loadData() {
        guard let url = URL(string: "\(self.apiUrlBase)\(self.apiKey)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                self.showNetworkError = true
                self.confirmationMessage = "\(error?.localizedDescription.lowercased() ?? "Unknown error")."
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let decodedMovies = try? decoder.decode(MovieList.self, from: data) {
                DispatchQueue.main.async {
                    self.movies = decodedMovies
                    self.showNetworkError = false
                }
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
}
