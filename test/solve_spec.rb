require 'rspec'
require_relative '../lib/program'

describe 'solve' do

    it 'should return nil for an empty array of ops' do
        expect(solve([])).to be nil
    end

    it 'should return the number for an array with one number' do
        expect(solve([1])).to eq 1
    end

    it 'should return the sum' do
        expect(solve([13, '+', 7])).to eq 20
    end

    it 'should return the difference' do
        expect(solve([13, '-', 7])).to eq 6
    end

    it 'should return the product' do
        expect(solve([13, '*', 7])).to eq 91
    end

    it 'should return the quotient' do
        expect(solve([200, '/', 20])).to eq 10
    end

    it 'should return the sum with four numbers' do
        expect(solve([4, '+', 7, '+', 13, '+', 86])).to eq 110
    end

    it 'should return the difference with four numbers' do
        expect(solve([4, '-', 7, '-', 13, '-', 86])).to eq -102
    end

    it 'should return the product with four numbers' do
        expect(solve([4, '*', 7, '*', 13, '*', 86])).to eq 31304
    end

    it 'should return the quotient with four numbers' do
        expect(solve([200, '/', 2, '/', 2, '/', 2])).to eq 25
    end

    it 'should return the proper answer with four numbers with mixed operators' do
        expect(solve([2, '+', 4, '*', 6, '-', 3])).to eq 33
    end
end