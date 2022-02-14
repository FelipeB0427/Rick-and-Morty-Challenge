//
//  OnboardingViewController.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 10/02/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    // MARK: - PROPERTIES
    private let viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "main-background2")
        addSubViews()
        setConstraints()
    }
    
    @objc func buttonTapped(sender: UIButton) {
        Core.shared.setIsFirstLaunch()
        viewModel.presentMainScreen()
    }
    
    // MARK: - CONFIGS
    lazy var configureButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(named: "main-button")
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var configureLogo: UIImageView = {
        let logo = UIImage(named: "logo")
        let logoView = UIImageView(image: logo)
        
        return logoView
    }()
    
    // MARK: - CONSTRAINTS
    func setConstraints() {
        // MARK: - BUTTON
        configureButton.translatesAutoresizingMaskIntoConstraints = false
        configureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        configureButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        configureButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        configureButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        // MARK: - LOGO
        configureLogo.translatesAutoresizingMaskIntoConstraints = false
        configureLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -12).isActive = true
        configureLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        configureLogo.widthAnchor.constraint(equalToConstant: 450).isActive = true
        configureLogo.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    // MARK: - SUB VIEWS
    func addSubViews() {
        view.addSubview(configureButton)
        view.addSubview(configureLogo)
    }
}
