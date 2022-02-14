//
//  AppCoordinator.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 08/02/22.
//

import Foundation
import UIKit

/// Classe utilizada para realizar a navegação entre todas as views da aplicação.
class AppCoordinator: Coordinator {
// MARK: - PROPERTIES
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// This function uses an (if) where decides which View will be presented depending the state stored in User Defaults.
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
    
    /// Present the [EpisodeDetailViewModel] with the {episodeData} with data recieved from the [MainViewModel].
    /// - Parameter episodeData: Has all the data recieved from the API.
    func showEpisodeDetailScreen(episodeData: Results) {
        let viewModel = EpisodeDetailViewModel(coordinator: self)
        let vc = EpisodeDetailViewController(viewModel: viewModel, episode: episodeData)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    /// Present the [showSettingsScreen] to reset the User Defaults state.
    func showSettingsScreen() {
        let viewModel = SettingsViewModel(coordinator: self)
        let vc = SettingsViewController(viewModel: viewModel)
        
        navigationController.pushViewController(vc, animated: true)
    }
}


