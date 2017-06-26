//
//  BulletinBoardDetailViewController.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/03/02.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController {

    
    let kCloseCellHeight: CGFloat = 110
    let kOpenCellHeight: CGFloat = 340
    var category:CategoryType?
    
    let kRowsCount = 10
    
    let data = BulletinModel.sharedInstance.getNotice(genre: .call, update: <#T##Double#>)

    fileprivate struct C{
        struct CellHeight {
            static let close: CGFloat = 110
            static let open: CGFloat = 200
        }
    }
    
    var cellHeights:[CGFloat] = (0..<10).map { _ in C.CellHeight.close }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfomations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension DetailViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = CategoryView()
//        headerView.categoryLabel.text = "あいうえお"
//        headerView.categoryImage.image = UIImage(named: "classes")
//        headerView.backgroundColor = UIColor.blue
//        return headerView
//    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard case let cell as DetailCell = cell else {
            return
        }
        
        if cellHeights[indexPath.row] == kCloseCellHeight {
            cell.selectedAnimation(false, animated: false, completion: nil)
        } else {
            cell.selectedAnimation(true, animated: false, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellHeights[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight {//open cell
            cellHeights[(indexPath as NSIndexPath).row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        }else{//close cell
            cellHeights[(indexPath as NSIndexPath).row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
        tableView.beginUpdates()
        tableView.endUpdates()
        }, completion: nil)
    }
    
}


extension DetailViewController{
    func getInfomations(){
        Alamofire.request("http://kyutechapp.planningdev.com/api/v3/i/bullettinboards.json").responseJSON{
            response in
            let json = JSON(response.result.value)
        }
    }
}


