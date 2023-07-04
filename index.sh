if [ $# -gt 0 ]; thne
  remote=$1
  cd /tmp
  wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppelWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36" -T 5 -t 2 http://docker.xiaoya.pro/update/index.zip
  if [ ! -f index.zip ]; then
    echo "Failed to download index compressed file, the index file upgrade process has aborted"
    exit
  else
    unzip -o -q -P abcd index.zip
    cat index.video.txt index.book.txt index.music.txt index.non.video.txt >/index/index.txt
    mv index*.txt /index/
    echo $(date) "update index successfully, your new version.txt is" $remote
    echo $remote >/version.txt
    rm -f rm index.*
  fi
fi

if ! grep -q '我的PikPak分享/' /index/index.video.txt; then
	cat /index/index.zhao.txt >> /index/index.video.txt
fi