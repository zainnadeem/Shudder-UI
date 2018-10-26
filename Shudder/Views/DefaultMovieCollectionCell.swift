//
//  CookingNowCollectionViewCell.swift
//  MammaFoodie
//
//  Created by Zain Nadeem on 2/27/17.
//  Copyright © 2017 MammaFoodieCorp. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

class DefaultMovieCollectionViewCell: UICollectionViewCell {

    lazy var backgroundImageView    : UIImageView = UIImageView()
    lazy var topTitle               : UILabel     = UILabel()
    lazy var bottomTitle            : UILabel     = UILabel()
    lazy var darkView               : UIView      = UIView()
    
    var availabilityIcon            : UIImageView = UIImageView()
    
    
    var imagesToDisplay: [UIImage] = [UIImage]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewConstraints()
        setViewProperties()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateUI(){
        self.reloadInputViews()
    }
    
    
    func setViewConstraints(){
        
        
        self.contentView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.contentView.addSubview(darkView)
        darkView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
        
    }
    
    func setViewProperties(){
        
        //background Image
        
        
        //darkview
        self.darkView.backgroundColor = UIColor.black
        self.darkView.alpha = 0.35
        
        
        
    }
    
    
}


