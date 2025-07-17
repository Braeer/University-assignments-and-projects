import React from 'react';

import style from './styleHeader.module.scss';

const Header = () => {
  return (
    <header>
      <div className={style.header}>
        <a className='logo' href="">DRIVE</a>
        <div className='navBar'>
          <nav className='menu'>
            <ul>
              <li><a href="#">Cars</a></li>
              <li><a href="#">About</a></li>
            </ul>
          </nav>
          <div className='authorization'>
            <a className='sing-in' href="#">Sing in</a>
            <a className='sing-up' href="#">Sing up</a>
          </div>
        </div>
      </div>
    </header>
  )
};

export default Header;
