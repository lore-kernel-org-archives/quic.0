Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D6214E2E2
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762259609; cv=none; b=DVNtgmCZdyMLoplXYH0vRSQJZ1xNI3CaiUQ2iMqM5Co7pqPE/Thu4RzCoTk1BKHIiJwqNP1FijIBOe5cYcdJWT73N50YEf8IBHW5KcfYZ9WH03SVscZpmZiyjaAH9jFvDJNSb9XcvpLaWOe+qi+chClgICxWogG2NNYh4iqKwsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762259609; c=relaxed/simple;
	bh=rvu6O0E/7DDQAPj95W4jLS6+wxWIiNJJleMFtELomlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaaGKBbBj0BdJbxJ9LxjcX/fKCx6/JJ7TITVV4lxAIL7MA75cYJccMEfG0wkv2L1qYV1GxqoKo7yqkzx2dfCjaJ6MUD/wGeilxsJQj1Dd46ZealBqXKRZVPzKB2zYLaVabBeUEbP1m96ZbqE2Ag4E9ubiE3LL0ueKJ4Vf96JJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RvkelZuH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RvkelZuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762259605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+n3IR+AGm5h5aAEd+ooyhPcJs+3zBjyrD/S6ttEIHg=;
	b=RvkelZuH+Id7D1p5Br4U28HG+9GDaZkllXUASNn0BVdgIAPXIhDv37rDuhsKRMdUoe0hzz
	CiXlVuNJ7hLE1dv13jvYzLJBQqacTIz4A1V6fTRBB1RcH3/Yg4+TttA3fr+icYtNqOMzjk
	Ehr5U83chHlVS4NmD6AHRXXHkh9/8Iw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-LajGvnL7OlqBQeVzyICd5A-1; Tue, 04 Nov 2025 07:33:24 -0500
X-MC-Unique: LajGvnL7OlqBQeVzyICd5A-1
X-Mimecast-MFC-AGG-ID: LajGvnL7OlqBQeVzyICd5A_1762259604
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4721b4f3afbso21481045e9.0
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 04:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762259603; x=1762864403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+n3IR+AGm5h5aAEd+ooyhPcJs+3zBjyrD/S6ttEIHg=;
        b=a0SY1oJplgCZ0a/EFiU9ZrGS+7jkU9WQlBe0Bf/lhDBLKnrly7QNt+zNXz227zWzgx
         LT5v3JlBEz7L3GdmNtvF0TQk5WIBnQ89zxq78utIEmIe6jCMU2KgsKjcZOSkGWBK4/gL
         BKUPmmRYAjMluuWG9kXfWaDf68Qp4iRuxL3J6TCBESK4JddSArcK8dqnS8seKptbxvFG
         ZvwH+oRjU86TNLHceGJgiJvMwAwTEZGrfBtrYL+VSOSdpIBmDQrlcoRfl6U8xjls8G1s
         kkBN6IliprA42ZV/G/RimlPKE32v+TAtpEaLRIOLx3u5bcK+9MFkyHM0xtStU8P8ItwU
         iFqg==
X-Forwarded-Encrypted: i=1; AJvYcCWnyMt9kh63igZTIZn5ZfhccFiBGyRaYwwTj+Kh3JfaWZBdGMJIX1/xOg0pI2L08c80zuwZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxO6fts61LWYjsE1FJ5p5YJydZu6eHqYjFx54gDK/qgJW9ETdyQ
	DxEYkscLoOb26CYeop4uWq7ut5LXfs6rpoO/8OYNqBWtatQyh4EbyqICtaUqYNWnMvR1oreYxD3
	yIlLVSWlD6x0RPbUhkZSSNs+JCPj/Mm6UNNbNNm4SRh/CLPs9FHBzax4=
X-Gm-Gg: ASbGncuf1xsg5khqVLrO3o/tngGLV9CECG1u3Xc9p86m/jaSnR4UE3QRfPkivCcOHNR
	MOfuJaCCFBljArXBcituyIvJFHnxhcY1tnm6PpSTJLMREm8Ethe/kclaBT2FlA1pCuOKYnvGw1G
	8xRyHBsPN5g6CxjaGd4tZQyEIJRiBijXdx5a2LCnim8VOOCKmLBrkXYyOtU4GiHN4AmHwtNg+6+
	vudHnuC0EoI4dZPr4a7vcnX2tOV3Jm2M0ByoXo0fIyT49LfgBYn/OIW8mKpaEHMb694nrBkDt6m
	zpvH0fcwK/WG9VSd9ULHCZEgUlUWRCyqnP3lyrpCCsnV/IzOIXaeEIO1xH9Ec6SinRRCXjbGoW/
	4nSZm9ruDp23+nvea9NGdViQM3pMS0nV9lQ05nVvbWlT1
X-Received: by 2002:a05:600c:a086:b0:477:5582:dee3 with SMTP id 5b1f17b1804b1-4775582e17dmr21786555e9.23.1762259603575;
        Tue, 04 Nov 2025 04:33:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW7XZAfAI36z3n3gua+YP3lVHEkUX5rYhKEKRSMwAwl/px8xmvwUV2n/8i+Vg7lzMYGCOnZA==
X-Received: by 2002:a05:600c:a086:b0:477:5582:dee3 with SMTP id 5b1f17b1804b1-4775582e17dmr21786255e9.23.1762259603207;
        Tue, 04 Nov 2025 04:33:23 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558e695esm17324625e9.2.2025.11.04.04.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:33:22 -0800 (PST)
Message-ID: <3618948d-8372-4f8d-9a0e-97a059bbf6eb@redhat.com>
Date: Tue, 4 Nov 2025 13:33:20 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 13/15] quic: add timer management
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
 <cc874b85134ba00f8d1d334e93633fbfa04b5a9a.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cc874b85134ba00f8d1d334e93633fbfa04b5a9a.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T_3QhixnMHQXmhGZWGUpp2QqwetaPwUeHaHbm12_5dE_1762259604
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> +void quic_timer_stop(struct sock *sk, u8 type)
> +{
> +	if (type == QUIC_TIMER_PACE) {
> +		if (hrtimer_try_to_cancel(quic_timer(sk, type)) == 1)
> +			sock_put(sk);
> +		return;
> +	}
> +	if (timer_delete(quic_timer(sk, type)))

timer_shutdown()

Other than that:

Acked-by: Paolo Abeni <pabeni@redhat.com>

