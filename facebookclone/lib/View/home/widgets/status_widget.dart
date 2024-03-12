import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(3)),
          child: const Icon(
            Icons.person_2,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(30, 30, 30, 0.1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Whats on your mind??',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            const Icon(
              Icons.photo_album,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
