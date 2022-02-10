//
//  MainViewModel.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 08/02/22.
//

import Foundation

final class MainViewModel {
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    public func presentEpisodeDetailScreen(episode: Results) {
        coordinator.showEpisodeDetailScreen(episodeData: episode)
    }
}
