//
//  FavorietsViewController.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 25.10.2023.
//

import UIKit
import CoreData

class FavorietsViewController: UIViewController {
    
    //MARK: - Private properties
    
    private var favoriteData: [NSManagedObject] = []
    
    private var coreDataManager = CoreDataManager.shared
    
    private lazy var tablePosts: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(FavorietsPostTableViewCell.self, forCellReuseIdentifier: String(describing: FavorietsPostTableViewCell.self))
        return table
    }()
    
    //MARK: - Life cycls

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Избранное"
        setupView()
        setupConstraints()
        getFromCoreData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFromCoreData()
        
    }
    
    //MARK: - Private methods
    
    private func getFromCoreData() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PostStorage")
        favoriteData = CoreDataManager.shared.fetchData(fetchRequest)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.tablePosts.reloadData()
        }
    }
    
    private func setupView() {
        view.addSubview(tablePosts)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            // таблица
            tablePosts.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tablePosts.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tablePosts.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tablePosts.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
}

//MARK: - UITableViewDelegate

extension FavorietsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                coreDataManager.delete(favoriteData[indexPath.row])
                getFromCoreData()
            }
        }
    
}

//MARK: - UITableViewDataSource

extension FavorietsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tablePosts.dequeueReusableCell(withIdentifier: String(describing: FavorietsPostTableViewCell.self), for: indexPath) as? FavorietsPostTableViewCell else {return UITableViewCell()}
        cell.setup(post: favoriteData[indexPath.row])
        return cell
    }
}
