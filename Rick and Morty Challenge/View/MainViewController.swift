//
//  ViewController.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 08/02/22.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: -  PROPERTIES
    private let viewModel: MainViewModel
    let tableView = UITableView()
    var episodes: [Results] = []
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CONFIGS
    func configureTableView() {
        super.viewDidLayoutSubviews()
        tableView.separatorColor = UIColor(named: "main-background2")
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    lazy var configureSettingsButton: UIButton = {
        let settingsButton = UIButton()
        
        settingsButton.configuration = .filled()
        settingsButton.layer.shadowColor = UIColor.black.cgColor
        settingsButton.layer.shadowRadius = 12
        settingsButton.layer.shadowOpacity = 0.4
        settingsButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        settingsButton.configuration?.baseBackgroundColor = UIColor(named: "main-background2")
        settingsButton.configuration?.image = UIImage(systemName: "gear")
        settingsButton.configuration?.cornerStyle = .capsule
        settingsButton.addTarget(self, action:  #selector(self.buttonTapped), for: .touchUpInside)
        
        return settingsButton
    }()
    
    lazy var configureRickImage: UIImageView = {
        let image = UIImage(named: "pickle-rick")
        let rickImageView = UIImageView(image: image)
        
        return rickImageView
    }()
    //: CONFIGS
    
    // MARK: - CONSTRAINTS
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        configureSettingsButton.translatesAutoresizingMaskIntoConstraints = false
        configureSettingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        configureSettingsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        configureSettingsButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        configureSettingsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        configureRickImage.translatesAutoresizingMaskIntoConstraints = false
        configureRickImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        configureRickImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -120).isActive = true
        configureRickImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        configureRickImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    // MARK: - SUB VIEWS
    func addSubViews() {
        view.addSubview(configureSettingsButton)
        view.addSubview(configureRickImage)
    }
    
    private func loadApi() {
        let epManager = EpisodeManager()
        for index in 1..<4 {
            epManager.getAllEps(page: index) { episode in
                self.episodes.append(contentsOf: episode.results)
                
                if index == 3 {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "main-background1")
        title = "All Episodes"
        
        addSubViews()
        configureTableView()
        setConstraints()
        loadApi()
    }
    
    @objc func buttonTapped(sender: UIButton) {
        viewModel.presentSettingsScreen()
    }
}


// MARK: - EXTENSIONS
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = self.episodes[indexPath.row].name
        content.secondaryText = self.episodes[indexPath.row].episodeCode
        content.textProperties.color = .black
        content.secondaryTextProperties.color = .black
        cell.backgroundColor = UIColor(named: "tableView-background")
        cell.selectionStyle = .none
        cell.contentConfiguration = content
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentEpisodeDetailScreen(episode: self.episodes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
