//
//  AViewController.swift
//  Demo_019
//
//  Created by 鄭淳澧 on 2021/8/1.
//

import UIKit

class AViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var aTextField: UITextField! {
        didSet { aTextField.delegate = self }
    }
    @IBOutlet weak var aLabel: UILabel!
    
    var name = ""
//    var age = 0
    
    // MARK: - allocate & deallocate
    required init?(coder: NSCoder) {
        print("===> AViewController init")
        super.init(coder: coder)
    }

    deinit {
        print("<=== AViewController Deinit")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {}
    override func viewWillLayoutSubviews() {}
    override func viewDidLayoutSubviews() {}
    override func viewDidAppear(_ animated: Bool) {}
    override func viewWillDisappear(_ animated: Bool) {}
    override func viewDidDisappear(_ animated: Bool) {}

    
    // MARK: - 採用 Segue，用 prepare 傳值
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let controller = segue.destination as? BViewController {
//            controller.name = aTextField.text ?? ""
//        }

    }
    
    // MARK: - IBActions
    @IBAction func aBtnPressed(_ sender: Any) {
        /*  直接從元件（如 Button）拉線 show VC 時，Button 自動產生一個 show action；
         *  performSegue 則是由 VC 拉線 show VC，由 Button 的 IBAction 透過 Segue ID
         *  來達到轉場的目的。
         */
//        performSegue(withIdentifier: "fromAtoB", sender: nil)

        // 用 show 做轉場時，會自動嵌入 navigationController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "\(BViewController.self)") as? BViewController {
            vc.name = aTextField.text ?? ""
            show(vc, sender: nil)
        }
       
        // 用 present 做轉場時，不會自動嵌入 navigationController
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "\(BViewController.self)") as? BViewController {
//            present(vc, animated: true)
//            vc.bLabel.text = aTextField.text ?? ""
////            { [self] in
////                vc.bLabel.text = aTextField.text ?? ""
////            }
//        }
        
        // 故使用 navigationController 去 push
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "\(BViewController.self)") as? BViewController {
//            vc.name = aTextField.text!
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        
    }
    
    /*  需研究轉場的生命週期，很多時候當 VC 尚未 present 是不能找到它的 property
     *  但 VC 排進 Navigation Controller 的 Stack 中，即便未 show，
     *  此時仍可找到它的 property
     */
    @IBAction func uwindToA(_ segue: UIStoryboardSegue) {
        if let vc = segue.source as? BViewController,
           let text = vc.bTextField.text {
            aLabel.text = text
        }
    }
    
    
//    @IBSegueAction func segueAction(_ coder: NSCoder) -> BViewController? {
//        let vc = BViewController(coder: coder)
//        if let text = aTextField.text {
//            vc?.name = text
//        }
//        return vc
//    }
    
}

// MARK: TextFieldDelegate
extension AViewController: UITextFieldDelegate {
    // 按下 return 收鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        textField.endEditing(true)
    }
}
