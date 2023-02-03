import 'package:flutter/material.dart';

class Email {
  final String image, name, subject, body, time;
  final bool isAttachmentAvailable, isRead;
  final Color tagColor;

  Email({
    required this.image,
    required this.name,
    required this.subject,
    required this.body,
    required this.time,
    required this.isAttachmentAvailable,
    required this.isRead,
    required this.tagColor,
  });

  Email.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        name = json['name'],
        subject = json['subject'],
        body = json['body'],
        time = json['time'],
        isAttachmentAvailable = json['isAttachmentAvailable'],
        isRead = json['isRead'],
        tagColor = json['tagColor'];

  Map<String, dynamic> toJson() => {
        'image': image,
        'name': name,
        'subject': subject,
        'body': body,
        'time': time,
        'isAttachmentAvailable': isAttachmentAvailable,
        'isRead': isRead,
        'tagColor': tagColor,
      };

  static Email fromSnap(var snap) {
    var data = snap.data() as Map<String, dynamic>;
    return Email.fromJson(data);
  }
}
