//
//  HomeHeaderView.swift
//  Pepper_Assignment
//
//  Created by lidor tamir on 07/10/2021.
//

import UIKit

protocol HomeHeaderViewDelegate : AnyObject {
    func homeHeader(_ header : HomeHeaderView, textDidChange text : String)
}

class HomeHeaderView: UIView {
    var title_lbl : UILabel = UILabel(frame: .zero)
    var searchBar : UISearchBar = UISearchBar(frame: .zero)
    
    weak var delegate : HomeHeaderViewDelegate?
    
    init(frame : CGRect , title : String) {
        super.init(frame: frame)
        backgroundColor = .white
        title_lbl.text = title
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        title_lbl.font = UIFont.systemFont(ofSize: 26)
        self.addSubview(title_lbl)
        self.addSubview(searchBar)
        setupUI()
    }
    
    required init?(coder: NSCoder) {super.init(coder: coder)}
    
}

fileprivate extension HomeHeaderView {
    func setupUI() {
        searchBar.backgroundImage = UIImage()

        title_lbl.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(title_lbl.snp.bottom).offset(8)
            make.left.equalTo(title_lbl.snp.left)
            make.width.equalTo(frame.width - 32)
            make.height.equalTo(40)
        }
    }
}


extension HomeHeaderView : UISearchBarDelegate  {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.homeHeader(self, textDidChange: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("teata")
    }
}
