import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/about/data/repos/contact_repo.dart';
import 'package:portfolio/features/about/data/models/message_model.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {}

class ContactFailure extends ContactState {
  final String error;
  ContactFailure(this.error);
}

class ContactCubit extends Cubit<ContactState> {
  final ContactRepository repository;
  ContactCubit(this.repository) : super(ContactInitial());

  Future<void> sendMessage(ContactMessage message) async {
    emit(ContactLoading());
    try {
      await repository.sendMessage(message);
      emit(ContactSuccess());
    } catch (e) {
      emit(ContactFailure('Error with the internet, please try again later'));
    }
  }
}
