import React from 'react';
import './App.css';
import { Provider } from 'react-redux';
import {store} from "./redux/store";
import {Counter} from "./Counter";
import {WeaponsMenu} from "./weapons_menu/Menu"
import { PlayerHud } from './hud/Hud';
import { TeamScore } from './hud/TeamScore';
import { NotificationWin } from './Notification';

// This is the main part of the application that will run as soon as the cef is ready and javascript loaded
const App: React.FC = () => {
  return (
    <Provider store={store}>
      <div className="App">
          <TeamScore />
          <NotificationWin /> 
          <WeaponsMenu />
          <PlayerHud />
      </div>
    </Provider>
  );
}

export default App;
