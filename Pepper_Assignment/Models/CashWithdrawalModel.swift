//
//  CashWithdrawalModel.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import Foundation


class CashWithdrawalModel : BaseOperation  {
    var operationType: String?
    
    var amount: Double?
    
    var operationId: Int?
    
    var source : String? = ""
    
    var address : String? = ""
    
    func contains(_ text: String) -> Bool {
        return source?.contains(text) ?? false || address?.contains(text) ?? false
    }
}
