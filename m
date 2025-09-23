Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77F3164B5
	for <quic@lists.linux.dev>; Tue, 23 Sep 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626502; cv=none; b=riNE6Z+DBNNpb+Fl61dUBta5Y0vAk4I4exHFx7+8WYrd7LvcSGqRvkXdSPzPJNq4Qcyt72So+DL7a/jfJzMFMBgza30K6Bq7uBMpZ3//PmaXxIsN/CxDOxYfz5q4kcGLdaEDcGUMvDcbJ4KloZtiS1QC8tZQI+SGQ+/V55RoUvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626502; c=relaxed/simple;
	bh=t+QZDhTto1uLLFwLELmutlOR0nLBR5O3CYGMg93yR9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2s1J68AryXmE3DVHbhPvsja9LTwtuQ1Q2PZ59QriR75CMaJOIzOGVCs8tTwE/n7p/tT0bOFY63rKU0sF9dR6IRNV60Ko6/lg9L5v68Y2l+EEPu8ne7GCcd3cEuX4jjMqUermKZRixF/cEOcuNN3ZMg2tNfu5CZw3ASe+/bL2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XHahVRyX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XHahVRyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758626499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRiwAmUD+4/mMUYIIKXqkLb49gsCM2cGlAg51GqgPDQ=;
	b=XHahVRyXxa1ur/96lz9oUCwMiWbLZiP77AJ3Ic1BsOiULYjIRvQfwJDNqYyJAmTM2WmuFa
	ZtF0vJBe+T0u5Tr+A7jNjBgJ7qLoHdk6D7JGhMUxnx9qLAm/9RF7SYd+FCM85qZSv4NUV/
	np/xVQCdVsWhW/pjFYQfojKz1PB3WJE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-a1KSDMhIN0qK6NqS2HUAvg-1; Tue, 23 Sep 2025 07:21:38 -0400
X-MC-Unique: a1KSDMhIN0qK6NqS2HUAvg-1
X-Mimecast-MFC-AGG-ID: a1KSDMhIN0qK6NqS2HUAvg_1758626497
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e1b05b42fso10272235e9.2
        for <quic@lists.linux.dev>; Tue, 23 Sep 2025 04:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626497; x=1759231297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRiwAmUD+4/mMUYIIKXqkLb49gsCM2cGlAg51GqgPDQ=;
        b=Q/JxLHVdCHzUUQQc+hD2MTTlwxTcCm61fC+/5RW/R+RrFfbOnCM+vAOkEpfSTV0z1n
         P94W4fbTTGHahijTygeGZEtb+Zf2t3ST/Ci3ixG9JnuapwEpQXnBG/NqpJlMalVQJaPR
         aDPyzPzj0L6DfuR6gi/tiqdBHt1QnLK7A7StBdlyzEYzS9dMmhD2c+qmoDs557zRpG4v
         N71x3zXPzU+ZHrGe9qJoMPaHqK08H2aYhF1hL/xrjgjRvnu/ca7cJwUqvc9SR2AhrStY
         iDmG67prOBrDv6WdCl2iYEp+awwp02NR3mzABaMkYbK0wdyHD1bFVj5jf9gAbzSIyAOw
         4Uog==
X-Forwarded-Encrypted: i=1; AJvYcCXRprVH/oeTyXbCLEO0oEVJt0F2BRbffL2OzN3PdsK4dlkHUm8VZxejGuUuGttlSCReD/cK@lists.linux.dev
X-Gm-Message-State: AOJu0YykexBE/+QJNFo+/hrXx5RVCU8qSif41qwcdCKMjJ2WlLkC0+di
	WC6+Y6dHq9mmom2d84V+Y6pL3jWusuUvGhtS8qNPnyVTttdddsTDlqrPIQ5Gd60OybnQCM9upfO
	Xq2fNo9Tpf5y5As1oR7dFsuvS+UIXBAjNCaPf8LH97AbR/BZA1kUMHQg99PVfQaA=
X-Gm-Gg: ASbGncvw4yhewL0J1GYzg5UCBWqITZduL7BuFUnocN1nHDrBMbgo6p0l+yTMybRLIUr
	8lhtXuoap4uhO+JKpLAV0gPOUPFrRLSmCKSV0hkLf8e2EI9wIo/3dyKsNXoxhtfGrOj3FPjuveu
	UF4GQuA3jK6PRgavbW3UEUKnIu7jM2sxKi5kM2l67grtvc5vXPMCwuDQduDNa+enLKMYZdUtSc+
	qHpODQwQEGq/787s3lsTnTBN6kQwSkUn9abqvylawwAW1svGm1Fbxu9XdCTyZA6m1r979rCO08W
	wDBJCCbM02vFFHhqpufenxwCdlbE8uEAPsWopZuolmsFMJxQaAi5zkU6RyNbulgGUl5udhcD47g
	7rNKhqiAfKGU7
X-Received: by 2002:a05:600c:468a:b0:45b:5f3d:aa3d with SMTP id 5b1f17b1804b1-46e1dad1bc0mr17677835e9.21.1758626496735;
        Tue, 23 Sep 2025 04:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVl5LwJCSoJe18fqUI2zrrluC6snkXwQxOKaMoTUidlB/HP/Iah2lrSfVasHGUh0FtzoWWMQ==
X-Received: by 2002:a05:600c:468a:b0:45b:5f3d:aa3d with SMTP id 5b1f17b1804b1-46e1dad1bc0mr17677575e9.21.1758626496239;
        Tue, 23 Sep 2025 04:21:36 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e1dab52d7sm13706445e9.2.2025.09.23.04.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 04:21:35 -0700 (PDT)
Message-ID: <871ed254-c3d8-49aa-9aac-eeb72e82f55d@redhat.com>
Date: Tue, 23 Sep 2025 13:21:33 +0200
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 03/15] quic: provide common utilities and data
 structures
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
 quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Benjamin Coddington <bcodding@redhat.com>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1758234904.git.lucien.xin@gmail.com>
 <a7fb75136c7c2e51b7081d3bff421e01b435288f.1758234904.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a7fb75136c7c2e51b7081d3bff421e01b435288f.1758234904.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IjKLooJx0UpukBDn0jyhKBych0b-kj-TIGQWr83r8tA_1758626497
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/25 12:34 AM, Xin Long wrote:
> This patch provides foundational data structures and utilities used
> throughout the QUIC stack.
> 
> It introduces packet header types, connection ID support, and address
> handling. Hash tables are added to manage socket lookup and connection
> ID mapping.
> 
> A flexible binary data type is provided, along with helpers for parsing,
> matching, and memory management. Helpers for encoding and decoding
> transport parameters and frames are also included.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>
> ---
> v3:
>   - Rework hashtables: split into two types and size them based on
>     totalram_pages(), similar to SCTP (reported by Paolo).
>   - struct quic_shash_table: use rwlock instead of spinlock.

Why? rwlock usage should be avoided in networking (as it's unfair, see
the many refactors replacing rwlock with rcu/plain spinlock)

[...]
> +
> +static int quic_uhash_table_init(struct quic_uhash_table *ht, u32 max_size, int order)
> +{
> +	int i, max_order, size;
> +
> +	/* Same sizing logic as in quic_shash_table_init(). */
> +	max_order = get_order(max_size * sizeof(struct quic_uhash_head));
> +	order = min(order, max_order);
> +	do {
> +		ht->hash = (struct quic_uhash_head *)
> +			__get_free_pages(GFP_KERNEL | __GFP_NOWARN, order);
> +	} while (!ht->hash && --order > 0);

You can avoid a little complexity, and see more consistent behaviour,
using plain vmalloc() or alloc_large_system_hash() with no fallback.


> +/* rfc9000#section-a.3: DecodePacketNumber()
> + *
> + * Reconstructs the full packet number from a truncated one.
> + */
> +s64 quic_get_num(s64 max_pkt_num, s64 pkt_num, u32 n)
> +{
> +	s64 expected = max_pkt_num + 1;
> +	s64 win = BIT_ULL(n * 8);
> +	s64 hwin = win / 2;
> +	s64 mask = win - 1;
> +	s64 cand;
> +
> +	cand = (expected & ~mask) | pkt_num;
> +	if (cand <= expected - hwin && cand < (1ULL << 62) - win)
> +		return cand + win;
> +	if (cand > expected + hwin && cand >= win)
> +		return cand - win;
> +	return cand;

The above is a bit obscure to me; replacing magic nubers (62) with macro
could help. Some more comments also would do.

/P

