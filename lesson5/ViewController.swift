//
//  ViewController.swift
//  lesson5
//
//  Created by GEDAKYAN Artur on 15.02.2024.
//

import UIKit

final class ViewController: UIViewController {

    private lazy var animator = UIDynamicAnimator(referenceView: view)

    private lazy var box: UIView = {
        let view = UIView(frame: .zero)
        view.frame.size = .init(width: 100, height: 100)
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 12
        view.backgroundColor = .purple

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onScreenTap(_:)))

        box.frame.origin = .init(x: view.center.x - box.frame.size.width / 2, y: view.center.y + 200)

        view.addGestureRecognizer(tapRecognizer)
        view.addSubview(box)
    }

    @objc private func onScreenTap(_ sender: UIGestureRecognizer) {
        let tapLocation = sender.location(in: view)
        let behavior = UISnapBehavior(
            item: box,
            snapTo: tapLocation
        )
        behavior.damping = 0.5
        animator.removeAllBehaviors()
        animator.addBehavior(behavior)
    }
}
