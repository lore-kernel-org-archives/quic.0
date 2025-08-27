Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8728199230
	for <quic@lists.linux.dev>; Wed, 27 Aug 2025 04:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756269988; cv=none; b=l8Nj9sTNpiqUJWen4AFAQ9xIHgKXU3yyaNycAYOEIm4TVOzoVkfj7g6+J367UCONr3tae4gVcYqOWlm7xjxRpyHlE/bxgCLAaqN6pnGqB81Jhvbsk+zsmg+iCZNACQiAByZ/Yxxz6gm2i4GMMri36VyUPQO/DUuk7xe5G14rSbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756269988; c=relaxed/simple;
	bh=YZ8XN4JlKmbALa20PMFw7N7pTiOcyy9pOFvtYP5fk3Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=t/EHEQ2JDSE14TqPYA6FICta0CPZmyaZUZkFFlmbNxW3oopuDgmwP5WLObvbj5ZGimXMQba11shj/eXEJQerjOT9UhEyjUiLRqodX0DZv5zr8guAJN8N5kygyPy9r7SlcSqUKl/9RECUwx4Kb0zmXr+1lPdBS/stEM/VHScDmA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=johnericson.me; spf=pass smtp.mailfrom=johnericson.me; dkim=pass (2048-bit key) header.d=johnericson.me header.i=@johnericson.me header.b=hbxS3Dw6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XJ4LPzj7; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=johnericson.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johnericson.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=johnericson.me header.i=@johnericson.me header.b="hbxS3Dw6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XJ4LPzj7"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id BD78B1D000F5;
	Wed, 27 Aug 2025 00:46:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-11.internal (MEProxy); Wed, 27 Aug 2025 00:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnericson.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1756269983; x=1756356383; bh=rnU3HSLKyuqh0N3v7WRKaI1Mk8bTweeh
	MjpkiZxpCz8=; b=hbxS3Dw6ijmJP7oxFJBGMoHKK99YKFUoEwa2yEbb7Lp5Bc8E
	o8g9c9NSMhHTUL/xKz72UNTOh7dQQ20YhAMhF6upY/P77JEkozb63Ssv/2PVX/Z0
	Sv3R7EvgVoUZgNLf7iFnElP15w8j1oGKzwkCcY1mcE1hcNy/COEOXJrGsKNq5H+b
	g04SNb1URKIvVx32m4SXrF/fVeqEA5QSPbMQTRSzH3QCJ4SiDjI4q2BItTFWm0PS
	++qc24qapCz4fF0OGye69LMQnnTEoavH6J2Ki8uHLi5kxNLSvs8c/UFrQDvwXhyX
	hjLclP/6dbJoWR9y4/7PRZ/w3ynptkx4vMvF6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756269983; x=
	1756356383; bh=rnU3HSLKyuqh0N3v7WRKaI1Mk8bTweehMjpkiZxpCz8=; b=X
	J4LPzj7reMZEhHs2hG0mF3OfVLVWYMiulrUPtblO50SY6gv4gBd2ygor9VSjHypC
	EWhKbuuhWIryhqZhyqFIQJ6cj9vq/2f31S5SkIVFTsGcn372qQ2fyxbasJUSODpH
	JBD3VwCBJcw7lAOPUT7kqzSWZlouBGwp26ZpIb7+kPsD2jUXL1BaPEkxOXt/XunD
	qaDSYHhSGgs64yqoLx1GjuH4lwuvxPycyjsSYazaxD3S0P3T0B0gsZEfKhGvc75b
	RNZxz3C9XjsuWNTI8fCXuegC/S7FqnxA/erI6cgdhcHcZZ1pxkPUHgwl7E9EamvO
	j8Fsx1xtTf8asHsCanAMA==
X-ME-Sender: <xms:no2uaM647b97iQQ60YIwy1Wx3j-tyI-VejzX4MB8MCR1kZ3m9z-AHg>
    <xme:no2uaN7fHpa7Q8eJ62aIl3toYo0lpZasGnM1hy2rUP4nUkXVbvfmOOZnpvgb25u4S
    l2LIWzeWLjt-rj7KK8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeejvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthhqre
    dtredtjeenucfhrhhomhepfdflohhhnhcugfhrihgtshhonhdfuceomhgrihhlsehjohhh
    nhgvrhhitghsohhnrdhmvgeqnecuggftrfgrthhtvghrnhepjeeltdegueetteeuvdevve
    ffffeuleevueejjefhgfdvgeefueefgedtkeelhfffnecuffhomhgrihhnpehkvghrnhgv
    lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghilhesjhhohhhnvghrihgtshhonhdrmhgvpdhnsggprhgtphhtthhopeegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehluhgtihgvnhdrgihinhesghhmrghilh
    drtghomhdprhgtphhtthhopegurhgrfhhtqdhlgihinhdqqhhuihgtqdhsohgtkhgvthdq
    rghpihhssehivghtfhdrohhrghdprhgtphhtthhopehquhhitgeslhhishhtshdrlhhinh
    hugidruggvvhdprhgtphhtthhopehmsghuhhhlsehruhhsshgvlhdruhgsvghrshhprggt
    vgdruggv
X-ME-Proxy: <xmx:no2uaAJmkJbIHdBBZ5qhoqG6lJFkNCy8AwWf-eUoXZwBYkg6yrOlAw>
    <xmx:no2uaFhO5CQPJH1zmMk6qDHnD1CBYDLVvMFHabRTPZQD0XN1UhHjaQ>
    <xmx:no2uaA5S5XegfCAjSwG_KkYCa7PEf1QeOJV7qxTHHuKhzjPqo92dqQ>
    <xmx:no2uaNYWV4A0Xqi8lc6-RlqmyzZtjedQJqvUPQKd9fINS_MSQ-lG_w>
    <xmx:n42uaOXdvND6fRHD1eVs-HP6-5bvlRwIxcDrnCs--K5l5bwOTIlxlNuH>
Feedback-ID: ieb4144f1:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9B9CB700069; Wed, 27 Aug 2025 00:46:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AsYvG0Y22C5R
Date: Wed, 27 Aug 2025 00:45:30 -0400
From: "John Ericson" <mail@johnericson.me>
To: quic@lists.linux.dev
Cc: "Xin Long" <lucien.xin@gmail.com>, mbuhl@russel.uberspace.de,
 draft-lxin-quic-socket-apis@ietf.org
Message-Id: <c5d598ac-1bb0-47db-a90d-39d475f02bfe@app.fastmail.com>
In-Reply-To: 
 <CADvbK_e9sNbvHSCNuvetOCFY5OQPG99tmZLW=odcRzcN9xK8rQ@mail.gmail.com>
References: <cover.1755525878.git.lucien.xin@gmail.com>
 <cb74facd-aa28-4c9d-b05f-84be3a135b20@app.fastmail.com>
 <CADvbK_f4v916nbx4t0fnkCj44S-buTytj_Paurd3j3Ro2tLDsQ@mail.gmail.com>
 <CADvbK_e9sNbvHSCNuvetOCFY5OQPG99tmZLW=odcRzcN9xK8rQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/15] net: introduce QUIC infrastructure and core
 subcomponents
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025, at 5:48 PM, Xin Long wrote:
> Hi, John,
>=20
> Feel free to create a thread on quic@lists.linux.dev for this.
>=20
> Thanks.

Kicking of the new linux QUIC dev mailing list with this, as requested.

(The last email in netdev is
https://lore.kernel.org/netdev/CADvbK_e9sNbvHSCNuvetOCFY5OQPG99tmZLW=3Do=
dcRzcN9xK8rQ@mail.gmail.com/,
for reference.)

> On Sun, Aug 24, 2025 at 1:57=E2=80=AFPM Xin Long <lucien.xin@gmail.com=
> wrote:
> >
> > On Sat, Aug 23, 2025 at 11:21=E2=80=AFAM John Ericson <mail@johneric=
son.me> wrote:
> > >
> > > (Note: This is an interface more than implementation question ---
> > > apologies in advanced if this is not the right place to ask. I
> > > originally sent this message to [0] about the IETF internet draft
> > > [1], but then I realized that is just an alias for the draft
> > > authors, and not a public mailing list, so I figured this would be
> > > better in order to have something in the public record.)
> > >
> > > ---
> > >
> > > I was surprised to see that (if I understand correctly) in the
> > > current design, all communication over one connection must happen
> > > with the same socket, and instead stream ids are the sole
> > > mechanism to distinguish between different streams (e.g. for
> > > sending and receiving).
> > >
> > > This does work, but it is bad for application programming which
> > > wants to take advantage of separate streams while being
> > > transport-agnostic. For example, it would be very nice to run an
> > > arbitrary program with stdout and stderr hooked up to separate
> > > QUIC streams. This can be elegantly accomplished if there is an
> > > option to create a fresh socket / file descriptor which is just
> > > associated with a single stream. Then "regular" send/rescv, or
> > > even read/write, can be used with multiple streams.
> > >
> > > I see that the SCTP socket interface has sctp_peeloff [2] for this
> > > purpose. Could something similar be included in this
> > > specification?

> > Hi, John,
> >
> > That is a bit different. In SCTP, sctp_peeloff() detaches an
> > association/connection from a one-to-many socket and returns it as a
> > new socket. It does not peel off a stream. Stream send/receive
> > operations in SCTP are actually quite similar to how QUIC handles
> > streams in the proposed QUIC socket API.

OK fair enough. sctp_peeloff() was the closest prior art I could find,
but I don't know much about SCTP. Rest assured, I did have the QUIC
semantics in mind. E.g. closing one of these QUIC per-stream peeled off
sockets should close just the stream in question, not the entire
connection.

> > For QUIC, supporting 'stream peeloff' might mean creating a new
> > socket type that carries a stream ID and maps its sendmsg/recvmsg to
> > the 'parent' QUIC socket.

Yes, exactly.

> > But there are details to sort out, like whether the 'parent-child
> > relationship' should be maintained.

What do you mean by this? I assume the answer is that it should be
maintained? e.g. if the connection is closed, then any child per-stream
sockets are also invalidated and must be closed.

> > We also need to consider whether this is worth implementing in the
> > kernel, or if a  similar API could be provided in libquic.

So this is sort of the crux of my argument. If it is in userland, then
any application that wants to act per-stream needs to know about QUIC.
But if it is in kernel, just a a tiny bit of QUIC-aware glue code is to
plug together QUIC-agnostic software, by passing stream sockets to that
software. (You could do it by passing pipes and a little userland
man-in-the-middle using *quic_sendmsg and quic_recvmsg*, of course, but
those extra context switches and copies are rather lousy.)

For what it's worth, I would go further in fact and say that this
"stream peeloff" system call should not just be supported by QUIC, too.
It is very nice today how many code can be agnostic to TCP vs unix
domain sockets, for example. I would ideally want the same thing to be
true with QUIC too, via an "extended unix domain socket" that would
replicate the QUIC state machine(s) just as regular unix domain sockets
replicate the TCP state machine.

I bring up such an "extended unix domain socket" not to indulge in scope
creep, but just to point out that a good litmus test for a new socket
interface is that multiple domains could meaningfully support it, and
that litmus test is met in this case.

Cheers,

John
