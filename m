Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF447369D43
	for <quic@lists.linux.dev>; Fri, 12 Jun 2026 19:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293299; cv=pass; b=BSsZzC1DJ6kUgTzEhJ4fD/hf9RTIagZ2vO7oUtU6+UAyY1nkJISUAYkpKeuS3nVZnHswSfdC4khHNiF3H2VaCbP00/HUbOlKBog5EVdt5SQ90dhD9NY0QTlFFGDzFTKrQMXf2uIFmimR42rxM/G5qBXkEgEKVG9fZvBmxtpHEL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293299; c=relaxed/simple;
	bh=8ZLOGvGFodYhD0qua0VuzQdoTndbnD664tOVgr1qn2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olkpUZABD3/OOO1QYYbvWsGJ9U22t5Z5bmxoPM+RV6YrJn/1aXiPWJ9Tzc/WtmgDaSjjnjZKROKRZtcY1E+9C220dPfqYICG5NkKk4Eg//LUeBHYBiqSUHJsg9RTPqXM9nqPuzrPRDIUthM0z3hTTBaAaQd3IFSlzl/nVGxpLYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWCh3jnq; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWCh3jnq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so1008977b3a.1
        for <quic@lists.linux.dev>; Fri, 12 Jun 2026 12:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781293298; cv=none;
        d=google.com; s=arc-20240605;
        b=Bs4YqPcjNLvSLhA72spD/gNVi9d2STiAl4Wqsdu1uvi9oBhsWBm+lLPHKxmkK2upob
         xCVFjMIOr37jBeJvqXXxxQT6hQxHX6gTyc8hn6nnyvm4P07UpvZWmKBRKqQngSLINE4t
         6nBqfh0xuH+2bQVjBqLf2YdFXxRL9MwfcZcEaoQjUo0q0b8teZyLp3dFWl3ZtizBHzq3
         bWxha0KgTBY8s6TmYOeENlpNTCi7Nj4qQFEjIM+ilLollwT85w6+ePlGl5h8XDsFo/68
         nhl/1wwXlvLZ8hE1pKyxuUFDqSf6ORmBgYVAidy4nFRjJTMwf2SRr+z4ZmAGKquBTa0+
         kVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rbi30ru7gSioJ7/e48J895iPmcFfwsVcpIndfODcrgQ=;
        fh=hQDW3kafaNozBhmpAy2jU14cMulTsmq9EzHcnmWkU7E=;
        b=d/cCflnzOuewQLNgnFzLkH07q8xp7R8xoMHEMITi2UCk+fid9uKwJnbixpbyeszj0q
         RN7GHpWdMbu+s8LCY4B8uLMl5Dk/uaF/4NYlwxN0jY4gJx10SAzlZiKRVOpanDIAiWMG
         Gc+UjIkW8H2Lrt0zOnn/KWpFpjFn8xkT2zsTPgax3xK82wszcMN91yyepIBUB446gD4T
         s2Ib977L2xV2LpFaXlCq8mxxhy13YUx2UAiHB4DHFHOjDNQBfOgY10jItuQFLBeFLzl/
         6hsCQnS2AvBmfBhLI0xH5IJ65gtgWswu3ZfMyvTapvzMXfg+wpfieEQ1m5x4lc2cF2N1
         go3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781293298; x=1781898098; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbi30ru7gSioJ7/e48J895iPmcFfwsVcpIndfODcrgQ=;
        b=JWCh3jnq+zTwsfa6e752v+Q5JnmwsoVUYM77XCTdbgwlC2nGIlRAtgJCS8twUSecAn
         V87l4ICHF08F30iThrDago3in+jRiAZDHrk9bxSk8hsoOhTY6EDfzse6IaeFse4lWLxM
         HxT4DjeKCyVGThPhQvz6TJnODVPsMh9F6ErwEAzfpDijAG+Y0wMHWIALMixGTz3ijICw
         ex3elnbR5WOjYKeRejQkJobEpXmdRptQTf5HOvpn7+zdtpmdW3pEA6YoPupQv+13K3JJ
         yQFw1XQIA2mNra1+iBe3iIcLZOtp2PvURswfL9y4u1Enb5zCZpmI3e5imriLkc0h4k31
         xFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293298; x=1781898098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rbi30ru7gSioJ7/e48J895iPmcFfwsVcpIndfODcrgQ=;
        b=CQHCQI91FTac8JNGGlKyg11paPFq6unpvMXByI/l+6Z4MMMzEG6ESWc0aWUy0OuhyQ
         wZXBQ37P9h9d8k9YTzAHinIVADAbiqhgbI3cuYMHdtrNbSxrfPygjSl5fBGz13mSMuWR
         IqbXAPPLmj8tyVtGOiIvtmo+X+G+0059nklWFomYgW8q9JiSUfU27BLhlsdoVI7EftAB
         Wh/IHltwwPOGYbE4wcl55PNz8UZCR7XMCsbGtI167H38DUfucGxtEiOxABUYtoZoqHHr
         DtQ97rYLNnqb255Twt9rVIhyxtUOlZ1MzhPUpM3Sy/6pY7yNU8bfV0BX2qPW1W/rZ2nL
         OOPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9byq7OQUxuA62yR8H9croTXuEapcBtPinYOgseNrEnBTgAVug5Ynl3e4LGZnQWb5iGXLP5@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3RkCVRpuRnq2c0wP3XJMbIEaR1R4E4k1fQ1kwT7jvsMxxLc04
	TR3bdoYI1hOYmok+Fdsfw/DnAEklSrANh0kkHKmgIuimAZvCFjSTXs09nYCOAQAbd24jPBUAu2r
	aqMiUWN8nLXXtlxGvf68UkCpRkxr3FHk=
X-Gm-Gg: Acq92OGaBqrJ1ya6wDonHMBM9+6iKH0pv4IBI9P2DZng4iL/KFIxrefG4vlMvoxCraz
	KpCcSE1JHC/w0X8GXtXA2skmXya4FwNBcFRF1uA8Hs6tQfyvIpDyCmVh7xOVcIiyZN6zJB/k/GV
	5/mrnzwCRR0mbtBFC3Er+D1Hq2x6vNw0CzgY7Ok1Ucb0GVVF+V/b0e146eav362nwm4k6hjzbEC
	l9IybdMvzvYZwjeEOowWnDwLNWxcvXd0MjPzu9blLmPlPBNEkgDgGsmsz0ko3aRr/ybzCBKZgTK
	ahApLyMML2HvJldWfVANUbpweLMX6G4b87msyitl8BbcC37JO3ytGOBR0/UMv+hGgzDoCh1AX6X
	djN5IOFq9K2RtOgPS
X-Received: by 2002:a05:6a00:18aa:b0:842:4387:34b7 with SMTP id
 d2e1a72fcca58-8434cd41f33mr4652675b3a.10.1781293298066; Fri, 12 Jun 2026
 12:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780855296.git.lucien.xin@gmail.com> <e73d8f69b67fdeeec076fbe772ca465d7e1af4cb.1780855297.git.lucien.xin@gmail.com>
In-Reply-To: <e73d8f69b67fdeeec076fbe772ca465d7e1af4cb.1780855297.git.lucien.xin@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 15:41:26 -0400
X-Gm-Features: AVVi8CccjtCVNlXysoHMU93ce-8zqlj8T5zFjNLF2CVr-6fSHzwtKPVAgQLYHfw
Message-ID: <CADvbK_e7wpf=-C9h97b2JWUMQ6YkQLtVeTcxxCdQPaFTN+Litw@mail.gmail.com>
Subject: Re: [PATCH net-next v13 04/15] quic: provide family ops for address
 and protocol
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

> +static void quic_v4_lower_xmit(struct sock *sk, struct sk_buff *skb,
> +        struct flowi *fl)
> +{
> + struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> + u8 tos = (inet_sk(sk)->tos | cb->ecn), ttl;
> + struct flowi4 *fl4 = &fl->u.ip4;
> + struct dst_entry *dst;
> + __be16 df = 0;
> +
> + pr_debug("%s: skb: %p, len: %d, num: %llu, %pI4:%d -> %pI4:%d\n",
> + __func__, skb, skb->len, cb->number, &fl4->saddr,
> + ntohs(fl4->fl4_sport), &fl4->daddr, ntohs(fl4->fl4_dport));
Should cb->number use %lld here rather than %llu? Looking at struct
quic_skb_cb in net/quic/common.h:
    s64 number;  /* Parsed packet number, or the largest previously seen */
Since number is s64, a negative initial value (such as -1 for "largest
previously seen") would be printed as 18446744073709551615 with %llu, and
compilers with -Wformat-signedness flag the mismatch.
[ ... ]
> +static void quic_v6_lower_xmit(struct sock *sk, struct sk_buff *skb,
> +        struct flowi *fl)
> +{
> + struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> + u8 tc = (inet6_sk(sk)->tclass | cb->ecn), ttl;
> + struct flowi6 *fl6 = &fl->u.ip6;
> + struct dst_entry *dst;
> + __be32 label;
> +
> + pr_debug("%s: skb: %p, len: %d, num: %llu, %pI6c:%d -> %pI6c:%d\n",
> + __func__, skb, skb->len, cb->number, &fl6->saddr,
> + ntohs(fl6->fl6_sport), &fl6->daddr, ntohs(fl6->fl6_dport));
Same question about cb->number being printed with %llu while the field is
declared s64.

A minor one but legit, will fix it.

Thanks.
