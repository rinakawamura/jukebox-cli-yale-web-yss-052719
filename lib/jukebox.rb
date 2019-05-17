songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:\n- help : displays this help message\n- list : displays a list of songs you can play\n- play : lets you choose a song to play\n- exit : exits this program"
end

def list(songs)
  songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
end

def play(songs)
  song_array = []
  songs.each do |song|
    array = song.split(" ")
    array.each_with_index do |word, index|
      if word == "-"
        song_array << array[index + 1 .. -1].join(" ")
      end
    end
  end
  puts "Please enter a song name or number:"
  response = gets.chomp
  if song_array.include?(response)
    puts "Playing #{songs[songs_array.index(response)]}"
  elsif response.between?(1, song_array.length)
    puts "Playing #{songs[response - 1]}"
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  puts "Please enter a command:"
  command = gets.chomp
  until command == "exit"
    case command
    when "help"
      help
    when "list"
      list(songs)
    when "play"
      play(songs)
    when "exit"
      exit_jukebox
      break
    end
    puts "Please enter a command:"
    command = gets.chomp
  end
end
