//
//  MoreInforViewController.swift
//  KnowBeforeYouGo
//
//  Created by Juan Martinon on 7/20/26.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    private let itemText: String
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializer
    
    init(itemText: String) {
        self.itemText = itemText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupBackButton()
        setupLabel()
        textLabel.text = itemText
        print("more info will go here")
    }
    
    private func setupBackButton() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setupLabel() {
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }

    
    
    
}
