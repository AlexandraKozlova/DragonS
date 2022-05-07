//
//  DragonsListVC.swift
//  DragonS
//
//  Created by Aleksandra on 06.05.2022.
//

import UIKit
import SDWebImage

class DragonsListVC: UIViewController {
    
    let tableView = UITableView()
    var dragonsList = [DragonsList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getDragonsList()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)

        tableView.frame = view.bounds
        tableView.backgroundColor = .systemGray6
        tableView.rowHeight = 350
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DragonCell.self, forCellReuseIdentifier: DragonCell.reuseID)
    }
    
    private func getDragonsList() {
        NetworkManager.shared.getDragons { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let dragonsList):
                    self.dragonsList = dragonsList
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
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
            cell.pictureView.sd_setImage(with: url)
            cell.dragonName.text = dragon.name
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        }
    }


   




