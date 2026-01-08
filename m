Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D733E37C
	for <quic@lists.linux.dev>; Thu,  8 Jan 2026 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886566; cv=none; b=qhE0yd4/xheq2zDAUfjBfN6vGWAd7KBRJ8BU0AotVqxY9Ts3SSSJU2LnbIcQhK0i472ry6Qfe94cWu9Xe2bHja+yeXSN4xMl+KHJ8RiXVB1xaTNmSrZIqAwQb2WhvUX+dahe/Nuf+tA66Q7y91s1MZpbG3FucPzlBVTJwHTaGTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886566; c=relaxed/simple;
	bh=NKOwiPZMksNsVlmICgHUyde/kre1yGZPZIKBPuvUi8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qY2UBredsaGMcw/Fajh4F/oI3yME73tfuAV7O3Iwino7atk4aNdS7IQhXBsPydjSeYoP0JpNaWYVnXYE379A/5xSAXeuWU4GVQFMKXnBQPmLrFTAo5NuqKmYhkrV0sYaAOWZjEHa6EU3gSwRvX4bqDOxHnKiYzUfIdPc0NtlWYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=duboADyy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="duboADyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767886561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eKOA6bIG5gqeJG8Qpb8f66GiNtAZiz2HEDO5SYzczYQ=;
	b=duboADyytAa26cN39qiVa/k4oLWwtziie0CjrB+xRpJglMMfbFZsQ7GcZV5/sxnoXM8kJT
	LJqbLjPNdneA54+ulXKnaFIcxuu6uB1Pu26Ri696iU1RYEGWrAE6jIUlZBDEaTh4Yh0TF6
	u3XqdKCBLJVJyvviPdi6K20rOeRaRM8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-Lqu9-2J1PiqPo7tgrvnC2g-1; Thu, 08 Jan 2026 10:36:00 -0500
X-MC-Unique: Lqu9-2J1PiqPo7tgrvnC2g-1
X-Mimecast-MFC-AGG-ID: Lqu9-2J1PiqPo7tgrvnC2g_1767886559
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso37009665e9.2
        for <quic@lists.linux.dev>; Thu, 08 Jan 2026 07:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767886559; x=1768491359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKOA6bIG5gqeJG8Qpb8f66GiNtAZiz2HEDO5SYzczYQ=;
        b=qLtchHvRh64E248jzYQ1aK6COT5TkYiviXLsrgcxTZmYpbQTXXwXbKGzRd692Ndf8X
         7MiZw/39LsD0o796Oytap7wGbb1N3g8cSJ/TH24DKPWfY0RXKAFjPhKK6CGbj0hreM19
         uFsGvHuk+TOtAjr8IHZASko25OProx8PzAwdn08pl8+3/vtt/hIJfwd8GVqzj+RVZWku
         G5p5nfcJsvZ52Hpcm+DG9c/6Q8JBlgL1Njon/swlGdbqzgXlHKwvDIbIhrfG/bOYdtU9
         lDKnTrvaNv6OKYnjGcZhLJ8cS76L/Odc9wkUZ7ib9HTPl/LHut7d4CXjlxf+oXqsWzzw
         q10Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7NwiNSQxyxOCJmyWxQI7ppAeAYShG7fvv0xK3e8NlNxFWBore4x/x4im8I0VmbrmjR8B@lists.linux.dev
X-Gm-Message-State: AOJu0YyQRWe4/pLwT9+QgjQgQ6rg56HtCokPvYd97mcHb+UY1RO8R0VK
	8mNmiob0QxyoN6ff7mU19GydHyw0XDv1ptCAJvZ0uYoUoNU+Rl8WlDIMT2R44Be0zAuETvuaUM8
	czQg59yLGn5W3QHsluPIA1OSq9sMe/3uyiQDmH+sarUsgQXy6b5KCDRU=
X-Gm-Gg: AY/fxX7Xtb8J55o0uyIpb/VAH2DIGn8uZDbiv4X0BUDTi+6EXA4tdNIvz4mszodtD1O
	95RhnED22r1HZpUxW5NAJcaoS08PbJvg5Uljqpi5a5rRDR6yXuGBw6jH0j6uQGM3UUhPrftRg6e
	xmA/ffDUcg4tQ6YCEjNBLvLjawESS99WyUpAiLySd0gdeyVV83Z/9K8K+5Hhv4o10/FHEARvqsf
	zyN6CPwZ9uI/ObQQeRZ3jZjNtsivG1kukGLm2hmxobD93rTGZ8zh522XeyICSh+3umpKOZTDqdz
	rPjT82MfJDFjbsqJSbUa6ZaZRz1mCryIWkFte3i/6k4YwQt4GOdPf4JTlPR9TZG28ymwXjte+r/
	aRtQR7t7xeN9CSg==
X-Received: by 2002:a05:600c:1992:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-47d84b4a815mr83106515e9.32.1767886558991;
        Thu, 08 Jan 2026 07:35:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfuJjGcbYUc5IlncqaTXsISNS90Og1zJ6QRlJFr7XbIoCIfy/sOMJ3agGVfwayDL7K8CC5eg==
X-Received: by 2002:a05:600c:1992:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-47d84b4a815mr83105905e9.32.1767886558466;
        Thu, 08 Jan 2026 07:35:58 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm16557435f8f.30.2026.01.08.07.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:35:58 -0800 (PST)
Message-ID: <5cb27e9f-ec01-4b50-b22c-dc8b027827bc@redhat.com>
Date: Thu, 8 Jan 2026 16:35:55 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 06/16] quic: add stream management
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
 <1e642f7c65ec53934bb05f95c5cf206648c7de9f.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <1e642f7c65ec53934bb05f95c5cf206648c7de9f.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PzlK9_5QhMB4ZbT7Zo1bY0NFdu6ANbyKEQ5ZKZjUfgM_1767886559
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> +/* Create and register new streams for sending or receiving. */
> +static struct quic_stream *quic_stream_create(struct quic_stream_table *streams,
> +					      s64 max_stream_id, bool send, bool is_serv)
> +{
> +	struct quic_stream_limits *limits = &streams->send;
> +	struct quic_stream *stream = NULL;
> +	gfp_t gfp = GFP_KERNEL_ACCOUNT;
> +	s64 stream_id;
> +
> +	if (!send) {
> +		limits = &streams->recv;
> +		gfp = GFP_ATOMIC | __GFP_ACCOUNT;
> +	}
> +	stream_id = limits->next_bidi_stream_id;
> +	if (quic_stream_id_uni(max_stream_id))
> +		stream_id = limits->next_uni_stream_id;
> +
> +	/* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
> +	 * of that type with lower-numbered stream IDs also being opened.
> +	 */
> +	while (stream_id <= max_stream_id) {
> +		stream = kzalloc(sizeof(*stream), gfp);
> +		if (!stream)
> +			return NULL;

Do you need to release the allocated ids in case of failure? It would be
sourprising to find some ids allocated when this call fails/returns NULL.

> +
> +		stream->id = stream_id;
> +		if (quic_stream_id_uni(stream_id)) {
> +			if (send) {
> +				stream->send.max_bytes = limits->max_stream_data_uni;
> +			} else {
> +				stream->recv.max_bytes = limits->max_stream_data_uni;
> +				stream->recv.window = stream->recv.max_bytes;
> +			}
> +			/* Streams must be opened sequentially. Update the next stream ID so the
> +			 * correct starting point is known if an out-of-order open is requested.
> +			 */
> +			limits->next_uni_stream_id = stream_id + QUIC_STREAM_ID_STEP;
> +			limits->streams_uni++;
> +
> +			quic_stream_add(streams, stream);
> +			stream_id += QUIC_STREAM_ID_STEP;
> +			continue;
> +		}
> +
> +		if (quic_stream_id_local(stream_id, is_serv)) {
> +			stream->send.max_bytes = streams->send.max_stream_data_bidi_remote;
> +			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_local;
> +		} else {
> +			stream->send.max_bytes = streams->send.max_stream_data_bidi_local;
> +			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_remote;
> +		}
> +		stream->recv.window = stream->recv.max_bytes;
> +
> +		limits->next_bidi_stream_id = stream_id + QUIC_STREAM_ID_STEP;
> +		limits->streams_bidi++;
> +
> +		quic_stream_add(streams, stream);
> +		stream_id += QUIC_STREAM_ID_STEP;
> +	}
> +	return stream;
> +}
> +
> +/* Check if a send or receive stream ID is already closed. */
> +static bool quic_stream_id_closed(struct quic_stream_table *streams, s64 stream_id, bool send)
> +{
> +	struct quic_stream_limits *limits = send ? &streams->send : &streams->recv;
> +
> +	if (quic_stream_id_uni(stream_id))
> +		return stream_id < limits->next_uni_stream_id;
> +	return stream_id < limits->next_bidi_stream_id;

I can't recall if I mentioned the following in a past review... it looks
like the above assumes wrap around are not possible, which is realistic
given the u64 counters - it would require > 100y on a server allocating
4G ids per second.

But it would be nice to explcitly document such assumption somewhere.

> +}
> +
> +/* Check if a stream ID would exceed local (recv) or peer (send) limits. */
> +bool quic_stream_id_exceeds(struct quic_stream_table *streams, s64 stream_id, bool send)
> +{
> +	u64 nstreams;
> +
> +	if (!send) {
> +		if (quic_stream_id_uni(stream_id))
> +			return stream_id > streams->recv.max_uni_stream_id;
> +		return stream_id > streams->recv.max_bidi_stream_id;
> +	}
> +
> +	if (quic_stream_id_uni(stream_id)) {
> +		if (stream_id > streams->send.max_uni_stream_id)
> +			return true;
> +		stream_id -= streams->send.next_uni_stream_id;
> +		nstreams = quic_stream_id_to_streams(stream_id);

It's not clear to me why send streams only have this additional check.

> +		return nstreams + streams->send.streams_uni > streams->send.max_streams_uni;

Possibly it would be more consistent

max_uni_stream_id -> max_stream_ids_uni

(no strong preferences)

> +	}
> +
> +	if (stream_id > streams->send.max_bidi_stream_id)
> +		return true;
> +	stream_id -= streams->send.next_bidi_stream_id;
> +	nstreams = quic_stream_id_to_streams(stream_id);
> +	return nstreams + streams->send.streams_bidi > streams->send.max_streams_bidi;
> +}

[...]
> +/* Get or create a receive stream by ID. Requires sock lock held. */
> +struct quic_stream *quic_stream_recv_get(struct quic_stream_table *streams, s64 stream_id,
> +					 bool is_serv)
> +{
> +	struct quic_stream *stream;
> +
> +	if (!quic_stream_id_valid(stream_id, is_serv, false))
> +		return ERR_PTR(-EINVAL);
> +
> +	stream = quic_stream_find(streams, stream_id);
> +	if (stream)
> +		return stream;
> +
> +	if (quic_stream_id_local(stream_id, is_serv)) {
> +		if (quic_stream_id_closed(streams, stream_id, true))
> +			return ERR_PTR(-ENOSTR);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (quic_stream_id_closed(streams, stream_id, false))
> +		return ERR_PTR(-ENOSTR);
> +
> +	if (quic_stream_id_exceeds(streams, stream_id, false))
> +		return ERR_PTR(-EAGAIN);
> +
> +	stream = quic_stream_create(streams, stream_id, false, is_serv);
> +	if (!stream)
> +		return ERR_PTR(-ENOSTR);
> +	if (quic_stream_id_valid(stream_id, is_serv, true))
> +		streams->send.active_stream_id = stream_id;

This function is really similar to quic_stream_send_get(), I think it
should be easy factor out a common helper (and possibly use directly
such helper with no send/recv wrapper).

/P

