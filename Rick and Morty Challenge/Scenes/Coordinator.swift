//
//  Coordinator.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 08/02/22.
//

import Foundation
import UIKit

/// Protocol used to define the navigation and the initial function.
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
