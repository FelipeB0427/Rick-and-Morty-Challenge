//
//  SettingsViewController.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 12/02/22.
//

import UIKit

class SettingsViewController: UIViewController {
    private let viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = UIColor(named: "main-background2")
    }
}
