//
//  RelayListEmptyView.swift
//  Relay
//
//  Created by seungyeon oh on 2023/01/25.
//

import UIKit
import SnapKit

class RelayListEmptyView: UIView {
    
    private var emptyViewImage: UIImageView {
        let image = UIImageView()
        image.image = UIImage(systemName: "tray")
        image.tintColor = .relayPink1
        
        return image
    }
    private lazy var emptyViewLabel: UILabel = {
        let label = UILabel()
        
        label.text = "현재 시작된 릴레이가 없습니다."
        label.setFont(.body1)
        label.textColor = .relayGray
        
        return label
    }()
    
    init(frame: CGRect, type: ListViewType) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayListEmptyView{
    private func setupLayout() {
        [
            emptyViewImage,
            emptyViewLabel
            
        ].forEach { addSubview($0) }
        
        emptyViewImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(emptyViewLabel.snp.top).offset(30)
        }
        emptyViewLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
