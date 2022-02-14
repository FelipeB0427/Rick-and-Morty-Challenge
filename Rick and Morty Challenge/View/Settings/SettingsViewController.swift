//
//  SettingsViewController.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 12/02/22.
//

import UIKit

class SettingsViewController: UIViewController {
    private let viewModel: SettingsViewModel
    let tableView = UITableView()
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CONSTRAINTS
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    // MARK: - SUB VIEWS
    func addSubViews() {
        view.addSubview(tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = UIColor(named: "main-background2")
        configureTableView()
        addSubViews()
        setConstraints()
    }
    
    // MARK: - CONFIGS
    func configureTableView() {
        super.viewDidLayoutSubviews()
        tableView.separatorColor = UIColor(named: "main-background2")
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
        
    func showAlert() {
        let alert = UIAlertController(title: "Success", message: "Close and Open the App to see the Onboarding", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            
        }))
        
        present(alert, animated: true)
    }
    
    @objc
    func switchChanged(_ sender : UISwitch!){
        Core.shared.resetIsFirstLaunch()
        showAlert()
    }
}

// MARK: - EXTENSIONS
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "User Defaults"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let switchView = UISwitch(frame: .zero)
        
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        content.text = "Reset"
        content.textProperties.color = .black
        cell.backgroundColor = UIColor(named: "tableView-background1")
        cell.selectionStyle = .none
        cell.accessoryView = switchView
        cell.contentConfiguration = content
        
        return cell
    }
}
