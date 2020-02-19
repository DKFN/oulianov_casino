import React from "react";
import { useSelector } from "react-redux";
import { IAppState } from "../redux/reducer";

export const PlayerHud = () => {
    const playerData = useSelector((appData: IAppState) => appData.hud)

    return (
        <div className="player-hud content ogk-shadowbox ">
            <div className="hud-top">
                <div className="column hud-col">
                    <span className="hud-title" id="health">{Math.round(playerData.health)}</span><br />
                    <span className="hud-subtitle">HEALTH</span>
                </div>
                <div className="column hud-col">
                    <span className="hud-title" id="ammo">{playerData.ammo}</span><br />
                    <span className="hud-subtitle">AMMO</span>
                </div>
                <div className="column">
                    <span className="hud-title" id="level">-</span><br />
                    <span className="hud-subtitle">LVL</span>
                </div>
            </div>
        </div>
    )
}
