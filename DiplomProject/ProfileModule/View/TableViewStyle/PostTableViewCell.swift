//
//  PostTableViewCell.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 20.10.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private var post: Post!
    
    private lazy var postNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.createColor(lightMode: .black, darkMode: .white)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var postDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private lazy var postLikes: UILabel = {
        let likes = UILabel()
        likes.text = "Likes:"
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    private lazy var postLikesCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postViews: UILabel = {
        let views = UILabel()
        views.text = "Views: "
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    private lazy var postViewsCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tapLikeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemRed
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.addTarget(self, action: #selector(addLikes), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstrains()
//        setupGestures()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func setupCell(_ post: Post) {
        postNameLabel.text = post.author
        postImage.image = (UIImage(named: post.image))
        postDescLabel.text = post.description
        postLikesCount.text = String(post.likes)
        postViewsCount.text = String(post.views)
        self.post = post
    }
    
    private func setupConstrains() {
        [postNameLabel, postImage, postDescLabel, postLikes, postLikesCount, postViews, postViewsCount, tapLikeButton].forEach({contentView.addSubview($0)})
        
        let labelInset: CGFloat = 16
        let imageInset: CGFloat = 12
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        NSLayoutConstraint.activate([
            postNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: labelInset),
            postNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: labelInset),
            postNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -labelInset),
            
            postImage.topAnchor.constraint(equalTo: postNameLabel.bottomAnchor, constant: imageInset),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: screenWidth),
            postImage.widthAnchor.constraint(equalToConstant: screenWidth),
            
            postDescLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: labelInset),
            postDescLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -labelInset),
            postDescLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: labelInset),
            
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: labelInset),
            postLikes.topAnchor.constraint(equalTo: postDescLabel.bottomAnchor, constant: labelInset),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -labelInset),
            
            postLikesCount.topAnchor.constraint(equalTo: postDescLabel.bottomAnchor, constant: labelInset),
            postLikesCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -labelInset),
            postLikesCount.leadingAnchor.constraint(equalTo: postLikes.trailingAnchor),
            
            postViews.topAnchor.constraint(equalTo: postDescLabel.bottomAnchor, constant: labelInset),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -labelInset),
            postViews.trailingAnchor.constraint(equalTo: postViewsCount.leadingAnchor),
            
            postViewsCount.topAnchor.constraint(equalTo: postDescLabel.bottomAnchor, constant: labelInset),
            postViewsCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -labelInset),
            postViewsCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -labelInset),
            
            tapLikeButton.topAnchor.constraint(equalTo: postDescLabel.bottomAnchor, constant: labelInset),
            tapLikeButton.leadingAnchor.constraint(equalTo: postLikesCount.trailingAnchor, constant: labelInset),
            tapLikeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -labelInset)
        ])
    }
    
    
    
    
    
    
    
    
    @objc
    private func addLikes() {

//        CoreDataManager.shared.addToFavorites(originPost: post)
//
//        isTapped.toggle()
//        let name = isTapped ? "heart.fill" : "heart"
//        tapLikeButton.setImage(UIImage(systemName: name), for: .normal)
    }
    
}
