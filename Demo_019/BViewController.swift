//
//  BViewController.swift
//  Demo_019
//
//  Created by 鄭淳澧 on 2021/8/1.
//

import UIKit

class BViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var bTextField: UITextField! {
        didSet {
            bTextField.delegate = self
        }
    }
    @IBOutlet weak var bLabel: UILabel!
    
    var name = ""
    var age = 0
    
    // MARK: allocate & deallocate
    required init?(coder: NSCoder) {
        print("===> BViewController init")
        super.init(coder: coder)
    }
    
    deinit {
        print("<=== BViewController Deinit")
    }
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBlabel()
    }
    override func viewWillAppear(_ animated: Bool) {}
    override func viewWillLayoutSubviews() {}
    override func viewDidLayoutSubviews() {}
    override func viewDidAppear(_ animated: Bool) {}
    override func viewWillDisappear(_ animated: Bool) {}
    override func viewDidDisappear(_ animated: Bool) {}
    
    // MARK: Private Funcs
    private func setupBlabel() {
        bLabel.text = name
    }
    
    // MARK: IBActions
    // 事實是我們可以更簡單地調用unwindSegue
    @IBAction func backBtnPressed(_ sender: UIButton) {
        // 與任何一種ViewController推出來的回上頁
//        navigationController?.popViewController(animated: true)
        
        // 與present湊一對的回上頁
//        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: TextFiledDelegate
extension BViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        textField.endEditing(true)
    }
}

// 以下寫錯的, 不要管它
// 1. 非產生一個新的A, 不用prepare, 且segue.source是在unwind func裡面寫才對
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let controller = segue.source as! AViewController
//        controller.age = bTextField.text!
//        controller.aLabel.text = "\(controller.age)"
// 2. 理由同上, 若是連到三個controller便可用比對segueID的方式去跳轉頁面
//        if segue.identifier == "fromAtoB" {
//            let controller = segue.source as! AViewController
//            controller.aLabel.text = bTextField.text!
//        }
//    }
// 3. A並不需要unwindToB
//    @IBAction func backToA(_ segue: UIStoryboardSegue) {
//
//    }
