import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constantss/enums.dart';

class AppScrollingController extends GetxController {
  final scrollController = ScrollController();

  // Section keys
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final educationKey = GlobalKey();
  final contactKey = GlobalKey();

  // Observable active section
  final currentSection = Section.about.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

  void _onScroll() {
    final offset = scrollController.offset;

    _getOffset(aboutKey);
    final skillsOffset = _getOffset(skillsKey);
    final projectsOffset = _getOffset(projectsKey);
    final educationOffset = _getOffset(educationKey);
    final contactOffset = _getOffset(contactKey);

    // Adjust the margin of tolerance (-200) as needed
    if (offset >= contactOffset - 200) {
      currentSection.value = Section.contact;
    } else if (offset >= educationOffset - 200) {
      currentSection.value = Section.education;
    } else if (offset >= projectsOffset - 200) {
      currentSection.value = Section.projects;
    } else if (offset >= skillsOffset - 200) {
      currentSection.value = Section.skills;
    } else {
      currentSection.value = Section.about;
    }
  }

  double _getOffset(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return double.infinity;

    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return double.infinity;

    return box.localToGlobal(Offset.zero, ancestor: null).dy + scrollController.offset;
  }

  bool isCurrentSection(Section section) {
    return currentSection.value == section;
  }

  void scrollTo(Section section) {
    late GlobalKey key;

    switch (section) {
      case Section.about:
        key = aboutKey;
        break;
      case Section.skills:
        key = skillsKey;
        break;
      case Section.projects:
        key = projectsKey;
        break;
      case Section.education:
        key = educationKey;
        break;
      case Section.contact:
        key = contactKey;
        break;
    }

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0, // scroll to top of viewport
      );
    }
  }
}
