INSERT INTO universe (name) VALUES
                                ('Minecraft'),
                                ('Main universe');

INSERT INTO planet (name, universe_id) VALUES
                                           ('world', 1),  -- 1
                                           ('earth', 2),  -- 2
                                           ('rick`s station', 2);  -- 3

INSERT INTO creature (name, power, planet_id) VALUES
                                                  ('creeper', 100, 1), -- 1
                                                  ('zombie', 50, 1), -- 2
                                                  ('rick-from-minecraft', 80, 1), -- 3
                                                  ('morty-from-minecraft', 10, 1), -- 4
                                                  ('angry-rick', 110, 3), -- 5
                                                  ('morty', 25, 2), -- 6
                                                  ('nimbus', 150, 2), -- 7
                                                  ('jessy', 75, 2), -- 8
                                                  ('smart-rick', 111, 3), -- 9
                                                  ('old-rick', 65, 3); -- 10
INSERT INTO weapon (name, power) VALUES
                                     ('diamond sword', 32),
                                     ('portal gun', 13),
                                     ('blaster', 56),
                                     ('BFG', 3333),
                                     ('ANTI-BFG', -3000);

INSERT INTO effect (name, power_affect) VALUES
                                            ('baff', 50),  -- 1
                                            ('debaff', -50);  -- 2

INSERT INTO planet_effect_rule (planet_id, creature_to_id, effect_id) VALUES
                                                               (2, 9, 2),
                                                               (2, 10, 1),
                                                               (2, 6, 1),
                                                               (2, 5, 2),
                                                               (2, 7, 1),
                                                               (3, 9, 1),
                                                               (3, 10, 1),
                                                               (3, 5, 1),
                                                               (3, 6, 2),
                                                               (3, 8, 1);
INSERT INTO creature_effect_rule (creature_from_id, creature_to_id, effect_id, is_to_ally) VALUES
                                                                                               (8, 6, 1, False),
                                                                                               (8, 7, 1, False),
                                                                                               (10, 8, 1, False),
                                                                                               (8, 8, 1, False),
                                                                                               (6, 8, 1, True),
                                                                                               (7, 7, 1, True),
                                                                                               (5, 10, 1, True),
                                                                                               (5, 9, 2, False),
                                                                                               (8, 9, 2, True),
                                                                                               (3, 3, 2, True),
                                                                                               (7, 10, 2, True),
                                                                                               (1, 3, 1, True),
                                                                                               (10, 10, 2, False),
                                                                                               (5, 8, 1, True),
                                                                                               (10, 6, 2, False),
                                                                                               (4, 1, 2, False),
                                                                                               (5, 9, 1, True),
                                                                                               (10, 6, 1, False),
                                                                                               (8, 10, 1, True),
                                                                                               (9, 9, 1, True),
                                                                                               (7, 5, 1, False),
                                                                                               (6, 8, 1, False),
                                                                                               (8, 6, 2, False),
                                                                                               (4, 4, 1, False),
                                                                                               (7, 8, 2, True),
                                                                                               (10, 10, 1, True),
                                                                                               (1, 3, 1, False),
                                                                                               (1, 4, 1, False),
                                                                                               (9, 8, 1, False),
                                                                                               (4, 2, 2, False),
                                                                                               (1, 2, 2, True),
                                                                                               (9, 7, 2, False),
                                                                                               (8, 7, 1, True),
                                                                                               (7, 6, 2, False),
                                                                                               (9, 9, 1, False),
                                                                                               (8, 8, 1, True),
                                                                                               (1, 3, 2, True),
                                                                                               (5, 10, 2, False),
                                                                                               (7, 9, 2, False),
                                                                                               (5, 5, 1, False),
                                                                                               (7, 10, 1, False),
                                                                                               (7, 8, 1, True),
                                                                                               (6, 7, 2, False),
                                                                                               (7, 8, 2, False),
                                                                                               (9, 5, 1, False),
                                                                                               (1, 1, 2, True);








