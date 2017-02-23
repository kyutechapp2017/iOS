//
//  TimetableViewController.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/17.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class TimetableViewController: UIViewController {

    // 曜日と時限のカスタムビュー
    @IBOutlet weak var dayOfWeekView: DayOfWeek!
    @IBOutlet weak var periodOfTimeView: PeriodOfTime!
    
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
        
        // StatusBar,NavigationBar,TabBarの高さを取得
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
        let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
        let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
    
        // 曜日のカスタムビューの高さと時限のカスタムビューの幅を取得
        let dowHeight = self.dayOfWeekView.frame.size.height
        let potWidth = self.periodOfTimeView.frame.size.width
        
        let tableWidth = (UIScreen.main.bounds.size.width - CGFloat(potWidth)) / CGFloat(5)
        let tableHeight = (UIScreen.main.bounds.size.height - CGFloat(statusBarHeight) - CGFloat(navigationBarHeight!) - CGFloat(tabBarHeight!) - CGFloat(dowHeight)) / CGFloat(6)
        
        
        return CGSize(width: tableWidth, height: tableHeight)
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
