function removeTransition(e) {
    if (e.propertyName !== 'transform') return;
    e.target.classList.remove('playing');
  }

  function playSound(e) {
    const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
    const key = document.querySelector(`div[data-key="${e.keyCode}"]`);
    if (!audio) return;

    key.classList.add('playing');
    audio.currentTime = 0;
    audio.play();
  }

  // function stopSound(e) {
  //   const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
  //   const key = document.querySelector(`div[data-key="${e.keyCode}"]`);
  //   console.log(key);
  //   if (audio) return;
  //
  //   key.classList.remove('playing');
  //   audio.loop=false;
  //   audio.currentTime = 0;
  //   audio.stop();
  //
  // }

  // const selectedKeys = Array.from(document.querySelectorAll('.key'));
  // selectedKeys.forEach(key => key.addEventListener('click', stopSound));
  // window.addEventListener('click', stopSound);

  const keys = Array.from(document.querySelectorAll('.key'));
  keys.forEach(key => key.addEventListener('transitionend', removeTransition));
  window.addEventListener('keydown', playSound);
