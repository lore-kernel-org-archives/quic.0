Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734312749D6
	for <quic@lists.linux.dev>; Thu,  8 Jan 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883903; cv=none; b=MQaVPlJJhePwX4++eyUm0/PzWWUJJ83lwBjD+jSijzxA1ZGnv8QhDDFoXbLvRl0rg/znTtDOu2ql+1dxRmRwOrdpN2+Wer4ubl3KEBdRAQ0PWpLgPAwZgUYNNKT7C36SutlYb42huco368enyx2bQVXu9r6t5jn1BnVmdlKY12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883903; c=relaxed/simple;
	bh=DXhgONYeIS9bChdWRL5MXzxkLSKekfV9hllD3azG3T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eb9Nym/Fii0JLpigkrBXVqVOJ7El2JaovMXqGusOCpDqKMhW2MJNPCET8JJ1iiM5fCzUDojiGwAdBTUVJ7oZmcgKTegnAoLxcRYixRuUWbeGp6Cyf7qNrejvnu/K6v/nRAE+xsGiJJo+L4WDdPAUKhpqQu/biTzk5B1NtVnFo6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZmiTmoI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZmiTmoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767883900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sOEaS67jxDLLnbL0hp6gXDx5hl4Xnwdn7lV77ig2jkU=;
	b=WZmiTmoIUofRl8sr8F9/HwP7/5eQAnMWfSJHHewdgtexOO0cFD0DlxLi297bdfe3L0msCC
	xz62p5OLndM0MEcOhj5xzq9y7Zcr6dvTNZKhRWLzXSAl4hbWGNnmFN6x/K4rLxBgJwrc2z
	BhjUsSgEOdWrX/6biakx/mYH/QMLPjc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-XLCIWXWjOUCheMc9HmaJXQ-1; Thu, 08 Jan 2026 09:51:39 -0500
X-MC-Unique: XLCIWXWjOUCheMc9HmaJXQ-1
X-Mimecast-MFC-AGG-ID: XLCIWXWjOUCheMc9HmaJXQ_1767883898
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43102ac1da8so2343533f8f.2
        for <quic@lists.linux.dev>; Thu, 08 Jan 2026 06:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883897; x=1768488697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOEaS67jxDLLnbL0hp6gXDx5hl4Xnwdn7lV77ig2jkU=;
        b=p9/SBQpj0784FtbwLkz/IQsaBvSPBhG+LshDiN9Abs7q4Nqyhx8AJ45XTLaBryVKOB
         l/4nJ1Sddkr/shDiCeu6vi1TAh8xRL0cq38m4Z1uvLU/COCNss3HwtAVLDoPKQy8tbNp
         bzyGT3G6Ys7IXrlM6gN5AbUTBTXTgx0GRULpIBf9aGkQACKVx4FWhFMuxxot85P608Tu
         nnHp7i3hvOe4pRnASX5D6NCV8azCiYjPC5wDdzkVWOz7fFVTzZudCVPKMfC4t+5Xx6Ki
         1Pmtwe1xiS1oEZwbtJgsRJq2yPB0c4RPrMkkpsg1RyTdRcbS0SqoPlXcCQi4zs5mxTQb
         L2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCQZ8ZSwsOJOhJlcqII6vUHoKEBsa5h0QXlUswuvIP0A7zEZvdbm26zPShknDFqjE+nLtm@lists.linux.dev
X-Gm-Message-State: AOJu0YyNW4QgqwD9C1vRFd4faku0UYQKo+trzSVLsnRxs2X8AP1/ByTE
	xioCkVb4cRW0SXf5Y1CWsjntSxx3DoCa+ve4ptZQOEnOr04Ibus8jiJiquyqbJf7oCL7d1LbT6t
	ZHbln5J1+PrRVUTgT8ZwarQph5kar0A7E3jqvyX/VBMz7b4T2v7VQ9Ss=
X-Gm-Gg: AY/fxX4Z4Q+ffgr4F16qrSzUs6QvwtscYS6Jvgy2js7kdwUu7i6Ml4a8INf1/M7u041
	z3pfe9JRitemq/YFe07x4YclYeyKnYTW9sDEjSVQEBJ7O7V5VQQpwvdFu++afwxNnfm+xPw1t/H
	/Ubdw7eEU9oF29y+P838zHBW7mnaZsNdxMRpoiSAG08aZzB9ESdFtMWqgrXg88irq1yosYnvvIF
	ct3i0IvT7ls2ktPAcvRkW59HgSopkPzEQW7+HVhgiC5bKBkWPEMO+iXpopnabIWEsNDRen5qb6U
	Qbo96vy0Dv6QCXPjR2VlKQSOckJBT01C1UvB2sW5k9tHz7sOdCLBPB+VMtRpLGZ4AJ2obX+r+FA
	GWgxTpQeSJoN4mA==
X-Received: by 2002:a05:6000:250e:b0:430:fd69:9926 with SMTP id ffacd0b85a97d-432c377ece0mr7284122f8f.28.1767883897588;
        Thu, 08 Jan 2026 06:51:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl69o07nid1rtv2ElvvEp5emJMaGD57S1+3wGIJzICQrcTyqY6I1e4bFP5EYxEC7EOfbCGWA==
X-Received: by 2002:a05:6000:250e:b0:430:fd69:9926 with SMTP id ffacd0b85a97d-432c377ece0mr7284095f8f.28.1767883897151;
        Thu, 08 Jan 2026 06:51:37 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff1e9sm17585141f8f.41.2026.01.08.06.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:51:36 -0800 (PST)
Message-ID: <32c5dc26-d200-4c45-bcd5-3739699e39eb@redhat.com>
Date: Thu, 8 Jan 2026 15:51:34 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 04/16] quic: provide family ops for address
 and protocol
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
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1767621882.git.lucien.xin@gmail.com>
 <d6526f74c99731fa08bdd43f97330f9c2dd78e43.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <d6526f74c99731fa08bdd43f97330f9c2dd78e43.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0pW1aF968F0J6RJwCW5vqoWcXdiUkfOIcYyDCVjIwcc_1767883898
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> Introduce QUIC address and protocol family operations to handle IPv4/IPv6
> specifics consistently, similar to SCTP. The new quic_family.{c,h} provide
> helpers for routing, skb transmit handling, address parsing and comparison
> and UDP socket config initializing etc.
> 
> This consolidates protocol-family logic and enables cleaner dual-stack
> support in the QUIC socket implementation.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

