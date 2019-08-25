//
//  SwipeTopView.swift
//  SwipeTopView
//
//  Created by Yusuf Çınar on 19.12.2018.
//  Copyright © 2018 Yusuf Çınar. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol SwipeTopViewDataSource : NSObjectProtocol {
    func heightContainerView() -> CGFloat
    func containerSwipeTopView() -> UIView
    func constantContainerSwipeTopView() -> UIEdgeInsets
}
@objc public protocol SwipeTopViewDelegate : NSObjectProtocol {
    func swipeTopViewWillOpen (_ swipeTopView : SwipeTopView)
    func swipeTopViewDidOpen (_ swipeTopView : SwipeTopView)
    func swipeTopViewWillClose (_ swipeTopView : SwipeTopView)
    func swipeTopViewDidClose (_ swipeTopView : SwipeTopView)
}

public class SwipeTopView: UIView {
    
    private var heightContentView : CGFloat?
    private var containerSwipeTopView : UIView? {
        didSet {
            setupContainerAddConstraintView()
        }
    }
    public weak var delegate : SwipeTopViewDelegate?
    public weak var dataSource : SwipeTopViewDataSource?
   
    public override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    fileprivate func startOrganizerView() {
        setupViewInit()
        setupView()
    }
    fileprivate func setupViewInit() {
        guard let dataSource = self.dataSource else { return  }
        guard let window = UIApplication.shared.keyWindow else { return  }
        
        let heightContentView = dataSource.heightContainerView() + window.safeAreaInsets.top
        self.heightContentView = heightContentView
        window.addSubview(self)
        setupAddConstraintView()
        
        containerSwipeTopView = dataSource.containerSwipeTopView()
        
    }
    fileprivate func setupView() {
        setupAddConstraintView()
    }
    fileprivate func setupAddItemView(){
      
        guard let containerSwipeTopView = self.containerSwipeTopView else { return  }
        self.addSubview(containerSwipeTopView)
        
    }
    fileprivate func setupAddConstraintView(){
        guard let heightContentView = self.heightContentView else { return  }
        guard let window = UIApplication.shared.keyWindow else { return  }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo:window.topAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: heightContentView + 10).isActive = true
        self.rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
        
    }
    fileprivate func setupContainerAddConstraintView(){
        
        guard let dataSource = self.dataSource else { return  }
        guard let containerSwipeTopView = self.containerSwipeTopView else { return  }
        guard let window = UIApplication.shared.keyWindow else { return  }
        
        setupAddItemView()
        
        containerSwipeTopView.translatesAutoresizingMaskIntoConstraints = false
        
        containerSwipeTopView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -dataSource.constantContainerSwipeTopView().bottom).isActive = true
        containerSwipeTopView.topAnchor.constraint(equalTo: self.topAnchor, constant: dataSource.constantContainerSwipeTopView().top + window.safeAreaInsets.top + 10).isActive = true
        containerSwipeTopView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -dataSource.constantContainerSwipeTopView().right).isActive = true
        containerSwipeTopView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant:dataSource.constantContainerSwipeTopView().left).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func openPageSwipeTopView() {
       
        startOrganizerView()
        
        guard let heightContentView = self.heightContentView else { return  }
        guard let delegate = self.delegate else { return  }
        
        delegate.swipeTopViewWillOpen(self)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: heightContentView)
        }, completion: { (_) in
            delegate.swipeTopViewDidOpen(self)
        })
    }
    public func closePageSwipeTopView() {
        
        guard let delegate = self.delegate else { return  }
    
        delegate.swipeTopViewWillClose(self)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.transform = .identity
        }, completion: { (_) in
            delegate.swipeTopViewDidClose(self)
            self.removeFromSuperview()
        })
    }
}


