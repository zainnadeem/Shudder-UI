//
//  FeaturedChefCollectionViewCell.swift
//  MammaFoodie
//
//  Created by Zain Nadeem on 2/27/17.
//  Copyright © 2017 MammaFoodieCorp. All rights reserved.
//

import UIKit
import SnapKit


class FeaturedMovieCollectionViewCell: UICollectionViewCell {
    
    lazy var backgroundImageView    : UIImageView = UIImageView()
    lazy var darkView               : UIView      = UIView()

    
    let store = DataStore.sharedInstance
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewConstraints()
        setViewProperties()
        
        self.backgroundColor = UIColor.black
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
