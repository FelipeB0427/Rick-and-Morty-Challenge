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
    var episodes: Episodes?
    var results: [Results]?
    
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
                DispatchQueue.main.async {
                    if index == 1 {
                        self.episodes = episode
                    } else {
                        self.episodes?.results.append(contentsOf: episode.results)
                    }
                    self.tableView.reloadData()
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
        return self.episodes?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.episodes?.results[indexPath.row].name
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}

