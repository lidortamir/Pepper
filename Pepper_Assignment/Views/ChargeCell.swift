//
//  ChargeCell.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import UIKit

protocol BaseCellDelegate : AnyObject {
    func baseCell(_ cell : BaseCell , didClickOnInfo operation : BaseOperation)
}

class BaseCell : UITableViewCell {
    var operation : BaseOperation?

    weak var delegate : BaseCellDelegate?
    
    func setupUI(operation: BaseOperation) {
        preconditionFailure("This method must be overridden")
    }
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}


class ChargeCell: BaseCell {
    
    @IBOutlet weak var location_label: UILabel!
    
    @IBOutlet weak var amount_label: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupUI(operation: BaseOperation)  {
        if let chargeModel = operation as? ChargeModel {
            self.operation = chargeModel
            self.location_label.text = chargeModel.operationDesc
            self.amount_label.text = "$\(chargeModel.amount ?? 0.0)"
        }
    }
    
    @IBAction func clickInfo(_ sender: Any) {
        if let operation = self.operation {
            delegate?.baseCell(self, didClickOnInfo: operation)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.amount_label.text = "$0"
        self.location_label.text = ""
    }
}
