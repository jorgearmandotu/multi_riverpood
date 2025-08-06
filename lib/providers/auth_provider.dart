
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_riverpood/models/user.dart';

final authProvider = StateProvider<bool>((href) => false);

final userProvider = StateProvider<User?>((ref) => null);