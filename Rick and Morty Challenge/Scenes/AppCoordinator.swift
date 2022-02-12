//
//  AppCoordinator.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 08/02/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
// MARK: - PROPERTIES
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if !Core.shared.isFirstLauch() {
            let viewModel = MainViewModel(coordinator: self)
            let vc = MainViewController(viewModel: viewModel)
            
            navigationController.pushViewController(vc, animated: true)
        } else {
            let viewModel = OnboardingViewModel(coordinator: self)
            let vc = OnboardingViewController(viewModel: viewModel)
            
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showEpisodeDetailScreen(episodeData: Results) {
        let viewModel = EpisodeDetailViewModel(coordinator: self)
        let vc = EpisodeDetailViewController(viewModel: viewModel, episode: episodeData)
        
        navigationController.pushViewController(vc, animated: true)
    }
}


