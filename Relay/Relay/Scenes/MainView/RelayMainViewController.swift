//
//  RelayMainHostingController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/03.
//

import SwiftUI
import UIKit
import SnapKit

class RelayMainViewController: UIViewController {
    @ObservedObject var observable: PageAnimationViewObservable = PageAnimationViewObservable()
    private var recommend: Recommend?
    
    //TODO: 알람이 있을때 이미지 변경 필요
    private lazy var noticeButton = UIBarButtonItem(
        image: UIImage(systemName: "bell"),
        style: .plain,
        target: self,
        action: #selector(goToNoticeView)
    )
    
    //TODO: 이미지 크기 변경 필요
    private lazy var logoButton = UIBarButtonItem(
        image: UIImage(named: "RelayLogo"),
        style: .plain,
        target: self,
        action: nil
    )
    
    private let animationView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("릴레이 시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        
        button.backgroundColor = UIColor.relayBlack
        
        button.layer.cornerRadius = 8
        
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(goToWritingView), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //TODO: 데이터호출 API로 변경
        recommend = mockRecommend.recommend
        
        observable.onTouchAction = { [weak self] in
            guard let pageNumber = self?.observable.pageNumber else { return}
            
            let relayReadingViewController = RelayReadingViewController()
            
            switch pageNumber {
            case 0, 3:
                self?.navigationController?.pushViewController(relayReadingViewController, animated: true)
            case 1, 4:
                self?.navigationController?.pushViewController(relayReadingViewController, animated: true)
            case 2, 5:
                self?.navigationController?.pushViewController(relayReadingViewController, animated: true)
            default:
                print("Story가 확인되지 않았습니다.")
            }
        }
        
        self.addAnimationView()
        setNavigationBar()
        setupLayout()
    }
}

extension RelayMainViewController {
    private func setNavigationBar() {
        noticeButton.tintColor = .relayBlack
        logoButton.tintColor = .relayPink1
        
        navigationItem.leftBarButtonItem = logoButton
        navigationItem.rightBarButtonItem = noticeButton
    }
    
    @objc
    private func goToNoticeView() {
        let noticeViewController = RelayNoticeViewController()
        
        navigationController?.pushViewController(noticeViewController, animated: true)
    }
    
    @objc
    func goToWritingView(_ sender: UIButton!) {
        let vc = RelayWritingViewController()
        
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func setupLayout() {
        [
            animationView
            
        ].forEach { view.addSubview($0) }
        animationView.addSubview(submitButton)
        
        animationView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120.0)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        submitButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34.44)
            $0.height.equalTo(52.56)
            $0.leading.equalToSuperview().inset(15.0)
            $0.trailing.equalToSuperview().inset(15.0)
        }
    }
    
    func addAnimationView() {
        if let recommend = recommend {
            let hostingController = UIHostingController(rootView: PageAnimationView(observable: observable, recommend: recommend))
            
            hostingController.view.frame = animationView.bounds
            hostingController.didMove(toParent: self)
            
            addChild(hostingController)
            animationView.addSubview(hostingController.view)
        } else {
            print("Recommend 데이터 호출 실패")
        }
    }
    
}
