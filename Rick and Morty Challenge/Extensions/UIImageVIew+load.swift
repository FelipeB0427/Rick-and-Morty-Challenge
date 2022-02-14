//
//  UIImageVIew+load.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 13/02/22.
//

import UIKit

extension UIImageView {
    /// Needed to convert the string of the character image in a actual image using concurrency.
    /// - Parameter urlString: Recieves a String with the character URL.
    func load(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        self.image = UIImage(systemName: "questionmark")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
