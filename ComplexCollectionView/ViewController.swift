//
//  ViewController.swift
//  ComplexCollectionView
//
//  Created by Aniket Rao on 02/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    let customFlowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    func initView(){
        setUpCollectionView()
        mainCollectionView.reloadData()
    }
    
    func setUpCollectionView(){
    
//        let layout = UICollectionViewCompositionalLayout(section: section)
        customFlowLayout.sectionInsetReference = .fromContentInset // .fromContentInset is default
        customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        customFlowLayout.headerReferenceSize = CGSize(width: 0, height: 10)
        customFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        mainCollectionView.collectionViewLayout = customFlowLayout
        let nib = UINib(nibName: "BiographyCVC", bundle: nil)
        let nib1 = UINib(nibName: "AboutInfoCell", bundle: nil)
        let nib2 = UINib(nibName: "NestedCollectionCVC", bundle: nil)
        mainCollectionView.register(UINib(nibName : "SectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        mainCollectionView.register(nib, forCellWithReuseIdentifier: "BiographyCVC")
        mainCollectionView.register(nib1, forCellWithReuseIdentifier: "AboutInfoCell")
        mainCollectionView.register(nib2, forCellWithReuseIdentifier: "NestedCollectionCVC")
    }
}



extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (indexPath.section == 0 || indexPath.section == 2) {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
            view.lblTitle.text = "Title : \(indexPath.section)"//do other header related calls or settups
            return view
            
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section == 0 || section == 2) {
            return CGSize(width: mainCollectionView.frame.width - 20, height: 50)
            
        } else {
            return CGSize.zero
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 6
        } else {
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "BiographyCVC", for: indexPath ) as? BiographyCVC else { return UICollectionViewCell() }
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "AboutInfoCell", for: indexPath ) as? AboutInfoCell else { return UICollectionViewCell() }
            return cell
        }
        
        if indexPath.section == 2{
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "BiographyCVC", for: indexPath ) as? BiographyCVC  else { return UICollectionViewCell() }
            return cell
            
        }
            
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width - 20, height: 0)
        } else if indexPath.section == 1 {
            return CGSize(width: view.frame.width - 20, height: 0)
        } else {
            return CGSize(width: view.frame.width - 20 , height: 0)
        }
    }
}
