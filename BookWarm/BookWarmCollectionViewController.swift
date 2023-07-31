//
//  BookWarmCollectionViewController.swift
//  BookWarm
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit


class BookWarmCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "BookWarmCollectionViewCell", bundle: nil)

        collectionView.register(nib, forCellWithReuseIdentifier: "BookWarmCollectionViewCell")
        
        setCollectionViewLayout()
        
        // MARK: - 상자모양 세팅
    }
    func setCollectionViewLayout() {
        //cell estimated size none으로 인터페이스 빌더에서 설정할 것!
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collectionView.collectionViewLayout = layout
    }
    
    
    
    
    // MARK: - collectionView method
    //1.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    //2.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookWarmCollectionViewCell", for: indexPath) as! BookWarmCollectionViewCell
        
        cell.backgroundColor = getRandomColor()
        cell.titleLabel.text = "\(indexPath)"
        
        return cell
    }
    
    func getRandomColor() -> UIColor {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
}


