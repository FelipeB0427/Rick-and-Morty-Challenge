//
//  OnboardingViewModel.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 10/02/22.
//

import Foundation

final class OnboardingViewModel {
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    public func presentMainScreen() {
        coordinator.start()
    }
}
