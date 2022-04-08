//
//  NaviSpotListTableViewCell.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/29.
//

import UIKit

class NaviSpotListTableViewCell: UITableViewCell {

    @IBOutlet weak var destinationImageView: UIImageView!
    @IBOutlet weak var destinationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clear
        selectedBackgroundView = makeSelectedBackgroundView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSpotListCustomCell() {
        
    }
    
    private func makeSelectedBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
}
