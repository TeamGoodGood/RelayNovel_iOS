//
//  RelayUserActivityCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

final class RelayUserActivityCollectionViewCell: UICollectionViewCell {
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .brown
        
        return imageView
    }()
    
    private lazy var novelActivityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.text = "내가 시작한 릴레이"
        
        return label
    }()
    
    private lazy var novelActivityNumberLabel = UILabel()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        
        return imageView
    }()
    
    //TODO: configure 함수 구현할 때 private 설정 후 configure 함수 내부로 들어갈 예정
    func setupLayout() {
        layer.cornerRadius = 16.0
        backgroundColor = .systemGray6
        
        [
            imageView,
            novelActivityLabel,
            novelActivityNumberLabel,
            arrowImageView
        ].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(40)
            $0.height.equalTo(43.1)
        }
        
        novelActivityLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(20.0)
            $0.top.equalTo(imageView.snp.top)
        }
        
        novelActivityNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(novelActivityLabel.snp.leading)
            $0.top.equalTo(novelActivityLabel.snp.bottom).offset(4.0)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(16.0)
            $0.height.equalTo(26.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
    }
    
    private func setnovelActivityNumberLabel(_ relayCount: Int) {
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15.0)
        ]
        
        let numberAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15.0, weight: .bold),
            .foregroundColor: UIColor.magenta
        ]
        
        let countStr = "\(relayCount)"
        let postPosition = "개"
        
        let joinText = [countStr, postPosition].joined(separator: "")
        let attributedString = NSMutableAttributedString(string: joinText)
        
        let range1 = attributedString.mutableString.range(of: countStr)
        let range2 = attributedString.mutableString.range(of: postPosition)
        
        attributedString.addAttributes(textAttributes, range: range1)
        attributedString.addAttributes(numberAttributes, range: range2)
        
        novelActivityNumberLabel.attributedText = attributedString
    }
}
