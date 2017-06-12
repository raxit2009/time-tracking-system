module ActiveAdmin::AttendancesHelper
    def average_of_times(array)
        zero_seconds      = ->x{ x=='0:00:00' }
        covert_to_seconds = ->x do
          hours, minutes, seconds = x.split(':').map(&:to_i)
          hours * 3600 + minutes * 60 + seconds
        end
    
        seconds = array.reject!(&zero_seconds)
                 .map(&covert_to_seconds)
                 .reduce(:+) / array.size
    
        Time.at(seconds).utc.strftime("%H:%M:%S")
    end
end