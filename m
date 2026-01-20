Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251724418D5
	for <quic@lists.linux.dev>; Tue, 20 Jan 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921112; cv=pass; b=aff2rQDh+tKf0a2oTdunbqb7Xr6un3L8N5alyTAdOhzykUxcG23otwMoaMAonf7C/6g7YnuW8qI7kAHziTffbqchSpPPut6SNrbcVoXJa/nwnt8QeZ+lcBf5mBBssw237hXIz9WjV476ma5fHnV5J5yqqetLkpbrwf6WH2Qpd2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921112; c=relaxed/simple;
	bh=AV9hAIQr5RzI8gRTr0Om3D11rvB2xShikwoc1m16OHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWBReB89mXXxYxIC5l18qRgaA12q3evSw/5oQYwmSpkPysiO99uYRaP91NIenxH6EC18PLbpfpoA/WCkRCrMEyWVuHzdr5ndNyyCiextePE+SEkoP30/a4Roumu9QZHgv/pmmDqXcI3G4ZSh/hsT5U5sbo3tMYZgI9nTnaV1mXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJLGfqPX; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJLGfqPX"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so2623823b3a.2
        for <quic@lists.linux.dev>; Tue, 20 Jan 2026 06:58:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768921110; cv=none;
        d=google.com; s=arc-20240605;
        b=WQTc4IZAsmGT7RpEPAFwSQDBUEWa8yTvZtg53K3/tM6C9knpULUcTe1sxuX5cBsDSS
         TcsET3np8Q5bRzIB/nHGA0Piv8K4rhjlRqkYmYFBwkaD+RlWledronDoeHTeuM3LJ5CT
         lrk4GX5RjSuC0WqcoIx3jkKZKi8gQDZ4J2/WXF517572Ax7AvWfvNoUqjWzYjZfbUeWm
         SChA0cpb2F3fj2Dw+WgkPXoXGDKKGVDwJ99z8gFfKsnLVhKqmXYUac6Pm1vDmtdl3ZrL
         8bABoYaALR2yaDDSESNvwmm+cjnsZAjkdQf3QHRUbBKQvaigeYl1lxjmixnLtXf/bph8
         1OWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EUfRwMQV3KapT7k/eehULUSMHqVaGxUA4eRrbnoBX9U=;
        fh=5C7x8bgPfjtcjfLiMRInM9ogo0CbaNE24+ukM324wxQ=;
        b=JVZZKt+r7wnKtv1CN/VLe0l5iakgNiyBVNxP8h2pOUnFJYuMwt6uACVZkCVzHUk25f
         qwlX93DpvQ2RxJw9AaptxHW3soLVdntaW2YqxA8EpFCiPCrozdmFm4TYT6q03w6xajYP
         POCPiB6tH8YlcnTUma+HuIqmIj9abfoePmViuqWfLEqQzw1qACoPZpyDv7aEdKf378TY
         qDjXKr1Agqz1FORqVOoVCU7mNKJnu6C2HPRiN2H8l+zZZM2MGcYnSXUfFnxv+7GHwM/D
         TbRLsNNBnnYgb4t4ezfjQ1wWxpZ1Zmo7KfwsP92oSFlfkVGaUyu5jZuFOJoOJMUf/ohJ
         VZ+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921110; x=1769525910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUfRwMQV3KapT7k/eehULUSMHqVaGxUA4eRrbnoBX9U=;
        b=KJLGfqPXbXWgKRJAk0YOWgo8mMixSi0Xw0ehxrXdmoj2/XcJacr8ihlpkALHL2CuJv
         0C8GFClrPL+H6eBR9ZMCe7zT8Mez1vvzyDbtQN3TuKao9B5wTBihU+EjameGH5jp9wJR
         0QOho3wUBpqOC/y/38q4MyqKZ9Lo9q+ihfvOEtmodHN4APC6zNIdhdzOIfpqMi8/kPw7
         qLSZ7nBcH1k7XKkf8JDrUkMvC7CoIkxpCGaP4sXoHYEo2OO6dhy7wbIVqZJ6aGFEX4mM
         LR5eyHeDB1xelDCwqUrSM2kHkbjPs5l1ReCn1v9xWgXecZKeeBDJkjfr6aqweqn34hpH
         KXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921110; x=1769525910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUfRwMQV3KapT7k/eehULUSMHqVaGxUA4eRrbnoBX9U=;
        b=kp+GFpbh3cHsq+Ub6qRm5ZkYnD4eCFyOuLNxhm6+Fk8ZVef3TZCt8VxtCZnqd6cHKi
         XwTB5hBBRa8mZ7V9fZWOHsp9pTTx72mSZRDVW3LciXRlcF+sisPN/bJZl7BS9/XG1exc
         69s5vlyHFYjbRO+b2RnEBMvgk9WhVLQ6EO135wZb75461pFolsXfAZ/166MVz0/p2/B2
         U2H4FztxRNXCucVF9vLvbuYQ82d0+trvlpqOwGPNzeKyweFU2VUtvVcOEXnE31VunqE9
         KI8GD5lD9YnYhjTsVzkAoPx0BPuTaWRyWWTMNTK2kT40n6F0UduSikYOwtN67EJ6LL5p
         cGXA==
X-Forwarded-Encrypted: i=1; AJvYcCUIqbqpqKgsVUz8iM9TIOQLN1N3yBAAmcx75yFoRd98pgw8sAeGhNRwOfmhzy9uk9zxSlyv@lists.linux.dev
X-Gm-Message-State: AOJu0YymXNFmncjdYOh1t5wlypD+Nc9R3RETBXBsDI509d5x8dQuD1fz
	+ujHyP5rFr++6qBBMOqe8Vc3kBRYhTXCdA+/rL+Y6+57/UAxWLomDrxaz3UsokGzk4/I5TEljzb
	jLX7mkNXGPNnsVkujtW3QiPwWFG69e4g=
X-Gm-Gg: AY/fxX5grVzI1ktJs4cleVbY8o8PN0UjMcFkaZfPUfgwWmnoWFyiQtUUkmDcxYMieaS
	EuatEwWzFvQ5eiPsl2poX07eNXzRjMeMDZ+r3S/w628GLE/tg3ZrRB2+lT72HRIPJJ4Ty03DZT4
	RSWBhdQ3Dh0Kyv0EivISah+RAQlNO8uhJdxJGQMkHY1k/N3n4WVudcsmrE/TzQwa/5Yj979pfkJ
	hwtxxMb+/KeEAWUeZUUaDUtfMdTYnJPbwtD2tmUc42rJKQ5V8eLFAu3wZbuDAcePxcJaDWFk5M8
	iwWsfHOswwc3VLKJkpGGX87REG73Q8BjgCYS1E0=
X-Received: by 2002:a05:6a21:692:b0:38d:f0f3:b940 with SMTP id
 adf61e73a8af0-38e00d47b68mr13733048637.57.1768921110331; Tue, 20 Jan 2026
 06:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768489876.git.lucien.xin@gmail.com> <e3f770ef8d9aba101e1f5dc2f2f72bb0d2a30b94.1768489876.git.lucien.xin@gmail.com>
 <6c6d5644-3354-46ba-bbc9-e76789648abf@redhat.com>
In-Reply-To: <6c6d5644-3354-46ba-bbc9-e76789648abf@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Jan 2026 09:58:18 -0500
X-Gm-Features: AZwV_Qg7dfPxOkDkqOzOQW_7YKwWAViU6i2Li95CyFWjfHPIuFun67eybDn2Dd4
Message-ID: <CADvbK_dh-O9NuNE4XL2ic2WUy9ysWc1NzbsJ99kv0ZciAw7ttQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 06/16] quic: add stream management
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 7:32=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/15/26 4:11 PM, Xin Long wrote:
> > +struct quic_stream {
> > +     struct hlist_node node;
> > +     s64 id;                         /* Stream ID as defined in RFC 90=
00 Section 2.1 */
> > +     struct {
> > +             /* Sending-side stream level flow control */
> > +             u64 last_max_bytes;     /* Maximum send offset advertised=
 by peer at last update */
> > +             u64 max_bytes;          /* Current maximum offset we are =
allowed to send to */
> > +             u64 bytes;              /* Bytes already sent to peer */
> > +
> > +             u32 errcode;            /* Application error code to send=
 in RESET_STREAM */
> > +             u32 frags;              /* Number of sent STREAM frames n=
ot yet acknowledged */
> > +             u8 state;               /* Send stream state, per rfc9000=
#section-3.1 */
> > +
> > +             u8 data_blocked:1;      /* True if flow control blocks se=
nding more data */
> > +             u8 done:1;              /* True if application indicated =
end of stream (FIN sent) */
>
> Minor nit: AFAICS with the current struct layout the bitfield above does
> not save any space, compared to plain u8 and will lead to worse code.
>
Makes sense, will change to plain u8.

Thanks.
> > +     } send;
> > +     struct {
> > +             /* Receiving-side stream level flow control */
> > +             u64 max_bytes;          /* Maximum offset peer is allowed=
 to send to */
> > +             u64 window;             /* Remaining receive window befor=
e advertise a new limit */
> > +             u64 bytes;              /* Bytes consumed by application =
from the stream */
> > +
> > +             u64 highest;            /* Highest received offset */
> > +             u64 offset;             /* Offset up to which data is in =
buffer or consumed */
> > +             u64 finalsz;            /* Final size of the stream if FI=
N received */
> > +
> > +             u32 frags;              /* Number of received STREAM fram=
es pending reassembly */
> > +             u8 state;               /* Receive stream state, per rfc9=
000#section-3.2 */
> > +
> > +             u8 stop_sent:1;         /* True if STOP_SENDING has been =
sent */
> > +             u8 done:1;              /* True if FIN received and final=
 size validated */
>
> ... same here...
>
> > +     } recv;
> > +};
> > +
> > +struct quic_stream_limits {
> > +     /* Stream limit parameters defined in rfc9000#section-18.2 */
> > +     u64 max_stream_data_bidi_remote;        /* initial_max_stream_dat=
a_bidi_remote */
> > +     u64 max_stream_data_bidi_local;         /* initial_max_stream_dat=
a_bidi_local */
> > +     u64 max_stream_data_uni;                /* initial_max_stream_dat=
a_uni */
> > +     u64 max_streams_bidi;                   /* initial_max_streams_bi=
di */
> > +     u64 max_streams_uni;                    /* initial_max_streams_un=
i */
> > +
> > +     s64 next_bidi_stream_id;        /* Next bidi stream ID to open or=
 accept */
> > +     s64 next_uni_stream_id;         /* Next uni stream ID to open or =
accept */
> > +     s64 max_bidi_stream_id;         /* Highest allowed bidi stream ID=
 */
> > +     s64 max_uni_stream_id;          /* Highest allowed uni stream ID =
*/
> > +     s64 active_stream_id;           /* Most recently opened stream ID=
 */
> > +
> > +     u8 bidi_blocked:1;      /* STREAMS_BLOCKED_BIDI sent, awaiting AC=
K */
> > +     u8 uni_blocked:1;       /* STREAMS_BLOCKED_UNI sent, awaiting ACK=
 */
> > +     u8 bidi_pending:1;      /* MAX_STREAMS_BIDI needs to be sent */
> > +     u8 uni_pending:1;       /* MAX_STREAMS_UNI needs to be sent */
>
> ... and here.
>
> Other than that LGTM. With the bitfield replaced with plain u8 feel free
> to add my
>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>
