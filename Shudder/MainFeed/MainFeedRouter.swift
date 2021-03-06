//
//  MainFeedRouter.swift
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

@objc protocol MainFeedRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol MainFeedDataPassing
{
  var dataStore: MainFeedDataStore? { get }
}

class MainFeedRouter: NSObject, MainFeedRoutingLogic, MainFeedDataPassing
{
  weak var viewController: MainFeedViewController?
  var dataStore: MainFeedDataStore?
  
}
