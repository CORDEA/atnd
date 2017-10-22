module models.event;

import watt.json;

struct Event {
	title, description, eventUrl: string;

	global fn fromValue(value: Value) Event
	{
		event := value.lookupObjectKey("event");
		e: Event;
		e.title = event.lookupObjectKey("title").str();
		e.description = event.lookupObjectKey("description").str();
		e.eventUrl = event.lookupObjectKey("event_url").str();
		return e;
	}
}
