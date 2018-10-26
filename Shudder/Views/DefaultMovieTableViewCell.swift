//
//  UpcomingBroadcastsTableViewCell.swift
//  MammaFoodie
//
//  Created by Zain Nadeem on 2/27/17.
//  Copyright © 2017 MammaFoodieCorp. All rights reserved.
//

import UIKit

class DefaultMovieCell: UITableViewCell{
    
    let defaultMovieCollectionViewIdentifier = "defaultMovieCollectionViewIdentifier"
    
    let defaultMovieCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    
     var imagesToDisplay: [UIImage] = [UIImage]()

    
    func layOutCollectionView(){
        self.contentView.backgroundColor = shudderBackgroundColor
        
        defaultMovieCollectionView.delegate = self
        defaultMovieCollectionView.dataSource = self
        
        defaultMovieCollectionView.register(DefaultMovieCollectionViewCell.self, forCellWithReuseIdentifier: defaultMovieCollectionViewIdentifier)
        
        let defaultMovieCollectionViewLayout = UICollectionViewFlowLayout()
        defaultMovieCollectionViewLayout.scrollDirection = .horizontal
        
        defaultMovieCollectionView.isPagingEnabled = false
        defaultMovieCollectionView.collectionViewLayout = defaultMovieCollectionViewLayout
        
        defaultMovieCollectionView.backgroundColor = shudderBackgroundColor
        
        setViewConstraints()
        
    }
    
    func setViewConstraints() {
        
        self.contentView.addSubview(defaultMovieCollectionView)
        defaultMovieCollectionView.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
    func fetchUsers(){
        //Fetch Users from firebase
        
        
    }
    
}

extension DefaultMovieCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesToDisplay.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultMovieCollectionViewIdentifier, for: indexPath) as! DefaultMovieCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = collectionCellCornerRadius
        cell.backgroundImageView.image = imagesToDisplay[indexPath.row]
         cell.backgroundImageView.contentMode = .scaleAspectFill
        cell.updateUI()
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.width / 4, height:self.contentView.frame.height)
    }
    
}


extension DefaultMovieCell: UICollectionViewDelegate { }

extension DefaultMovieCell: UICollectionViewDelegateFlowLayout { }
