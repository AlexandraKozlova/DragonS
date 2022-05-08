//
//  DragonInfoVC.swift
//  DragonS
//
//  Created by Aleksandra on 08.05.2022.
//

import UIKit
import SDWebImage

class DragonInfoVC: UIViewController {
    
    var currentDragon: DragonInfo!
    
    init(currentDragon: DragonInfo) {
        super.init(nibName: nil, bundle: nil)
        self.currentDragon = currentDragon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let images: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let firstFlightImage = UIImageView()
    let firstFlightLabel = DLabel(fontSize: 20, textAlignment: .left, textColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    let heightOfTrunkImage = UIImageView()
    let heightOfTrunkLabel = DLabel(fontSize: 20, textAlignment: .left, textColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    let dryMassImage = UIImageView()
    let dryMassLabel = DLabel(fontSize: 20, textAlignment: .left, textColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    let descriptionLabel = BioLabel()
    let wikiButton = WikipediaButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewDidLoad()
        updateUIElements()
        configureImages()
        configureFirstFlightImage()
        configureFirstFlightLabel()
        configureHeightOfTrunkImage()
        congigureHeightOfTrunkLabel()
        configureDryMassImage()
        configureDryMassLabel()
        configureDescriptionLabel()
        congigureWikiButton()
    }
    
    private func updateUIElements() {
        let imageUrl = currentDragon.flickrImages[0]
        let url = URL(string: imageUrl)
        images.sd_setImage(with: url)
        firstFlightLabel.text = "First flight: \(currentDragon.firstFlight)"
        heightOfTrunkLabel.text = "Height of trunk: \(currentDragon.heightWTrunk.meters) meters"
        dryMassLabel.text = "Dry mass: \(currentDragon.dryMassKg) kilograms "
        descriptionLabel.text = currentDragon.description
    }
    
    private func configureViewDidLoad() {
        view.backgroundColor = .systemGray6
        title = currentDragon.name
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    
    private func configureImages() {
        view.addSubview(images)
        images.layer.cornerRadius = 50
        
        NSLayoutConstraint.activate([
            images.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            images.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            images.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            images.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureFirstFlightImage() {
        view.addSubview(firstFlightImage)
        firstFlightImage.translatesAutoresizingMaskIntoConstraints = false
        firstFlightImage.image = UIImage(named: "rocket")
        
        NSLayoutConstraint.activate([
            firstFlightImage.topAnchor.constraint(equalTo: images.bottomAnchor, constant: 5),
            firstFlightImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstFlightImage.heightAnchor.constraint(equalToConstant: 25),
            firstFlightImage.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func configureFirstFlightLabel() {
        view.addSubview(firstFlightLabel)
        
        NSLayoutConstraint.activate([
            firstFlightLabel.topAnchor.constraint(equalTo: images.bottomAnchor, constant: 5),
            firstFlightLabel.leadingAnchor.constraint(equalTo: firstFlightImage.trailingAnchor, constant: 5),
            firstFlightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            firstFlightLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func configureHeightOfTrunkImage() {
        view.addSubview(heightOfTrunkImage)
        heightOfTrunkImage.translatesAutoresizingMaskIntoConstraints = false
        heightOfTrunkImage.image = UIImage(named: "rocket")
        
        NSLayoutConstraint.activate([
            heightOfTrunkImage.topAnchor.constraint(equalTo: firstFlightImage.bottomAnchor, constant: 5),
            heightOfTrunkImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            heightOfTrunkImage.heightAnchor.constraint(equalToConstant: 25),
            heightOfTrunkImage.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func congigureHeightOfTrunkLabel() {
        view.addSubview(heightOfTrunkLabel)
        
        NSLayoutConstraint.activate([
            heightOfTrunkLabel.topAnchor.constraint(equalTo: firstFlightLabel.bottomAnchor, constant: 5),
            heightOfTrunkLabel.leadingAnchor.constraint(equalTo: heightOfTrunkImage.trailingAnchor, constant: 5),
            heightOfTrunkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            heightOfTrunkLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func configureDryMassImage() {
        view.addSubview(dryMassImage)
        dryMassImage.translatesAutoresizingMaskIntoConstraints = false
        dryMassImage.image = UIImage(named: "rocket")
        
        NSLayoutConstraint.activate([
            dryMassImage.topAnchor.constraint(equalTo: heightOfTrunkImage.bottomAnchor, constant: 5),
            dryMassImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dryMassImage.heightAnchor.constraint(equalToConstant: 25),
            dryMassImage.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func configureDryMassLabel() {
        view.addSubview(dryMassLabel)
        
        NSLayoutConstraint.activate([
            dryMassLabel.topAnchor.constraint(equalTo: heightOfTrunkLabel.bottomAnchor, constant: 5),
            dryMassLabel.leadingAnchor.constraint(equalTo: dryMassImage.trailingAnchor, constant: 5),
            dryMassLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            dryMassLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func configureDescriptionLabel() {
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: dryMassLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    private func congigureWikiButton() {
        view.addSubview(wikiButton)
        
        NSLayoutConstraint.activate([
            wikiButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            wikiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            wikiButton.heightAnchor.constraint(equalToConstant: 35),
            wikiButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
}


