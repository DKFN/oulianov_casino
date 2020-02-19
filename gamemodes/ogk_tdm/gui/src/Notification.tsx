import React from "react"
import { useSelector } from "react-redux"
import { IAppState } from "./redux/reducer"

export const NotificationWin = () => {

    const winState = useSelector((s: IAppState) => s.win)

    return (
        <div className={`${winState !== 0 ? 'ogk-shadowbox' : ''}`} style={{
                fontSize: "24px",
                color: "orange"
            }}>
            { winState === 1 && <h1><span style={{color: "red"}}>[TERRORIST]</span> Won the round </h1> }
            { winState === 2 && <h1><span style={{color: "blue"}}>[POLICE]</span> Won the round </h1> }
            { winState === 3 && <h1><span></span> Round draw </h1> }
        </div>
    )
}
