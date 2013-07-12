## Install dependencies
    brew install cmake
    brew install python
    sudo easy_install pip

Add powerline bin to your path. In your zshrc file (or the paths files sourced in zshrc) add the following line

    PATH="/usr/local/share/python/:$PATH"

## Reinstall MacVim with brew
I needed to edit the formula to specify which python to build against.

    brew edit macvim

Edit it as follows ([tip is from here](http://superuser.com/questions/440981/how-can-i-use-the-homebrew-python-version-with-homebrew-macvim-on-snow-leopard/440982#440982))

Find the arguments list (begins with args = %W\[ ...), and modify this line:

    --enable-pythoninterp

Change it to these two lines:

    --enable-pythoninterp=dynamic
    --with-python-config-dir=/usr/local/lib/python2.7/config

On my system the above folder did not exist so I had to link it as follows

    ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/Current/lib/python2.7/config /usr/local/lib/python2.7/config

then reinstall it

    brew remove macvim
    brew install macvim --env-std --override-system-vim

## Install powerline
    pip install --user git+git://github.com/Lokaltog/powerline --verbose

## Install fonts
Install the fonts by downloading them (https://github.com/Lokaltog/powerline-fonts/tree/master/Meslo), click on them, and then click install in the application that opens.

## Usage
Add the following to your dot files

### .vimrc
    set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

    if has("gui_running")
       let s:uname = system("uname")
       if s:uname == "Darwin\n"
          set guifont=Meslo\ LG\ S\ for\ Powerline
       endif
    endif
    
Note: Use your desired font in place of Meslo above. The first line is needed for all vim and the next few lines are needed for MacVim GUI.

### .zshrc
    . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

### .tmux.conf
    source '/usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf'

## Installing iTerm from source
I needed to do this because my Fonts were not working. Without this it looked like ↓
![](http://f.cl.ly/items/351w0U2P323f1M0n3O21/Screen%20Shot%202013-02-10%20at%203.44.55%20PM.png)

- git clone https://github.com/gnachman/iTerm2
- start XCode
- open the iTerm.xcodeproj
- Click Run

It will build and launch iTerm. Then copy the app to /Applications. It will be something like:

    mv /Users/wmernagh/Library/Developer/Xcode/DerivedData/iTerm-dmqofiayvqouzqakzaudepvpnfgb/Build/Products/Development/iTerm.app /Applications

## Configure iTerm to use the powerline fonts

In Preferences > Profiles > Text and select the fonts:

![](http://f.cl.ly/items/2K2y0M0i0a2u3h0j371P/Screen%20Shot%202013-02-10%20at%207.15.26%20PM.png)

## Result

If all goes well it should look like this:

#### vim (MacVim launched as vi or vim in the iTerm2)
![](http://f.cl.ly/items/2A2l3T1l3a3l2w451F2z/Screen%20Shot%202013-02-10%20at%207.21.34%20PM.png)

### MacVim GUI
![](http://f.cl.ly/items/1Q0y0D1o0H3V0q2j2Z0V/Screen%20Shot%202013-02-10%20at%2010.45.24%20PM.png)

#### zsh
![](http://f.cl.ly/items/3y1D1S2Y2X1U2h2s3a3K/Screen%20Shot%202013-02-10%20at%207.22.43%20PM.png)

#### tmux
![](http://f.cl.ly/items/2h1y2L1l1W2o1v0R0N3D/Screen%20Shot%202013-02-10%20at%207.24.11%20PM.png)
