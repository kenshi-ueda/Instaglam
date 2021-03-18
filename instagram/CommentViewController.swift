//
//  CommentViewController.swift
//  instagram
//
//  Created by ueda on 2021/03/12.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
   
    
    @IBOutlet weak var commentField: UITextField!
    
    var postData:PostData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func kettei(_ sender: Any) {
        // 更新データを作成する
        var updateValue: FieldValue
        
        let displayName = Auth.auth().currentUser!.displayName
        
        updateValue = FieldValue.arrayUnion([displayName! + " : " + commentField.text!])
        //同じ文字不可
        
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comments": updateValue])
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
