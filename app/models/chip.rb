class Chip < ApplicationRecord
	def self.to_csv
  
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
end
