//
//  MainFeedViewController.swift
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

protocol MainFeedDisplayLogic: class
{
    func fetchVideos(request: MainFeed.Data.Request)
    func displayVideos(viewModel: MainFeed.Data.ViewModel)
}

class MainFeedViewController: UIViewController, MainFeedDisplayLogic
{

    

  var interactor: MainFeedBusinessLogic?
  var router: (NSObjectProtocol & MainFeedRoutingLogic & MainFeedDataPassing)?

  // MARK: Object lifecycle
    //NavBar
    lazy var navBar : NavBarView = NavBarView(withView: self.view, rightButtonImage: nil, leftButtonImage: nil, middleButtonImage: nil)
    
    
    //TableView
    var sections = ["", "Newly Added", "Curator's Choice", "A Shudder Halloween"]
    
    lazy var tableView : UITableView = UITableView()
    
   
    var imagesForView = [UIImage]()
    
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = MainFeedInteractor()
    let presenter = MainFeedPresenter()
    let router = MainFeedRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.view.backgroundColor = .red
    
    
    self.navBar.delegate = self
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    
    self.navBar.middleButton.title = "Shudder"
    self.navBar.middleButton.tintColor = .red
    self.navBar.backgroundColor = shudderBackgroundColor
    self.navBar.tintColor = shudderBackgroundColor
    
    self.tableView.backgroundColor = .black
    self.view.backgroundColor = .black
    
    
    self.tableView.register(FeaturedMovieCell.self, forCellReuseIdentifier: featuredMovieCellIdentifier)
    self.tableView.register(DefaultMovieCell.self, forCellReuseIdentifier: defaultMovieCellIdentifier)
    
    self.setViewConstraints()
    
    fetchVideos(request: MainFeed.Data.Request(searchString: ""))
    

    self.tabBarController?.tabBar.items?[0].title = NSLocalizedString("Featured", comment: "comment")
    
  }
    
    
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
    func fetchVideos(request: MainFeed.Data.Request) {
        interactor?.fetchVideos(request: request)
    }
    
    func displayVideos(viewModel: MainFeed.Data.ViewModel) {
         DispatchQueue.main.async {
        if let images = viewModel.images {
                self.imagesForView = images
                self.tableView.reloadData()
            
            }
      
        }
        
    }
}

extension MainFeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        default:
           return sections[section]
        }
        
  
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: featuredMovieCellIdentifier) as! FeaturedMovieCell
            cell.layOutCollectionView()
            cell.imagesToDisplay = self.imagesForView as! [UIImage]
            cell.backgroundColor = .black
            cell.featuredMovieCollectionView.reloadData()
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: defaultMovieCellIdentifier) as! DefaultMovieCell
            cell.layOutCollectionView()
            cell.imagesToDisplay = self.imagesForView as! [UIImage]
               cell.backgroundColor = .black
            cell.defaultMovieCollectionView.reloadData()
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
           return nil
        default:
            
            let view = UIView()
            view.backgroundColor = shudderBackgroundColor
            let label = UILabel()
            label.text = sections[section]
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = .white
            
            
            
            label.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 35)
            label.textAlignment = .left
            
            
            view.addSubview(label)
             return view
        }
 
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 35
        }
    }
    
}

extension MainFeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return self.view.frame.height * featuredCellHeightIdentifier
        default:
            return self.view.frame.height * cellHeightIdentifier
        }
    }
    
    
}

//Set View Constraints
extension MainFeedViewController {
    
    func setViewConstraints(){
        
        self.view.addSubview(navBar)
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(navBar.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
    
}

//NavBar
extension MainFeedViewController : NavBarViewDelegate {
    
    func rightBarButtonTapped(_ sender: AnyObject) {

        
    }
    
    func leftBarButtonTapped(_ sender: AnyObject) {

        
    }
    
    func middleBarButtonTapped(_ Sender: AnyObject) {
        
        
    }
    
}