//
//  ViewController.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import UIKit


class ViewController: UIViewController {
    
    let HomeHeaderHeight : CGFloat = 90

    fileprivate var tableView = UITableView(frame: .zero)
    
    fileprivate var headerView : HomeHeaderView!

    fileprivate var presenter = MainPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        presenter.loadData()
        setupUI()
    }
}

fileprivate extension ViewController {
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true

        headerView = HomeHeaderView(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: HomeHeaderHeight), title: "Financial operations")
        headerView.delegate = self
        
        tableView.register(ChargeCell.nib(), forCellReuseIdentifier: ChargeCell.identifier())
        
        tableView.register(CashWithDrawalCell.nib(), forCellReuseIdentifier: CashWithDrawalCell.identifier())
        
        tableView.register(ReceivedPaymentCell.nib(), forCellReuseIdentifier: ReceivedPaymentCell.identifier())
        
        tableView.delegate = self
        tableView.dataSource = self
   
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
      
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.list().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let operation = presenter.list()[indexPath.row]
        
        guard let operationType = OperationType(rawValue: operation.operationType ?? ""),
              let cell =
                tableView.dequeueReusableCell(withIdentifier: operationType.getCellByOperationType(), for: indexPath) as? BaseCell
        else {
            return UITableViewCell(frame: .zero)
        }
                
        cell.selectionStyle = .none
        cell.delegate = self
        cell.setupUI(operation: operation)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let operation = presenter.list()[indexPath.row]
        
        let operationType =
                OperationType(rawValue: operation.operationType ?? "")
        return operationType?.heightForType() ?? 0
    
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HomeHeaderHeight
    }
}

extension ViewController : HomeHeaderViewDelegate {
    func homeHeader(_ header: HomeHeaderView, textDidChange text: String) {
        presenter.filter(text)
    }
}

extension ViewController : MainPresenterDelegate , BaseCellDelegate {
    
    func baseCell(_ cell: BaseCell, didClickOnInfo operation: BaseOperation) {
        print("Operation : \(operation.operationType ?? "") has been clicked")
    }
    
    func reloadUI() {
        tableView.reloadData()
    }
}

