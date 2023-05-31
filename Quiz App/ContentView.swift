import SwiftUI

struct ContentView: View {
    
    let questions: [QuizQuestion] = [
        QuizQuestion(
            questionText: "Question 1",
            option1: "Answer 1",
            option2: "Answer 2",
            option3: "Answer 3",
            option4: "Answer 4"
        ),
        QuizQuestion(
            questionText: "Question 2",
            option1: "Answer 1",
            option2: "Answer 2",
            option3: "Answer 3",
            option4: "Answer 4"
        ),
        QuizQuestion(
            questionText: "Question 3",
            option1: "Answer 1",
            option2: "Answer 2",
            option3: "Answer 3",
            option4: "Answer 4"
        ),
        QuizQuestion(
            questionText: "Question 4",
            option1: "Answer 1",
            option2: "Answer 2",
            option3: "Answer 3",
            option4: "Answer 4"
        )
    ]
    @State private var showAlert = false
    @State private var wasRight = false
    @State private var index = 0
    @State private var showSheet = false
    @State private var score = 0
    
    var body: some View {
        VStack {
            Text(questions[index].questionText)
                .padding()
            
            VStack {
                HStack {
                    
                    Button {
                        showAlert = true
                        wasRight = false
                    } label: {
                        Text(questions[index].option1)
                            .padding(50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        showAlert = true
                        wasRight = true
                        score += 1
                    } label: {
                        Text(questions[index].option2)
                            .padding(50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                }
                HStack {
                    Button {
                        showAlert = true
                        wasRight = false
                    } label: {
                        Text(questions[index].option3)
                            .padding(50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        showAlert = true
                        wasRight = false
                    } label: {
                        Text(questions[index].option4)
                            .padding(50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
        .alert(wasRight ? "You got that right!!!" : "You got that wrong...", isPresented: $showAlert) {
            
            // one button to go to the next question
            Button("Next Question") {
                index += 1
                if index == questions.count {
                    showSheet = true
                    index = 0
                }
            }
            
        }
        .sheet(isPresented: $showSheet) {
            ScoreView(score: score, total: questions.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
