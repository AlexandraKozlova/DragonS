//
//  DragonsListVC.swift
//  DragonS
//
//  Created by Aleksandra on 06.05.2022.
//

import UIKit
import SDWebImage

class DragonsListVC: UIViewController {
    
    var dragonsList = [DragonsList]()
  
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getDragonsList()
        configureRefreshControl()
    }
    
    private func getDragonsList() {
        showLoadingView()
        NetworkManager.shared.getDragons { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.dissmisLoadingView()
                switch result {
                case .success(let dragonsList):
                    self.dragonsList = dragonsList
                    self.tableView.reloadData()
                case .failure(let error):
                    self.presentAlertOnMainThread(title: "Oops, something went wrong!", message: error.rawValue, buttonTitle: "Okay")
                }
            }
        }
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemGray6
        tableView.rowHeight = (tableView.frame.height / 2) - 50
        tableView.separatorColor = .clear
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DragonCell.self, forCellReuseIdentifier: DragonCell.reuseID)
    }
    
    private func configureRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc private func refresh() {
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
}


extension DragonsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dragonsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DragonCell.reuseID) as! DragonCell
        let dragon = dragonsList[indexPath.row]
        let imageUrl = dragon.flickrImages[0]
        let url = URL(string: imageUrl)
        cell.pictureView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        cell.dragonName.text = dragon.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showLoadingView()
        let dragon = dragonsList[indexPath.row]
        NetworkManager.shared.getDragonInfo(at: dragon.id) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.dissmisLoadingView()
                switch result {
                case .success(let dragon):
                    let destinationVC = DragonInfoVC(currentDragon: dragon)
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                case .failure(let error):
                    self.presentAlertOnMainThread(title: "Oops, something went wrong!", message: error.rawValue, buttonTitle: "Okay")
                }
            }
        }
    }
}







