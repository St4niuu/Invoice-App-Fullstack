import { configureStore, createAction, createReducer } from '@reduxjs/toolkit'

type AuthStateType = {
	loggedIn: false | true
	token: null | string
	data: any
}

export const login = createAction('login', (token: string, data: any) => {
	return {
		payload: {
			token,
			data,
		},
	}
})

export const logout = createAction('logout')

const reducer = createReducer(
	{
		loggedIn: false,
		token: null,
		data: null,
	} as AuthStateType,
	(builder) => {
		builder
			.addCase(login, (state, action) => {
				state.loggedIn = true
				state.token = action.payload.token
				state.data = action.payload.data
			})
			.addCase(logout, (state) => {
				state.loggedIn = false
				state.token = null
				state.data = null
			})
	}
)

const store = configureStore({ reducer })

export default store
