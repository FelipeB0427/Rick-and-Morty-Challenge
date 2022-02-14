//
//  CustomTableViewCell.swift
//  Rick and Morty Challenge
//
//  Created by Felipe Brigagão de Almeida on 13/02/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let id = "CustomTableViewCell"
    
    private let charImage: UIImageView = {
        let imgView = UIImageView()
        
        imgView.image = UIImage()
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .label
        label.text = "Rick Sanchez"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .label
        label.text = "Alive"
        label.font = .systemFont(ofSize: 12, weight: .light)
        
        return label
    }()
    
    private let circleImage: UIImageView = {
        let circle = UIImage(systemName: "circle.fill")
        let imgView = UIImageView(image: circle)
        
        imgView.tintColor = .green
        
        return imgView
    }()
    
    private let originLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .label
        label.text = "Earth"
        label.font = .systemFont(ofSize: 12, weight: .light)
        
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .label
        label.text = "Earth"
        label.font = .systemFont(ofSize: 12, weight: .light)
        
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .label
        label.text = "Male"
        label.font = .systemFont(ofSize: 12, weight: .light)
        
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .label
        label.text = "Human"
        label.font = .systemFont(ofSize: 12, weight: .light)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "tableView-background2")
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func confs(urlCharImage url: String, charName name: String, statusLabel status: String, originLabel origin: String, locationLabel location: String, charGender gender: String, speciesLabel specimen: String) {
        charImage.load(urlString: url)
        nameLabel.text = name
        statusLabel.text = "Status: \(status)"
        originLabel.text = "Origin: \(origin)"
        locationLabel.text = "Location: \(location)"
        genderLabel.text = "Gender: \(gender)"
        speciesLabel.text = "Specimen: \(specimen)"
    }
    
    private func addSubviews() {
        contentView.addSubview(charImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(circleImage)
        contentView.addSubview(originLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(speciesLabel)
    }
    
    public func cicleColor(statsColor: UIColor) {
        circleImage.tintColor = statsColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        charImage.image = nil
        nameLabel.text = nil
        circleImage.tintColor = .clear
        statusLabel.text = nil
        originLabel.text = nil
        locationLabel.text = nil
        genderLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        charImage.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        nameLabel.frame = CGRect(x: 135, y: -40, width: contentView.frame.size.width, height: contentView.frame.size.height)
        circleImage.frame = CGRect(x: 135, y: 35, width: 14, height: 14)
        statusLabel.frame = CGRect(x: 135, y: 2, width: contentView.frame.size.width, height: contentView.frame.size.height)
        originLabel.frame = CGRect(x: 135, y: 17, width: contentView.frame.size.width - 250, height: contentView.frame.size.height)
        locationLabel.frame = CGRect(x: 135, y: 32, width: contentView.frame.width, height: contentView.frame.size.height)
        genderLabel.frame = CGRect(x: 275, y: 2, width: contentView.frame.size.width, height: contentView.frame.size.height)
        speciesLabel.frame = CGRect(x: 275, y: 17, width: contentView.frame.size.width - 280, height: contentView.frame.size.height)
    }
}
