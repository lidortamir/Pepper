//
//  OperationFactory.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import Foundation


class OperationFactory {
    public static func create(_ operation : [String : Any]) -> BaseOperation? {
        guard let operationType = operation[CodingKeys.operationType.rawValue] as? String , operationType != "" else {
            return nil
        }
        
        switch operationType {
        case OperationType.charge.rawValue :
            return JSONDecoder().decode(operation, to: ChargeModel.self)
            
        case OperationType.cash_withdrawal.rawValue:
            return JSONDecoder().decode(operation, to: CashWithdrawalModel.self)
            
            
        case OperationType.saving_withdrawal.rawValue:
            return JSONDecoder().decode(operation, to: SavingWithdrawalModel.self)
            
        default:
            return nil
        }
    }
}
    
