CREATE TABLE IF NOT EXISTS universe(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS planet(
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    universe_id INTEGER NOT NULL REFERENCES universe(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS creature (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    power INTEGER NOT NULL CHECK (power >= 0),
    icon VARCHAR(255),
    planet_id INTEGER NOT NULL REFERENCES planet(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS adventure (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    started_at TIMESTAMP,
    finished_at TIMESTAMP,
    is_successful BOOL
);

CREATE TABLE IF NOT EXISTS weapon (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    power INTEGER NOT NUlL,
    icon VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS battler (
    id SERIAL PRIMARY KEY,
    creature_id INTEGER NOT NULL REFERENCES creature(id),
    adventure_id INTEGER NOT NULL REFERENCES adventure(id),
    weapon_id INTEGER REFERENCES weapon(id) ON DELETE SET NULL,
    UNIQUE (creature_id, adventure_id)

);

CREATE TABLE IF NOT EXISTS adventure_planets (
    id SERIAL PRIMARY KEY,
    adventure_id INTEGER NOT NULL REFERENCES adventure(id) ON DELETE CASCADE,
    planet_id INTEGER NOT NULL REFERENCES planet(id) ON DELETE CASCADE,
    is_visited BOOL NOT NULL
);

CREATE TABLE IF NOT EXISTS team (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    adventure_id INTEGER NOT NULL REFERENCES adventure(id) ON DELETE CASCADE,
    UNIQUE (adventure_id)
);

CREATE TABLE IF NOT EXISTS teammates (
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL REFERENCES team(id) ON DELETE CASCADE,
    battler_id INTEGER NOT NULL REFERENCES battler(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS battle  (
    id SERIAL PRIMARY KEY,
    adventure_id INTEGER NOT NULL REFERENCES adventure(id) ON DELETE CASCADE,
    planet_id INTEGER NOT NULL REFERENCES planet(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS battle_battlers (
    id SERIAL PRIMARY KEY ,
    battle_id INTEGER NOT NULL REFERENCES battle(id) ON DELETE CASCADE,
    battler_id INTEGER NOt NULL REFERENCES battler(id) ON DELETE CASCADE,
    is_opponent BOOL NOT NULL
);

CREATE TABLE IF NOT EXISTS battle_report (
    id SERIAL PRIMARY KEY,
    battle_id INTEGER NOT NULL REFERENCES battle(id) ON DELETE CASCADE,
    allies_power INTEGER NOT NULL CHECK (allies_power >= 0),
    opponents_power INTEGER NOT NULL CHECK (opponents_power >= 0),
    UNIQUE (battle_id)
);

CREATE TABLE IF NOT EXISTS effect (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    power_affect INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS creature_effect_rule(
    id SERIAL PRIMARY KEY,
    creature_from_id INTEGER NOT NULL REFERENCES creature(id) ON DELETE CASCADE,
    creature_to_id INTEGER NOT NULL REFERENCES creature(id) ON DELETE CASCADE,
    effect_id INTEGER NOT NULL REFERENCES effect(id) ON DELETE CASCADE,
    is_to_ally BOOL NOT NULL,
    UNIQUE (creature_from_id, creature_to_id, effect_id, is_to_ally)
);

CREATE TABLE IF NOT EXISTS planet_effect_rule(
    id SERIAL PRIMARY KEY ,
    planet_id INTEGER NOt NULL REFERENCES planet(id) ON DELETE CASCADE,
    creature_to_id INTEGER NOT NULL REFERENCES creature(id) ON DELETE CASCADE,
    effect_id INTEGER NOT NULL REFERENCES effect(id) ON DELETE CASCADE,
    UNIQUE (planet_id, creature_to_id, effect_id)
);

CREATE TABLE IF NOT EXISTS battler_effects(
    id SERIAL PRIMARY KEY,
    battle_id INTEGER NOT NULL REFERENCES battle(id) ON DELETE CASCADE,
    battler_id INTEGER NOT NULL REFERENCES battler(id) ON DELETE CASCADE,
    effect_id INTEGER NOT NULL REFERENCES effect(id) ON DELETE CASCADE

);

CREATE INDEX IF NOT EXISTS creature_planet_id_fk ON creature USING HASH (planet_id);
CREATE INDEX IF NOT EXISTS  creature_name_idx ON creature (name);

CREATE INDEX IF NOT EXISTS  battler_creature_id_fk ON battler USING HASH (creature_id);
CREATE INDEX IF NOT EXISTS battler_weapon_id_fk ON battler USING HASH (weapon_id);

CREATE INDEX IF NOT EXISTS adventure_planets_planet_id_fk ON adventure_planets USING HASH (planet_id);

CREATE INDEX IF NOT EXISTS teammates_battler_id_fk ON teammates USING HASH (battler_id);

CREATE INDEX IF NOT EXISTS battle_battlers_id_fk ON battle_battlers USING HASH (battler_id);

CREATE INDEX IF NOT EXISTS creature_effect_rule_creature_to_id_fk ON creature_effect_rule USING HASH (creature_to_id);
CREATE INDEX IF NOT EXISTS creature_effect_rule_creature_from_id_fk ON creature_effect_rule USING HASH (creature_from_id);
CREATE INDEX IF NOT EXISTS creature_effect_rule_effect_id_fk ON creature_effect_rule USING HASH (effect_id);

CREATE INDEX IF NOT EXISTS planet_effect_rule_creature_to_id_fk ON planet_effect_rule USING HASH (creature_to_id);
CREATE INDEX IF NOT EXISTS planet_effect_rule_planet_id_fk ON planet_effect_rule USING HASH (planet_id);
CREATE INDEX IF NOT EXISTS planet_effect_rule_effect_id_fk ON planet_effect_rule USING HASH (effect_id);

CREATE INDEX IF NOT EXISTS battler_effects_battler_id_fk ON battler_effects USING HASH (battler_id);
CREATE INDEX IF NOT EXISTS battler_effects_battle_id_fk ON battler_effects USING HASH (battle_id);
CREATE INDEX IF NOT EXISTS battler_effects_effect_id_fk ON battler_effects USING HASH (effect_id);