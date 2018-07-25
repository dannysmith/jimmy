# Core Features

We have defined a set of "core features". These are the features that, if they break, make it impossible for our users to peform their primary Jobs to Be Done. Core features should:

- Always have 100% test coverage at unit and request level.
- Be covered by an end-to-end system test, at least along the happy path.
- Have any non-standard routes covered by route specs.
- Have well-factored, defensive code.
- Have well-designed exception handling built in.
- Have had edge-cases considered and handled.
- Be thoroughly manually tested on staging before release.

Although not ideal, we accept that non-core features might sometimes ship to production with minor bugs. We're cool with the odd user encountering an edge-case bug and reporting it in this case. It is **never okay for a core feature to ship to production with bugs** (though of course, that will sometimes happen).
