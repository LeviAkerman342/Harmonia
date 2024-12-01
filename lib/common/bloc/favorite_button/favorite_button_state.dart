// Абстрактное состояние кнопки "Избранное"
abstract class FavoriteButtonState {}

// Начальное состояние, дефолт
class FavoriteButtonInitial extends FavoriteButtonState {}

// Обновлённое состояние, содержит флаг "в избранном"
class FavoriteButtonUpdated extends FavoriteButtonState {
  final bool isFavorite;

  FavoriteButtonUpdated({required this.isFavorite});
}
