//
//  TimetableViewController.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/17.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu

protocol EditViewDisplayDelegate {
    func didTappedEditButton()
}

class TimetableViewController: UIViewController{

    // 曜日と時限のカスタムビュー
    @IBOutlet weak fileprivate var dayOfWeekView: DayOfWeek!
    @IBOutlet weak fileprivate var periodOfTimeView: PeriodOfTime!
    // BTNavigationDropdownMenu
    var menuView: BTNavigationDropdownMenu!
    // TableCellDelegate
    var editViewDisplayDelegate: EditViewDisplayDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Edit timetable
    @IBAction func pushEditButton(_ sender: Any) {
        self.editViewDisplayDelegate?.didTappedEditButton()
    }
    
}


/*
    setUp --------------------
*/
extension TimetableViewController {
    
    func setUp() {
        
        // BTNavigationDropdownMenuの設定
        let items = ["第1クォーター", "第2クォーター", "第3クォーター", "第4クォーター"]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: #colorLiteral(red: 0.3333333333, green: 0.7294117647, blue: 0.8823529412, alpha: 1)]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "学期を選択", items: items as [AnyObject])
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        menuView.cellSelectionColor = #colorLiteral(red: 0.3333333333, green: 0.7294117647, blue: 0.8823529412, alpha: 1)
        menuView.cellSeparatorColor = #colorLiteral(red: 0.6666666667, green: 0.6980392157, blue: 0.7411764706, alpha: 1)
        menuView.shouldKeepSelectedCellColor = false
        menuView.cellTextLabelColor = #colorLiteral(red: 0.6666666667, green: 0.6980392157, blue: 0.7411764706, alpha: 1)
        menuView.selectedCellTextLabelColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9490196078, alpha: 1)
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .left // .center // .right // .left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
        }
        
        self.navigationItem.titleView = menuView
        
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
