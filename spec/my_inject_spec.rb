require './lib/enumerables'

RSpec.describe Enumerable do

    let(:data) {[3,4,5,6,4]}
    
    describe '#my_inject' do
        context 'When block is not given' do

            it 'when a number and a symbol are passed' do
                expect(data.my_inject( 5, :* )).to eql(7200)
            end

            it 'when a symbol is given' do
                expect(data.my_inject(:*)).to eql(1440)
            end
        end
        # context 'When block is given' do

        #     it 'when a number and a symbol are passed' do
        #         expect(data.my_inject {})).to eql(10)
        #     end

        #     xit 'when a number and a symbol are passed' do
        #         expect(data.my_inject( 5, :* )).to eql(7200)
        #     end

        #     xit 'when a number and a symbol are passed' do
        #         expect(data.my_inject(:*)).to eql(1440)
        #     end
        # end
    end
end