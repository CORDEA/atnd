module main;

import watt.http : Http, Request;
import watt.io;
import models.response;

enum ENDPOINT = "api.atnd.org";
enum PATH_EVENT = "events";
enum QUERY = "?format=json";

private {
	fn request() string
	{
		http := new Http();
		request := new Request(http);
		request.server = ENDPOINT;
		request.port = 80;
		request.secure = false;
		request.url = PATH_EVENT ~ QUERY;

		while (!http.isEmpty()) {
			http.perform();
		}

		return request.getString();
	}

	fn parse(response: string) Response
	{
		return Response.fromString(response);
	}
}

fn main(args: string[]) i32
{
	resp := request();
	parsed := parse(resp);
	events := parsed.events;
	foreach (event; events) {
		writeln(event.title);
	}
	return 0;
}
