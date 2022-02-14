//
//  EpisodeDetailViewController.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 09/02/22.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    // MARK: - PROPERTIES
    private let viewModel: EpisodeDetailViewModel
    var characters: [Character] = []
    var episodeData: Results
    let tableView = UITableView()
    
    init(viewModel: EpisodeDetailViewModel, episode: Results) {
        self.viewModel = viewModel
        self.episodeData = episode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CONFIGS
    func configureTableView() {
        super.viewDidLayoutSubviews()
        tableView.separatorColor = UIColor.systemGray2
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.id)
    }
    
    lazy var configureEpisodeBackgroundInfo: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "tableView-background2")
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    lazy var configureEpisodeNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "\(episodeData.name)"
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        
        return label
    }()
    
    lazy var configureEpisodeDateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Date: \(episodeData.airDate)"
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    lazy var configureEpisodeCodeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Episode Code: \(episodeData.episodeCode)"
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    lazy var configureEpisodeCreatedLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Created At: \(episodeData.createdAt.prefix(10))"
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    // MARK: - CONSTRAINTS
    func setConstraints() {
        // MARK: - BACKGROUND
        configureEpisodeBackgroundInfo.translatesAutoresizingMaskIntoConstraints = false
        configureEpisodeBackgroundInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        configureEpisodeBackgroundInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        configureEpisodeBackgroundInfo.widthAnchor.constraint(equalToConstant: 370).isActive = true
        configureEpisodeBackgroundInfo.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        // MARK: - NAME
        configureEpisodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        configureEpisodeNameLabel.topAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.topAnchor, constant:  -165).isActive = true
        configureEpisodeNameLabel.bottomAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.bottomAnchor).isActive = true
        configureEpisodeNameLabel.rightAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.rightAnchor).isActive = true
        configureEpisodeNameLabel.leftAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.leftAnchor, constant: 25).isActive = true
        
        // MARK: - DATE
        configureEpisodeDateLabel.translatesAutoresizingMaskIntoConstraints = false
        configureEpisodeDateLabel.topAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.topAnchor, constant:  85).isActive = true
        configureEpisodeDateLabel.bottomAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.bottomAnchor).isActive = true
        configureEpisodeDateLabel.rightAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.rightAnchor).isActive = true
        configureEpisodeDateLabel.leftAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.leftAnchor, constant: 25).isActive = true
        
        // MARK: - CREATED AT
        configureEpisodeCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        configureEpisodeCreatedLabel.topAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.topAnchor, constant:  125).isActive = true
        configureEpisodeCreatedLabel.bottomAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.bottomAnchor).isActive = true
        configureEpisodeCreatedLabel.rightAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.rightAnchor).isActive = true
        configureEpisodeCreatedLabel.leftAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.leftAnchor, constant: 25).isActive = true
       
        // MARK: - EPISODE CODE
        configureEpisodeCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        configureEpisodeCodeLabel.topAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.topAnchor, constant:  165).isActive = true
        configureEpisodeCodeLabel.bottomAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.bottomAnchor).isActive = true
        configureEpisodeCodeLabel.rightAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.rightAnchor).isActive = true
        configureEpisodeCodeLabel.leftAnchor.constraint(equalTo: configureEpisodeBackgroundInfo.leftAnchor, constant: 25).isActive = true
        
        // MARK: - TABLE VIEW
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
    }
    
    // MARK: - SUB VIEWS
    func addSubViews() {
        view.addSubview(tableView)
        view.addSubview(configureEpisodeBackgroundInfo)
        configureEpisodeBackgroundInfo.addSubview(configureEpisodeNameLabel)
        configureEpisodeBackgroundInfo.addSubview(configureEpisodeDateLabel)
        configureEpisodeBackgroundInfo.addSubview(configureEpisodeCreatedLabel)
        configureEpisodeBackgroundInfo.addSubview(configureEpisodeCodeLabel)
    }
    
    // MARK: API
    private func loadApi() {
        let charManager = CharacterManager()
        for index in 0..<episodeData.characters.count {
            charManager.getCharacter(url: episodeData.characters[index]) { character in
                self.characters.append(character)
                
                if index == self.episodeData.characters.count - 1 {
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
        view.backgroundColor = UIColor(named: "main-background3")
        
        configureTableView()
        addSubViews()
        setConstraints()
        loadApi()
    }
}

extension EpisodeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        switch self.characters[indexPath.row].status {
            case "Alive":
                cell.cicleColor(statsColor: .green)
            case "Dead":
                cell.cicleColor(statsColor: .red)
            default:
                cell.cicleColor(statsColor: .yellow)
        }
        
        cell.confs(
            urlCharImage: self.characters[indexPath.row].image,
            charName: self.characters[indexPath.row].name,
            statusLabel: self.characters[indexPath.row].status,
            originLabel: self.characters[indexPath.row].origin.name,
            locationLabel: self.characters[indexPath.row].location.name,
            charGender: self.characters[indexPath.row].gender,
            speciesLabel: self.characters[indexPath.row].species
        )
        
        return cell
    }
}
