Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E72153E7
	for <quic@lists.linux.dev>; Wed, 10 Sep 2025 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757537430; cv=none; b=jCkOggK7WpKqqPyOw993Yb3cNDTnpzgXYMth8sSBqoGdAEiIZoaZvvEoSDdGQSIJVOCR4JAkgBUAEWRojs7P9tzNRtg/dpXHb4vqNSCCQuda9VSe5n9+Lj7jwCEBuQKByViNIYwHl7/POgrLSyZNjx9cNh8RtmmuKaiUOEiNhqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757537430; c=relaxed/simple;
	bh=vTq4lHfHj++v+a21dBS0hHklW0pogqfk3rKMcJvHRXA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TWRqyxCRRjuwF+uA9GmrY+UjvlCRetaNs6t/Rl3u6vCjbtUNmeLzazg6Rx/bzIvfQiRWydMHBLbMxAQOOGZwK3O9mGjo/9LMcNHkGoRV9/7jfwn9eTZZ1IaKb4QV9aSfFcbJNpB46V9zSWQsA2q6WBkOIr1uaaxXYW8yGum3tbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=johnericson.me; spf=pass smtp.mailfrom=johnericson.me; dkim=pass (2048-bit key) header.d=johnericson.me header.i=@johnericson.me header.b=mjEPCwoX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MRfe1yO4; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=johnericson.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johnericson.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=johnericson.me header.i=@johnericson.me header.b="mjEPCwoX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MRfe1yO4"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 362177A0186;
	Wed, 10 Sep 2025 16:50:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-11.internal (MEProxy); Wed, 10 Sep 2025 16:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnericson.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1757537426; x=1757623826; bh=XAUxZ2VPGjQjv7spiQATmBdcayuP1dBD
	x+cwHTFlFB0=; b=mjEPCwoXAhP+gsE5a9bBkaHjWWS98udjTIHFdrh8JiNH4ZjM
	/GD1yYijqdCFQk8/CixLJJR1JjlqOjw1nw6cnuLptha5WX09arEVolH7QqdVfErC
	9apzgQl9oOZgxiksEAb+QWWOwB1IwZZlFpkh5C62X8h5rZVFiemVVlxQWm3hDX7c
	HhAMbqch7C8244XhvY93e5XlTHuV/y1eR1mOLfK8Gd6ubuAsGkyAVAHPFQ5H5Ira
	B3Ioa1re5R+ZfjSyNMvuMisvg4Dk7vjmywn5pkmr3PwCM+YTo9iT8LR5+7SYnNzf
	dyAQNDPyeIqq7iRHRIMDXLSDh11b8D6ZRV5/Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757537426; x=
	1757623826; bh=XAUxZ2VPGjQjv7spiQATmBdcayuP1dBDx+cwHTFlFB0=; b=M
	Rfe1yO4nwUKwpgQ51RurCcZoqCmlgUbOpWYAqE9DOLOM4evGtG66bU4hV0F1KUv/
	JdlsrCEmcmY3/Ol9GPJKLe8mmA6UPBePctg5wJidN7FFbJjy1kPBpoaNo3dJNYvQ
	8GVlE6oNRW+HepBtKKmjy6ykrgZqyWb8gY1Z3kNhtUKiY7Rz4hhuqQm1jhY3P03b
	sG38As4czK+0/rQP3u1AH1iUsYljsDsEt6J2userohij3G9dKQtQBD+eyHa01qAN
	6k1zfpMkTP1ulOpomynG/cx595XlPNj9O2YbXZXX7eVkRirQZ20umB3kh7uQtXRk
	SAcyVzbphJJaz4ZkC7Vlw==
X-ME-Sender: <xms:keTBaLoNmoI5QF9WY0KWRusEbtLoSq-_Dge28IKjHXEGoTzF9l6MDw>
    <xme:keTBaFoQWz-FGcPr-7VsAAohHDHTvjLzb845Xd_vhFJmN9a42CY6wHJryKcxKeWUe
    Ciiol_Xq-AA6sElIog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflohhhnhcu
    gfhrihgtshhonhdfuceomhgrihhlsehjohhhnhgvrhhitghsohhnrdhmvgeqnecuggftrf
    grthhtvghrnhepudehvdekffektefgtdffhfelhfdttedvhfeihfekgeeivedvgfeikeff
    ledugffgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilhesjhhohhhnvghrihgtshho
    nhdrmhgvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehluhgtihgvnhdrgihinhesghhmrghilhdrtghomhdprhgtphhtthhopegurhgrfhht
    qdhlgihinhdqqhhuihgtqdhsohgtkhgvthdqrghpihhssehivghtfhdrohhrghdprhgtph
    htthhopehquhhitgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmsghu
    hhhlsehruhhsshgvlhdruhgsvghrshhprggtvgdruggvpdhrtghpthhtohepmhgvthiivg
    esshgrmhgsrgdrohhrgh
X-ME-Proxy: <xmx:keTBaGO7YANBttv7V8tFQruAmAWCnNdmNdFiNeHTCg_IAnVBzZWL_g>
    <xmx:keTBaC4DCEhhLKVfEZNm5f2ex5HnfjSLTVjdqUncxP4a9uiBite0UA>
    <xmx:keTBaPnvHagCE1Jy3puuchizSJ6IJLuz63KsLNz7REozu_QFbbj_hQ>
    <xmx:keTBaLQ9qOpMvfxQPBaLB5BfC8LqFma6NHjjKJ5H62eaflGnDaiSXw>
    <xmx:kuTBaAPUvwVVUR3i7wsj06qPYW_ZWGx5keJ4NpViTKHKKPMGIbkR22Vc>
Feedback-ID: ieb4144f1:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7F018700069; Wed, 10 Sep 2025 16:50:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ApCvOd3xOdeN
Date: Wed, 10 Sep 2025 16:50:02 -0400
From: "John Ericson" <mail@johnericson.me>
To: "Xin Long" <lucien.xin@gmail.com>
Cc: quic@lists.linux.dev, mbuhl@russel.uberspace.de,
 "Stefan Metzmacher" <metze@samba.org>, draft-lxin-quic-socket-apis@ietf.org
Message-Id: <2c235f76-9e69-4ed0-8978-8e71198ad2b0@app.fastmail.com>
In-Reply-To: 
 <CADvbK_fGu11GwR1eoxBsCF8HSnOGf9L_0fZwWX6XQNaZzFOk-Q@mail.gmail.com>
References: <cover.1755525878.git.lucien.xin@gmail.com>
 <cb74facd-aa28-4c9d-b05f-84be3a135b20@app.fastmail.com>
 <CADvbK_f4v916nbx4t0fnkCj44S-buTytj_Paurd3j3Ro2tLDsQ@mail.gmail.com>
 <CADvbK_e9sNbvHSCNuvetOCFY5OQPG99tmZLW=odcRzcN9xK8rQ@mail.gmail.com>
 <c5d598ac-1bb0-47db-a90d-39d475f02bfe@app.fastmail.com>
 <9d4a3c5f-8b4b-4057-b550-e9158cbbc8bf@app.fastmail.com>
 <CADvbK_fGu11GwR1eoxBsCF8HSnOGf9L_0fZwWX6XQNaZzFOk-Q@mail.gmail.com>
Subject: Re: Separate sockets for separate connections
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(Sorry for not responding to this sooner, I was attending NixCon 2025)

On Fri, Aug 29, 2025, at 8:42 PM, Xin Long wrote:
>=20
> I wrote some code to explore this:
> https://github.com/lxin/quic/pull/53
>=20
> - A stream can be peeled off from a parent/connection socket using
>   getsockopt(QUIC_SOCKOPT_STREAM_PEELOFF) with a stream_id, similar to
>   SCTP's connection peeloff.
>=20
> - For stream sockets, in addition to send(), recv(), and close(), supp=
ort
>   for poll() and shutdown() is also implemented. Note that close() and
>   shutdown() send a FIN on the sending side, issue a STOP_SENDING on t=
he
>   receiving side, or both for bidirectional streams, as applicable.
>=20
> There's also a sample test:
> https://github.com/lxin/quic/blob/stream-peeloff/tests/peeloff_test.c
>=20
> - Sender: Opens a stream with getsockopt(QUIC_SOCKOPT_STREAM_OPEN), pe=
els
>   it off with getsockopt(QUIC_SOCKOPT_STREAM_PEELOFF), and sends data =
via
>   the new file descriptor.
>=20
> - Receiver: Detects stream creation through a QUIC_EVENT_STREAM_UPDATE
>   event, peels off the stream with getsockopt(QUIC_SOCKOPT_STREAM_PEEL=
OFF),
>   and receives data via the new file descriptor.

Fantastic! Thank you for investigating this; I really appreciate it.

> Please check out the stream socket interfaces in the PR above and comm=
ent
> on anything that you think could be improved.

Gladly! I looked at the linked PR and left some comment now, but they ar=
e only "mild questions". The basic design here looks like exactly like w=
hat I was hoping for. Hooray!

> I aimed to make a peeled-off stream socket fully independent to keep t=
he
> design simple. However, since the connection socket may close at any t=
ime,
> the stream socket must hold a reference to it. To keep the relationship
> strictly one-way, the connection socket remains unaware of any peeled-=
off
> stream sockets.

That makes sense to me. Maybe someday someone will want "please close co=
nnection when the last stream socket is closed", but that can come later=
. (If I understand what `sock_hold` is doing with ref counts correctly, =
I'd hope that would be possible without any bidirectional references.)

> Right, providing it in libquic won't work for kernel consumers.

Just to be clear, I was thinking of one user-land process sending the st=
ream socket to another. But yes, kernel consumer would face the exact sa=
me issues as other userspace processes without this.

> > For what it's worth, I would go further in fact and say that this
> > "stream peeloff" system call should not just be supported by QUIC, t=
oo.
> > It is very nice today how many code can be agnostic to TCP vs unix
> > domain sockets, for example. I would ideally want the same thing to =
be
> > true with QUIC too, via an "extended unix domain socket" that would
> > replicate the QUIC state machine(s) just as regular unix domain sock=
ets
> > replicate the TCP state machine.
> >
> > I bring up such an "extended unix domain socket" not to indulge in s=
cope
> > creep, but just to point out that a good litmus test for a new socket
> > interface is that multiple domains could meaningfully support it, and
> > that litmus test is met in this case.
> >
> That=E2=80=99s a good point.

Glad you like it! I had been thinking abstractly at that point. But putt=
ing on my hat as a Nix developer, yes=20

> I originally based the QUIC stream API on SCTP=E2=80=99s model, but it=
 now seems that
> most real-world use cases are closer to applications that traditionally
> relied on TCP rather than SCTP.

I don't really know enough about who is using SCTP to know for sure, but=
 yes I think that it is right :).

Cheers,

John
