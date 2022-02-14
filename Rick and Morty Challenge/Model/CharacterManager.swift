//
//  CharacterManager.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 09/02/22.
//

import Foundation

struct CharacterManager {
    func getCharacter(url: String, completion: @escaping(Character) -> Void) {
            guard let url = URL(string: url) else { return }
            
            let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print("Error fetching characters: \(error.localizedDescription)")
                }
                
                guard let charData = data else { return }
                let decoder = JSONDecoder()
                
                do {
                    let decodedData = try decoder.decode(Character.self, from: charData)
                    completion(decodedData)
                    //print(decodedData)
                } catch {
                    print("Error decoding data.")
                }
            }
            dataTask.resume()
    }
}
