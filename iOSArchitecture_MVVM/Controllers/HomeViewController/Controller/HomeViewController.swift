//
//  HomeViewController.swift
//  FantomLED
//
//  Created by Surjeet Singh on 01/06/18.
//  Copyright © 2018 Surjeet Singh. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView?
    
    lazy var viewModel: HomeViewModel = {
        let obj = HomeViewModel()
        self.baseVwModel = obj
        return obj
    }()

    // MARK: Apple Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        self.hideBackButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func initialize() {

//        self.tblView?.register(UINib(nibName: CustomSliderTableCell.className, bundle: nil), forCellReuseIdentifier: CustomSliderTableCell.className)
     
        self.title = "Home"
        self.tblView?.tableFooterView = UIView()
        self.initViewModel()
    }
       
    func initViewModel() {
        
        viewModel.reloadListViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tblView?.reloadData()
            }
        }

        viewModel.fetchListing()
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return viewModel.heightForIndexPath(indexPath) //(obj.status ? 138 : 110)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.className, for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        cell.listing = viewModel.roomForIndexPath(indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: DetailViewController.className) as! DetailViewController
        controller.viewModel = DetailViewModel(with: viewModel.roomForIndexPath(indexPath))
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

class TableCell:UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    open var listing:Listing? {
        didSet {
            self.titleLbl.text = listing?.name
            self.subTitleLbl.text = listing?.subTitle
            
            self.contentView.backgroundColor = (listing?.enable ?? false) ? UIColor.white : UIColor.lightGray.withAlphaComponent(0.3)
        }
    }
}
