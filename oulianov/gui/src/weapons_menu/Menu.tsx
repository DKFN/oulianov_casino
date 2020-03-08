import React from "react"
import "./menu.css"
import { IAppState } from "../redux/reducer"
import { useSelector } from "react-redux";

export const WeaponsMenu = () => {

    const menuData = useSelector((appData: IAppState) => appData.weaponMenu);

    const menuContent = menuData.step === 1 ? (
        <>
            [1/2] Main <br/>
            <div className="menu-content">
                1. AK-47<br />
                2. M4A1 <br />
                3. Scout<br />
                4. MP5<br />
            </div>
        </>
    ) : (
        <>
            [2/2] Pistol <br/>
            <div className="menu-content">
                1. Beretta <br />
                2. Glock <br />
                3. Deagle <br />
                4. ? <br />
            </div>
        </>
    ) ;

    console.log("menu ", menuData)
    
    return menuData.isOpen ? (
        <div className="ogk-shadowbox weaponsMenu">
            <div className="menu-header">
                <span className="orange">[WeaponsMenu]</span><br />
                <b>F1</b> to open/close
            </div>
            {menuContent}
        </div>
    ) : null;
}
