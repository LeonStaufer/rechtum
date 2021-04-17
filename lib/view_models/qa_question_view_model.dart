import 'package:rechtum/models/qaitem.dart';
import 'package:rechtum/view_models/base_model.dart';

class QAViewModel extends BaseModel {
  final List<QAItem> _items = [
    QAItem(
      isExpanded: true,
      question: "What does does progress mentoring mean?",
      answer:
          "Study Progress Monitoring defines the amount of credits you need to have achieved at the end of a certain semester. Not meeting these credit thresholds may have serious consequences, ultimately the final failure of a degree program.",
    ),
    QAItem(question: "What are my credit hurdles?", answer: """
• 30 credits by the end of the third semester,
• 60 credits by the end of the fourth semester,
• 90 credits by the end of the fifth semester,
• 120 credits by the end of the sixth semester,
• 150 credits by the end of the seventh semester,
• and 180 credits by the end of the eighth semester.    
        """),
    QAItem(
      question: "What happens when I fail too many exams?",
      answer:
          "Final failure means that an examination, which is mandatory within the course schedule defined in the applicable Academic and Examination Regulations has been failed in the last possible attempt, or that it is no longer possible to meet a necessary requirement for the registration to take such an examination - due to reasons for which the student him or herself is responsible. You thereby lose your right to take an examination.",
    ),
    QAItem(question: "What are important notices?", answer: """
A Notification is an official document with important, binding decisions concerning your studies. You will receive notifications via email, in your TUMonline account or by post.

The most important notifications in the course of your studies are:
• the Notification of Admission, with the formal decision about your admission to a degree program.
• the Notfication of Enrollment, which confirms your student status.
• the Notification of Examination Results, with the summary of the course work or exams completed within a certain semester. It sums up the results of your exams, and helps you track your study progress.
• the Notification of Disenrollment/Withdrawal, which confirms the end of your student status.
• the Notification of Final Failure of Examination Requirements with the information that a required examination has been failed in the last possible attempt.
• the Notification of the Right to take an Examination, also known as Clearance Certificate, confirming that you have not lost your right to take an exam, i.e. have not finally failed a required examination
        """),
    QAItem(
      isExpanded: true,
      question: "What should I do when my grades are published?",
      answer: """
Be sure to read the notification promptly and thoroughly. This is the only way to make sure your progress is documented correctly in TUMonline, and you are aware of your rights and duties. Be sure to also read the information on legal remedies attached to the notification.

Should you disagree with the summary of your subjects, grades and attributions of the relevant semester, be sure to contact your department, school or central examinations office directly
      """,
    ),
  ];

  List<QAItem> get items => _items;

  void toggle(int index) {
    _items[index].isExpanded = !_items[index].isExpanded;
    setStatus(Status.idle);
  }
}
