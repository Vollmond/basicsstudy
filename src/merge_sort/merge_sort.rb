require 'rspec'
require 'pry'

def merge_sort(array)
  return array if array.length <= 1
  slice_size = array.length / 2
  left = array[0...slice_size]
  right = array[slice_size...array.length]
  merge(array, merge_sort(left), merge_sort(right))
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
      result[k] = right[j]
      j += 1
    end
  end
  result
end

describe 'merge_sort' do
  let(:input) { [3, 2, 5, 4, 1] }

  subject { merge_sort(input) }

  it { is_expected.to eq [1, 2, 3, 4, 5] }

  context 'empty' do
    let(:input) { [] }
    it { is_expected.to eq [] }
  end

  context '1 eement' do
    let(:input) { [5] }

    it { is_expected.to eq [5] }
  end
end
