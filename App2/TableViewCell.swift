//
//  TableViewCell.swift
//  App2
//
//  Created by user209640 on 3/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name: String?, phone: String?, lastname: String?){
        
        
        self.lblName.text = name! + " " + lastname!
        self.lblPhone.text = phone
        
        if (UserDefaults.standard.integer(forKey: "tablaFuente") != nil){
            
            var size = UserDefaults.standard.integer(forKey: "tablaFuente")
            lblName.font = UIFont(name: lblName.font.fontName, size: CGFloat(size))
            lblPhone.font = UIFont(name: lblPhone.font.fontName, size: CGFloat(size))
        }

     
    }

}
