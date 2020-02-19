import React from "react";
import { useSelector } from "react-redux";
import { IAppState } from "../redux/reducer";

export const TeamScore = () => {
    const gameState = useSelector((appState: IAppState) => appState.game);

    console.log("Game state updated ", gameState);
    
    return (
        <div className="leaderboard_content" id="leaderboardContent">
            <div className={`leaderboard_row`} id="rowTerro">
                <div className="leaderboard_points">
                    {gameState.terroPoints}
                </div>
                <div className="leaderboard_player_name">
                </div>
            </div>
            <div className={`leaderboard_row`} id="rowCounter">
                <div className="leaderboard_points">
                    {gameState.message ? gameState.message : gameState.secondsLeft}
                </div>
                <div className="leaderboard_player_name">
                </div>
            </div>
            <div className={`leaderboard_row`} id="rowPolice">
                <div className="leaderboard_points">
                    {gameState.policePoints}
                </div>
                <div className="leaderboard_player_name">
                </div>
            </div>
        </div>
    )
}
