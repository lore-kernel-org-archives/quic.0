Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4475F2DE200
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762254357; cv=none; b=YVLQFX0XrZA+3cIuoJ6YXqlgmNzyjIVnjgJ4jaUnP5yGuA3ZLiDJIux8rVnsKfFlviVAQOekjZb9KxPjFjjzoB0w739+eLyht3Zsby6N8f/Uj2+XbSq2Kr1iDlJ6XMZS5ddwhY4T/xXb9UY7bxVjD1Zh0OcQPYmey6v5UoEhoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762254357; c=relaxed/simple;
	bh=6rkuhGsUq+FMshFBuGH4UBuujI5+HFmkSrNJPWLxEDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlJeFpKXcZmsqDJo3n7AdRUJN9m8ch3vEzlM24U9gRZIoeR4UNE1D9fEjDrk1fLlfWR3wFTEjR7oEDJkuhH2lsLIvUmRnz3rTu0rDGOQONAH85Ye+DBuXaxVVqxkR+uaFYTHW8WeC5niqQ9Xko3kaVjrckD0n4VFrgjZJXo89Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R3Ki+WyI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R3Ki+WyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762254354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OxmghJIcjc3tJC2DIG8MaqzZFBLXh5fxewma9fsdqXU=;
	b=R3Ki+WyIMdLbuE/2gHhykMgWbRmwu0xoImIoyh+oa3xCEKpws1QiXKHeiM5aIVEhdKXwY7
	szL8PO87H05qhFFj8tqVvht2RuMv6yHxihT8Z5Q9eDl9MfLqFtkh4pm3UDJMkpjLvMOQSz
	21A5J9zy2NLZyyJmBMbXFsBESLTDxeU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-8YZjrPkRMmS-rWN6m-AYXA-1; Tue, 04 Nov 2025 06:05:51 -0500
X-MC-Unique: 8YZjrPkRMmS-rWN6m-AYXA-1
X-Mimecast-MFC-AGG-ID: 8YZjrPkRMmS-rWN6m-AYXA_1762254350
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-429c8d07874so1687037f8f.3
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 03:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762254350; x=1762859150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxmghJIcjc3tJC2DIG8MaqzZFBLXh5fxewma9fsdqXU=;
        b=hedmfIk8bY9hQSN/gYZbpAPKaST4LYzV6u97xmRPCUMK6fIQ/tigfGh2GzGIpc+Ful
         2lD/0WVdbINE86oKPndpAs1m8TFsVTFZVu7Sf6T6nuEfYpx5gMDFsBoWQrKD/FcneTmN
         Q/rM6ddY1SL7Sd42JUhy57KrSus/ZrTF8i3K+zUoh4c0JekDOV8GujVS+MGrayLTUxbd
         EoFLBHtSljzt/GavUVyXlvVx+ZLCaVm25nksShGJZDHJcTN/oakNIsN/SlMFzR9QCIFA
         D7hfa/HlOHph7up+7JGPmDfkMmBuaXtQdfjRSY63PtyK0mI4SpZH1y88i6X0k1eD30+B
         BrTg==
X-Forwarded-Encrypted: i=1; AJvYcCW/GLBQjiWr0IgqQ/u5QxWnbumokOP0bKcLtmWuNliYtEGTlGxp+EjV6dFRsMAzOqdRQA3k@lists.linux.dev
X-Gm-Message-State: AOJu0Ywld9CF3Vw4bdQIDvjwsi2l+LoqZLwJdGXTxexi51/DA6FqMbmd
	EaIDyhJ6r/XJnK6AR3SmKHo1hgFe8LUXaftsg2CDORvWw+N4122/8coauI6BnBF6qSbligZ0fZ8
	hOPn5Zfu/nNFGPjiMx5OxNyQdKyZlMoWhjA369rqL8bJPwVwppKjL2lI=
X-Gm-Gg: ASbGncse12A0EijBcTewrow0T0ryZVk7L3ZjjKClh+L+eWsIO6+SKXeMO0AhZQRWtRh
	0eVzx1czyZHB/r5fXS3Mzu+TYxjz3dbocq0i8X2n1/DLzrFqFZy0XLtj+UfwoyWmt5St8WkJmLf
	PpPbhKDExf6A0itVQNhA/pfoZxb/bb5OlCrdXTVyzoXAmshNgzzaPqOfEV7EYct606dPaa645+d
	ZhOstXIHojvMhQF44gLMJ7Q4jFgy6N+jzw5GK3tONJ6NH6Ph+IjgKXDr0PM4OzLbGRsZfl3PNJr
	gk+ooYGrZv4smDsySbiJ22sxOlgmzR3kTfU83glqWeO5Rkr6WEKC6YAPA/KylL1330Oe+7XHBNq
	6N71Vtexo8Ba4h+jNO9TG2IQ19T/eB+LUQ2GSScYIJ21w
X-Received: by 2002:a5d:584b:0:b0:429:dc4a:4094 with SMTP id ffacd0b85a97d-429dc4a41c5mr2036046f8f.30.1762254349802;
        Tue, 04 Nov 2025 03:05:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRTcLyJarL+HzJIicet1BC+SA9mI8/liFB8LEEp4cpSbdxEDl917ajaG6JsdKZcXmSqC73zQ==
X-Received: by 2002:a5d:584b:0:b0:429:dc4a:4094 with SMTP id ffacd0b85a97d-429dc4a41c5mr2036004f8f.30.1762254349252;
        Tue, 04 Nov 2025 03:05:49 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f5af7sm4174267f8f.28.2025.11.04.03.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:05:48 -0800 (PST)
Message-ID: <ad38f56b-5c53-408e-abcc-4b061c2097a3@redhat.com>
Date: Tue, 4 Nov 2025 12:05:46 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 06/15] quic: add stream management
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
 <6b527b669fe05f9743e37d9f584f7cd492a7649b.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <6b527b669fe05f9743e37d9f584f7cd492a7649b.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eal3T_p-IWXEvEGKpbn32LoT55xZiB-StRLY7Dpi6ho_1762254350
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
+/* Create and register new streams for sending. */
> +static struct quic_stream *quic_stream_send_create(struct quic_stream_table *streams,
> +						   s64 max_stream_id, u8 is_serv)
> +{
> +	struct quic_stream *stream = NULL;
> +	s64 stream_id;
> +
> +	stream_id = streams->send.next_bidi_stream_id;
> +	if (quic_stream_id_uni(max_stream_id))
> +		stream_id = streams->send.next_uni_stream_id;
> +
> +	/* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
> +	 * of that type with lower-numbered stream IDs also being opened.
> +	 */
> +	while (stream_id <= max_stream_id) {
> +		stream = kzalloc(sizeof(*stream), GFP_KERNEL_ACCOUNT);
> +		if (!stream)
> +			return NULL;
> +
> +		stream->id = stream_id;
> +		if (quic_stream_id_uni(stream_id)) {
> +			stream->send.max_bytes = streams->send.max_stream_data_uni;
> +
> +			if (streams->send.next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)
> +				streams->send.next_uni_stream_id = stream_id + QUIC_STREAM_ID_STEP;

It's unclear to me the goal the above 2 statements. Dealing with id
wrap-arounds? If 'streams->send.next_uni_stream_id < stream_id +
QUIC_STREAM_ID_STEP' is not true the next quic_stream_send_create() will
reuse the same stream_id.

I moving the above in a separate helper with some comments would help.


> +			streams->send.streams_uni++;
> +
> +			quic_stream_add(streams, stream);
> +			stream_id += QUIC_STREAM_ID_STEP;
> +			continue;
> +		}
> +
> +		if (streams->send.next_bidi_stream_id < stream_id + QUIC_STREAM_ID_STEP)
> +			streams->send.next_bidi_stream_id = stream_id + QUIC_STREAM_ID_STEP;
> +		streams->send.streams_bidi++;
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
> +		quic_stream_add(streams, stream);
> +		stream_id += QUIC_STREAM_ID_STEP;
> +	}
> +	return stream;
> +}
> +
> +/* Create and register new streams for receiving. */
> +static struct quic_stream *quic_stream_recv_create(struct quic_stream_table *streams,
> +						   s64 max_stream_id, u8 is_serv)
> +{
> +	struct quic_stream *stream = NULL;
> +	s64 stream_id;
> +
> +	stream_id = streams->recv.next_bidi_stream_id;
> +	if (quic_stream_id_uni(max_stream_id))
> +		stream_id = streams->recv.next_uni_stream_id;
> +
> +	/* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
> +	 * of that type with lower-numbered stream IDs also being opened.
> +	 */
> +	while (stream_id <= max_stream_id) {
> +		stream = kzalloc(sizeof(*stream), GFP_ATOMIC | __GFP_ACCOUNT);
> +		if (!stream)
> +			return NULL;
> +
> +		stream->id = stream_id;
> +		if (quic_stream_id_uni(stream_id)) {
> +			stream->recv.window = streams->recv.max_stream_data_uni;
> +			stream->recv.max_bytes = stream->recv.window;
> +
> +			if (streams->recv.next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)
> +				streams->recv.next_uni_stream_id = stream_id + QUIC_STREAM_ID_STEP;
> +			streams->recv.streams_uni++;
> +
> +			quic_stream_add(streams, stream);
> +			stream_id += QUIC_STREAM_ID_STEP;
> +			continue;
> +		}
> +
> +		if (streams->recv.next_bidi_stream_id < stream_id + QUIC_STREAM_ID_STEP)
> +			streams->recv.next_bidi_stream_id = stream_id + QUIC_STREAM_ID_STEP;
> +		streams->recv.streams_bidi++;
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
> +		quic_stream_add(streams, stream);
> +		stream_id += QUIC_STREAM_ID_STEP;
> +	}
> +	return stream;
> +}

The above 2 functions has a lot of code in common. I think you could
deduplicate it by:
- defining a named type for quic_stream_table.{send,recv}
- define a generic quic_stream_create() helper using an additonal
argument for the relevant table.{send,recv}
- replace the above 2 functions with a single invocation to such helper.

It looks like there are more de-dup opportunity below.

> +
> +/* Check if a send or receive stream ID is already closed. */
> +static bool quic_stream_id_closed(struct quic_stream_table *streams, s64 stream_id, bool send)
> +{
> +	if (quic_stream_id_uni(stream_id)) {
> +		if (send)
> +			return stream_id < streams->send.next_uni_stream_id;
> +		return stream_id < streams->recv.next_uni_stream_id;
> +	}
> +	if (send)
> +		return stream_id < streams->send.next_bidi_stream_id;
> +	return stream_id < streams->recv.next_bidi_stream_id;
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
> +		return nstreams + streams->send.streams_uni > streams->send.max_streams_uni;
> +	}
> +
> +	if (stream_id > streams->send.max_bidi_stream_id)
> +		return true;
> +	stream_id -= streams->send.next_bidi_stream_id;
> +	nstreams = quic_stream_id_to_streams(stream_id);
> +	return nstreams + streams->send.streams_bidi > streams->send.max_streams_bidi;
> +}
> +
> +/* Get or create a send stream by ID. */
> +struct quic_stream *quic_stream_send_get(struct quic_stream_table *streams, s64 stream_id,
> +					 u32 flags, bool is_serv)
> +{
> +	struct quic_stream *stream;
> +
> +	if (!quic_stream_id_valid(stream_id, is_serv, true))
> +		return ERR_PTR(-EINVAL);
> +
> +	stream = quic_stream_find(streams, stream_id);
> +	if (stream) {

You should add some comments and possibly lockdep annotation/static
check about the expected locking for the whole stream lifecycle.

/P

