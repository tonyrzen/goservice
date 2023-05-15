package createserver

import "github.com/go-chi/chi/v5"

func CreateServer() chi.Router {
	r := chi.NewRouter()
	return r
}
