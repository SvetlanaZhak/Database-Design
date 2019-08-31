--2.2
--SQL Script to create the indexes
CREATE INDEX ix_FK_event_id_performer_id ON Performer(performer_id);
CREATE INDEX ix_FK_venue_id ON Venue(venue_id);
CREATE INDEX ix_FK_event_id ON Event(event_id);
CREATE INDEX ix_FK_event_id ON EventPerformance(event_id, performer_id);
