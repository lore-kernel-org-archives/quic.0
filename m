Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A09B33ADBE
	for <quic@lists.linux.dev>; Thu, 29 Jan 2026 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703993; cv=none; b=uApBsWw+/edww1sLPHqovX2/KZQrFWUZgC7UtFDdMl5U0udEmbdBoC94mMUpMusBJWk6lShIMvtUKjvGksJZ472oPB1NokBk8+DcwNbA8z8ZzF/oR+5dRtx0jE2oFnIbHPwiPu4hn27Mcfla4zGEtk3p3zyHcs2+vJcUpUjCn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703993; c=relaxed/simple;
	bh=l86OLD8ANrV0mU8pNoPBa0/YPrKD248BWDWu+9LLv88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4luwFWEYIgdHCDDW6By5izcWsj67yv4rqqkcRZ0LKwIw1E9ik4JWFzEPJdq3pRMU8JPGdzH8gMO81iR/fkrP8ZHOHCfJDg+n0i7HrRexivDa3UpmyMDv3xCAQhBsxf8bUnRgYqWlXBHYrBKvKeIjoZSrrcwLVZe6wkoyZK+R1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBKJDwFe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBKJDwFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769703991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smuqHJFpRj+j2xYajnlqs/VsDNhOWtBkZ67qclJoWoE=;
	b=CBKJDwFeQkigZ5Q8X8j00VCR7u7VMvAYutGSFE3T4bmPGfEpgv/wpewGMknoeY4FGjkPoi
	VOcSv0brGQ7mUoQDjN77gT++sJafnbJpfZanUW6DvzYgMi+L/urRKi3WACTAtWkEeSyQGo
	rIO2+1pyfERZwRc2bIXoXnAJas7yufM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-af41IQ8gOH2eZPxfApfOzQ-1; Thu, 29 Jan 2026 11:26:30 -0500
X-MC-Unique: af41IQ8gOH2eZPxfApfOzQ-1
X-Mimecast-MFC-AGG-ID: af41IQ8gOH2eZPxfApfOzQ_1769703989
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42fd46385c0so808603f8f.0
        for <quic@lists.linux.dev>; Thu, 29 Jan 2026 08:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769703989; x=1770308789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smuqHJFpRj+j2xYajnlqs/VsDNhOWtBkZ67qclJoWoE=;
        b=B4fhIFvGR8jc+9JnWGk/x0hvXak3ae/JH5un8e888ViDkucyFU5bD5bxyzEGQbgs43
         yCXH0Rhiacfzz+FWdmV7DBJO9UCydIrl3fW/NTKZJiGFCOXcFTfvdzqZaG2zpxQvEx9F
         0Zv3EWL8BQQjF/pzSMq8zZTTHuiH58lE+HS5TW/4TDhHDT19j33PzdvmEl0Oqzr8bYqr
         ue2Qen3/QUa1OiUeKuRYXOfzDu/rCDwEWs0hSScXXQllGTWhmoQAFPoOdyUZ/j+qyqaC
         moIYNw2KXH6Vd1IE9P2RDg78lHjNZbjW2M4UahHY9hSFs3Ctn/By7075mIAwUblc1fs8
         oUXg==
X-Forwarded-Encrypted: i=1; AJvYcCXVvUC9S4EYte9W5kyfvJoMlVx1ytIMTHirtrn4c69vOx4k9TLlSbsZ9MHtF4qAdnqNsSO4@lists.linux.dev
X-Gm-Message-State: AOJu0YyllLP6ltC9fecGoBpYHDSELwjDE2oHiRj7IggpQisfZx2TRym2
	YqoI6R8qJXtBc7EirM8zHH6wLdhOOmILcoaYdbUsYnHPtRZHmNHHr/oXDLcGjOyn78NcklIBWc0
	19bBve2fgraJsvBQcN+WYeIDDc5izdTP1R2FU5PHW8ASogWUCKnafR/M=
X-Gm-Gg: AZuq6aIEvHBvhpXZzmutcg0nI2SfjyAa7g9vWjUq0LRrasmHqc0+yJthVsJfSQKgwVK
	rMk6R1SrwQgSmXw62iE0MRpjNiGxXZ37WOvHyHWWv8H/yCRLjUFytFvsGtxXd4iN9m7mym0zh4L
	XO2aP3ORrhZNJKNtD0zf+E1Of3/Oq8nM8JqcYBI1vrx3WNfkf6HbuOlbVmt6oyxj+3qOkt+0bVD
	6k3nZEuzfo97V2k1qMC/pympbP2fLMSSAyFowi4nAj9p8ngCNdiS7BBDi/GiRQuzCFcqUaYCTm3
	I5Ef6QhlRj2zNEu9HOBGt8wWlDzqkN1IZL4s8q9tzs/uKeijVGM3lPzEzZ4jkMjJpOBI15ANVFe
	9LFx6SwrLgOQP
X-Received: by 2002:a05:6000:18a7:b0:430:fdc8:8be3 with SMTP id ffacd0b85a97d-435f3aafd25mr246909f8f.29.1769703988777;
        Thu, 29 Jan 2026 08:26:28 -0800 (PST)
X-Received: by 2002:a05:6000:18a7:b0:430:fdc8:8be3 with SMTP id ffacd0b85a97d-435f3aafd25mr246869f8f.29.1769703988173;
        Thu, 29 Jan 2026 08:26:28 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee562sm15878577f8f.18.2026.01.29.08.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 08:26:27 -0800 (PST)
Message-ID: <9c17e0f5-0a07-4800-9356-0ee9445e3922@redhat.com>
Date: Thu, 29 Jan 2026 17:26:25 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 03/15] quic: provide common utilities and data
 structures
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
References: <cover.1769439073.git.lucien.xin@gmail.com>
 <1cbfbd45fda48c82f629b000fc102ee011515e12.1769439073.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <1cbfbd45fda48c82f629b000fc102ee011515e12.1769439073.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2qtVaYY_qVxIu-hv-vi0yZpctuyXj2-r_ZsPyv5DQfw_1769703989
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/26 3:51 PM, Xin Long wrote:
> +struct quic_skb_cb {
> +	/* Callback and temporary context when encryption/decryption completes in async mode */
> +	void (*crypto_done)(struct sk_buff *skb, int err);
> +	void *crypto_ctx;
> +	union {
> +		struct sk_buff *last;	/* Last packet in bundle on TX */
> +		u64 time;		/* Arrival timestamp in UDP tunnel on RX */
> +	};
> +	s64 number;		/* Parsed packet number, or the largest previously seen */
> +	u32 seqno;		/* Dest connection ID number on RX */
> +	u16 errcode;		/* Error code if encryption/decryption fails */
> +	u16 length;		/* Payload length + packet number length */
> +
> +	u16 number_offset;	/* Offset of packet number field */
> +	u8 number_len;		/* Length of the packet number field */
> +	u8 level;		/* Encryption level: Initial, Handshake, App, or Early */
> +
> +	u8 key_update:1;	/* Key update triggered by this packet */
> +	u8 key_phase:1;		/* Key phase used (0 or 1) */
> +	u8 backlog:1;		/* Enqueued into backlog list */
> +	u8 resume:1;		/* Crypto already processed (encrypted or decrypted) */
> +	u8 path:1;		/* Packet arrived from a new or migrating path */
> +	u8 ecn:2;		/* ECN marking used on TX */
> +};
> +
> +#define QUIC_SKB_CB(skb)	((struct quic_skb_cb *)&((skb)->cb[0]))

Please add a build time check on quic_skb_cb size.

Thanks,

Paolo

