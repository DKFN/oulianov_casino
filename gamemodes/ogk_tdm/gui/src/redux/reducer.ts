import { createAction, AnyAction, createReducer } from "@reduxjs/toolkit";
import { wrapAction } from "../onset";

// Here I create an action that takes no argument
export const incrementCounter = createAction("INCREMENT_COUNTER");

// I want this action to be available to Onset so I attach it globally
(window as any).incrementCounter = wrapAction(incrementCounter)


export const updatePlayerHud = createAction("UPDATE_PLAYER_HUD");
(window as any).updatePlayerHud = wrapAction(updatePlayerHud)
export const setWeaponStep = createAction("SET_WEAPON_STEP");
(window as any).setWeaponStep = wrapAction(setWeaponStep)
export const setGameState = createAction("SET_GAME_STATE");
(window as any).setGameState = wrapAction(setGameState)
export const setWinState = createAction("SET_WIN_STATE");
(window as any).setWinState = wrapAction(setWinState)

export const closePlayerWeapon = createAction("CLOSE_PLAYER_WEAPON");
(window as any).closePlayerWeapon = wrapAction(closePlayerWeapon)
export const openPlayerWeapon = createAction("OPEN_PLAYER_WEAPON");
(window as any).openPlayerWeapon = wrapAction(openPlayerWeapon)


// Here I declare the state of my whole application
// I only have one of course because this is only counting
export interface IAppState {
    counter: number;
    hud: {
        health: number,
        ammo: number;
        weapon?: string;
    },
    weaponMenu: {
        isOpen: boolean;
        step: number;
    },
    game: {
        state: number, // 0: Not Launched / 1: Active
        terroPoints: number,
        policePoints: number,
        secondsLeft: number,
        message?: string,
    },
    win: number
}

const initialState: IAppState = {
    counter: 0,
    hud: {
        health: 0,
        ammo: 0,
    },
    weaponMenu: {
        isOpen: true,
        step: 1,
    },
    game: {
        state: 0, // 0: Not Launched / 1: Active
        terroPoints: 0,
        policePoints: 0,
        secondsLeft: 0,
        message: "Loading ...",
    },
    win: 0
};

// Here it is my reducer, his tasks is to merge the future state with
export const counterReducer = createReducer(initialState, {
    [incrementCounter.type]: (state) => ({ ...state, counter: state.counter + 1 }),
    [closePlayerWeapon.type]: (state) => ({ ...state, weaponMenu: { ...state.weaponMenu, isOpen: false}}),
    [openPlayerWeapon.type]: (state) => ({ ...state, weaponMenu: { ...state.weaponMenu, isOpen: true}}),
    [setWeaponStep.type]: (state, action) => ({ ...state, weaponMenu: { ...state.weaponMenu, step: Number.parseInt(action.payload)}}),
    [updatePlayerHud.type]: (state, action) => ({...state, hud: JSON.parse(action.payload)}),
    [setGameState.type]: (state, action) => ({...state, game: JSON.parse(action.payload)}),
    [setWinState.type]: (state, action) => ({...state, win: Number.parseInt(action.payload)})
});
