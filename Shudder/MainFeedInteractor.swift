//
//  MainFeedInteractor.swift
//  Shudder
//
//  Created by Zain N. on 10/23/18.
//  Copyright (c) 2018 Mapfit. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainFeedBusinessLogic
{
  func fetchVideos(request: MainFeed.Data.Request)
}

protocol MainFeedDataStore
{
  //var name: String { get set }
}

class MainFeedInteractor: MainFeedBusinessLogic, MainFeedDataStore
{
  var presenter: MainFeedPresentationLogic?
  var worker: MainFeedWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func fetchVideos(request: MainFeed.Data.Request)
  {
    worker = MainFeedWorker()
    worker?.performFlickrSearch(request: request, completion: { (response) in
       
        self.presenter?.presentVideos(response: response)
        
    })
    
 
    }
}