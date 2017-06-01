//
//  ViewController.swift
//  SolidRotation
//
//  Created by Ngmm_Jadon on 2017/6/1.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let gestureView = UIView()
    var angle = CGPoint(x: 0, y: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gestureView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        gestureView.center = view.center
        view.addSubview(gestureView)
        
        let rotateView = UIView(frame: gestureView.bounds)
        rotateView.backgroundColor = UIColor.red
        gestureView.addSubview(rotateView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTransform))
        gestureView.addGestureRecognizer(panGesture)
    }
    
    func viewTransform(sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: gestureView)
        let angleX = angle.x + point.x/30
        let angleY = angle.y - point.y/30
        
        var transform = CATransform3DIdentity
        transform.m34 = -1/500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        gestureView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            angle.x = angleX
            angle.y = angleY
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

