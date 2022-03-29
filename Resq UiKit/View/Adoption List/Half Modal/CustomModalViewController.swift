//
//  HalfModal.swift
//  Resq UiKit
//
//  Created by Bryan Khufa on 16/07/21.
//

import UIKit
import Foundation

protocol FilterDelegate {
    func addFilter(selected: DogFilter)
}

class CustomModalViewController: UIViewController {
    
    var delegate: FilterDelegate?
    
    let userDefaults = UserDefaults.standard

    let blueHex = 0x4DA9EB
    let defaultHeight: CGFloat = 400
    let dismissibleHeight: CGFloat = 200
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    // keep updated with new height
    var currentContainerHeight: CGFloat = 400
    
    // 3. Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    var buttonDict = [String:[GroupedButton]]()
    var selectedFilter = [String:String]()
    var selectedDog = DogFilter()
    
    // container view
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    // content lazy views
    lazy var navCancelButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Cancel", for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(cancelFilter(_:)), for: .touchUpInside)

        return btn
    }()
    
    lazy var navApplyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Apply", for: .normal)
        btn.setTitleColor(UIColor(hex: blueHex), for: .normal)
        btn.addTarget(self, action: #selector(applyFilter(_:)), for: .touchUpInside)

        return btn
    }()
        
    lazy var navItemContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [navCancelButton, navApplyButton])
        stackView.axis = .horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private func filterLabel(_ text:String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }
    
    lazy var tagContainer: UIView = {
        let ageArray = ["Adult", "Puppy"]
        let genderArray = ["Male", "Female"]
        let cityArray = ["Jakarta", "Surabaya", "Bali", "Gresik", "Sidoarjo"]
        
        let ageTag = CustomView()
        let genderTag = CustomView()
        let cityTag = UIView()

        let ageLabel = filterLabel("Age")
        let genderLabel = filterLabel("Gender")
        let cityLabel = filterLabel("City")

        createTagCloud(OnView: ageTag, withArray: ageArray as [AnyObject], group: "Age")
        createTagCloud(OnView: genderTag, withArray: genderArray as [AnyObject], group: "Gender")
        createTagCloud(OnView: cityTag, withArray: cityArray as [AnyObject], group: "City")
        
        
        let stackView = UIStackView(arrangedSubviews: [ageLabel, ageTag, genderLabel, genderTag, cityLabel, cityTag])
        
        stackView.axis = .vertical
        stackView.spacing = 4.0
        stackView.isUserInteractionEnabled = true

        return stackView
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [navItemContainer, titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 16.0
        
        stackView.addArrangedSubview(tagContainer)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupPanGesture()
        
        // Read/Get Dictionary
//        selectedFilter = userDefaults.object(forKey: "selectedFilter") as? [String:String] ?? [:]
//        activateBtn(btnDict: buttonDict, selectedBtn: selectedFilter)
        
        if let data = UserDefaults.standard.value(forKey:"selectedDog") as? Data {
            selectedDog = try! PropertyListDecoder().decode(DogFilter.self, from: data)
        }
        activateBtnFromDogFilter(btnDict: buttonDict, selectedBtn: selectedDog)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func animatePresentContainer() {
        // Update bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func animateDismissView() {
        // hide main container view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        
        // hide blur view
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
    }
    
    func setupPanGesture() {
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        // change to false to immediately listen on gesture movement
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        // Drag to top will be minus value and vice versa
//        print("Pan gesture y offset: \(translation.y)")
        
        // Get drag direction
        let isDraggingDown = translation.y > 0
//        print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")
        
        // New height is based on value of dragging plus current container height
        let newHeight = currentContainerHeight - translation.y
        
        // Handle based on gesture state
        switch gesture.state {
        case .changed:
            // This state will occur when user is dragging
            if newHeight < maximumContainerHeight {
                // Keep updating the height constraint
                containerViewHeightConstraint?.constant = newHeight
                // refresh layout
                view.layoutIfNeeded()
            }
        case .ended:
            // This happens when user stop drag,
            // so we will get the last height of container
            // Condition 1: If new height is below min, dismiss controller
            if newHeight < dismissibleHeight {
                self.animateDismissView()
            }
            else if newHeight < defaultHeight {
                // Condition 2: If new height is below default, animate back to default
                animateContainerHeight(defaultHeight)
            }
            else if newHeight < maximumContainerHeight && isDraggingDown {
                // Condition 3: If new height is below max and going down, set to default height
                animateContainerHeight(defaultHeight)
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                // Condition 4: If new height is below max and going up, set to max height at top
                animateContainerHeight(maximumContainerHeight)
            }
        default:
            break
        }
    }
    
    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            // Update container height
            self.containerViewHeightConstraint?.constant = height
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        // Save current height
        currentContainerHeight = height
    }
    
    func setupConstraints() {
        // 4. Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
        ])
        
        // 6. Set container to default height
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        // 7. Set bottom constant to 0
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
    
    func createTagCloud(OnView view: UIView, withArray data:[AnyObject], group: String) {
        for tempView in view.subviews {
            if tempView.tag != 0 {
                tempView.removeFromSuperview()
            }
        }
        
        var xPos: CGFloat = 0.0
        var ypos: CGFloat = 8.0
        var tag: Int = 1
                
        for str in data  {
            let startstring = str as! String
            let width = startstring.widthOfString(usingFont: UIFont(name:"verdana", size: 13.0)!)
            let checkWholeWidth = CGFloat(xPos) + CGFloat(width) + CGFloat(13.0) + CGFloat(25.5 )//13.0 is the width between lable and cross button and 25.5 is cross button width and gap to righht
            if checkWholeWidth > UIScreen.main.bounds.size.width - 30.0 {
                //we are exceeding size need to change xpos
                xPos = 0.0
                ypos = ypos + 29.0 + 8.0
            }
            
            let bgView = UIView(frame: CGRect(x: xPos, y: ypos, width:width + 17.0 + 38.5 , height: 29.0))
            bgView.layer.cornerRadius = 5
            bgView.tag = tag
            
            let button = GroupedButton(type: .custom)
            button.frame = CGRect(x: 0.0, y: 0.0, width: width + 17.0 + 38.5, height: bgView.frame.size.height)
            button.setTitle(startstring, for: .normal)
            button.setTitleColor(UIColor(hex: blueHex), for: .normal)
            button.backgroundColor = .clear
            
            button.setTitleColor(.white, for: .selected)
            
            button.layer.borderWidth = 2
            button.layer.borderColor = CGColor.colorWithHex(hex: blueHex)
            button.layer.cornerRadius = 5
            button.addTarget(self, action: #selector(filterSelected(_:)), for: .touchUpInside)
            button.isUserInteractionEnabled = true
            button.tag = tag
            button.group = group
            
            bgView.addSubview(button)
            bgView.isUserInteractionEnabled = true
            
            xPos = CGFloat(xPos) + CGFloat(width) + CGFloat(17.0) + CGFloat(43.0)
            view.addSubview(bgView)
            view.isUserInteractionEnabled = true
            tag = tag  + 1
            
            buttonDict[group, default:[]].append(button)
        }
    }
    
    func deactivateBtnGroup(_ btnArray: [GroupedButton]){
        for btn in btnArray {
            btnDeSelected(btn)
        }
    }
    
    func activateBtn(btnDict: [String:[GroupedButton]], selectedBtn: [String:String]){
        for (group, buttons) in btnDict {
//            print(selectedBtn)
            for button in buttons {
                if button.currentTitle == selectedBtn[group]{
                    btnSelected(button)
                }
            }
        }
    }
    
    func activateBtnFromDogFilter(btnDict: [String:[GroupedButton]], selectedBtn: DogFilter){
        for (group, buttons) in btnDict {
//            print(selectedBtn)
            for button in buttons {
                if button.currentTitle == selectedBtn.byAge || button.currentTitle == selectedBtn.byGender || button.currentTitle == selectedBtn.byLocation {
                    btnSelected(button)
                }
            }
        }
    }
    
    func btnDeSelected(_ btn: GroupedButton){
        btn.isSelected = false
        btn.backgroundColor = .clear
    }
    
    
    func btnSelected(_ btn: GroupedButton){
        btn.isSelected = true
        btn.backgroundColor = UIColor(hex: blueHex)
    }
    
    //    MARK: - Selector
        
        @objc func applyFilter(_ sender: AnyObject) {
            animateDismissView()
            
            // Write/Set Dictionary
            userDefaults.set(selectedFilter, forKey: "selectedFilter")
            UserDefaults.standard.set(try? PropertyListEncoder().encode(selectedDog), forKey:"selectedDog")
            
            delegate?.addFilter(selected: selectedDog)
        }
        
        @objc func cancelFilter(_ sender: AnyObject) {
            animateDismissView()
        }
    
    @objc func filterSelected(_ sender: GroupedButton) {
        if sender.isSelected {
            sender.backgroundColor = .clear
            selectedFilter[sender.group] = ""
            switch sender.group {
            case "Age":
                selectedDog.byAge = ""
            case "Gender":
                selectedDog.byGender = ""
            case "City":
                selectedDog.byLocation = ""
            default:
                break
            }
        }
        else if !sender.isSelected{
            deactivateBtnGroup(buttonDict[sender.group]!)
            sender.backgroundColor = UIColor(hex: blueHex)
            selectedFilter[sender.group] = sender.currentTitle
            switch sender.group {
            case "Age":
                selectedDog.byAge = sender.currentTitle!
            case "Gender":
                selectedDog.byGender = sender.currentTitle!
            case "City":
                selectedDog.byLocation = sender.currentTitle!
            default:
                break
            }
        }
        sender.isSelected.toggle()
    }
    
}

class CustomView: UIView {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 64)
    }
    
}

class GroupedButton: UIButton {
    var group: String = ""
}
