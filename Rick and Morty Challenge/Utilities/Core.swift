//
//  Core.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 10/02/22.
//

import Foundation

class Core {
    static let shared = Core()
    let standard = UserDefaults.standard
    
    func isFirstLauch() -> Bool {
        return !standard.bool(forKey: "isFirstLaunch")
    }
    
    func setIsFirstLaunch() {
        standard.set(true, forKey: "isFirstLaunch")
    }
}
