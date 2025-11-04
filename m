Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA282EAB80
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762258656; cv=none; b=iKIWvm05xVEeyDWd7sn+PDawNoTEd2A9mXbKu2PyNZkg4PMeuG0Asvt/+lafbm+tdGTuzCLz4y8Ekyl86iXb7HpHtNOv120SwARjakdumFy/gl/Q9WLGYy7xAkuwR6fLNT/QvswKxyQmS8QiiQVSm0NN8XjNqHf6XBU8BrErRhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762258656; c=relaxed/simple;
	bh=P0QOjc+Y/i4SUjAz9hyI1Est9kQhNqP0MO2eaNzC2o0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNC9XcRHExeFLiCT86ICZrjcI2cqT8pjrSzLXMnF7poWlQMSs+dU12qtwgyulT3GzN9YpPhctHsLQYE1t8mCpUitueReudnCynZGZh01RY4M6XjDpwgvqSiKunUCpSdrpulQIvjnssg7yywQK8cgowKGuWRcxNMZpTg9TDQ5H70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZuJ/wiPV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZuJ/wiPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762258653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrVv52+Wup10TuV26Al3G9RFtHr2QH+o3/M+H4STBAA=;
	b=ZuJ/wiPVaV2kFPl4w7jI67n5inMCnjHDHGCnf+4/rhtRetIgVaHXH6OSBKpN8LFrYsCYFh
	mJy/BxSM5CK7W+TpdftiHXPdWBamZSEemhlkcP/2ouEpo+lx+9+GkR5e3WZTFprwWMRdSy
	fbIzCcRWN4gm+29kv3EVrINKu+rNhbM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-lP5bzWroNhChfiQoesRu2A-1; Tue, 04 Nov 2025 07:17:32 -0500
X-MC-Unique: lP5bzWroNhChfiQoesRu2A-1
X-Mimecast-MFC-AGG-ID: lP5bzWroNhChfiQoesRu2A_1762258651
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-426d4f59cbcso3450902f8f.1
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 04:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762258650; x=1762863450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrVv52+Wup10TuV26Al3G9RFtHr2QH+o3/M+H4STBAA=;
        b=mMGM3PuDoPYVYw0d1NTHJ2YKaO+pdtl/mzdKmj6JGPK0Zl247tYCS6zTGfPmLdPrss
         VWiaCyC8AmpRqnRwJeby+lXSxiuGA43C9nVzcz4Ef2TClPiTKxk+MqOA1GPGLdwlvtMj
         4OgzK2cHNVfDr4KorDJwlfMzcWtSuVY1LR6m0QzRfxjHCYUGryPP5ptRcA+vG05ixhl4
         ofoqE0vvO8vbGKA4pmfaZfyL2Xo/mFO4Mbm29/qFB7rjdqVZpz8yvhdMKzR8i0zT5Uqg
         a+HTpKh+TEYOJIWQeSFWHgBBYvgL7pvpFntDu0JiTwOnu9OzdilZdS8djhm485p1oOTw
         wYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI4KdY67xGbYIv8lqJrFos6wedlfyU0WzuGkf6M4g+bAYZBpJRMuMKhPuAk337juqn2/Mq@lists.linux.dev
X-Gm-Message-State: AOJu0YyjlIcb1vMOoTOkHWYvHfsZVIXaaC0C0iLzTsp/+BbL7BP74FQ7
	OK/Dlbpi5qm5f4DQ4JGiIDWvdW0a20jW/51BQIdZlAR8gHwH7i45mlP6Y953vZqt7cJ76W1ATNl
	UUsTXP8ixWZ9KxbjHoRIFLJyCo5QzbUe3RZejWDD8Wr/BnLhN9U3DBRrAiw1tdC8=
X-Gm-Gg: ASbGncs8EvDPdXqp6HbJyduCY8UIDdipVlGQqqsoCQ9I5k4gj6WK163CzjxRinxTQb/
	8i7zskOWOCttIxva1m7ht34qQ8nBbqtP4fshiEd3LQmxFQpmHu0+efAxMPb9MOaYZ7FIH2Kxc+2
	uMa5gpfc6yCUF3eg1m0BqAWwXGKWgDx9ye8nXcoH5hGPm4J2agCtv4gkGuOUiUmTTGv2MV8CTyC
	j5mJkkaGBfGYhmdQacob233/s8AHUtb49nG3JR/xwRzqEoQsO2q2MgJf9Q2M8blCoOM5383R4bn
	kU+EeAU7IutOfHAvbUdjEgVU+ZKUXOrB+jXqxoKlcPeKmPpYuuNEP7055a4iD6+aSjAXHQdlIxK
	R+vaL0PuD5ZqUsp8EG0ZA6pCbYzI06qQ1GprodCfqJT/M
X-Received: by 2002:a05:6000:40de:b0:429:d290:22f9 with SMTP id ffacd0b85a97d-429dbcabe53mr2945318f8f.4.1762258650462;
        Tue, 04 Nov 2025 04:17:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElFwJq3LBE7DNZtfuVK0eheDgsp8L8ZPbTvbUgjo7k2WL6IDip2GsX5myepH9Q0/Tu9JOyzw==
X-Received: by 2002:a05:6000:40de:b0:429:d290:22f9 with SMTP id ffacd0b85a97d-429dbcabe53mr2945262f8f.4.1762258649949;
        Tue, 04 Nov 2025 04:17:29 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f5a7fsm4316521f8f.24.2025.11.04.04.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:17:29 -0800 (PST)
Message-ID: <635b0dad-98bf-41e9-b7b6-1f28da48fc00@redhat.com>
Date: Tue, 4 Nov 2025 13:17:26 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 10/15] quic: add packet number space
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
 quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>,
 linux-cifs@vger.kernel.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Paulo Alcantara <pc@manguebit.com>,
 Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Benjamin Coddington <bcodding@redhat.com>, Steve Dickson
 <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
 <a1df61880c9f424b49b2d4933e0d6ea0bf6da268.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a1df61880c9f424b49b2d4933e0d6ea0bf6da268.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yseHUV53sG9VHVgDzI2lajdXXEKL7hTWKsEu3ARomTE_1762258651
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> +struct quic_pnspace {
> +	/* ECN counters indexed by direction (TX/RX) and ECN codepoint (ECT1, ECT0, CE) */
> +	u64 ecn_count[QUIC_ECN_DIR_MAX][QUIC_ECN_MAX];
> +	unsigned long *pn_map;	/* Bit map tracking received packet numbers for ACK generation */
> +	u16 pn_map_len;		/* Length of the packet number bit map (in bits) */
> +	u8  need_sack:1;	/* Flag indicating a SACK frame should be sent for this space */
> +	u8  sack_path:1;	/* Path used for sending the SACK frame */
> +
> +	s64 last_max_pn_seen;	/* Highest packet number seen before pn_map advanced */
> +	u32 last_max_pn_time;	/* Timestamp when last_max_pn_seen was received */
> +	u32 max_time_limit;	/* Time threshold to trigger pn_map advancement on packet receipt */
> +	s64 min_pn_seen;	/* Smallest packet number received in this space */
> +	s64 max_pn_seen;	/* Largest packet number received in this space */
> +	u32 max_pn_time;	/* Time at which max_pn_seen was received */
> +	s64 base_pn;		/* Packet number corresponding to the start of the pn_map */
> +	u32 time;		/* Cached current time, or time accept a socket (listen socket) */

There are a few 32 bits holes above you could avoid reordering the fields.

Otherwise LGTM,

Acked-by: Paolo Abeni <pabeni@redhat.com>

