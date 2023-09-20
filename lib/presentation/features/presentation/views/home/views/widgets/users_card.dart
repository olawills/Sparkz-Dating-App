import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/presentation/auth/data/models/user.dart';

class UsersDisplayCard extends StatelessWidget {
  final User user;
  const UsersDisplayCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user.firstName,
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
