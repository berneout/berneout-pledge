# The Berneout Pledge

The Berneout Pledge is a simple tool for hassle-free open-source
contribution licensing.  It's [short, simple, and easy][pledge]
with GitHub and BASH.  No paper.  No bots.  No ties.

[pledge]: https://github.com/berneout/berneout-pledge/blob/master/pledge

__The Berneout Pledge is experimental legal technology, in active
development, provided free for the public good.  Nobody involved in
the project will answer to you, financially or professionally, for any
problem you have because of it.  Formal contributor license agreements
use older, better known legal mechanisms, and pose less risk.  Get a
lawyer if you need one.__

## For Contributors

The Berneout Pledge is a short pledge you can make to show that:

1. You understand common intellectual property traps and the basic
   responsibilities of a good open-source contributor.

2. Unless you say otherwise, you offer contributions to others'
   projects on the same terms they offer the project to you and
   everybody else.

Alas, these cannot otherwise be expected or implied.

To make the pledge:

1.  Create a [GitHub] account if you don't already have one.

2.  [Fork the official GitHub repository][fork] and clone it
    to your computer.

3.  Read the [`pledge` file][pledge].  Make sure you understand
    and agree with it.  Do research if you need it!

4.  Run the included `sign-pledge.sh` script and follow the prompts.
    If you sign the pledge, it will create a new commit for you that
    will be easy for projects to verify.

5.  Push the new commit to your fork on GitHub.

The end result should be a fork of the official repository at
`https://github.com/{you}/berneout-pledge` with one additional
commit.  [Like this one][example].

If you change your mind about the pledge later, remove your fork
from GitHub.

[GitHub]: https://github.com

[fork]: https://github.com/berneout/berneout-pledge/fork

[example]: https://github.com/kemitchell/berneout-pledge

## For Maintainers

Of the current popular contributor licensing approaches, the Berneout
Pledge works most like the [Developer Certificate of Origin][DCO]
used in Linux kernel development.  A few important differences:

1. By signing, folks making the Berneout Pledge take specific,
   individual action to show they understand the basics and norms of
   contributor licensing and offer their stuff accordingly.

2. The Berneout Pledge helps educate contributors about [works made
   for hire], transparency, and the need to get permission to
   contribute code from work.

3. The Berneout Pledge is easier and friendlier to read.
   No cross-references.  No legal-style numbering.  No license header.
   Just five paragraphs.

4. The Berneout Pledge is designed for [GitHub Flow, rather than
   Kernel or Git Flow][flow].  Commits come direct from their
   contributors, rather than through a gauntlet of reviewers
   and subsystem maintainers.  There are no metadata tags, like
   `Signed-Off-By`, to add.  Contributors show their agreement by
   signing forks of the pledge under the same GitHub user names they
   use to contribute, making them easy to check, even for new and
   one-time contributors.

[DCO]: http://developercertificate.org/

[works made for hire]: http://worksmadeforhire.com

[flow]: https://zachholman.com/posts/git-commit-history/

## For Everybody

The most important thing the Berneout Pledge does is present
contributor licensing as it is.  Giving as you take and watching out
for others are awesome things open-source people do and should be proud
of doing, not [ritual dances to appease fancy-pants jerks][kindzadza].
Nobody "complies with" the Berneout Pledge.  That's not how any of
this stuff works.

[kindzadza]: https://youtu.be/2ZqNtkh5mAg

Longer term, the Berneout Pledge might help make the case that
licensing contributions on the project's public terms is the norm,
and should be implied wherever open-source happens.  [Section 5 of
Apache 2.0] was a good start.  The Berneout Pledge builds steam for
"inbound=outbound" even under [other][MIT] [important][BSD-2-Clause]
[licenses][ISC] that don't mention what's expected.

[Section 5 of Apache 2.0]: https://www.apache.org/licenses/LICENSE-2.0#contributions

[MIT]: https://spdx.org/licenses/MIT

[BSD-2-Clause]: https://spdx.org/licenses/BSD-2-Clause

[ISC]: https://spdx.org/licenses/ISC
