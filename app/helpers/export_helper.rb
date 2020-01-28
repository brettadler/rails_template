module ExportHelper

  def export_to_csv(records, attributes)

    CSV.generate(headers: true) do |csv|

      csv << attributes.map(&:first)

      records.each do |row|
        csv << attributes.map(&:last).map{ |attr| row.send(attr) }
      end

    end

  end

end
