//
//  ViewController.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 08/02/22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        configureTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
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
    
    // MARK: - HELPERS
    func configureTableView() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor = .red
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.episodes[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentEpisodeDetailScreen(episode: self.episodes[indexPath.row])
    }
}

