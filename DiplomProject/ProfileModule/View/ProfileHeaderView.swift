//
//  ProfileHeaderView.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 19.10.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var avatarImage: UIImageView = {
        var image = UIImageView(image: UIImage(named: "Kate"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kate"
        label.textColor = UIColor.createColor(lightMode: .black, darkMode: .white)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [avatarImage, fullNameLabel].forEach{addSubview($0)}
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public methods
    
    func setupView(user: User?) {
        if let user = user {
            self.fullNameLabel.text = user.fullName
            self.avatarImage.image = user.avatar
        }
    }
    
    // MARK: - Private methods
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            avatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16),
            fullNameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

        
        ])
        
    }

}
