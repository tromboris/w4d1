class PolyTreeNode
    attr_reader :start_pos, :all_pos
    def initialize(arr)
        throw "not valid position" if !(0...8).to_a.include?(arr[0]) || !(0...8).to_a.include?(arr[1]) 
        @root_node = arr
        # @start_pos = arr
        @all_pos = path_generator(arr)
    end

    def path_generator(arr)
        start = self.start_pos
        all_pos = Array.new {Array.new}
        pos_mutations = [[1,2], [1,-2], [-1, -2], [-1,2], [2,1], [-2,1], [-2,1], [-2,1]]
        pos_mutations.each do |ele|
            new_x = arr[0] + ele[0]
            new_y = arr[1] + ele[1]
            if (0...8).to_a.include?(new_x) && (0...8).to_a.include?(new_y)
                all_pos << [new_x, new_y]
            end
        end
        return all_pos
    end
end