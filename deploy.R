no_error <- devtools::check()

stop <- any(
  length(no_error$errors),
  length(no_error$warnings),
  length(no_error$notes)
)

if (!stop){
  system("osascript -e 'display notification \"No error, sending to Connect\"'")
  rsconnect::deployApp()
} 