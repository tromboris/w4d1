require "./00_tree_node.rb"
require "byebug"

class KnightPathFinder
    def initialize(pos)
        throw "not valid position" if !((0...8).to_a.include?(pos[0]) && (0...8).to_a.include?(pos[1])) 
        @root_node = PolyTreeNode.new(pos)
        @valid_pos = []
        @considered_pos = [pos]
        # @start_pos = pos
        # @all_pos = valid_moves(pos)
    end

    def self.valid_moves(pos)
        # debugger
        start = @root_node
        pos_mutations = [[1,2], [-1,2], [1, -2], [-1,-2], [2,1], [-2,1], [2,-1], [-2,-1]]
        holder = []
        pos_mutations.each do |ele|
            new_x = pos[0] + ele[0]
            new_y = pos[1] + ele[1]
            if (0..7).to_a.include?(new_x) && (0..7).to_a.include?(new_y)
                holder << [new_x, new_y]
            end
        end
        holder
    end

    def new_move_positions(pos)
        debugger
        valid_moves = KnightPathFinder.valid_moves(pos)
        @valid_pos = valid_moves.select {|ele| @valid_pos << ele if !@considered_pos.include?(ele)}
        @considered_pos += @valid_pos
    end
    
    def build_move_tree
        # debugger
        moves_queue = []
        start_pos = @root_node.value
        moves_queue << @root_node
        until moves_queue.empty?
            new_move = moves_queue.shift
            new_move_positions(new_move.value)
            @valid_pos.each do |pos|
                new_node = PolyTreeNode.new(pos)
                new_node.parent = new_move
                moves_queue << new_node
                # new_pos = new_node.root_node.value
                # moves_queue << new_pos
            end
        end
    end

    attr_accessor :root_node, :valid_pos, :considered_pos
end