//
//  Core.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 10/02/22.
//

import Foundation


/// Used to control the states of the {isFirstLaunch} with a singleton.
class Core {
    static let shared = Core()
    let standard = UserDefaults.standard
    
    func isFirstLauch() -> Bool {
        return !standard.bool(forKey: "isFirstLaunch")
    }
    
    func setIsFirstLaunch() {
        standard.set(true, forKey: "isFirstLaunch")
    }
    
    func resetIsFirstLaunch() {
        standard.set(false, forKey: "isFirstLaunch")
    }
}
