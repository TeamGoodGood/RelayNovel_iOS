//
//  RelayReadingFooterView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit

class RelayReadingFooterView: UIView {
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "heart.fill")
        
        button.tintColor = .relayPink1
        button.setTitle("13", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .bold)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceLeftToRight
        
        button.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        
        return button
    }()
    
    private lazy var batonButton: UIButton = {
        let button = UIButton()
        button.setTitle("바통 터치", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = .relayBlack
        button.layer.cornerRadius = 16.0
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayReadingFooterView {
    private func setupLayout() {
        [
            likeButton,
            batonButton
        ].forEach { addSubview($0) }
        
        likeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(81.0)
            $0.height.equalTo(56.0)
        }
        
        batonButton.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.top)
            $0.leading.equalTo(likeButton.snp.trailing).offset(16.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(likeButton.snp.height)
        }
    }
}
