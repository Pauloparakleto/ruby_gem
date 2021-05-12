# frozen_string_literal: true

require_relative "algorithymsolver/version"

module Algorithymsolver
  class Error < StandardError; end

  # Linear search
  # Performs a search starting at the first index, evaluate to second and so on
  # until find the number returning it or -1 as not found.
  class LinearSearch
    def initialize(array, number, start_index = 0)
      @array = array
      @number = number
      @index = start_index
    end

    def search
      index = -1
      @array.length.times do
        index += 1
        return index if @array[index] == @number
      end
      -1
    end
  end

  # Jump Search
  # Let’s consider the following
  # array: (0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610).
  # Length of the array is 16. Jump search will find the value of 55 with the following steps
  # assuming that the block size to be jumped is 4.
  #
  # STEP 1: Jump from index 0 to index 4;
  # STEP 2: Jump from index 4 to index 8;
  # STEP 3: Jump from index 8 to index 12;
  # STEP 4: Since the element at index 12 is greater than 55 we will jump back a step to come to index 8.
  # STEP 5: Perform linear search from index 8 to get the element 55.
  #
  # What is the optimal block size to be skipped?
  #
  # In the worst case, we have to do n/m jumps and
  # if the last checked value is greater than the element to be searched for,
  # we perform m-1 comparisons more for linear search.
  # Therefore the total number of comparisons in the worst case will be ((n/m) + m-1).
  # The value of the function ((n/m) + m-1) will be minimum when m = √n.
  # Therefore, the best step size is m = √n.
  class JumpSearch
    def initialize(array, number)
      @array = array
      @number = number
      @array_length = @array.length
    end

    def search
      @index = 0
      while @index <= @array_length
        if @array[@index] == @number
          return @array.index @number
        end
        if @array[@index] > @number
          @index += jump(@array_length)
        else
          @index -= jump(@array_length)
          return LinearSearch.new(@array, @number, @index).search
        end
      end

    end

    def jump(array_length)
      jump = Math.sqrt array_length
      jump.to_i
    end
  end

  # Maximize array
  # returns the maximus sum of an array after a such times modifier interact
  # over the numbers changing they signals.
  class MaximizeArray
    def initialize(array, modifier)
      @array = array
      @modifier = modifier
    end

    def maximize
      @score = 0
      sorted_array = @array.sort
      @negative_array = sorted_array.select(&:negative?)
      @positive_array = sorted_array.select(&:positive?)
      modify_negatives
      @zero_array = sorted_array.select(&:zero?)
      modify_zero unless @zero_array.empty?

      modify_positives
      @positive_array.sum + @negative_array.sum
    end

    def modify_negatives
      @negative_array.map! do |number|
        number *= -1
        @score += 1
        return @negative_array.sum + @positive_array.sum if @score == @modifier

        number
      end
    end

    def modify_positives
      @positive_array.map! do |number|
        if @modifier.even?
          number
        elsif @score < @modifier
          @score = @modifier
          -number
        else
          number
        end
      end
    end

    def modify_zero
      @negative_array.sum + @positive_array.sum
    end
  end
end
