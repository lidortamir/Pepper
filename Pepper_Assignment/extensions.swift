//
//  extensions.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import Foundation
import UIKit

typealias CellIdentifier = (String)

extension Bundle {
    func json(file  name : String) -> [String : Any]? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try? Data(contentsOf : URL(fileURLWithPath: bundlePath)) {
                return try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}

extension JSONDecoder {
    func decode<T : Decodable>(_ from : Any , to : T.Type) -> T? {
        guard let data = try? JSONSerialization.data(withJSONObject: from, options: .prettyPrinted) else { return nil}
        do {
            let model = try self.decode(T.self, from: data)
            return model
        } catch {
        }
        return nil
    }
}


extension String {
    public static func isEmpty(_ text : String?) -> Bool {
        return text == nil || text == "" 
    }
}
