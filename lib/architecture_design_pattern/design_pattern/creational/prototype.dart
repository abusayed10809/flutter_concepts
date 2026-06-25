// Prototype
// Allows cloning existing objects without making your code dependent on their classes.
// Dart doesn't have a built-in clone interface, but the standard way of implementing the Prototype pattern in the Flutter ecosystem is using the copyWith method. This is critical for state management systems (like Bloc or Riverpod) where states must be immutable, and you only want to change specific fields.

class UserProfileState {
  final String username;
  final String email;
  final bool isLoading;

  UserProfileState({
    required this.username,
    required this.email,
    this.isLoading = false,
  });

  // The Prototype "Clone" implementation
  UserProfileState copyWith({
    String? username,
    String? email,
    bool? isLoading,
  }) {
    return UserProfileState(
      username: username ?? this.username,
      // Use new value or fallback to original
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// --- Usage in State Management ---
void main() {
  final initialState = UserProfileState(
    username: 'Dash',
    email: 'dash@flutter.dev',
  );

  // Triggering a loading state using our prototype clone
  final loadingState = initialState.copyWith(isLoading: true);

  // Triggering a successful data update state
  final updatedState = loadingState.copyWith(
    isLoading: false,
    username: 'Dash The Bird',
  );

  print(initialState.username); // Output: Dash
  print(updatedState.username); // Output: Dash The Bird
  print(
    updatedState.email,
  ); // Output: dash@flutter.dev (copied over seamlessly)
}
