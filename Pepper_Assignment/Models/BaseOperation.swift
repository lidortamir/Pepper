//
//  BaseOperation.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import Foundation
import UIKit

enum OperationType: String {
    case cash_withdrawal = "CASH_WITHDRAWAL"
    case charge = "CHARGE"
    case refund = "REFUND"
    case saving_withdrawal = "SAVING_WITHDRAWAL"
    case salary = "SALARY"
    
    private static var map : [OperationType : CellIdentifier]  {
        return [
            OperationType.charge : ChargeCell.identifier(),
            OperationType.cash_withdrawal : CashWithDrawalCell.identifier(),
            OperationType.saving_withdrawal : ReceivedPaymentCell.identifier(),
            OperationType.refund : ReceivedPaymentCell.identifier(),
            OperationType.salary : ReceivedPaymentCell.identifier()
        ]
    }
    
    public func getCellByOperationType() -> String {
        return OperationType.map[self] ?? ""
    }
    
    public func heightForType() -> CGFloat {
        switch self {
        case .cash_withdrawal , .charge:
            return CGFloat(60.0)
            
            default :
            return CGFloat(90.0)
        }
    }
}

extension OperationType {
  
}

enum CodingKeys: String, CodingKey {
    case operationId , amount , operationType , operationDesc , address,source
}
protocol BaseOperation : AnyObject, Codable {
    var operationType : String? { get set }
    var amount : Double? { get set }
    var operationId : Int? { get set }
    func contains(_ text : String) -> Bool
}
