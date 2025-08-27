Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B919CCEC
	for <quic@lists.linux.dev>; Wed, 27 Aug 2025 04:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756270394; cv=none; b=E8bi5G10lYWJ5Aym4k4RxVGzs+42b9ndIDxI8dlgkr4j0VBnhgT7PjMRI7QMXKKo1TS6WDhXKbWeiYZ87kxgASgGHmz7r0VPG6YooBCLcqMTRwbTqo60mJfb5aLwTfld6hFMQOYIo301V9XoVJAN+2GILs9FrAoH7UwneW5laOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756270394; c=relaxed/simple;
	bh=9P6Cmo51gRxgcEPgHJelolEJTHj4vPDSTTQTRTflENg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DP41FC927MoDRStKlKYhYK/x97DxZ2N6wMaKFuFa/hwbFwEFZl/H7npnyHLlCmWWqp6ATNEqCSPMR4Xi9dmFHSLDVeso5sqewN/x2IbwC48vplHvMvrRxO5Kkejmx5QqfM4OOYgGKJVqQuj3a8H+R97KDSKZ/V42B124zZD3BNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=johnericson.me; spf=pass smtp.mailfrom=johnericson.me; dkim=pass (2048-bit key) header.d=johnericson.me header.i=@johnericson.me header.b=I0IotvFq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IZwiSd5F; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=johnericson.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johnericson.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=johnericson.me header.i=@johnericson.me header.b="I0IotvFq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IZwiSd5F"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 1AE571D000A2;
	Wed, 27 Aug 2025 00:53:11 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-11.internal (MEProxy); Wed, 27 Aug 2025 00:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnericson.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1756270390; x=1756356790; bh=RQtblwlQPskOtkL+H06JjLiviT5CsK1t
	sjlgq6JqyZ4=; b=I0IotvFqUOQDGWnZmtp0ka8j5cNaVqbUFWnNsSnOWLfoCart
	KSq1PWkepq9SxGZMARug5JPiCd9Wi7c9TsSl1wdoodLhTENEe+86BFn3Aa7gJheI
	wCAZvfM2V5sRlFfCmL41MLQLFoZHjYGJQzhDjPc6amrdSxXHYtkeYGEhCvwosSsv
	bqJX/ZFXrOsZ7QcGKuP50v8zugLThgbOSAlJ+9+JbB6JQkeI3e2mQnjpX9tgamEc
	/6mVpj5nYNH7W0Dzd1gjTXMwHNPGU5oPPxrhhVW21qkFbWH0J0C0zK0rgzjHfBip
	0gNrR+RfHdqG04V9PDuSyEaUoo3Fa5+IaGmO3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756270390; x=
	1756356790; bh=RQtblwlQPskOtkL+H06JjLiviT5CsK1tsjlgq6JqyZ4=; b=I
	ZwiSd5F0XflW8zOpnqqycWeazEFHwzn4zfC8BcY/kEWn2Iae3K/MxaNPoCpv4yKM
	va7r3yqJM5YZykz9miWAqJnNbLXc5bng6KQ129Y1iDcEULQb86b2Q9zY0UUE8FsR
	zTJmSZfOQjP7IxHSV/d181X0KmIoXxXexSjdMjPbMQOaLkB1Y8p75uUdFAyrjENI
	k5aidzbwAGDoFuzU0VgtTwiVH8Xmp3GGfKtdtl8mqNAagZy8X+5R9fIYnjY08Y1I
	taZ42O2zVXbDcd5Xv/cpJvs2GjZp+b3lgpnalnoOeDz9KGp32/6VHWOjEXFNPbMv
	/254XAACsV3vKxjfNR01w==
X-ME-Sender: <xms:No-uaIAZhDNPc_9ZXnSSWAYMVXH2Zy6qLhGValaiMZIYWTJkO1UvdQ>
    <xme:No-uaKj3HWgDycpU1GI8bDZpUL6vl67I03Xj7m2h4IzDr1AADgCbnQkdKFeCqdAkn
    vEci97Unkco5aUvvjo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeejvdefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:No-uaOQvUigFzaucXk3JjslZqTJIXXGeI1i-mKjYi7X2sIfiexW6Xw>
    <xmx:No-uaJJPIGjUXOp3a-jLrnTNB9CZZ_1kByMz5XYNYVjQB3yJgPzt-g>
    <xmx:No-uaMDzA2-YknSAPDzBBlkVeA-I5moHYz0lVNzAATJSLeCfzhPWrg>
    <xmx:No-uaKDbv6kFllS6oEwVQh3hAyNVPLcEqrCQLfKsKfYd8NjOHh7-Wg>
    <xmx:No-uaI9iqq34rxJE1D17F7dC5jt9EalE2eth2qVmjnGeA7WQQgENP_gc>
Feedback-ID: ieb4144f1:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9464E700065; Wed, 27 Aug 2025 00:53:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 Aug 2025 00:52:50 -0400
From: "John Ericson" <mail@johnericson.me>
To: quic@lists.linux.dev
Cc: "Xin Long" <lucien.xin@gmail.com>, mbuhl@russel.uberspace.de,
 draft-lxin-quic-socket-apis@ietf.org
Message-Id: <d800e384-92ed-4db3-9b2e-42c675197d5e@app.fastmail.com>
In-Reply-To: <c5d598ac-1bb0-47db-a90d-39d475f02bfe@app.fastmail.com>
References: <cover.1755525878.git.lucien.xin@gmail.com>
 <cb74facd-aa28-4c9d-b05f-84be3a135b20@app.fastmail.com>
 <CADvbK_f4v916nbx4t0fnkCj44S-buTytj_Paurd3j3Ro2tLDsQ@mail.gmail.com>
 <CADvbK_e9sNbvHSCNuvetOCFY5OQPG99tmZLW=odcRzcN9xK8rQ@mail.gmail.com>
 <c5d598ac-1bb0-47db-a90d-39d475f02bfe@app.fastmail.com>
Subject: Separate sockets for separate connections
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Aye, I did everything I meant to do email-wise but change the subject li=
ne to
something more appropriate. Let me just reply to myself right away doing=
 that
before there are more messages.

John

On Wed, Aug 27, 2025, at 12:45 AM, John Ericson wrote:
> On Tue, Aug 26, 2025, at 5:48 PM, Xin Long wrote:
> > Hi, John,
> >=20
> > Feel free to create a thread on quic@lists.linux.dev for this.
> >=20
> > Thanks.
>=20
> Kicking of the new linux QUIC dev mailing list with this, as requested.
>=20
> (The last email in netdev is
> https://lore.kernel.org/netdev/CADvbK_e9sNbvHSCNuvetOCFY5OQPG99tmZLW=3D=
odcRzcN9xK8rQ@mail.gmail.com/,
> for reference.)
>=20
> > On Sun, Aug 24, 2025 at 1:57=E2=80=AFPM Xin Long <lucien.xin@gmail.c=
om> wrote:
> > >
> > > On Sat, Aug 23, 2025 at 11:21=E2=80=AFAM John Ericson <mail@johner=
icson.me> wrote:
> > > >
> > > > (Note: This is an interface more than implementation question ---
> > > > apologies in advanced if this is not the right place to ask. I
> > > > originally sent this message to [0] about the IETF internet draft
> > > > [1], but then I realized that is just an alias for the draft
> > > > authors, and not a public mailing list, so I figured this would =
be
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
> > > > I see that the SCTP socket interface has sctp_peeloff [2] for th=
is
> > > > purpose. Could something similar be included in this
> > > > specification?
>=20
> > > Hi, John,
> > >
> > > That is a bit different. In SCTP, sctp_peeloff() detaches an
> > > association/connection from a one-to-many socket and returns it as=
 a
> > > new socket. It does not peel off a stream. Stream send/receive
> > > operations in SCTP are actually quite similar to how QUIC handles
> > > streams in the proposed QUIC socket API.
>=20
> OK fair enough. sctp_peeloff() was the closest prior art I could find,
> but I don't know much about SCTP. Rest assured, I did have the QUIC
> semantics in mind. E.g. closing one of these QUIC per-stream peeled off
> sockets should close just the stream in question, not the entire
> connection.
>=20
> > > For QUIC, supporting 'stream peeloff' might mean creating a new
> > > socket type that carries a stream ID and maps its sendmsg/recvmsg =
to
> > > the 'parent' QUIC socket.
>=20
> Yes, exactly.
>=20
> > > But there are details to sort out, like whether the 'parent-child
> > > relationship' should be maintained.
>=20
> What do you mean by this? I assume the answer is that it should be
> maintained? e.g. if the connection is closed, then any child per-stream
> sockets are also invalidated and must be closed.
>=20
> > > We also need to consider whether this is worth implementing in the
> > > kernel, or if a  similar API could be provided in libquic.
>=20
> So this is sort of the crux of my argument. If it is in userland, then
> any application that wants to act per-stream needs to know about QUIC.
> But if it is in kernel, just a a tiny bit of QUIC-aware glue code is to
> plug together QUIC-agnostic software, by passing stream sockets to that
> software. (You could do it by passing pipes and a little userland
> man-in-the-middle using *quic_sendmsg and quic_recvmsg*, of course, but
> those extra context switches and copies are rather lousy.)
>=20
> For what it's worth, I would go further in fact and say that this
> "stream peeloff" system call should not just be supported by QUIC, too.
> It is very nice today how many code can be agnostic to TCP vs unix
> domain sockets, for example. I would ideally want the same thing to be
> true with QUIC too, via an "extended unix domain socket" that would
> replicate the QUIC state machine(s) just as regular unix domain sockets
> replicate the TCP state machine.
>=20
> I bring up such an "extended unix domain socket" not to indulge in sco=
pe
> creep, but just to point out that a good litmus test for a new socket
> interface is that multiple domains could meaningfully support it, and
> that litmus test is met in this case.
>=20
> Cheers,
>=20
> John
