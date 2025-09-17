import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ProjectCardName { pregnantMom, ushop, ushopDashboard, howTodo }

class ProjectCardController extends GetxController {
  //! --- For dependancy Injection
  static ProjectCardController get instansce => Get.find();

  //! --- Variabels
  PageController pregnantMomPageViewController = PageController();
  PageController uShopPageViewController = PageController();
  PageController ushopDashboardPageViewController = PageController();
  PageController howToDoPageViewController = PageController();

  Rx<int> pregnantMomCurrentPage = 0.obs;
  Rx<int> uShopCurrentPage = 0.obs;
  Rx<int> ushopDashboardCurrentPage = 0.obs;
  Rx<int> howToDoCurrentPage = 0.obs;

  //! --- On Dot Clicked

  //onDoteClicked
  void onDotClicked(int index, ProjectCardName projectCardName) {
    switch (projectCardName) {
      case ProjectCardName.pregnantMom:
        _onPregnantMomDotClicked(index);
        break;
      case ProjectCardName.ushop:
        _onUShopDotClicked(index);
        break;
      case ProjectCardName.ushopDashboard:
        _onUShopDashboardDotClicked(index);
        break;
      case ProjectCardName.howTodo:
        _onHowToDoDotClicked(index);
        break;
    }
  }

  //ondots clicked
  void _onPregnantMomDotClicked(int index) {
    pregnantMomCurrentPage.value = index;
    pregnantMomPageViewController.jumpToPage(index);
  }

  void _onHowToDoDotClicked(int index) {
    howToDoCurrentPage.value = index;
    howToDoPageViewController.jumpToPage(index);
  }

  void _onUShopDotClicked(int index) {
    uShopCurrentPage.value = index;
    uShopPageViewController.jumpToPage(index);
  }

  void _onUShopDashboardDotClicked(int index) {
    ushopDashboardCurrentPage.value = index;
    ushopDashboardPageViewController.jumpToPage(index);
  }

  //! --- On Page Scrolling Using Indecators
  void indecatorScrolle(int index, ProjectCardName projectCardName) {
    switch (projectCardName) {
      case ProjectCardName.pregnantMom:
        _updatePregnantMomCurrentPage(index);
        break;
      case ProjectCardName.ushop:
        _updateUShopCurrentPage(index);
        break;
      case ProjectCardName.ushopDashboard:
        _updateUShopDashboardCurrentPage(index);
        break;
      case ProjectCardName.howTodo:
        _updateHowToDoCurrentPage(index);
        break;
    }
  }

  //! --- update current page
  void _updatePregnantMomCurrentPage(int index) {
    pregnantMomCurrentPage.value = index;
    pregnantMomPageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _updateHowToDoCurrentPage(int index) {
    howToDoCurrentPage.value = index;
    howToDoPageViewController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _updateUShopCurrentPage(int index) {
    uShopCurrentPage.value = index;
    uShopPageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _updateUShopDashboardCurrentPage(int index) {
    ushopDashboardCurrentPage.value = index;
    ushopDashboardPageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }
}
