require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/game_over_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

class TestGameOverValidation < Test::Unit::TestCase
  def test_game_over_raises_argument_error_when_board_is_nil
    assert_raises(ArgumentError) do GameOverValidator.game_over?(nil) end 
  end

  def test_game_is_over_when_first_row_on_board_contains_matching_tiles
    board = []
    board << "X"
    board << "X"
    board << "X"
    board << "4"
    board << "5"
    board << "6"
    board << "7"
    board << "8"
    board << "9"
    assert(GameOverValidator.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_middle_row_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "2"
    board << "3"
    board << "X"
    board << "X"
    board << "X"
    board << "7"
    board << "8"
    board << "9"
    assert(GameOverValidator.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_last_row_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "2"
    board << "3"
    board << "4"
    board << "5"
    board << "6"
    board << "X"
    board << "X"
    board << "X"
    assert(GameOverValidator.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_first_column_on_board_contains_matching_tiles
    board = []
    board << "X"
    board << "2"
    board << "3"
    board << "X"
    board << "5"
    board << "6"
    board << "X"
    board << "8"
    board << "9"
    assert(GameOverValidator.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_last_column_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "2"
    board << "X"
    board << "4"
    board << "5"
    board << "X"
    board << "7"
    board << "8"
    board << "X"
    assert(GameOverValidator.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_middle_column_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "X"
    board << "3"
    board << "4"
    board << "X"
    board << "6"
    board << "7"
    board << "X"
    board << "9"
    assert(GameOverValidator.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_left_to_right_diagonal_on_board_contains_matching_tiles
    board = []
    board << "X"
    board << "2"
    board << "3"
    board << "4"
    board << "X"
    board << "6"
    board << "7"
    board << "8"
    board << "X"
    assert(GameOverValidator.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_right_to_left_diagonal_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "2"
    board << "X"
    board << "4"
    board << "X"
    board << "6"
    board << "X"
    board << "8"
    board << "9"
    assert(GameOverValidator.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_not_over_when_there_are_no_matching_tiles_on_board
    board = []
    board << "1"
    board << "2"
    board << "3"
    board << "4"
    board << "X"
    board << "6"
    board << "X"
    board << "8"
    board << "9"
    assert(!GameOverValidator.game_over?(board), "Expected game over to be false.")
  end

  def test_game_is_not_over_on_brand_new_unplayed_board
    board = GameBoard.create_board
    assert(!GameOverValidator.game_over?(board), "Expected game over to be false.")
  end

  def test_win_for_player_raises_argument_error_when_provided_board_is_nil
    assert_raises(ArgumentError) do GameOverValidator.win_for_player?("X", nil) end 
  end

  def test_win_for_player_raises_argument_error_when_provided_player_symbol_is_invalid
    board = GameBoard.create_board
    assert_raises(ArgumentError) do GameOverValidator.win_for_player?("1", board) end 
  end

  def test_win_for_player_returns_false_on_brand_new_unplayed_board
    board = GameBoard.create_board
    assert(!GameOverValidator.win_for_player?("X", board), "Expected false to be returned on unplayed board.")
  end

  def test_provided_player_wins_when_first_row_on_board_contains_matching_tiles
    board = []
    board << "X"
    board << "X"
    board << "X"
    board << "4"
    board << "5"
    board << "6"
    board << "7"
    board << "8"
    board << "9"
    assert(GameOverValidator.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_middle_row_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "2"
    board << "3"
    board << "X"
    board << "X"
    board << "X"
    board << "7"
    board << "8"
    board << "9"
    assert(GameOverValidator.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_last_row_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "2"
    board << "3"
    board << "4"
    board << "5"
    board << "6"
    board << "X"
    board << "X"
    board << "X"
    assert(GameOverValidator.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_first_column_on_board_contains_matching_tiles
    board = []
    board << "X"
    board << "2"
    board << "3"
    board << "X"
    board << "5"
    board << "6"
    board << "X"
    board << "8"
    board << "9"
    assert(GameOverValidator.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_last_column_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "2"
    board << "X"
    board << "4"
    board << "5"
    board << "X"
    board << "7"
    board << "8"
    board << "X"
    assert(GameOverValidator.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_middle_column_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "X"
    board << "3"
    board << "4"
    board << "X"
    board << "6"
    board << "7"
    board << "X"
    board << "9"
    assert(GameOverValidator.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_left_to_right_diagonal_on_board_contains_matching_tiles
    board = []
    board << "X"
    board << "2"
    board << "3"
    board << "4"
    board << "X"
    board << "6"
    board << "7"
    board << "8"
    board << "X"
    assert(GameOverValidator.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_right_to_left_diagonal_on_board_contains_matching_tiles
    board = []
    board << "1"
    board << "2"
    board << "X"
    board << "4"
    board << "X"
    board << "6"
    board << "X"
    board << "8"
    board << "9"
    assert(GameOverValidator.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_doesnt_win_when_there_are_no_matching_tiles_on_board_for_that_player
    board = []
    board << "1"
    board << "2"
    board << "X"
    board << "4"
    board << "X"
    board << "6"
    board << "X"
    board << "8"
    board << "9"
    assert(!GameOverValidator.win_for_player?("Y", board), "Expected method to return false.")
  end
end
