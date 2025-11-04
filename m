Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914F01F1513
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260464; cv=none; b=p+Xo0i9F0YQ37PPVStMXA79FSYvv85FvQ++TloQZNF1UqCCvtB5XtN9vxvc/7PYE8cc4WVpkhS25ARJVj2NHgeTuzfzLmchTriECsXdIeUASEecE9USYCw3knuhoPnBNwUvYoZZ26IWHzGrIzHjvDQ6vqJ0leHE7dn7T+X5yWMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260464; c=relaxed/simple;
	bh=g4MzobWCgMAbdFKqXdws3q6G9OR+n0+6vpq9/2gGiYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2KJMqDzIXfKk+cE9gB4mdUWId8nVKzeCN6h84ZXFYmd5PCIScewMFyYFFxwe3DpkpcAsbbHQeA8A7QZSzbcaft2o99+GLvxjtXOawgD5VM0XdUzlJNAeKs8Cox2YfdQCFV5CgrDc5tn6rgzsT6yiDH31iojbtZXpmhsdbtQrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mp8b3IW6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mp8b3IW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762260461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWnifgGT0AcayVvuS2yfUcRlYF71GXMXDqlq2lq5xps=;
	b=Mp8b3IW68dk5F3iMH1X0sj/+wDHG+j01bA5G4NrkktUKG6qQn2NZwGAN/xcZwMXKmSBI8j
	N1Sidb9iXWwDnE3qSiZHBEK+Ire4EDoxSahfoweDBYPb4EupaL2O8RD5UHDB91GzywXur2
	uipVLuvRLEEHWgAN008PEj/C1FjuhfE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-aV6szBJoPYGrny--71McPQ-1; Tue, 04 Nov 2025 07:47:40 -0500
X-MC-Unique: aV6szBJoPYGrny--71McPQ-1
X-Mimecast-MFC-AGG-ID: aV6szBJoPYGrny--71McPQ_1762260459
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429cceeeb96so1223894f8f.1
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 04:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762260459; x=1762865259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWnifgGT0AcayVvuS2yfUcRlYF71GXMXDqlq2lq5xps=;
        b=UCjhIECsp5iY/oy9CBzVweecxDZsGtzjL+givPeYPRBlOqiXHU+MkfLxjXMyxk0yC7
         Vw2e2cprwyMp9B6mMfAosw59wKzWgDlxJOKaYmOW0ZrcueDT2m+OIi3dyo7qgMlWYGJi
         Sp73HJXZI6t4u3gsjd0om4wDhJEWiCGBds4nJ8ULe/f/fXTrKl6G3/LWkrWjzps69lM0
         CHnjGzMwoqPZQkvaCQaH21PKO+D1sDUNo6bR+8nWVjTyeeoWZAtjhBCmi/woq+aQ5BZS
         qTRgCDldVm0loH5ZfTQcZCgQm2LcNx666pPvzTaAy1bavyJCU+oYcOkYKVTB1IE3jcVL
         fEAw==
X-Forwarded-Encrypted: i=1; AJvYcCUk8GCxZfsD3ENFhB8jNNTAosughcKknDUPNMSpmiPGSLwLB9H/+WSvcnmgnVAhJsCFpD+0@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgj60p2/CaRrgEV/T9xAj+BobPvi7ojf9rxetL0k9/FHNqMjit
	yWzgUkV3cRJ6RKGxOSaWL2puifwbplxDOs5CUcQ0P5He8MPW3ISJCDfChZ2afu7kzOXcl3TqCCJ
	GdZ7u1RL8IyziaqSKD2n7QBQX0+ao55hG0anYiOt8kgGfpLr20Eikg90=
X-Gm-Gg: ASbGnctyMhOzUSHXAh/n6ga5fVMeEBJCLLIvxhbkXeORAqjxTpTIcLnlKOI87GTSKse
	hIrigEoLaFtHUbhDQ8B7h6OD2NffppWHsojWasjt6BfNF7OhT7jtL3o5hU/XgqGwkwIFpMnDK1F
	wKystL2etZdezrOOjSnwD7srl5CJ7QM3PcC3UW14Iog7M4aBvoy526dEH8zbJI1izMPmqda/HIb
	BJKqJd3Oz/mTohUAzlOcGBsgMBMGmeHxh/4n+QZCKaxhH7n2o1sSA+6tWSG/njZdtV04jdEfODX
	jFe8FHIrsV/btIOXjtL1yov//qmC6zwxQJUEGpiG4jxVTUOjYOqOqBH9HcxKFa+LvUChmDN3eic
	9XVr/+5dmibxinlVPsW7njTk87eK35Mv3Js8oFey1A4Pq
X-Received: by 2002:a05:6000:4b0f:b0:429:c965:afa with SMTP id ffacd0b85a97d-429c9650c2emr9026833f8f.36.1762260459270;
        Tue, 04 Nov 2025 04:47:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiJ1SiVaPavd71LCb0yruPCRV4eS0waiUfxW8OCw2NKcYZLnottK8w5LOXobrD0/V4oRg99w==
X-Received: by 2002:a05:6000:4b0f:b0:429:c965:afa with SMTP id ffacd0b85a97d-429c9650c2emr9026809f8f.36.1762260458840;
        Tue, 04 Nov 2025 04:47:38 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dbf53e86sm4620311f8f.0.2025.11.04.04.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:47:38 -0800 (PST)
Message-ID: <989d3df8-52cf-41db-bb4c-44950a34ce89@redhat.com>
Date: Tue, 4 Nov 2025 13:47:35 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 14/15] quic: add frame encoder and decoder
 base
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
 <56e8d1efe9c7d5db33b0c425bc4c1276a251923d.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <56e8d1efe9c7d5db33b0c425bc4c1276a251923d.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YGVYHtd9y08CnLyclikBx1F_jFgApu_rwkZPb_9EEV0_1762260459
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> +static void quic_frame_free(struct quic_frame *frame)
> +{
> +	struct quic_frame_frag *frag, *next;
> +
> +	if (!frame->type && frame->skb) { /* RX path frame with skb. */

Are RX path frame with !skb expected/possible? such frames will be
'misinterpreted' as TX ones, specifically will do `kfree(frame->data)`
which in turn could be a bad thing.

Possibly add a WARN on such scenario?

/P

