//
//  EpisodeManager.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 08/02/22.
//

import Foundation

struct EpisodeManager {
    func getAllEps(page: Int, completion: @escaping(Episodes) -> Void) {
            guard let url = URL(string: "https://rickandmortyapi.com/api/episode?page=\(page)") else { return }
            
            let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print("Error fetching episodes: \(error.localizedDescription)")
                }
                
                guard let epsData = data else { return }
                let decoder = JSONDecoder()
                
                do {
                    let decodedData = try decoder.decode(Episodes.self, from: epsData)
                    completion(decodedData)
                    //print(decodedData)
                } catch {
                    print("Error decoding data.")
                }
            }
            dataTask.resume()
    }
}
