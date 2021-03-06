class Test < ApplicationRecord
    scope :type, -> (column,*ids) {
        ret = []
        ids.each do |id|
            ret << Test.where(column => id)
        end

        ret.reject {|list| list.empty? }
    }

    scope :grouped, -> (column) {
        Test.group(column).count
    }
end
