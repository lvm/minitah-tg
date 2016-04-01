# minitah-tg

A crappy telegram bot which uses `python-telegram-bot` inside a `virtualenv` inside a `Docker container`, which runs in a `vps`.

## requirements

* docker
* git
* A tg token, to get one you should talk to the [BotFather](https://telegram.me/botfather)

## how to use it

	$ git clone https://github.com/lvm/minitah-tg
	$ cd minitah-tg
	$ docker build -t minitah-tg .
	$ docker run -ti --rm minitah-tg
	% . source/activate && python minitah.py

## LICENSE

see [LICENSE](LICENSE) for that.
