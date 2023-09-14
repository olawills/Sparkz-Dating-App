part of 'features_controller.dart';

class _FeaturesView extends StatelessView<FeaturesScreen, FeaturesController> {
  const _FeaturesView(FeaturesController state, {Key? key})
      : super(state, key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildBottomNavigation(context, tabs),
    );
  }
}

BlocBuilder<BottomNavigationCubit, BottomNavigationState>
    _buildBottomNavigation(
            context, List<_NamedNavigationBarItemsWidget> tabs) =>
        BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            buildWhen: (previous, current) => previous.index != current.index,
            builder: (context, state) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: state.index,
                selectedItemColor: Color(kDarkRed.value),
                unselectedItemColor: Color(kGrey.value).withOpacity(0.6),
                elevation: 3,
                onTap: (index) {
                  if (state.index != index) {
                    context.read<BottomNavigationCubit>().gotoNavBarItem(index);
                    context.go(tabs[index].initialLocation);
                  }
                },
                items: tabs,
              );
            });

final tabs = [
  _NamedNavigationBarItemsWidget(
      initialLocation: HomeScreen.path,
      icon: SvgPicture.asset(Assets.svgHelper('Favorite')),
      label: 'Home'),
  _NamedNavigationBarItemsWidget(
      initialLocation: ChatsScreen.route,
      icon: SvgPicture.asset(Assets.svgHelper('message')),
      label: 'Chats'),
  _NamedNavigationBarItemsWidget(
      initialLocation: NotificationScreen.route,
      icon: Icon(Icons.notifications),
      label: 'Notification'),
  _NamedNavigationBarItemsWidget(
      initialLocation: ProfileScreen.route,
      icon: SvgPicture.asset(Assets.svgHelper('User')),
      label: 'Profile'),
];

class _NamedNavigationBarItemsWidget extends BottomNavigationBarItem {
  final String initialLocation;

  _NamedNavigationBarItemsWidget(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);
}
