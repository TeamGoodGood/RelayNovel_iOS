//
//  SelfLoginVIewController.swift
//  Relay
//
//  Created by 이창형 on 2023/01/13.
//

import UIKit
import SnapKit

class RelaySelfLoginViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "로그인에 사용할\n이메일을 입력해주세요"
        label.numberOfLines = 0
        label.setFont(.display1)

        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = .relayGray2
        textField.placeholder = "relay@relay.com"
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        
        return textField
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setupLayout()
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.tintColor = .relayBlack
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func setupLayout() {
        [
         titleLabel,
         titleTextField
        ].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(136.0)
            $0.leading.equalToSuperview().inset(20.0)
            
        }
        titleTextField.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
//        closeButton.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(59.0)
//            $0.leading.equalToSuperview().inset(18.0)
//            $0.width.height.equalTo(26.0)
//        }
    }
}
