//
//  Presenter.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import Foundation

protocol MainPresenterDelegate: AnyObject {
    func reloadUI()
}

class MainPresenter {
    
    weak var delegate : MainPresenterDelegate?
    
    private var items : [BaseOperation] = []
    
    private var searchKeyword = ""
    
    func loadData() {
        items.removeAll()
        guard let data = Bundle.main.json(file: "data") , let list = data["operations"] as? [[String : Any]] else {
            return
        }
                    
        for item in list {
            if let obj = OperationFactory.create(item) {
                items.append(obj)
            }
        }
        
        delegate?.reloadUI()
    }
    
    func list() -> [BaseOperation] {
        if String.isEmpty(searchKeyword) {
            return items
        }
        
        return self.items.filter {[weak self] operation in
            return operation.contains(self?.searchKeyword ?? "")
        }
    }
    
    func filter(_ text : String) {
        searchKeyword = text
        delegate?.reloadUI()
    }
}
