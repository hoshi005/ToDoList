//
//  CreateTaskView.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/03.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import SwiftUI

struct CreateTaskView: View {
    
    @ObservedObject var viewModel: TaskListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // タスク名入力欄.
                TextField("新しいタスクを入力してね", text: $viewModel.taskName, onCommit:  {
                    if !self.viewModel.taskName.isEmpty {
                        self.viewModel.createNewTask()
                    }
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.gray, width: 2)
                .modifier(ClearButton(taskName: $viewModel.taskName))
                
//                // ADDボタン.
//                Button(action: {
//                    self.viewModel.createNewTask()
//                    self.endEditing()
//                }) {
//                    Image(systemName: "plus.square.fill")
//                        .imageScale(.large)
//                        .foregroundColor(.black)
//                }
//                .disabled(viewModel.taskName.isEmpty)
            }
            
            // タグ選択.
            Picker("Task Tag", selection: $viewModel.taskTag) {
                ForEach(TaskTag.allCases, id: \.self) { tag in
                    Image(systemName: tag.imageName)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
//    /// キーボード閉じる.
//    private func endEditing() {
//        UIApplication.shared.sendAction(
//            #selector(UIResponder.resignFirstResponder),
//            to: nil,
//            from: nil,
//            for: nil
//        )
//    }
}

/// テキストフィールドにクリアボタンを追加するModifier.
struct ClearButton: ViewModifier {

    @Binding var taskName: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            // タスク名に入力がある場合はクリアボタンを表示する.
            if !taskName.isEmpty {
                Button(action: {
                    self.taskName = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView(viewModel: TaskListViewModel())
    }
}
