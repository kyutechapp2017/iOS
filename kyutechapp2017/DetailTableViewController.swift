//
//  BulletinBoardDetailViewController.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/03/02.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {


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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



extension DetailTableViewController{
    
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as FoldingCell = tableView.cellForRow(at: indexPath) else {
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
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
    
    func animationDuration(itemIndex: NSInteger, type: CAAnimation.Type) ->TimeInterval{
        let durations = [0.33, 0.26,0.26]
        return durations[itemIndex]
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as FoldingCell = cell {
            if cellHeights[indexPath.row] == C.CellHeight.close{
                cell.selectedAnimation(false, animated: false, completion: nil)
            }else {
                cell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
}
