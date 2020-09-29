# frozen_string_literal: true

require 'logger'

module CompactLogFormatter
  class Formatter < Logger::Formatter
    def call(severity, datetime, _app, message)
      timestamp = datetime.strftime('%y-%m-%d %H:%M:%S.%L')
      level = "\e[#{color(severity)}m[#{status(severity)}]\e[0m"
      body = %w[ERROR FATAL].include?(severity) ? "\e[#{color(severity)}m#{message}\e[0m" : highlight(message)
      [timestamp, level, body].join(' ') + "\n"
    end

    private

    def color(severity)
      (@color ||= {
        'DEBUG' => 32,
        'ERROR' => 31,
        'FATAL' => 31,
        # 'INFO' => 36,
        'WARN' => 33
      })[severity] || 39
    end

    def highlight(message) # rubocop:disable Metrics/MethodLength
      if message.match(/\AStarted\s[A-Z]+\s/)
        "\e[36m#{message}\e[0m"
      elsif (result = message.match(/\ACompleted\s(\d+)\s/))
        color = {
          '2' => 32,
          '3' => 33,
          '4' => 35,
          '5' => 31
        }[result[1][0]] || 36
        "\e[#{color}m#{message}\e[0m"
      else
        message
      end
    end

    def status(severity)
      (@status ||= {
        'DEBUG' => 'DBG',
        'ERROR' => 'ERR',
        'FATAL' => 'FAT',
        'INFO' => 'NFO',
        'UNKNOWN' => 'UNK',
        'WARN' => 'WRN'
      })[severity]
    end
  end
end
