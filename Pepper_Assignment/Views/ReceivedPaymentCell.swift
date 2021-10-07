//
//  ReceivedPaymentCell.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import UIKit

class ReceivedPaymentCell:  BaseCell{
    
    @IBOutlet weak var amount_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.amount_label.text = "$0"
    }
    
    override func setupUI(operation: BaseOperation)  {
        self.operation = operation
        self.amount_label.text = "$\(operation.amount ?? 0.0)"
        
    }
    
    @IBAction func clickInfo(_ sender: Any) {
        if let operation = self.operation {
            delegate?.baseCell(self, didClickOnInfo: operation)
        }
    }
}
