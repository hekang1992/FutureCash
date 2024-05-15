//
//  RightOneView.swift
//  FutureCash
//
//  Created by apple on 2024/5/14.
//

import UIKit
import SnapKit

class RightOneView: UIView {

    var block1: (() -> Void)?
    
    var block2: (() -> Void)?
        
    let titleArray = ["Unpaid loan balance","Loan delinquency","Loan under review","Failed loan disbursement","Loan fully repaid"]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(RightViewCell.self, forCellReuseIdentifier: "RightViewCell")
        return tableView
    }()
    
    lazy var btn1: UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.addTarget(self, action: #selector(btn1Click), for: .touchUpInside)
        return btn1
    }()
    
    lazy var btn2: UIButton = {
        let btn2 = UIButton(type: .custom)
        btn2.addTarget(self, action: #selector(btn2Click), for: .touchUpInside)
        return btn2
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalToSuperview()
            make.bottom.equalTo(self).offset(-10.px())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RightOneView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 226.px()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        let hongqiImageView = UIImageView()
        hongqiImageView.image = UIImage(named: "honeqibg")
        headView.addSubview(hongqiImageView)
        let heiqiImageView = UIImageView()
        heiqiImageView.isUserInteractionEnabled = true
        heiqiImageView.image = UIImage(named: "heiqiimage")
        headView.addSubview(heiqiImageView)
        heiqiImageView.addSubview(btn1)
        heiqiImageView.addSubview(btn2)
        hongqiImageView.snp.makeConstraints { make in
            make.top.equalTo(headView)
            make.left.equalTo(headView)
            make.size.equalTo(CGSizeMake(140.px(), 224.px()))
        }
        heiqiImageView.snp.makeConstraints { make in
            make.top.equalTo(headView)
            make.left.equalTo(hongqiImageView.snp.right)
            make.size.equalTo(CGSizeMake(140.px(), 224.px()))
        }
        btn1.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(113.px())
        }
        btn2.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(113.px())
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RightViewCell", for: indexPath) as? RightViewCell {
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.nameLable.text = titleArray[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.px()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath>>>>>>>>\(indexPath.row)")
    }
    
    @objc func btn1Click() {
        self.block1?()
    }
    
    @objc func btn2Click() {
        self.block2?()
    }
    
}
