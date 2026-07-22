//
//  ListOfViewController.swift
//  KnowBeforeYouGo
//
//  Created by Juanito Martinon on 7/15/26.
//

import UIKit

class ListOfViewController: UIViewController {
    
    // MARK: - Properties
    
    // Model for each list item
    struct ListItem {
        let title: String
        let id: String
        let address: String
        let city: String
        let description: String
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "A List"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: CHANGE THE CLOSURE AND REOPENED LATER TO SOMETHING DYNAMIC
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Closed: 0 and Re-opened: 0"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    private var items: [ListItem] = []
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Configure navigation bar button
        let filterButton = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease.circle"),
            style: .plain,
            target: self,
            action: #selector(filterButtonTapped)
        )
        navigationItem.rightBarButtonItem = filterButton
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            collectionView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    // MARK: DUMMY DATA
    private func loadData() {
        items = [
            ListItem(title: "Restaurants", id: "tab_1", address: "123 Main St,", city: "Downtown", description: "Local dining establishments offering various cuisines and dining experiences."),
            ListItem(title: "Parks & Recreation", id: "tab_2", address: "456 Park Ave,", city: "Central District", description: "Public parks and recreational facilities for outdoor activities and relaxation."),
            ListItem(title: "Shopping Centers", id: "tab_3", address: "789 Commerce Blvd,", city: "West Side", description: "Retail shopping areas with stores, boutiques, and commercial services."),
            ListItem(title: "Libraries", id: "tab_4", address: "321 Book Lane,", city: "University Area", description: "Public libraries providing books, resources, and community programs."),
            ListItem(title: "Community Centers", id: "tab_5", address: "654 Community Dr,", city: "Northside", description: "Community gathering spaces offering classes, events, and social activities."),
            ListItem(title: "Public Services", id: "tab_6", address: "987 City Hall Plaza,", city: "Downtown", description: "Municipal services and government offices for residents."),
            ListItem(title: "Entertainment", id: "tab_7", address: "159 Theater Row,", city: "Arts District", description: "Entertainment venues including theaters, cinemas, and performance spaces.")
        ]
        collectionView.reloadData()
    }
    
    // MARK: - Actions
    
    @objc private func filterButtonTapped() {
        print("Filter button tapped")
        // TODO: Implement filter functionality
    }
    
}

// MARK: - UICollectionViewDataSource

extension ListOfViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 8
        
        // Clear existing subviews
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let item = items[indexPath.item]
        
        // Create title label (positioned in the top-left)
        let titleLabel = UILabel()
        titleLabel.text = item.title
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(titleLabel)
        
        // Create address label
        let addressLabel = UILabel()
        addressLabel.text = item.address
        addressLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        addressLabel.textColor = .secondaryLabel
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(addressLabel)
        
        // Create city label
        let cityLabel = UILabel()
        cityLabel.text = item.city
        cityLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        cityLabel.textColor = .secondaryLabel
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(cityLabel)
        
        // Create description text view
        let descriptionTextView = UITextView()
        descriptionTextView.text = item.description
        descriptionTextView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionTextView.textColor = .secondaryLabel
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.textContainer.lineFragmentPadding = 0
        descriptionTextView.textContainerInset = .zero
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: cell.contentView.trailingAnchor, constant: -16),
            
            addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            addressLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            
            cityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            cityLabel.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor, constant: 4),
            cityLabel.trailingAnchor.constraint(lessThanOrEqualTo: cell.contentView.trailingAnchor, constant: -16),
            
            descriptionTextView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 12),
            descriptionTextView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            descriptionTextView.bottomAnchor.constraint(lessThanOrEqualTo: cell.contentView.bottomAnchor, constant: -16)
        ])
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension ListOfViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.item]
        let moreInfoVC = MoreInfoViewController(itemText: selectedItem.title)
        let navController = UINavigationController(rootViewController: moreInfoVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
        
        print("Selected: \(selectedItem.title)")
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ListOfViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16 * 2 // left + right padding
        let availableWidth = collectionView.bounds.width - padding
        return CGSize(width: availableWidth, height: 150)
    }
    
}
