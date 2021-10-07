//
//  SavingWithdrawalModel.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import Foundation


class SavingWithdrawalModel : BaseOperation {
    var operationType: String?
    
    var amount: Double?
    
    var operationId: Int?
    
    var operationDesc : String? = ""
    
    func contains(_ text: String) -> Bool {
        return operationDesc?.contains(text) ?? false
    }
}
