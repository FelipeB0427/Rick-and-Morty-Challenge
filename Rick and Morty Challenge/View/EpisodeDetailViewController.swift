//
//  EpisodeDetailViewController.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 09/02/22.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    private let viewModel: EpisodeDetailViewModel
    var character: Character?
    var characters: [Character] = []
    var episodeData: Results
    let tableView = UITableView()
    var nameLabel = UILabel()
    var statusLabel = UILabel()
    
    init(viewModel: EpisodeDetailViewModel, episode: Results) {
        self.viewModel = viewModel
        self.episodeData = episode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        configureTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        loadApi()
    }
    
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
    
    // MARK: - HELPERS
    func configureTableView() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemCyan
    }
}

extension EpisodeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel?.text = self.characters[indexPath.row].name
        return cell
    }
}
