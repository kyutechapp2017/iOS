//
//  TimetableViewController.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/17.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class TimetableViewController: UIViewController {
    
    @IBOutlet weak var timetableView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


/*
    Set up --------------------
*/
extension TimetableViewController {

    func setUp() {
        timetableView.delegate = self
        timetableView.dataSource = self
    }
    
}


/*
    Collectionview --------------------
*/
extension TimetableViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // セクション数の決定
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // セルの数の決定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    // セルのサイズを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tableWidth = (UIScreen.main.bounds.size.width - CGFloat(45)) / CGFloat(5)
        let tableHeight = (UIScreen.main.bounds.size.height - CGFloat(45)) / CGFloat(6)
        
        return CGSize(width: tableWidth, height: tableHeight)
    }
    
    // セルの間の余白を設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // カスタムセルの紐付け
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classCell", for: indexPath)
        return cell
    }
    
    // セルが選ばれたとき
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // segueの呼び出し
        performSegue(withIdentifier: "toDetailPageVC",sender: nil)
    }

}
