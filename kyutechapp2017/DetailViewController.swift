//
//  BulletinBoardDetailViewController.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/03/02.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    fileprivate struct C{
        struct CellHeight {
            static let close: CGFloat = 70
            static let open: CGFloat = 500
        }
    }
    
    var cellHeights = (0..<CELLCOUNT).map{ _ in C.CellHeight.close}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



extension DetailViewController: UITableViewDelegate,UITableViewDataSource{
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do something
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
}
