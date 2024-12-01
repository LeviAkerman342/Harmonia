import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:myapp/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:myapp/service_locator.dart';

// Кубит для управления состоянием кнопки "Добавить в избранное"
class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  
  // Инициализация с начальным состоянием
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  // Метод для обновления состояния кнопки "Избранное"
  Future<void> favoriteButtonUpdated(String songId) async {
    
    // Вызов добавления или удаления песни из избранного
    var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
      params: songId
    );

    // Обработка результата: ошибка (левой ветки) игнорируется, успех (правой ветки) обновляет состояние
    result.fold(
      (l) {
      },
      (isFavorite) {
        // Если операция успешна, обновляем состояние кнопки
        emit(
          FavoriteButtonUpdated(
            isFavorite: isFavorite // Новое состояние: добавлена ли песня в избранное
          )
        );
      },
    );
  }
}