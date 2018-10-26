//
//  FeaturedChefTableViewCell.swift
//  MammaFoodie
//
//  Created by Zain Nadeem on 2/27/17.
//  Copyright © 2017 MammaFoodieCorp. All rights reserved.
//

import UIKit

class FeaturedMovieCell: UITableViewCell{
    
    let featuredMovieCollectionViewIdentifier = "featuredMovieViewCell"
   
    let featuredMovieCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    
    var imagesToDisplay: [UIImage] = [UIImage]()
    

    
    func layOutCollectionView(){
        self.backgroundColor = shudderBackgroundColor
        featuredMovieCollectionView.delegate = self
        featuredMovieCollectionView.dataSource = self
        
        featuredMovieCollectionView.register(FeaturedMovieCollectionViewCell.self, forCellWithReuseIdentifier: featuredMovieCollectionViewIdentifier)
        
        let featuredMovieLayout = UICollectionViewFlowLayout()
        featuredMovieLayout.scrollDirection = .horizontal
       
        featuredMovieCollectionView.isPagingEnabled = false
        featuredMovieCollectionView.collectionViewLayout = featuredMovieLayout
        
        featuredMovieCollectionView.backgroundColor = shudderBackgroundColor
        
        setViewConstraints()
        
    }
    
        func setViewConstraints() {
            
            self.contentView.addSubview(featuredMovieCollectionView)
            featuredMovieCollectionView.snp.makeConstraints { (make) in
                make.height.equalToSuperview()
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
            }
            
        }
    
    
}

extension FeaturedMovieCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesToDisplay.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredMovieCollectionViewIdentifier, for: indexPath) as! FeaturedMovieCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = collectionCellCornerRadius
        cell.backgroundImageView.image = imagesToDisplay[indexPath.row]
        cell.backgroundImageView.contentMode = .scaleAspectFill
        cell.updateUI()
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.width, height:self.contentView.frame.height)
    }
    
}


extension FeaturedMovieCell: UICollectionViewDelegate { }

extension FeaturedMovieCell: UICollectionViewDelegateFlowLayout { }


