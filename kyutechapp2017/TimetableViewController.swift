//
//  TimetableViewController.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/17.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit
import RealmSwift
import BTNavigationDropdownMenu

class TimetableViewController: UIViewController{

    // 曜日と時限のカスタムビュー
    @IBOutlet weak fileprivate var dayOfWeekView: DayOfWeek!
    @IBOutlet weak fileprivate var periodOfTimeView: PeriodOfTime!
    // 曜日と時限の集合と選択された学期
    fileprivate let dow = ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日"]
    fileprivate let pot = ["1限", "2限", "3限", "4限", "5限", "6限"]
    fileprivate var term = 0
    // BTNavigationDropdownMenu
    var menuView: BTNavigationDropdownMenu!
    // 時間割編集モード切り替えボタン
    @IBOutlet weak var modeChangeButton: UIBarButtonItem!
    // 時間割全体(collectionView)
    @IBOutlet weak var timetable: UICollectionView!
    // 入力ボタンのフラグ
    var isDisplay: Bool = true
    // UITableViewで選択された行を一時記憶する変数
    var selectedRow: Int = -1
    // UserTimetableのインスタンス
    let userTimetableRealm = KyutechRealm()
    // ユーザの時間割データを格納する配列
    var classes: [UserTimetable] = []
    // 授業及び担当教員のテスト配列
    fileprivate let classesTestData = ["データ構造とアルゴリズム", "情報メディアとコミュニケーション", "コンピュータ革命と現代社会", "英語III", "棒と軸の力学"]
    fileprivate let teachersTestData = ["中村　貞吾", "西野　和典", "安河内　恵子", "ウィリアムソン　ロジャー　スティル", "石原　大輔"]
    fileprivate let classroomsTestData = ["1101講義室", "MILAiS(講義棟側)", "1204講義室", "1301講義室", "2102講義室"]
    
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
        // NavigationDropdownMenuの設定
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
            self.term = indexPath
        }
        self.navigationItem.titleView = menuView
        
        // ユーザの時間割情報を配列に格納
        let classesObjects = Array(userTimetableRealm.getUserTimetableObjects())

        for _ in 0 ..< 30 {
            self.classes.append(UserTimetable())
        }
        
        for classesObject in classesObjects {
            self.classes[classesObject.cellTag].cellTag = classesObject.cellTag
            self.classes[classesObject.cellTag].classname = classesObject.classname
            self.classes[classesObject.cellTag].classroom = classesObject.classroom
        }
        
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
        cell.delegate = self
        cell.editClassButton.isHidden = isDisplay
        cell.editClassButton.tag = indexPath.row
        cell.classNameLabel.text = classes[indexPath.row].classname
        cell.classroomNumberLabel.text = classes[indexPath.row].classroom
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
    func didPushedEditClassButton(tag: Int, classNameLabel: UILabel, classroomNumberLabel: UILabel) {
        // AlertControllerの設定
        let alert = UIAlertController(title: dow[tag % 5] + " " + pot[tag / 5], message: "", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "削除", style: .destructive) { action in
            classNameLabel.text = ""
            classroomNumberLabel.text = ""
            self.classes[tag].cellTag = -1
            self.classes[tag].term = 0
            self.classes[tag].classname = ""
            self.classes[tag].classroom = ""
            self.userTimetableRealm.removeUserTimetableInfo(cellTag: tag)
            // self.timetable.reloadData()
        })
        alert.addAction( UIAlertAction(title: "追加", style: .default) { action in
            classNameLabel.text = self.classesTestData[self.selectedRow]
            classroomNumberLabel.text = self.classroomsTestData[self.selectedRow]
            self.classes[tag].cellTag = tag
            self.classes[tag].term = self.term
            self.classes[tag].classname = self.classesTestData[self.selectedRow]
            self.classes[tag].classroom = self.classroomsTestData[self.selectedRow]
            self.userTimetableRealm.addUserTimetableInfo(cellTag: tag, term: self.term, classname: self.classesTestData[self.selectedRow], classroom: self.classroomsTestData[self.selectedRow])
            // self.timetable.reloadData()
        })
        
        // AlertController内のUITableViewControllerの設定
        let tableViewController = UITableViewController()
        let nib = UINib(nibName: "ClasstableCell", bundle: nil)
        
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
        tableViewController.tableView.register(nib, forCellReuseIdentifier: "classtableCell")
        
        tableViewController.preferredContentSize = CGSize(width: 272, height: 176)
        
        alert.setValue(tableViewController, forKey: "contentViewController")
        present(alert, animated: true, completion: nil)
    }
    
}


/*
    UITableViewController --------------------
*/
extension TimetableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classesTestData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classtableCell", for: indexPath) as! ClasstableCell
        cell.classNameLabel.text = classesTestData[indexPath.row]
        cell.teacherNameLabel.text = teachersTestData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
    }
    
}
