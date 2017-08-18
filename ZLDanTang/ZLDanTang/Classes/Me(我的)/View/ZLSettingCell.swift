//
//  ZLSettingCell.swift
//  
//
//  Created by ZL on 2017/8/17.
//
//

import UIKit

class ZLSettingCell: UITableViewCell {
    
    var setting: ZLSettingModel? {
        
        didSet {
            iconImageView.image = UIImage(named: setting!.iconImage!)
            leftLabel.text = setting!.leftTitle
            rightLabel.text = setting!.rightTitle
            disclosureIndicator.isHidden = setting!.isHiddenRightTip!
            switchView.isHidden = setting!.isHiddenSwitch!
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var disclosureIndicator: UIImageView!
    
    @IBOutlet weak var switchView: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
