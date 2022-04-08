//
//  ShowNaviSpotViewController.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/29.
//

import UIKit

class ShowNaviSpotViewController: UIViewController {
    
    @IBOutlet weak var naviSpotTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setBackground(name: "Background")
        
        let image = UIImage(named: "Background")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.naviSpotTableView.frame.width, height: self.naviSpotTableView.frame.height))
        imageView.image = image
        naviSpotTableView.backgroundView = imageView
        
        naviSpotTableView.dataSource = self
        naviSpotTableView.delegate = self
        naviSpotTableView.register(UINib(nibName: "NaviSpotListTableViewCell", bundle: nil), forCellReuseIdentifier: "NaviSpotListTableViewCell")
    }
    
}

extension ShowNaviSpotViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = naviSpotTableView.dequeueReusableCell(withIdentifier: "NaviSpotListTableViewCell", for: indexPath) as! NaviSpotListTableViewCell
        
        return cell
    }
}

extension ShowNaviSpotViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 5
        return 180
    }
}
