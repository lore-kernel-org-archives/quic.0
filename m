Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A43537EE
	for <quic@lists.linux.dev>; Fri, 12 Jun 2026 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293437; cv=pass; b=XKQsXvSL5N26NyZ4T4cbvrAY3GSOiEJUPA3GQEzQw5acvsM0XM0utgcCOURGaqTzUuayTkY0f9cP93s8TLGaaIeHgpsBnqpRq/aObioHb+UGtW/UQnCVwp+XKvi5h0OAs8zN+Xwap8KpEq+02fFlianJzy7K+l5iTjnCC1Iw0T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293437; c=relaxed/simple;
	bh=0MIzScJKL1xXmPrlbYULoUIxKe1BsiEaaVgILh54qWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fo85Lbp/p2sI4ywB72LM/yuTvpfHwproCGKaQ1idNbcepfN9WYFoB6aF/M5rbtsKTkAbmByyJ10yNpX6/og7hVYHCTaAjh64CRHMmdoWKYDO55pGXcowp6Z5mjETp9flDj8UsSkLNyUps61ezXMdngfAS21dOYuu/CSUKdyaDDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfSurQj8; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfSurQj8"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842848fd613so1401097b3a.3
        for <quic@lists.linux.dev>; Fri, 12 Jun 2026 12:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781293436; cv=none;
        d=google.com; s=arc-20240605;
        b=ErzU9C8FPa93MC2P/pp5DKBzU7Fk1cuyO8HibQhmNqmEioXgGkIEuA3atVao7zTzr3
         5ykzIRLQDUXbuhXRTFhemRvW5vrIIfybckFYFWhR8UZ2wUNjazyHvhtSDIyNRjmDGJ63
         QG3yPzk7PrCX6T9saYf4IUCWtpXhGMH4PrqfkkAG0vyYa1Q/umIDwud+Tfh3CtBzc78v
         V+tMYIVM0PsCswK5Fb/EhuaeW0PPMCtuDoXglcYJLjYL5C0GjioZtFKxo7hrcmMBuIlb
         3g6BrCwRS2DlPQucVY/YqXmjQf2KMx5LZZDDQ/wmq797VjbyTMkCmIxRfMsjE1yRAJVj
         0lqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0MIzScJKL1xXmPrlbYULoUIxKe1BsiEaaVgILh54qWo=;
        fh=b/8BSdvsf4bF/lZ4EK67vhbSxemUyMwXXLbDNIPQps0=;
        b=DYmzek4ZtmH7mglJQZ972R1AGK/qxu0PeZpRTnHdKKKbv4fq5JdqhsTWXSUa61Pbr2
         mUWNfbCY1dXDxywbIp42C3sgcyy/yhLUO7nZJdzBQE/Fj+SiiNogn5JegDLdzn6gP8hl
         3BckXgLJj+UGA02UDwuzAbnsNF1FB6JSLrv61OBhjl1jqimbfPCBKmUv2TI3+DBEtIlq
         G9qrj0JrcIKcsN+2sA4LaqRhabrP1fXEMtE+K9fbLBEnpVgBjHRaW6DAuZpf2zHlBZXt
         OibgKkqkBbnFobuhDn0fl7ciTW7tid7PDDzSAhwuWLr04sAh9fdj2JdLp6j4+c53htdf
         cDxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781293436; x=1781898236; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0MIzScJKL1xXmPrlbYULoUIxKe1BsiEaaVgILh54qWo=;
        b=LfSurQj8iw0ulrY5pkO6UEqO6mtOciGWrOczqksYLiRai1Y7QHWPGMiU2M1ZUI3psF
         oqAALAjxRDiSZ6JMqsbk2yuADR9mNW4mCQzYLAynmmH9lGHHC5qtLgQOHJQr6508w4pH
         nC6dYE7BAO9J5cv+3Bz8xLA60HrXwyrXjl/Eiw3ghI4QTyNCPTBxSHxFk3XzZerKHG2C
         /6ob57UDN+lyffzQsQZTGKXkxaWhSllI02J8Nc+VND6/SuCy0OJguwpUfzTTZncunAh4
         woP0CsJ0IlFqe5JO64eT9CGVhGkHc80h0LMTddjWvJzBzSUedxPGY2m3eNcvrQhnpNsV
         fPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293436; x=1781898236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MIzScJKL1xXmPrlbYULoUIxKe1BsiEaaVgILh54qWo=;
        b=LoCuSUWTOkjZdN3FLIiKbbgDcrneRJMOPYJAqH96VFn7T2oxbEjRFGu14kyBGE7KiO
         +v/LKFRjcn2vzThELFwarR10MFdDFmWTb2sbY94upG7Y1vPZ5gdxjcRy/MHOT/nxqd1d
         uqWtJd+2zP5KaOpeTL1itsZtIHHbQ1WzUDAXg2w2KX+t6qghqL4EwUNBNv2X/ewcmBj7
         gnR8DItkv8PWXtfbt7FWOL0LocFsWBBQJpTcEN6IoeFO2uAAN5B+YMjKoAPsLlLDw0gJ
         hiWq62ugThZ+PxdD1VMXlk20KwKYNLz/jr/ugFhuFSC4V7yPeLIZIUmHjnjZXAjsI3mY
         uyvA==
X-Forwarded-Encrypted: i=1; AFNElJ8ccHcn6GZq0VVEqpIXQW8L7mhZ1sdNNeyMYoSKRFixdQ9zQ312I8jKxL+xT3QYoXzu4xSP@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5k/AQd+gMsCejrhOt1CSGzJggHTOzdzQR/1JPbCb9HXK9l/yp
	kNTpSiOlK7eo9rF9HWCbI+lv/DsYTx2U1ln5ssUU0jLItOCtH9OaOKl+luscIgPnjiu62ahXjwK
	0Tcdd9DtJdPltvmjOfKrpmT747O47e8E=
X-Gm-Gg: Acq92OFrGym8LG3Nqs0IWNi4g9FvcEIQ1EQznUNcud7Y27+ctONmWQwopHsI6krgopZ
	EB9E96VxKzuidvUKv4ggrqqPZL4Ey7F32cjrqk/UYi3NzaVCWcy31lSK2iTDNRtx7vK2Om5OO1A
	CijP3Tqb6F8hl8qNZHE92wmS3okMaYwLcDRiheGEW21go+32AE4XEpQN4Ziprva0qLkEOABBVUi
	gqRJUHmmk/ex7eHAyGDoi6Dxcdiaek7n23UgU4qaKxvYirWMnGVcCz+YEsmvSWi0Yel/+HPNCVN
	ojmyLbMEzex6+DguLUtuy3RpYeGQzMtfZozWhuYRrkwjzxTKZgXzUtn/6+T8aLdICh+OVhAon9K
	0asuWig==
X-Received: by 2002:a05:6a00:4146:b0:82f:1b1b:e166 with SMTP id
 d2e1a72fcca58-8434d0aeb79mr6315498b3a.33.1781293435882; Fri, 12 Jun 2026
 12:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780855296.git.lucien.xin@gmail.com> <1b5480358209643e574188ccba83bc9ef0a84aee.1780855297.git.lucien.xin@gmail.com>
In-Reply-To: <1b5480358209643e574188ccba83bc9ef0a84aee.1780855297.git.lucien.xin@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 15:43:44 -0400
X-Gm-Features: AVVi8CcosIZ2HodYXSoI2GurOTwt4JyXnbbeTIrOgwh_78ZtgEuE0FazxT7w2bQ
Message-ID: <CADvbK_cvO+EGvbzySPQc4DvN7GM-94gFZK+_pXMSkj8b9--DDA@mail.gmail.com>
Subject: Re: [PATCH net-next v13 06/15] quic: add stream management
To: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"

[sashiko-claude]

> +/* Get or create a send or recv stream by ID. Requires sock lock held. */
> +struct quic_stream *quic_stream_get(struct quic_stream_table *streams,
> + s64 stream_id, u32 flags, bool is_serv,
> + bool send)
> +{
> + struct quic_stream *stream;
> +
> + if (!quic_stream_id_valid(stream_id, is_serv, send))
> + return ERR_PTR(-EINVAL);
> +
> + stream = quic_stream_find(streams, stream_id);
> + if (stream)
> + return stream;
> +
> + if (!send && quic_stream_id_local(stream_id, is_serv)) {
> + if (quic_stream_id_closed(streams, stream_id, !send))
> + return ERR_PTR(-ENOSTR);
> + return ERR_PTR(-EINVAL);
> + }
The recv path here rejects stream IDs whose initiator does not match the
caller's role (a server cannot accept a SERVER_BIDI on the recv path
without it being closed/already-open). Should the send path have the
symmetric guard for peer-initiated bidi stream IDs?
Walking through quic_stream_get() with is_serv=true, send=true,
stream_id=4 (CLIENT_BIDI), flags=MSG_QUIC_STREAM_NEW:
- quic_stream_id_valid(4, true, true) only rejects CLIENT_UNI on the
server send path, so CLIENT_BIDI passes.
- The !send && local block is skipped because send is true.
- quic_stream_id_closed() compares 4 < next_bidi_stream_id (initially
SERVER_BIDI = 1) and returns false.
- quic_stream_id_exceeds() can pass when the peer's max_streams_bidi
is non-trivial.
Control then reaches quic_stream_create():
> + stream_id = limits->next_bidi_stream_id;
> + if (quic_stream_id_uni(max_stream_id))
> + stream_id = limits->next_uni_stream_id;
For a non-uni max_stream_id, stream_id is initialised from
streams->send.next_bidi_stream_id (SERVER_BIDI = 1), so the loop creates
a stream with id=1 instead of the requested id=4, increments
streams->send.streams_bidi as if locally initiated, and advances
streams->send.next_bidi_stream_id past 4.


This is a good catch, will add quic_stream_id_local() for send.

Thanks.
