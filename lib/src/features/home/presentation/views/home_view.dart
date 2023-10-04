part of '../home_barrel.dart';

class _HomeView extends StatelessView<HomeScreen, HomeScreenController> {
  const _HomeView(HomeScreenController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserBloc, FetchUserState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: _buildHomeWidget(controller: controller),
          ),
        );
      },
    );
  }
}

Widget _buildHomeWidget({required HomeScreenController controller}) {
  return SingleChildScrollView(
    child: RefreshIndicator(
      onRefresh: () => controller.onRefresh(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
              text: 'Welcome',
              style: appMStyle(16, Color(kGrey.value), FontWeight.w500)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(
                  text: '${controller.firstName} ${controller.lastName}',
                  style: appMStyle(18, Color(kDark.value), FontWeight.bold)),
              UserDisplayPicture(
                imageUrl: Assets.noAccountImage,
                onTap: () {},
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTxtField(
                  textEditingController: controller.searchController,
                  hintText: 'search user',
                  hintStyle: appMStyle(16, Color(kGrey.value), FontWeight.w400),
                  filled: true,
                  fillColor: Color(kLowRed.value),
                  prefix:
                      Icon(Icons.search, size: 30, color: Color(kGrey.value)),
                  focusBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(kDarkRed.value)),
                      borderRadius: kmediumBorderRadius),
                  inputBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(kLight.value)),
                      borderRadius: kmediumBorderRadius),
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(Assets.svgHelper('Filter')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(
                  text: 'Near you',
                  style: appMStyle(16, Color(kDarkRed.value), FontWeight.w600)),
              TextButton(
                onPressed: () {},
                child: ReusableText(
                    text: 'See more',
                    style: appMStyle(16, Color(kDark.value), FontWeight.w400)),
              )
            ],
          ),
          20.sbh,
          BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
              builder: (context, state) {
            if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi ||
                state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
              return _buildUsersCard(controller);
            } else if (state is InternetDisconnected) {
              return NoInternetConnectionWidget(
                  onPressed: () =>
                      context.read<FetchUserBloc>()..add(FetchAllUserEvent()));
            }
            return _buildUsersCard(controller);
          })
        ],
      ).padding(const EdgeInsets.symmetric(horizontal: 12, vertical: 20)),
    ),
  );
}

Widget _buildUsersCard(HomeScreenController controller) {
  return BlocBuilder<FetchUserBloc, FetchUserState>(
    builder: (context, state) {
      if (state is FetchAllUserLoading) {
        final user = List.generate(
          2,
          (index) => FakeUserModel(
              firstName: "Amechi", lastName: "Williams", profilePicture: ""),
        );
        Skeletonizer(
            enabled: true,
            ignoreContainers: true,
            child: CarouselSlider.builder(
              itemCount: user.length,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 0,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, int index, int pageViewIndex) {
                final users = user[index];
                return LoadingUserCard(users: users);
              },
            ));
      }

      // return const Center(child: CircularProgressIndicator());

      if (state is FetchAllUserSuccess) {
        return CarouselSlider.builder(
          itemCount: state.users.length,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 0,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, int index, int pageViewIndex) {
            final users = state.users[index];
            return GestureDetector(
              onTap: () {},
              child: UsersDisplayCard(user: users),
            );
          },
        );
      }
      if (state is FetchAllUserError) {
        return const Center(child: Text('Something went wrong'));
      }
      return Container();
    },
  );
}
