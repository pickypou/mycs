import 'package:flutter/material.dart';

import '../../data/repository/users_repository.dart';
import '../../domain/entity/user.dart';

class AddUserInteractor {
  final UsersRepository usersRepository;

  AddUserInteractor({required this.usersRepository});

  Future<void> registerUser(Users user) async {
    try {
      await usersRepository.registerUser(Users(
          id: (user.id),
          email: user.email,
          password: user.password,
          userName: user.userName));
    } catch (e) {
      debugPrint('Erreur lors de l\'enregistrement de l\'utilisateur : $e');
    }
  }
}