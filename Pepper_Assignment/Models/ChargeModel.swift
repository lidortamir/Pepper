//
//  ChargeModel.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import Foundation


class ChargeModel : BaseOperation {
    
    var operationType: String?
    
    var amount: Double?
    
    var operationId: Int?
   
    var  operationDesc : String? = nil
    
    func contains(_ text: String) -> Bool {
        return operationDesc?.contains(text) ?? false
    }
}
