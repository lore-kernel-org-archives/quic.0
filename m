Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E142E62B1
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257729; cv=none; b=kFlkfrdrGFlubTU3s1DDRUvwuc0+/NXF2dQVsSQV22AmSnmB0Kq6llm0Ljf9g0vZgfvJ/5+a6YCfi2NUZxhDzO4bUW6VChXn4762KEcy/of0cMe3Tglzdh7H3eQyvri0e6YhybB8nHR3rpfVNF59xCLQmE0n4wgbUIVTKX4evMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257729; c=relaxed/simple;
	bh=siDD7cjBMuaNTHwQly3VC8x+1gNlvhrCrFOU/ZhsCNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8ZB/zxXccLVu9tQXPIenShd2DzIvKemZ98DCZor8sBwQf/meVVN9wsuIuZfr5yTLf7s7i43M96JThVq9osQiIQ/JIYBxO9zpq1dY6e4u/6qgxFNiL9L6KXGFY+dziCdJ8SRuscsRAfl8p2DHp6DLecyY4FtRDsSEQkjN+XRTpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iKUpoTnA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iKUpoTnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762257726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ssdJLqXoynRieLG0swAQ2kxDsi5M4pN7LUYQOx6mmIg=;
	b=iKUpoTnAVHxp2KwDPqLSvydsEtzkLge1jncSXoFil7H4ro7iwZtSyY1btoFOpGVEdcrAop
	fk9YmysQyyetKALG9m/w063i6c7zSYrFH7XEjoRVX+I/6oTA7eIQElXmtV82GfDBiXxyER
	AINUB2ASqL+NLBZeTdbw+RuxxJZTiIw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-_y-a5ZvaNRiKkwl9slDxAw-1; Tue, 04 Nov 2025 07:02:05 -0500
X-MC-Unique: _y-a5ZvaNRiKkwl9slDxAw-1
X-Mimecast-MFC-AGG-ID: _y-a5ZvaNRiKkwl9slDxAw_1762257724
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-475e032d81bso39729335e9.3
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 04:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257724; x=1762862524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssdJLqXoynRieLG0swAQ2kxDsi5M4pN7LUYQOx6mmIg=;
        b=J1AG3+zhcRcKo+JkMn6N/7+OKgpjhHyCQ/e0TdeqXVimmCslwCTsKWuPkmbAKFLZrN
         AxPjrM2P3uQpzLfleqqtTBin2xKjKEiGEo6WT6khNV0AojWgz9AVmuxiGxuc5mlonfbd
         FXBrszk4hqJxz0a7+UPOsoCvPWUNlUekbt7aVtxzUiTDBWCROs+6V2ezmw4iOU0W6ImD
         J92Z7QSbc6YpS4VWoFDE0Ya/CAD2hmEd0RnBE17Rn352vqIhQRPCLIlql/59rvIHGeHQ
         2OFXgb1Fnhmw4bJiWlC1IaS06Fc10nblAcsr94ncJiF2elIv1zFqE1PgCQ4h3mYxT17d
         MHtg==
X-Forwarded-Encrypted: i=1; AJvYcCXHxvKT4n1sAjqpBRFiuXmLVKrvfBo4a+BLpOFSl4eB2K+tcFkSoHOrsHR6r5vwhNyGOJJl@lists.linux.dev
X-Gm-Message-State: AOJu0YwClJ/NhtxliKTimBd3bWUCWEvqXSaVP0eQ1W9b43rM1ParpCht
	mnECGM+C4+E97jAWM83I35VwFnN5ieAFREaWG1Cuy5d2BXsjwfLpy7lzq535ZSSNQVtYI/iRO+G
	PROsUh9RVdGrNE7RM9auzKZ1zqq3XOvRUbHqrN+VSm31tgAj7UgJyaKc=
X-Gm-Gg: ASbGncv60784ggZX5qrlwLlGSnbQreQKlVf151V66eeiAGmpoixrUu1mr8y3LTBXxEW
	u5kVJekQA/ud++yljVQAwc5yUflR7UiLgU2/BNavwgJME/eKzLeEFCz9O/6hbWSWamvFn7M2fQ2
	7fQpmM0puk4PqZW0pP4eIbvPeem2KDQ3Gg+JO318ZgqdomriQXsKBWuJMYco7L4xmkPqHWue99D
	J0ct+eiQBfQuD0r7b8zcjelbxZZazVYMw9BIj5Lo5FdeqPWC5Ps2bRJtaNxUTVj17dfnkYgekHZ
	xoMU57zVVvXsnLyKt9F/btOS0mD5Li0OkMGZSl7VhcvFeK22jCUnEb81UIEA7898l54dldIekMD
	6jauKE76r5MiMsKI3ypxhh0jSx2wG551Z2k8FwbtZKCaN
X-Received: by 2002:a05:600c:828c:b0:476:651d:27e6 with SMTP id 5b1f17b1804b1-477308a8967mr141057985e9.36.1762257724141;
        Tue, 04 Nov 2025 04:02:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEauK+mynBX5rWHPCWx1RsWJ73mWra6y4dymOB8ucAA4aBwaSotD7FEFCtCpoVpD7tQTjZ43A==
X-Received: by 2002:a05:600c:828c:b0:476:651d:27e6 with SMTP id 5b1f17b1804b1-477308a8967mr141057435e9.36.1762257723669;
        Tue, 04 Nov 2025 04:02:03 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477564d83e2sm31565865e9.3.2025.11.04.04.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:02:03 -0800 (PST)
Message-ID: <43ea4062-75a8-4152-bf19-2eca561036bd@redhat.com>
Date: Tue, 4 Nov 2025 13:02:00 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 09/15] quic: add congestion control
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
 <32c7730d3b0f6e5323d289d5bdfd01fc22d551b5.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <32c7730d3b0f6e5323d289d5bdfd01fc22d551b5.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lEHuYDEOfCdJ6Zr9pBE2AfT6ugocDaIGl1d_-WZt-Jo_1762257724
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> +/* Compute and update the pacing rate based on congestion window and smoothed RTT. */
> +static void quic_cong_pace_update(struct quic_cong *cong, u32 bytes, u32 max_rate)
> +{
> +	u64 rate;
> +
> +	/* rate = N * congestion_window / smoothed_rtt */
> +	rate = (u64)cong->window * USEC_PER_SEC * 2;
> +	if (likely(cong->smoothed_rtt))
> +		rate = div64_ul(rate, cong->smoothed_rtt);
> +
> +	WRITE_ONCE(cong->pacing_rate, min_t(u64, rate, max_rate));
> +	pr_debug("%s: update pacing rate: %u, max rate: %u, srtt: %u\n",
> +		 __func__, cong->pacing_rate, max_rate, cong->smoothed_rtt);

I think you should skip entirely the pacing_rate update when
`smoothed_rtt == 0`

[...]> +/* rfc9002#section-5: Estimating the Round-Trip Time */
> +void quic_cong_rtt_update(struct quic_cong *cong, u32 time, u32 ack_delay)
> +{
> +	u32 adjusted_rtt, rttvar_sample;
> +
> +	/* Ignore RTT sample if ACK delay is suspiciously large. */
> +	if (ack_delay > cong->max_ack_delay * 2)
> +		return;
> +
> +	/* rfc9002#section-5.1: latest_rtt = ack_time - send_time_of_largest_acked */
> +	cong->latest_rtt = cong->time - time;
> +
> +	/* rfc9002#section-5.2: Estimating min_rtt */
> +	if (!cong->min_rtt_valid) {
> +		cong->min_rtt = cong->latest_rtt;
> +		cong->min_rtt_valid = 1;
> +	}
> +	if (cong->min_rtt > cong->latest_rtt)
> +		cong->min_rtt = cong->latest_rtt;
> +
> +	if (!cong->is_rtt_set) {
> +		/* rfc9002#section-5.3:
> +		 *   smoothed_rtt = latest_rtt
> +		 *   rttvar = latest_rtt / 2
> +		 */
> +		cong->smoothed_rtt = cong->latest_rtt;
> +		cong->rttvar = cong->smoothed_rtt / 2;
> +		quic_cong_pto_update(cong);
> +		cong->is_rtt_set = 1;
> +		return;
> +	}
> +
> +	/* rfc9002#section-5.3:
> +	 *   adjusted_rtt = latest_rtt
> +	 *   if (latest_rtt >= min_rtt + ack_delay):
> +	 *     adjusted_rtt = latest_rtt - ack_delay
> +	 *   smoothed_rtt = 7/8 * smoothed_rtt + 1/8 * adjusted_rtt
> +	 *   rttvar_sample = abs(smoothed_rtt - adjusted_rtt)
> +	 *   rttvar = 3/4 * rttvar + 1/4 * rttvar_sample
> +	 */
> +	adjusted_rtt = cong->latest_rtt;
> +	if (cong->latest_rtt >= cong->min_rtt + ack_delay)
> +		adjusted_rtt = cong->latest_rtt - ack_delay;
> +
> +	cong->smoothed_rtt = (cong->smoothed_rtt * 7 + adjusted_rtt) / 8;

Out of sheer curiosity, is the compiler smart enough to use a 'srl 3'
for the above?

/P

