//
//  BViewController.swift
//  Demo_019
//
//  Created by 鄭淳澧 on 2021/8/1.
//

import UIKit

/// 第二頁
class BViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var bTextField: UITextField! { didSet { bTextField.delegate = self } }
    @IBOutlet weak var bLabel: UILabel!
    
    var name = ""
//    var age = 0
    
    // MARK: - allocate & deallocate
    required init?(coder: NSCoder) {
        print("===> BViewController init")
        super.init(coder: coder)
        
        // MARK: - 設定監聽
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(received),
                                               name: .aceObserver,
                                               object: nil)
    }
    
    // MARK: - Lifecycle
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
    
    deinit {
        print("<=== BViewController Deinit")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? AViewController,
//           let text = bTextField.text {
//            vc.aLabel.text = text
//        }
//    }
    
    // MARK: - 接值
    @objc func received(sender: Notification) {
        let text = sender.userInfo?["text"] as? String
        name = text!
    }
    
    // MARK: - Private Funcs
    private func setupBlabel() {
        bLabel.text = name
    }
    
    // MARK: - IBActions
    /* 回上頁，可以用 IBAction 去 pop 或 dismiss
     * 最簡單的方式是在 storyboard 中，透過 Exit 的方式去產生 Button action
     * 而在前一個頁面需加入 @IBAction func uwindToA(_ segue: UIStoryboardSegue) {}
     */
    @IBAction func backBtnPressed(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        
        // present 用的回上頁
//        dismiss(animated: true, completion: nil)
        
        // MARK: -  傳值
//        guard let text = bTextField.text else { return }
//        NotificationCenter.default.post(name: .beeObserver,
//                                        object: nil,
//                                        userInfo: ["text": text])
        NotificationCenter.default.post(name: .beeObserver, object: bTextField)
    }
    
//    @IBSegueAction func segueAction(_ coder: NSCoder) -> AViewController? {
//        let vc = AViewController(coder: coder)
//        if let text = bTextField.text {
//            vc?.aLabel.text = text
//        }
//        return vc
//    }
    
}

// MARK: TextFiledDelegate
extension BViewController: UITextFieldDelegate {
    // 按下 return 收鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        textField.endEditing(true)
    }
}

