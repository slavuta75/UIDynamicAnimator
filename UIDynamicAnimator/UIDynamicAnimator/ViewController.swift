//
//  ViewController.swift
//  UIDynamicAnimator
//
//  Created by Slava Utyuzh on 25.06.2018.
//  Copyright © 2018 Slava Utyuzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //проверка работы git
    //UICollisionBehavior - обнаружение столкновений
    //UIGravityBehavior - обеспечивает тяготение
    //UIPushBehavior - реагирует на толчки
    //UISnapBehavior - крепит view к определенной точке
 
//    let squareView = UIView()
//    var squareViews = [UIDynamicItem]()
//    var animator = UIDynamicAnimator()
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBehavior = UIPushBehavior()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//createSquare()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        creatGestureRecognizer()
        createSquare()
        createAnimationAndBehavior()
        
//        //создаем квадрат
//        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        squareView.backgroundColor = UIColor.blue
//        squareView.center = view.center
//        view.addSubview(squareView)
//
//        //создаем аниматор тяготения
//        animator = UIDynamicAnimator(referenceView: view)
//        let gravity = UIGravityBehavior(items: [squareView])
//        animator.addBehavior(gravity)
        
        //создаем view
//        let numberOfView = 3
//        squareViews.reserveCapacity(numberOfView)
//        var colors = [UIColor.red, .green, .yellow]
//        var currentCenterPoint: CGPoint = view.center
//        let eachViewSize = CGSize(width: 50, height: 50)
//
//        for counter in  0..<numberOfView {
//            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
//            newView.backgroundColor = colors[counter]
//            newView.center = currentCenterPoint
//            currentCenterPoint.y += 100
//            view.addSubview(newView)
//            squareViews.append(newView)
//        }
//     animator = UIDynamicAnimator(referenceView: view)
//
//        // создадим тягтение
//        let gravity = UIGravityBehavior(items: squareViews)
//        animator.addBehavior(gravity)
//
//        //реализуем столкновение
//        let collision = UICollisionBehavior(items: squareViews)
//        collision.translatesReferenceBoundsIntoBoundary = true
//        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height - 100), to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
//
//        collision.collisionDelegate = self
//        animator.addBehavior(collision)
//
//    }
    }
        func createSquare(){
            squareView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
            squareView.backgroundColor = .red
            squareView.center.x = view.center.x
            squareView.center.y = view.center.y - 100
            view.addSubview(squareView)
        }
        //создаем жест
        func creatGestureRecognizer() {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handle))
            view.addGestureRecognizer(tapGestureRecognizer)
        }
        
    @objc func handle(paramTap: UITapGestureRecognizer) {
            //Получаем угол view
        let tapPoint: CGPoint = paramTap.location(in: view)
        let squareViewCenterPoint = squareView.center
        // arc tangent 2((p1.x - p2.x),(p1.y - p2.y))
        let deltaX: CGFloat = tapPoint.x - squareViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - squareViewCenterPoint.y
        let angle: CGFloat = atan2(deltaY, deltaX)
        pushBehavior.angle = angle
        
        let distanceBettwenPoints: CGFloat = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBehavior.magnitude = distanceBettwenPoints / 200
        
        
        }
        
        // создаем столкновения и толчек у view
        
        func createAnimationAndBehavior() {
            animator = UIDynamicAnimator(referenceView: view)
            //создаем столновение
            let collision = UICollisionBehavior(items: [squareView])
            collision.translatesReferenceBoundsIntoBoundary = true
            pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
            animator.addBehavior(collision)
            animator.addBehavior(pushBehavior)
        }
        
    

//extension ViewController: UICollisionBehaviorDelegate {
//    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
//        let indentifier = identifier as? String
//        let kbottomBoundary = "bottomBoundary"
//
//        if indentifier == kbottomBoundary {
//            UIView.animate(withDuration: 3.0, animations: {
//                let view = item as? UIView
//                view?.backgroundColor = UIColor.black
//                view?.alpha = 0.0
//                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            }) { (finish) in
//                let view = item as? UIView
//                behavior.removeItem(item)
//                view?.removeFromSuperview()
//            }
//
//
//        }
//    }
}
