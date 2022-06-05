//
//  DragonInfoVC.swift
//  DragonS
//
//  Created by Aleksandra on 08.05.2022.
//

import UIKit
import SDWebImage

class DragonInfoVC: UIViewController {
    
    private var currentDragon: DragonInfo!
    
    init(currentDragon: DragonInfo) {
        super.init(nibName: nil, bundle: nil)
        self.currentDragon = currentDragon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var galleryDragons = GalleryCollectionView()
    private let stackOfImages = DStackView()
    private let stackOfLabels = DStackView()
    private let firstFlightImage = UIImageView()
    private let firstFlightLabel = DLabel(fontSize: 18, textAlignment: .left, textColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    private let heightOfTrunkImage = UIImageView()
    private let heightOfTrunkLabel = DLabel(fontSize: 18, textAlignment: .left, textColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    private let dryMassImage = UIImageView()
    private let dryMassLabel = DLabel(fontSize: 18, textAlignment: .left, textColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    private let descriptionLabel = BioLabel()
    private let wikiButton = WikipediaButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configureGalleryDragons()
        configureViewDidLoad()
        updateUIElements()
        configureDescriptionLabel()
        congigureWikiButton()
        configureStackOFImages()
        configureStackOfLabel()
    }
    
    private func updateUIElements() {
        firstFlightLabel.text = "First flight: \(currentDragon.firstFlight)"
        heightOfTrunkLabel.text = "Height: \(currentDragon.heightWTrunk.meters) meters"
        dryMassLabel.text = "Dry mass: \(currentDragon.dryMassKg) kilograms "
        descriptionLabel.text = currentDragon.description
    }
    
    @objc private func buttunTapped() {
        guard let url = URL(string: currentDragon.wikipedia) else { presentAlertOnMainThread(title: "Oops, something went wrong!", message: "Check your internet connection and try again.", buttonTitle: "Okay")
            return }
        presentSafariVC(with: url)
    }
    
    private func configureViewDidLoad() {
        view.backgroundColor = .systemGray6
        title = currentDragon.name
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 700)
        ])
    }
    
    private func configureGalleryDragons() {
        contentView.addSubview(galleryDragons)
        galleryDragons.delegate = self
        galleryDragons.dataSource = self
        
        NSLayoutConstraint.activate([
            galleryDragons.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            galleryDragons.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            galleryDragons.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            galleryDragons.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureStackOFImages() {
        contentView.addSubview(stackOfImages)
        
        let arrayOfImages = [firstFlightImage, heightOfTrunkImage, dryMassImage]
        for image in arrayOfImages {
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "rocket")
            stackOfImages.addArrangedSubview(image)
        }
        
        NSLayoutConstraint.activate([
            stackOfImages.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 330),
            stackOfImages.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: SizeConstants.leftDistanceToView),
            stackOfImages.widthAnchor.constraint(equalToConstant: 25),
            stackOfImages.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    private func configureStackOfLabel() {
        contentView.addSubview(stackOfLabels)
        stackOfLabels.addArrangedSubview(firstFlightLabel)
        stackOfLabels.addArrangedSubview(heightOfTrunkLabel)
        stackOfLabels.addArrangedSubview(dryMassLabel)
        
        NSLayoutConstraint.activate([
            stackOfLabels.topAnchor.constraint(equalTo: stackOfImages.topAnchor),
            stackOfLabels.leadingAnchor.constraint(equalTo: stackOfImages.trailingAnchor, constant: 5),
            stackOfLabels.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -SizeConstants.rightDistanceToView),
            stackOfLabels.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    private func configureDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 420),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: SizeConstants.leftDistanceToView),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -SizeConstants.rightDistanceToView),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    private func congigureWikiButton() {
        contentView.addSubview(wikiButton)
        wikiButton.addTarget(self, action: #selector(buttunTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            wikiButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            wikiButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -SizeConstants.rightDistanceToView),
            wikiButton.heightAnchor.constraint(equalToConstant: 35),
            wikiButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
}


extension DragonInfoVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currentDragon.flickrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryDragons.dequeueReusableCell(withReuseIdentifier: GalleryCell.reuseID, for: indexPath) as! GalleryCell
        let urlString = currentDragon.flickrImages[indexPath.row]
        let url = URL(string: urlString)
        cell.imageDragon.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SizeConstants.galleryItemWidth, height: galleryDragons.frame.height)
    }
}



