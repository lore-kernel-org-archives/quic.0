Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0D726F291
	for <quic@lists.linux.dev>; Tue, 23 Sep 2025 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643616; cv=none; b=uNnqpqlkpCQMJPB1reA/23Lmd6W7pV7Mbx0IUubSF9iIWmjw/yPGqkTfi0ksanfRS/jkFA1uim6xpRAB+I5NpjNHWx64SQd1lEkydoMS4tqqRjg9fe9tnrxBDwfnKf9aXjcGU4JDZHtvIIuYZ58VPBjr0BVtwMt/iA8q5coHgKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643616; c=relaxed/simple;
	bh=LSZaSxvgiNpblG6l7iGMnvMkhnGQyUdC6rYhgCCt/B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqgxFCwqLI8I7+CJCTWoyEHNs3kqnuD+yOJQntlqMI0e7lktRV7/zs22UsiqLCWYfE2P+zHwPrNdq+Um/ejGyZu72pPX8HqQ94Ln8+/XUpUc6Nq5gWLS2wckG5F7z/k3oR/m451AWA2tNhNFiD+1DBCH3oiXjnD5CPlVbzxxRGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzWEk7e6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzWEk7e6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-273a0aeed57so265125ad.1
        for <quic@lists.linux.dev>; Tue, 23 Sep 2025 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758643614; x=1759248414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfZwWS5AXjSjh47+jujhHs0PNbVVMWVBOW1GeBhi9ZA=;
        b=EzWEk7e6OpbmiW63Mblj31jlOYZQ8lyGo4I5efrvwQpiciYh/Abl+TKkPcZEv3QKJT
         izlxzoh4AFinAC3/sR8xHaGVCOX6EPc6JX8WZlOoVJY4PTCoxHOQ9md1AOQPFxGL5s5W
         9XPrbdI/HegWJLOyWSx5KiffW5s/iXfLYX1eYQTT+3GJcFH7ErXTdP2GDFOmn5oZqGlb
         E+OKxwYJcViQEHPSZUyigLJ9+rIFxTDYnj9Ey6uE/3AwOBKbycKAGwMubkHjmEy/tQ8I
         e4CpCV3410dgWgkp8veSzYid946ACJ3qH+UB1jqITfZnhZelSQGvKbJG3zdX9SVFqv1M
         srfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758643614; x=1759248414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfZwWS5AXjSjh47+jujhHs0PNbVVMWVBOW1GeBhi9ZA=;
        b=fIPvFj2YA9miZ0cdsYhljCf85TXnO9IEZ2BBTn1OzFOV3a7M9gSVzoWdYo8796rtRh
         dUGgGjv9XbFywOiutOMI8CO+D+4jLyuY/dTqG3kz4XF9vhOIci/3/zLfjsDTG3FS3L1p
         NQY0aRe1VL2tKMDpdkBI2e0bkUF02sE/LBN1VT4JT9Mw7JDZnO76t53JNNG30eXUx6m5
         8XIX/0ct3k2dbkGq+UK1RMs0wQgp5y3ycf+EP2VyfkPDUYS5y3U4F+eLt4Sleig5Q2B1
         BCsQsokM7ij3mfH+rzHtT0zaSuKQq01f8WCvB+9vdi4AZmG0w3nZytxq0qqD2EufjhIq
         6D+w==
X-Forwarded-Encrypted: i=1; AJvYcCXEsF6kx3Eg/HWT0JAIk7p+Lgp3D4AHOTACCS9RiTZE92xDYO4tTCWlFuV9sPRmMeFa64zJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxjM0tLqpmffPSbZ4dXpc14aJH52iZVOssOV2ZG1XjL03uJk9nM
	I65fYXrjy1Kk17Fm24Y98xhnTXqwqrRzRTY8wRqsaLsUUJ6UF++0AQiQICpx5wnmPi+wc7zmvI4
	4oat+8O8q1grkA8243pRVT1QGpbg2sB0=
X-Gm-Gg: ASbGncvrN8JyS7ZduF0YVMi58exEilkoXG3WXDBFm4HBEm0FZ9vhZAGXFucwLCpT8/0
	moWYRoQ+75gH1hdCNs35IkiHIxklpBkusePkqxsz1fbd9N6lpCnUE6PR1tD/7NWaqO3xvS0X5SQ
	2P4KUjpaL5iMuplDNuPLe6pHh+bP0CEGoZrVtgwK++Ko+Ajvl80FCip4ALh9eV6M5oja7IESUJQ
	h7ju2Dt5PqRu1BBKUyaNpdpQGmEgzCjfNupPtkMVw==
X-Google-Smtp-Source: AGHT+IElrnbiPc11xcIlgx/7eLp17j7KN5c1/0biJ0i/uJUb0MwRHW0VDJc6A4N7uhdDkUSkX1wG1aPAZnUI5GY+570=
X-Received: by 2002:a17:903:2447:b0:266:3f63:3500 with SMTP id
 d9443c01a7336-27cd7a31339mr34522615ad.12.1758643613364; Tue, 23 Sep 2025
 09:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758234904.git.lucien.xin@gmail.com> <a7fb75136c7c2e51b7081d3bff421e01b435288f.1758234904.git.lucien.xin@gmail.com>
 <871ed254-c3d8-49aa-9aac-eeb72e82f55d@redhat.com>
In-Reply-To: <871ed254-c3d8-49aa-9aac-eeb72e82f55d@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 12:06:41 -0400
X-Gm-Features: AS18NWD1Po0NumxImO775C_7VSP655cJIPbmA0dWx2wuT8JxABkrL-E_ndi5lAw
Message-ID: <CADvbK_e20TrcgprXmnZzvoEO6yzoo4Zx7B0qFS0kQPT8Sf63LQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 03/15] quic: provide common utilities and data structures
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 7:21=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/19/25 12:34 AM, Xin Long wrote:
> > This patch provides foundational data structures and utilities used
> > throughout the QUIC stack.
> >
> > It introduces packet header types, connection ID support, and address
> > handling. Hash tables are added to manage socket lookup and connection
> > ID mapping.
> >
> > A flexible binary data type is provided, along with helpers for parsing=
,
> > matching, and memory management. Helpers for encoding and decoding
> > transport parameters and frames are also included.
> >
> > Signed-off-by: Xin Long <lucien.xin@gmail.com>
> > ---
> > v3:
> >   - Rework hashtables: split into two types and size them based on
> >     totalram_pages(), similar to SCTP (reported by Paolo).
> >   - struct quic_shash_table: use rwlock instead of spinlock.
>
> Why? rwlock usage should be avoided in networking (as it's unfair, see
> the many refactors replacing rwlock with rcu/plain spinlock)
Interesting, I thought rwlock works better than spinlock in this case.
I will change back to spinlock.

>
> [...]
> > +
> > +static int quic_uhash_table_init(struct quic_uhash_table *ht, u32 max_=
size, int order)
> > +{
> > +     int i, max_order, size;
> > +
> > +     /* Same sizing logic as in quic_shash_table_init(). */
> > +     max_order =3D get_order(max_size * sizeof(struct quic_uhash_head)=
);
> > +     order =3D min(order, max_order);
> > +     do {
> > +             ht->hash =3D (struct quic_uhash_head *)
> > +                     __get_free_pages(GFP_KERNEL | __GFP_NOWARN, order=
);
> > +     } while (!ht->hash && --order > 0);
>
> You can avoid a little complexity, and see more consistent behaviour,
> using plain vmalloc() or alloc_large_system_hash() with no fallback.
>
I wanted to use alloc_large_system_hash(), but the memory allocated
by it is usually NOT meant to be freed at runtime. I don't see a free_
function to do it either.

If QUIC works as a kernel module, what should I do with this memory
in module_exit()?

>
> > +/* rfc9000#section-a.3: DecodePacketNumber()
> > + *
> > + * Reconstructs the full packet number from a truncated one.
> > + */
> > +s64 quic_get_num(s64 max_pkt_num, s64 pkt_num, u32 n)
> > +{
> > +     s64 expected =3D max_pkt_num + 1;
> > +     s64 win =3D BIT_ULL(n * 8);
> > +     s64 hwin =3D win / 2;
> > +     s64 mask =3D win - 1;
> > +     s64 cand;
> > +
> > +     cand =3D (expected & ~mask) | pkt_num;
> > +     if (cand <=3D expected - hwin && cand < (1ULL << 62) - win)
> > +             return cand + win;
> > +     if (cand > expected + hwin && cand >=3D win)
> > +             return cand - win;
> > +     return cand;
>
> The above is a bit obscure to me; replacing magic nubers (62) with macro
> could help. Some more comments also would do.
>
The code is exactly from the commented doc:
/* rfc9000#section-a.3: DecodePacketNumber()

See:
https://datatracker.ietf.org/doc/html/rfc9000#section-a.3

I will bring some comments from there.

Thanks.
