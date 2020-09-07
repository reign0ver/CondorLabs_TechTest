//
//  LikesViewController.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController {

    private var viewModel: LikesViewModel
    
    init(viewModel: LikesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCatImageView()
        setupButtonsStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = viewModel.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints

    private func setupCatImageView() {
        view.addSubview(catImageView)
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            catImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            catImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupButtonsStackView() {
        view.addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.addArrangedSubview(likeButton)
        buttonsStackView.addArrangedSubview(dislikeButton)
        let constraints = [
            buttonsStackView.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 16),
            buttonsStackView.leadingAnchor.constraint(equalTo: catImageView.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: catImageView.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: - Views
    
    private let catImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Like", for: .normal)
        return button
    }()
    
    private let dislikeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dislike", for: .normal)
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
}
