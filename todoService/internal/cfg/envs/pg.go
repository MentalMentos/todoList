package envs

import (
	"errors"
	"os"
)

const (
	dsnEnvName = "PG_DSN"
)

type PGConfig interface {
	DSN() string
}

type pgConfig struct {
	dsn string
}

func NewPGConfig() (PGConfig, error) {
	dsn := os.Getenv(dsnEnvName)
	if dsn == "" {
		return nil, errors.New("pg dsn not found")
	}
	return &pgConfig{
		dsn,
	}, nil
}

func (cfg *pgConfig) DSN() string {
	return cfg.dsn
}
