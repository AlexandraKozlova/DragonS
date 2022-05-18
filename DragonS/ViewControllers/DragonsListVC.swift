//
//  DragonsListVC.swift
//  DragonS
//
//  Created by Aleksandra on 06.05.2022.
//

import UIKit
import SDWebImage
import Combine

class DragonsListVC: UIViewController {
    
    var dragonsList = [DragonsList]()
    var casheList = [DragonsList]()
    private var subscriptions = Set<AnyCancellable>()
    
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        casheList = StorageManager.shared.getCasheList()
        configureTableView()
        getDragons()
        configureRefreshControl()
    }
    
    private func getDragons() {
        guard casheList.isEmpty else {
            dragonsList = casheList
            getDragonsList()
            return
        }
        getDragonsList()
    }
    
    private func getDragonsList() {
        showLoadingView()
        NetworkManager.shared.getDragons()
            .sink(receiveCompletion: {[weak self] (completion) in
                guard let self = self else { return }
                self.dissmisLoadingView()
                if case let .failure( error) = completion {
                    self.presentAlertOnMainThread(title: "Oops, something went wrong!", message: error.rawValue, buttonTitle: "Okay")
                }
            }, receiveValue: { dragonsList in
                self.dragonsList = dragonsList
                StorageManager.shared.saveObject(dragonsList: dragonsList)
                self.tableView.reloadData()
            })
            .store(in: &self.subscriptions)
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
        getDragonsList()
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
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showLoadingView()
        let dragon = dragonsList[indexPath.row]
        NetworkManager.shared.getDragonInfo(at: dragon.id)
            .sink(receiveCompletion: {[weak self] (completion) in
                guard let self = self else { return }
                self.dissmisLoadingView()
                if case let .failure( error) = completion {
                    self.presentAlertOnMainThread(title: "Oops, something went wrong!", message: error.rawValue, buttonTitle: "Okay")
                }
            }, receiveValue: { currentDragon in
                let destinationVC = DragonInfoVC(currentDragon: currentDragon)
                self.navigationController?.pushViewController(destinationVC, animated: true)
            })
            .store(in: &self.subscriptions)
    }
}







