//
//  TimetableViewController.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/17.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu

class TimetableViewController: UIViewController{

    // 曜日と時限のカスタムビュー
    @IBOutlet weak fileprivate var dayOfWeekView: DayOfWeek!
    @IBOutlet weak fileprivate var periodOfTimeView: PeriodOfTime!
    // 曜日と時限の集合
    fileprivate let dow = ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日"]
    fileprivate let pot = ["1限", "2限", "3限", "4限", "5限", "6限"]
    // BTNavigationDropdownMenu
    var menuView: BTNavigationDropdownMenu!
    // 時間割編集モード切り替えボタン
    @IBOutlet weak var modeChangeButton: UIBarButtonItem!
    // 時間割全体(collectionView)
    @IBOutlet weak var timetable: UICollectionView!
    // 入力ボタンのフラグ
    var isDisplay: Bool = true
    // 授業及び担当教員のテスト配列
    fileprivate let classes = ["数学", "英語", "情報"]
    fileprivate let teachers = ["江崎 茉美", "山本 和夫", "山浦 功"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // モード切り替えボタンが押されたとき
    @IBAction func pushModeChangeButton(_ sender: Any) {
        self.modeChangeButton.title = !isDisplay ? "編集" : "保存"
        isDisplay = !isDisplay
        self.timetable.reloadData()
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
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: KyutechColor.themeColor()]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "学期を選択", items: items as [AnyObject])
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = UIColor.white
        menuView.cellSelectionColor = KyutechColor.themeColor()
        menuView.cellSeparatorColor = KyutechColor.darkGray()
        menuView.shouldKeepSelectedCellColor = false
        menuView.cellTextLabelColor = KyutechColor.darkGray()
        menuView.selectedCellTextLabelColor = KyutechColor.lightGray()
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .left // .center // .right // .left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = KyutechColor.lightGray()
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
        }
        self.navigationItem.titleView = menuView
        
    }
}


/*
    UICollectionviewController --------------------
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
    // セルの描画
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // カスタムセルの生成
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timetableCell", for: indexPath) as! TimetableCell
        cell.editClassButton.isHidden = isDisplay
        cell.editClassButton.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    // セルが選ばれたとき
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // segueの呼び出し
        print(indexPath.row)
        performSegue(withIdentifier: "toDetailPageVC",sender: nil)
    }
    
}


/*
    UITableViewController --------------------
*/
extension TimetableViewController: TimetableCellDelegate {
    // 授業編集ボタンが押されたときの処理
    func didPushedEditClassButton(tag: Int) {
        // AlertControllerの設定
        let alert = UIAlertController(title: dow[tag % 5] + " " + pot[tag / 5], message: "", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "削除", style: .destructive) {
            action in NSLog("削除")
        })
        alert.addAction( UIAlertAction(title: "追加", style: .default) {
            action in NSLog("追加")
        })
        
        // AlertController内のUITableViewControllerの設定
        let tableViewController = UITableViewController()
        let nib = UINib(nibName: "classtableCell", bundle: nil)
        
        tableViewController.tableView.delegate = self
        tableViewController.tableView.register(nib, forCellReuseIdentifier: "classtableCell")
        
        tableViewController.preferredContentSize = CGSize(width: 272, height: 176)
        
        alert.setValue(tableViewController, forKey: "contentViewController")
        present(alert, animated: true, completion: nil)
    }
    
}


/*
    UITableViewController --------------------
*/
extension TimetableViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classtableCell", for: indexPath) as! ClasstableCell
        cell.classNameLabel.text = classes[indexPath.row]
        cell.teacherNameLabel.text = teachers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
