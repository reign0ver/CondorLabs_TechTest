//
//  BreedInformationCell.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import UIKit

protocol GoToWebViewDelegate: class {
    func presentWebView(vc: WikipediaWebViewController)
}

class BreedInformationCell: UITableViewCell {

    static let reuseIdentifier = String(describing: BreedInformationCell.self)
    private var wikipediaURL: String = ""
    weak var delegate: GoToWebViewDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: BreedInformationCell.reuseIdentifier)
        setupDescriptionLabel()
        setupOriginLabel()
        setupTemperamentLabel()
        setupWikipediaButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupOriginLabel() {
        addSubview(originLabel)
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            originLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            originLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            originLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupTemperamentLabel() {
        addSubview(temperamentLabel)
        temperamentLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            temperamentLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 16),
            temperamentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            temperamentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupWikipediaButton() {
        addSubview(wikipediaURLButton)
        wikipediaURLButton.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            wikipediaURLButton.topAnchor.constraint(equalTo: temperamentLabel.bottomAnchor, constant: 16),
            wikipediaURLButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            wikipediaURLButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func configure(_ breed: Breed) {
        descriptionLabel.text = "Description:\n\(breed.description)"
        originLabel.text  = "Origin: \n\(breed.name) is from \(breed.origin)"
        let temperament = breed.temperament
            .replacingOccurrences(of: ",", with: "\n")
            .replacingOccurrences(of: " ", with: "* ")
        temperamentLabel.text = "Its temperament is more like:\n* \(temperament)"
        wikipediaURLButton.setTitle("Tap here Wikipedia", for: .normal)
        wikipediaURL = breed.wikipediaURL ?? ""
        wikipediaURLButton.addTarget(self, action: #selector(goToWikipedia), for: .touchUpInside)
    }
    
    @objc
    private func goToWikipedia() {
        let vc = WikipediaWebViewController(webViewURL: wikipediaURL)
        vc.modalPresentationStyle = .fullScreen
        delegate?.presentWebView(vc: vc)
    }
    
    
    //MARK: - Views
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private let originLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private let temperamentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private let wikipediaURLButton: UIButton = {
        let button = UIButton(type: .system)
        
        return button
    }()
    
}
