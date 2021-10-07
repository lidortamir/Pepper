//
//  CashWithDrawalCell.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import UIKit

class CashWithDrawalCell: BaseCell{
    
    
    @IBOutlet weak var amount_lbl: UILabel!
    @IBOutlet weak var location_name_label: UILabel!
    @IBOutlet weak var address_label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.amount_lbl.text = "$0"
        self.location_name_label.text = ""
    }
    
    override func setupUI(operation: BaseOperation)   {
        if let model = operation as? CashWithdrawalModel {
            self.operation = model
            self.location_name_label.text = model.source
            self.amount_lbl.text = "$\(model.amount ?? 0.0)"
            self.address_label.text = model.address
        }
    }
    
}
