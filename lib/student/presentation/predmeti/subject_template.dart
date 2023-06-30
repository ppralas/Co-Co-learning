import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyScreenNotifier extends StateNotifier<MyScreenState> {
  MyScreenNotifier() : super(MyScreenState());

  void setTitle(String title) {
    state = state.copyWith(
      title: title,
      images: [],
      description: '',
    );
  }

  void setSubtitle(String subtitle) {
    state = state.copyWith(
      subtitle: subtitle,
      images: [],
      description: '',
    );
  }

  void setDescription(String description) {
    state = state.copyWith(
      description: description,
      images: [],
    );
  }

  void setImages(List<String> images) {
    state = state.copyWith(
      images: images,
      description: '',
    );
  }
}

class MyScreenState {
  final String title;
  final String subtitle;
  final String description;
  final List<String> images;

  MyScreenState({
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.images = const [],
  });

  MyScreenState copyWith({
    String? title,
    String? subtitle,
    required String description,
    required List<String> images,
  }) {
    return MyScreenState(
      title: title ?? '',
      subtitle: subtitle ?? '',
      description: description,
      images: images,
    );
  }
}
