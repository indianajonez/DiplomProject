//
//  ProfileViewController.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import UIKit

//MARK: - настроить отображение коллекции с первой фотографии, починить отображение галереи

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
        table.backgroundColor = UIColor.createColor(lightMode: .white, darkMode: .black)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return table
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        navigationItem.title = "ProfileView"
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Мой профайл"
        print(user?.fullName ?? "Not full name")
        setupView()
        setupConstraints()
        makeBarButtonItems()
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
    
    @objc private func makeBarButtonItems() {
        let edit = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(editTapped))
        let logout = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logoutTapped))

        navigationItem.rightBarButtonItems = [logout, edit]
        edit.tintColor = .black
        logout.tintColor = .black
    }
    
    @objc
    func editTapped() {
        let settingsProfileVC = SettingsProfileViewController()
        navigationController?.pushViewController(settingsProfileVC, animated: true)
    }
    
    @objc
    func logoutTapped() {
        let loginVC = LoginViewController(checkerService: CheckerService())
        navigationController?.pushViewController(loginVC, animated: true)
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
        header.backgroundColor = UIColor.createColor(lightMode: .systemGray6, darkMode: .black)
        header.layer.cornerRadius = 30
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
            cell.backgroundColor = UIColor.createColor(lightMode: .systemGray6, darkMode: .black)
            cell.layer.cornerRadius = 30
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as? PostTableViewCell else { return UITableViewCell()}
            cell.setupCell(listPost[indexPath.row])
            cell.backgroundColor = UIColor.createColor(lightMode: .systemGray6, darkMode: .black)
            cell.layer.cornerRadius = 30
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
