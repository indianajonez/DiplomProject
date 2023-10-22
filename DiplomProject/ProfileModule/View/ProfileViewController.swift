//
//  ProfileViewController.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    // MARK: - Public properties

    
    let user: User?
    
    
    // MARK: - Privte properties
    
    private var listPost = Post2.make()
    private var listPhoto = Photo.makeCollectionPhotos()
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.createColor(lightMode: .lightGray, darkMode: .black)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return table
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        navigationItem.title = "ProfileView comming soon:)"
        navigationItem.hidesBackButton = true
        print(user?.fullName ?? "Not full name")
        setupView()
        setupConstraints()
    }
    
    
    init(user: User?) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        view.addSubview(table)
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension // автоматическая высота ячеек ( зависти от контента)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        header.setupView(user: user) //как здесь правильно прописать?
        header.backgroundColor = UIColor.createColor(lightMode: .lightGray, darkMode: .black)
        return section == 0 ? header : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }
}


// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : listPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier) as? PhotosTableViewCell else { return UITableViewCell()}
            cell.delegate = self
            cell.backgroundColor = UIColor.createColor(lightMode: .lightGray, darkMode: .black)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as? PostTableViewCell else { return UITableViewCell()}
            cell.setupCell(listPost[indexPath.row])
            cell.backgroundColor = UIColor.createColor(lightMode: .lightGray, darkMode: .black)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
}

// MARK: - PhotosGalleryDelegate

extension ProfileViewController: PhotosGalleryDelegateProtocol {
    
    func openGallery() {
        print(#function)
        let galleryVC = PhotosViewController()
        navigationController?.pushViewController(galleryVC, animated: true)
    }
}