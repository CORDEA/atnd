module models.response;

import watt.json;
import models.event : Event;

struct Response {
	events: Event[];

	global fn fromString(json: string) Response
	{
		root := parse(json);
		events := root.lookupObjectKey("events").array();
		r: Response;
		length := cast(i32)events.length;
		r.events = new Event[](length);
		for (i := 0; i < length; i++) {
			r.events[i] = Event.fromValue(events[i]);
		}
		return r;
	}
}
