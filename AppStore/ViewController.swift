//
//  ViewController.swift
//  AppStore
//
//  Created by admin70 on 23/10/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        DataModel.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return DataModel.promotedApps.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "promoted", for: indexPath)
            //get app from array of promoted apps
            let promotedApp = DataModel.promotedApps[indexPath.row]
            if let cell = cell as? PromotedCollectionViewCell {
                cell.headingLabel.text = promotedApp.title
                cell.subTitle.text = promotedApp.subtitle
                cell.titleLabel.text = promotedApp.title
                cell.imageView.backgroundColor = randomColor
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section,env)->NSCollectionLayoutSection? in
            
            let sectionType = DataModel.sections[section]
            switch sectionType {
            case .promoted, .category, .regular, .standard:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(300))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            
            }
        }
        return layout
    }
    


}

