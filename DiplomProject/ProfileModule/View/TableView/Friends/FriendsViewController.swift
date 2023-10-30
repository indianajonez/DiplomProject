//
//  FriendsViewController.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 29.10.2023.
//

import UIKit

class FriendsViewController: UIViewController {
    
    // MARK: - Private properties
        
    private var imageList: [UIImage] = Friends.makeCollectionFriends()
        
    //    lazy var allPhotos = Photo.makeCollectioinPhotos()
        
        private lazy var imageCollection: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            let imageCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            imageCollection.translatesAutoresizingMaskIntoConstraints = false
            imageCollection.delegate = self
            imageCollection.dataSource = self
            imageCollection.register(FrinedsCollectionViewCell.self, forCellWithReuseIdentifier: FrinedsCollectionViewCell.identifier)
            return imageCollection
        }()
        
    // MARK: - Life cycle

        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "Друзья"
            navigationController?.navigationBar.isHidden = false
            layout()
            
        }
        
    // MARK: - Private methods
    
        private func layout() {
            view.addSubview(imageCollection)
            
            NSLayoutConstraint.activate([
                imageCollection.topAnchor.constraint(equalTo: view.topAnchor),
                imageCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                imageCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                imageCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }

    }



    // MARK: - UICollectionViewDataSource

    extension FriendsViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            imageList.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: FrinedsCollectionViewCell.identifier, for: indexPath) as? FrinedsCollectionViewCell else { return UICollectionViewCell()}
            cell.setupCollectionFrinedsCell(imageList[indexPath.item])
            return cell
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    extension FriendsViewController: UICollectionViewDelegateFlowLayout {
        private var sideInset: CGFloat {return 8}
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (imageCollection.bounds.width - sideInset * 4) / 3
            return CGSize(width: width, height: width)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            sideInset
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
        }
    }


