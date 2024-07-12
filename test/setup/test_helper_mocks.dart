import 'package:example_ui/features/auth/services/auth_service.dart';
import 'package:example_ui/features/shared/services/notification_service.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthService {}

class MockToastService extends Mock implements ToastService {}

class MockNotificationService extends Mock implements NotificationService {}

class TestHelperMocks {
  TestHelperMocks._();

  static MockAuthService getMockAuthService() {
    // instantiate mock
    final MockAuthService mockService = MockAuthService();

    // mock functions
    when(() => mockService.signInWithEmailAndPassword()).thenAnswer((_) async => await Future.value());

    when(() => mockService.loggedIn).thenReturn(true);

    // return mock

    return mockService;
  }

  static MockToastService getMockToastService() {
    // instantiate mock
    final MockToastService mockService = MockToastService();

    // mock functions
    when(() => mockService.showSnackBar(any())).thenReturn(null);

    // return mock
    return mockService;
  }

  static MockNotificationService getMockNotificationService() {
    // instantiate mock
    final MockNotificationService mockService = MockNotificationService();

    // mock functions
    when(() => mockService.getNotifications()).thenAnswer((_) async => await Future.value());

    // return mock
    return mockService;
  }
}

// TODO: Review this code

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (error) => error.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (error) => error.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint('Ignored Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}
