//
//  BulletinBoardDetailViewController.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/03/02.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let kCloseCellHeight: CGFloat = 179
    let kOpenCellHeight: CGFloat = 488

    fileprivate struct C{
        struct CellHeight {
            static let close: CGFloat = 70
            static let open: CGFloat = 500
        }
    }
//    var cellHeights = (0..<CELLCOUNT).map{ _ in C.CellHeight.close}
    var cellHeights = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension DetailViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CategoryView()
        headerView.categoryLabel.text = "あいうえお"
        headerView.categoryImage.image = UIImage(named: "classes")
        headerView.backgroundColor = UIColor.blue
        return headerView
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard case let cell as DetailCell = cell else {
            return
        }
        
        cell.backgroundColor = UIColor.clear
        
        if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight{
            cell.selectedAnimation(false, animated: false, completion: nil)
        } else {
            cell.selectedAnimation(true, animated: false, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        if cell.isAnimating(){
            return
        }
        
        var duration = 0.0
        if cellHeights[indexPath.row] == kCloseCellHeight {
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        }else{
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
        tableView.beginUpdates()
        tableView.endUpdates()
        }, completion: nil)
        
    }
}



