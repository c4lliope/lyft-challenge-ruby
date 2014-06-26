# Rideshare Resolver, Ruby version

This project is a Ruby implementation of [Lyft]'s programming challenge for
prospective software engineers:

The problem, as stated on the job posting:

> Calculate the detour distance between two different rides.
> Given four latitude / longitude pairs, where driver one is traveling from
> point A to point B and driver two is traveling from point C to point D,
> write a function (in your language of choice) to calculate the shorter
> of the detour distances the drivers would need to take to pick-up and
> drop-off the other driver.


This code and commit history gives a pretty typical snapshot of my development
process. I start out with tests, refactor continuously, and try to reduce
coupling between different parts of the program.

As an experiment, I also attempted to solve the problem [with EmberJS]. It
turned out to be more interesting than this one.

## Usage

As stated in the problem description, provide four latitude/longitude pairs as
a list of eight numbers on the command line. For example:

```bash
ruby rideshare_resolver.rb 37.808673 -122.409821 37.802139 -122.41874 37.777794 -122.511107 37.802139 -122.41874
```

These specific values correspond to popular tourist destinations in
San Francisco.

Again, unless you really enjoy keeping track of locations by their lat/long
values, you'll probably want to check out [the Ember version].

[Lyft]: https://www.lyft.com
[with EmberJS]: https://github.com/graysonwright/lyft-challenge-ember
[the Ember version]: https://github.com/graysonwright/lyft-challenge-ember
