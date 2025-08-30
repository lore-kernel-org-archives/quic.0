Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E035C7FBAC
	for <quic@lists.linux.dev>; Sat, 30 Aug 2025 00:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756514556; cv=none; b=I9m7B+QbJb8GHnAVaNZ7cydDtMgwDA58lARpqTeBrTPJx6f16l3VH886Bhu8medrtP7RY9uGw1yXGTD+bhxIb0YZkd4uahBnEv7DM4tx0OcWW4KpOuq9mwszdcnM8NE1lAWV6couAJua6ARffPao5628dOvMtp/kdjkNAwWqILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756514556; c=relaxed/simple;
	bh=CcUmhJCfvbstdws6vf9ioEEvjkYhzgsclNAn6AGWcOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oxk17XsAybiIvzWus2/WTtteEjdMXk6ruGMg57R2YSVgM/9OUOR+bGkqH0XYvvpfE3O+eE6YagaBkUPN9+TZRQkP+v0lcMchg78ESR2nHd+tbPGN9cZN4q+9nVuOSVKLP7oH5c63pn34aHPnvEj1sgVi3NfDgU74Bd3C0yXmNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AltoDd7k; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AltoDd7k"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4717543ed9so1804416a12.3
        for <quic@lists.linux.dev>; Fri, 29 Aug 2025 17:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756514553; x=1757119353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oT2jD/jOLx3+pqshj/jnt0yFOvPC3LTkf+hPkagM+wA=;
        b=AltoDd7k73Z7ARqPhJyqIabpqcShfOpp860AruBquArk1+NREKCJpzlq6jfv93Ljf1
         PthiOn5Gcp/FgWaykB1gaidYNkqT8GXzuEj1EiuER80UB6Coq1boQKO9O1+BMgpGVOSF
         IBS2mlS3lQvHhEJh5G1wXE89ighqqlEH3/07gRVbB7AN7G+p9pdIEXBrPmTEFoVpasJK
         dVPrmW4wV5HpOpqYgmrY/Hv7Wks19QmifB1j0YLXS6vBtkoEbmHK2pHIMsOgDYOagUg8
         5PzUCfyYPk4sOxOMhQ0DI6wDP6eyrMgeww4yfKofZPg2RcBA67uMXS2Sx9ikwJ4lNwPk
         c8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756514553; x=1757119353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oT2jD/jOLx3+pqshj/jnt0yFOvPC3LTkf+hPkagM+wA=;
        b=iNVPe6cPl8M/q0hNnVAUSjM7fGvykJ1hW0oEqlenL9VU5ZkC/TpGGqvkRUdcWKOdiD
         p2Zf7NJWlMuNq9v5f9w4HIybmVmfrVvTQP2bKVBJ2WDdR+Byjae0ZlmZzZTOgl52Y+Q3
         rWQVRKJqN45VPLdpo5NVnPSlr7n5uypyPrrsCMWoDmI0izVDz1XrbiC6SwyBXxlFuOKt
         q8uKvd6+HIh94PAVBHkDsSZkx6xQO+EbqIG0n00bq8imhRZ3jfkJWkDOPvjJN0ejpeYT
         euWrwaFuD/FzU46VbxGgzzkfJbvKVGrKMmTW3TRIkrS91ACfDQB1YYpgpwSdGlWDKz05
         1SPQ==
X-Gm-Message-State: AOJu0YxqZWFnYzk1REc4JPbAy3PSr0xNqfkLYqpoOhvveBgPLj6FgObk
	TbWx+vmVDhsluvvFYo7dg0/F6aoHNuwMoxb1Wa/JjV942GGBv03Ryq6Ku4gNwWIHhxIUSDa1xcj
	9GNe4VBIK8mPPCHMrFoYPqEfRWIvsIIY=
X-Gm-Gg: ASbGnctNhmlFPfvEc3mNdqrI7QDjAVuwxisUgnlPdUUtbMcjJDg1IkQtOLb0q6QmQLY
	P6bXfazNWA4sI6GR6wQyI7EUH6UngaPXhGAo2cNMO+Z2yZQ0SiRzlAG4Fti7JbqsFeztJx2EyWl
	nFZrEzbkAU+n6eQxE6q8u5280ilz3Y2eYrUOZ5zSV8gaQwjcyg+ySacwFSpzxclop1c+s5BsXuR
	ZzoVPD/Dmk5rd+sU9NMe9Fg4Rv5T7PC8+jUSN4=
X-Google-Smtp-Source: AGHT+IGS/r4DQ7InDpSOjhsvxFhCcRIO95OY0Q7bSjdBJZQzLP4e1A99PrzfGYy8u1n0OBioCJY3Ly3bcn0pprp0cUE=
X-Received: by 2002:a05:6a20:4322:b0:243:c36b:bec9 with SMTP id
 adf61e73a8af0-243d6e5bb1dmr748994637.26.1756514553090; Fri, 29 Aug 2025
 17:42:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <cb74facd-aa28-4c9d-b05f-84be3a135b20@app.fastmail.com>
 <CADvbK_f4v916nbx4t0fnkCj44S-buTytj_Paurd3j3Ro2tLDsQ@mail.gmail.com>
 <CADvbK_e9sNbvHSCNuvetOCFY5OQPG99tmZLW=odcRzcN9xK8rQ@mail.gmail.com>
 <c5d598ac-1bb0-47db-a90d-39d475f02bfe@app.fastmail.com> <9d4a3c5f-8b4b-4057-b550-e9158cbbc8bf@app.fastmail.com>
In-Reply-To: <9d4a3c5f-8b4b-4057-b550-e9158cbbc8bf@app.fastmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 29 Aug 2025 20:42:21 -0400
X-Gm-Features: Ac12FXw38GebHiJG4pEhOoSgkdC905HUjecOCRd1zHAZgvK4QLCTSPoWdyI5e5g
Message-ID: <CADvbK_fGu11GwR1eoxBsCF8HSnOGf9L_0fZwWX6XQNaZzFOk-Q@mail.gmail.com>
Subject: Re: Separate sockets for separate connections
To: John Ericson <mail@johnericson.me>
Cc: quic@lists.linux.dev, mbuhl@russel.uberspace.de, 
	Stefan Metzmacher <metze@samba.org>, draft-lxin-quic-socket-apis@ietf.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 12:49=E2=80=AFAM John Ericson <mail@johnericson.me>=
 wrote:
>
> Aye, I did everything I meant to do email-wise but change the subject lin=
e to
> something more appropriate. Let me just reply to myself right away doing =
that
> before there are more messages.
>
Thanks for opening this thread with a new subject!

>
> On Wed, Aug 27, 2025, at 12:45 AM, John Ericson wrote:
>
> On Tue, Aug 26, 2025, at 5:48 PM, Xin Long wrote:
> > Hi, John,
> >
> > Feel free to create a thread on quic@lists.linux.dev for this.
> >
> > Thanks.
>
> Kicking of the new linux QUIC dev mailing list with this, as requested.
>
> (The last email in netdev is
> https://lore.kernel.org/netdev/CADvbK_e9sNbvHSCNuvetOCFY5OQPG99tmZLW=3Dod=
cRzcN9xK8rQ@mail.gmail.com/,
> for reference.)
>
> > On Sun, Aug 24, 2025 at 1:57=E2=80=AFPM Xin Long <lucien.xin@gmail.com>=
 wrote:
> > >
> > > On Sat, Aug 23, 2025 at 11:21=E2=80=AFAM John Ericson <mail@johnerics=
on.me> wrote:
> > > >
> > > > (Note: This is an interface more than implementation question ---
> > > > apologies in advanced if this is not the right place to ask. I
> > > > originally sent this message to [0] about the IETF internet draft
> > > > [1], but then I realized that is just an alias for the draft
> > > > authors, and not a public mailing list, so I figured this would be
> > > > better in order to have something in the public record.)
> > > >
> > > > ---
> > > >
> > > > I was surprised to see that (if I understand correctly) in the
> > > > current design, all communication over one connection must happen
> > > > with the same socket, and instead stream ids are the sole
> > > > mechanism to distinguish between different streams (e.g. for
> > > > sending and receiving).
> > > >
> > > > This does work, but it is bad for application programming which
> > > > wants to take advantage of separate streams while being
> > > > transport-agnostic. For example, it would be very nice to run an
> > > > arbitrary program with stdout and stderr hooked up to separate
> > > > QUIC streams. This can be elegantly accomplished if there is an
> > > > option to create a fresh socket / file descriptor which is just
> > > > associated with a single stream. Then "regular" send/rescv, or
> > > > even read/write, can be used with multiple streams.
> > > >
> > > > I see that the SCTP socket interface has sctp_peeloff [2] for this
> > > > purpose. Could something similar be included in this
> > > > specification?
>
> > > Hi, John,
> > >
> > > That is a bit different. In SCTP, sctp_peeloff() detaches an
> > > association/connection from a one-to-many socket and returns it as a
> > > new socket. It does not peel off a stream. Stream send/receive
> > > operations in SCTP are actually quite similar to how QUIC handles
> > > streams in the proposed QUIC socket API.
>
> OK fair enough. sctp_peeloff() was the closest prior art I could find,
> but I don't know much about SCTP. Rest assured, I did have the QUIC
> semantics in mind. E.g. closing one of these QUIC per-stream peeled off
> sockets should close just the stream in question, not the entire
> connection.
>
I wrote some code to explore this:
https://github.com/lxin/quic/pull/53

- A stream can be peeled off from a parent/connection socket using
  getsockopt(QUIC_SOCKOPT_STREAM_PEELOFF) with a stream_id, similar to
  SCTP's connection peeloff.

- For stream sockets, in addition to send(), recv(), and close(), support
  for poll() and shutdown() is also implemented. Note that close() and
  shutdown() send a FIN on the sending side, issue a STOP_SENDING on the
  receiving side, or both for bidirectional streams, as applicable.

There's also a sample test:
https://github.com/lxin/quic/blob/stream-peeloff/tests/peeloff_test.c

- Sender: Opens a stream with getsockopt(QUIC_SOCKOPT_STREAM_OPEN), peels
  it off with getsockopt(QUIC_SOCKOPT_STREAM_PEELOFF), and sends data via
  the new file descriptor.

- Receiver: Detects stream creation through a QUIC_EVENT_STREAM_UPDATE
  event, peels off the stream with getsockopt(QUIC_SOCKOPT_STREAM_PEELOFF),
  and receives data via the new file descriptor.

> > > For QUIC, supporting 'stream peeloff' might mean creating a new
> > > socket type that carries a stream ID and maps its sendmsg/recvmsg to
> > > the 'parent' QUIC socket.
>
> Yes, exactly.
>
> > > But there are details to sort out, like whether the 'parent-child
> > > relationship' should be maintained.
>
> What do you mean by this? I assume the answer is that it should be
> maintained? e.g. if the connection is closed, then any child per-stream
> sockets are also invalidated and must be closed.
>
I aimed to make a peeled-off stream socket fully independent to keep the
design simple. However, since the connection socket may close at any time,
the stream socket must hold a reference to it. To keep the relationship
strictly one-way, the connection socket remains unaware of any peeled-off
stream sockets.

> > > We also need to consider whether this is worth implementing in the
> > > kernel, or if a  similar API could be provided in libquic.
>
> So this is sort of the crux of my argument. If it is in userland, then
> any application that wants to act per-stream needs to know about QUIC.
> But if it is in kernel, just a a tiny bit of QUIC-aware glue code is to
> plug together QUIC-agnostic software, by passing stream sockets to that
> software. (You could do it by passing pipes and a little userland
> man-in-the-middle using *quic_sendmsg and quic_recvmsg*, of course, but
> those extra context switches and copies are rather lousy.)
>
Right, providing it in libquic won't work for kernel consumers.

> For what it's worth, I would go further in fact and say that this
> "stream peeloff" system call should not just be supported by QUIC, too.
> It is very nice today how many code can be agnostic to TCP vs unix
> domain sockets, for example. I would ideally want the same thing to be
> true with QUIC too, via an "extended unix domain socket" that would
> replicate the QUIC state machine(s) just as regular unix domain sockets
> replicate the TCP state machine.
>
> I bring up such an "extended unix domain socket" not to indulge in scope
> creep, but just to point out that a good litmus test for a new socket
> interface is that multiple domains could meaningfully support it, and
> that litmus test is met in this case.
>
That=E2=80=99s a good point. Stream peel-off is an idea I find quite intere=
sting. I
originally based the QUIC stream API on SCTP=E2=80=99s model, but it now se=
ems that
most real-world use cases are closer to applications that traditionally
relied on TCP rather than SCTP.

Please check out the stream socket interfaces in the PR above and comment
on anything that you think could be improved.

Thanks.
