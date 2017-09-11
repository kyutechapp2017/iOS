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

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    
    
    let kCloseCellHeight: CGFloat = 117
    let kOpenCellHeight: CGFloat = 320
    let kRowsCount = 10
    var category:CategoryType!
    var genre: Genre?
    let data = BulletinModel.sharedInstance
    var cellHeights:[CGFloat] = (0..<10).map { _ in C.CellHeight.close }
    
    
    fileprivate struct C{
        struct CellHeight {
            static let close: CGFloat = 117
            static let open: CGFloat = 320
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genre = category.getGenre
        setHeaderView(view: headerView, imageView: headerImageView, label: headerLabel, category: category!)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    fileprivate func setHeaderView(view: UIView, imageView: UIImageView, label: UILabel, category: CategoryType){
        let gradient = CAGradientLayer()
        gradient.colors = [category.getColor1.cgColor, category.getColor2.cgColor]
        gradient.startPoint = category.getStartPoint
        gradient.endPoint = category.getEndPoint
        gradient.frame = view.frame
        gradient.locations = [NSNumber(value: 0.0 as Float), NSNumber(value: 1.0 as Float)]
        view.layer.insertSublayer(gradient, at: 0)
        imageView.image = category.headerIcon
        label.text = category.getLabelName
    }
}





extension DetailViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard case let cell as DetailCell = cell else {
            return
        }
        
        if cellHeights[indexPath.row] == kCloseCellHeight {
            cell.selectedAnimation(false, animated: false, completion:nil)
        } else {
            cell.selectedAnimation(true, animated: false, completion: nil)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        
        cell.dateLabel.text = data.getDate(genre: genre!, model: data, num: indexPath.row)
        cell.titleLabel.text = data.getTitle(genre: genre!, model: data, num: indexPath.row)
        
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        guard case let cell as DetailCell = tableView.cellForRow(at: indexPath) else { return }

         let cell = tableView.cellForRow(at: indexPath) as! DetailCell
        
        if cell.isAnimating(){
            return
        }
        genre = category.getGenre
        
        var duration = 0.0
        if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight {//open cell
            cell.containerView = ContentView(model: data, genre: genre!, num: indexPath.row)
            cellHeights[(indexPath as NSIndexPath).row] = cell.contentView.frame.height
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
