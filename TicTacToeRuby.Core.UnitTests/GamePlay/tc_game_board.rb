require 'test/unit'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../Players/mock_player_manager.rb'

class TestGameBoard < Test::Unit::TestCase

  attr_reader :game_board, :board, :player_manager
  def setup
    @board = GameBoard.create_board
    @player_manager = MockPlayerManager.new
    @game_board = GameBoard.new(@player_manager, @board)
  end

  def test_initialize_will_raise_an_exception_when_player_manager_is_nil
    assert_raises(ArgumentError) do GameBoard.new(nil) end
  end

  def test_create_board_will_create_a_nine_element_board
    expected_board_length = 9
    assert_equal(expected_board_length, @board.length, "Expected default board to have 9 elements.")
  end

  def test_initialize_will_set_the_board_to_the_provided_parameter
    assert_equal(@board, @game_board.board, "Expected game board's board to match provided board.")
  end

  def test_initialize_will_set_the_player_manager_to_the_provided_parameter
    assert_equal(@player_manager, @game_board.player_manager, 
      "Expected game board's player manager to match the provided one.")
  end

  def test_update_board_raises_argument_error_when_game_piece_is_nil
    assert_raises(ArgumentError) do @game_board.update_board(0, nil) end
  end

  def test_update_board_raises_argument_error_when_index_is_length_of_board
    assert_raises(ArgumentError) do @game_board.update_board(9, "X") end
  end

  def test_update_board_raises_argument_error_when_index_is_greater_than_length_of_board
    assert_raises(ArgumentError) do @game_board.update_board(-1, "X") end
  end

  def test_expected_spot_on_board_is_updated_with_provided_symbol
    index_on_board = 0
    player_symbol = "X"
    @game_board.update_board(index_on_board, player_symbol)
    stored_symbol_at_index = @game_board.board[index_on_board]
    assert_equal(player_symbol, stored_symbol_at_index, "Expected the spot on the board to match provided symbol.")
  end

  def test_the_only_spot_on_the_board_that_is_updated_is_at_the_provided_index
    expected_board = []
    expected_board << "X"
    expected_board << "2"
    expected_board << "3"
    expected_board << "4"
    expected_board << "5"
    expected_board << "6"
    expected_board << "7"
    expected_board << "8"
    expected_board << "9"
    
    @game_board.update_board(0, "X")
    result = @game_board.board - expected_board
    assert(result == [], "Expected boards to have same contents, but difference was: #{result}")
  end

  def test_rever_board_raises_argument_error_when_index_is_length_of_board
    assert_raises(ArgumentError) do @game_board.revert_board(9, "X") end
  end

  def test_revert_board_raises_argument_error_when_index_is_greater_than_length_of_board
    assert_raises(ArgumentError) do @game_board.revert_board(-1, "X") end
  end

  def test_the_only_spot_on_the_board_that_is_reverted_is_at_the_provided_index
    # first, update the board
    @game_board.update_board(0, "X")

    # then, revert the board
    expected_board = []
    expected_board << "1"
    expected_board << "2"
    expected_board << "3"
    expected_board << "4"
    expected_board << "5"
    expected_board << "6"
    expected_board << "7"
    expected_board << "8"
    expected_board << "9"
    
    @game_board.revert_board(0)
    result = @game_board.board - expected_board
    assert(result == [], "Expected boards to have same contents, but difference was: #{result}")
  end
end
