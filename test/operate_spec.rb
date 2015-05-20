require 'rspec'
require_relative '../lib/program'

describe 'operate' do

    it 'should return false for an empty array of numbers' do
        expect(operate([], [], 0)).to be false
    end

    it 'should return false for an empty array of operators' do
        expect(operate([1, 2, 3], [], 6)).to be false
    end

    it 'should return false when a single number and the same target is provided and no operators are provided' do
        expect(operate([7], [], 7)).to be false
    end

    it 'should return true when a single number, the same target, and many operators are provided' do
        expect(operate([7], %w(+ / * -), 7)).to be true
    end

    it 'should return true when two numbers, an add operator, and the sum is the target' do
        expect(operate([7, 17], ['+'], 24)).to be true
    end

    it 'should return true when two numbers, an subtract operator, and the difference is the target (calculation order is reversed)' do
        expect(operate([7, 17], ['-'], -10)).to be true
    end

    it 'should return true when two numbers, a multiply operator, and the difference is the product' do
        expect(operate([7, 17], ['*'], 119)).to be true
    end

    it 'should return true when two numbers, a divide operator, and the difference is the quotient (calculation order is reversed)' do
        expect(operate([5, 20], ['/'], 4)).to be true
    end

    it 'should return true when three numbers, and all four operators, and a producable number is the target' do
        expect(operate([6, 8, 10, 12], %w(+ - * /), 6)).to be true  # ((10 - 6) * 12) / 8)
    end

    it 'should return the correct answer for Rylans puzzle' do
        expect(operate([1, 3, 4, 6], %w(+ - * /), 24)).to be true
    end
end