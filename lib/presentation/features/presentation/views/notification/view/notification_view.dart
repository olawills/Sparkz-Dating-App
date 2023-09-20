part of '../notification_barrel.dart';

class _NotificationView
    extends StatelessView<NotificationScreen, NotificationController> {
  const _NotificationView(NotificationController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
