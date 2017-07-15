require 'rspec'
require 'pry'

class InversionsCounter
  def initialize(array)
    @array = array
    @counter = 0
  end

  def count_inversions
    return 0 if @array.length <= 1
    merge_and_count(@array)
    drop_and_return_counter
  end

  private

  def drop_and_return_counter
    counter = @counter
    @counter = 0
    counter
  end

  def merge_and_count(array)
    return array if array.length <= 1
    slice_size = array.length / 2
    left = array[0...slice_size]
    right = array[slice_size...array.length]
    merge(array, merge_and_count(left), merge_and_count(right))
  end

  def merge(array, left, right)
    i = 0
    j = 0
    result = []
    (0...array.length).each do |k|
      if !left[i].nil? && (right[j].nil? || left[i] < right[j])
        result[k] = left[i]
        i += 1
      else
        @counter += left[i...left.length].length
        result[k] = right[j]
        j += 1
      end
    end
    result
  end
end

describe '#count_inversions' do
  let(:input) { [1, 2, 3, 4, 5] }

  subject { InversionsCounter.new(input).count_inversions }

  it { is_expected.to eq 0 }

  context 'with inversions' do
    let(:input) { [1, 2, 5, 4, 3] }

    it { is_expected.to eq 3 } # [5, 4], [5, 3], [4, 3]
  end

  context 'empty array' do
    let(:input) { [] }

    it { is_expected.to eq 0 }
  end
end
