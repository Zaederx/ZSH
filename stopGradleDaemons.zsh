function stopGradleDaemon() {
  echo "\u001B[32mStopping Gradle Daemons\u001B[0m\n" && 
  echo "\u001B[32mJPS log\u001B[0m" && 
  jps | 
  tee >(grep GradleDaemon > stopGradle.txt) &&
  echo "\n\u001B[32mGradle Processes\u001B[0m";
  echo "$(<stopGradle.txt)";
  echo '\n\u001B[32mGradle Daemon IDs\u001B[31m' && 
  awk '{print $1}' stopGradle.txt | 
  tee stopGradle2.txt;
  echo "\n";
  read "answer?Kill all Gradle Daemons? y/n "
  # echo $answer;
  if  [[ $answer =~ ^[Yy]$ ]]
  then 
    echo "Killing Gradle Daemons";
    xargs kill <stopGradle2.txt;
  fi
  rm stopGradle.txt;
  rm stopGradle2.txt;
}