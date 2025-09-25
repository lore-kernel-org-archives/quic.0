Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228912DCF77
	for <quic@lists.linux.dev>; Thu, 25 Sep 2025 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758816216; cv=none; b=ei221m7IvSowAS+s9x2/Z1Fv6pM9nIRzDW5ze/wc5Z5tz1qmXxRfdzPnqdBB6oAxcbs5k5DL4DC5zlpn94Hwpru+boE5qo4enOnSwQECfVUKnJNyFJb14Blne4usVpxXcCdlTXS28dNcUwZ4yLDfDINzv4oVDNIfO5BkzhUfWzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758816216; c=relaxed/simple;
	bh=HnJd+NrxTuygtcASib599tdU6VkNGVSgK79JCOZW6fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzDZXF4oJm4RSPcGj57+sYNteId6YbVAnQ9xq6QapLhWUOvgsKOCI7yaMlBbpkSfm5iUZlRyrs+1ezUe7YR3hXcyN9lIUQtlsUvuh3FVN5pYvaN1ysiXJB8fe02tyZadtSNBotpuQwZ6+o0YKuHZdGIScTtVuIzOVURvsdIisJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnlmm1cS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnlmm1cS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758816214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lAAu2rvXua1onNC9vVWcLt9JR4YNW3IhkSLkwQw3+yc=;
	b=gnlmm1cSQBqMqIBpnkIJgchJNvQpM293H2fW45i86W6I6RsK3Qgd71BJ4a3L8w4CFDxruc
	4ZnfPmgYwZGweQ5KPY1Qv+qj0uXkVtQQDycCEp2UjiR8krt7/BTNqFbcFIpmZoWGOAeGgW
	iT+Xe4kfyG4v3jhBCMV5JuwctMHPI78=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-vN-b7q2zP1ePRTfzaxJGSQ-1; Thu, 25 Sep 2025 12:03:31 -0400
X-MC-Unique: vN-b7q2zP1ePRTfzaxJGSQ-1
X-Mimecast-MFC-AGG-ID: vN-b7q2zP1ePRTfzaxJGSQ_1758816210
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3f3c118cbb3so787702f8f.3
        for <quic@lists.linux.dev>; Thu, 25 Sep 2025 09:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758816210; x=1759421010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAAu2rvXua1onNC9vVWcLt9JR4YNW3IhkSLkwQw3+yc=;
        b=DMwVHHvocY6DgMW9oZK7/ug7LUH/pwPnQP+KK3fwpVaJQnA0YxSM5vOzCxpy5YHAGW
         BHcUsM0ViwCCEcRd0BJPMx9pqc5iJpILDCsAbq4BFelCAhaswzlbTQbv8EtC/FJx2DZO
         MU6qU3Xbx0t2lk1+QKMPWf0qYmyu/c1GYd22GBHTy3wYU6+fTfq/zb26cVKVtTEHkeh2
         zEq0+AE3JRH2xgEKliKaT+LIazCnY+sjLTAe83eImRd9oG74sVmL9FdFk9m2tz2gHcEE
         y2xVF0getV9Ov+JMBckdenLUwUoThgrojRV0npga29rmTK40QJsWgfr6KJtdjPdKS/wj
         amgg==
X-Forwarded-Encrypted: i=1; AJvYcCXCpZUIT0kDDR6xym+gab0MCpLKQ2bkJkf705fjtb4A1x5mxzMr+l3NRP4VHvlSc2oq8IDZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxFImHXqkYPqO9nU7pEc+dbH7giwB/9tbwxKhS0TNrI0Q1MbIO+
	r+j6LgBf18YylzApzqnDuznf/hZ8K3rWGsAMfaNgCbeTpSgxzdPYQKu5LrrekFiqgsV0JNpCA9c
	MRhRnaJtW2oFrvLEW00kBbg8ETpbcaIddRM2/LfoZSHksK0gzTUxKjfY=
X-Gm-Gg: ASbGncvgaBD1fb6I4rxow3Yk8tB53VUWG3emo100zENQOLiumfL2G2TlLz7/9c3ck7N
	nz5sJidtDnkPE+tyUD/AzC5G9/zS4yrcxcNZrlfD2o3maLEDkTJBR4MR/RcKk4SGYLB4uvudW3/
	HbXFr2s9MjkaNCqEiNAx/pZiny5ucv6mOkZ86iwPquv7sAe6T5grIuTE1sWgz3qGfJIi84vAXQv
	oFjK7ph76YtoeKA0zxN1fshlydp8FUKdVUt2yqyUmDLJUDPRJjRp2aiXYmodI06pTcgrMOnpoUZ
	9ejlQfzTq46IB6cRIUSNLcGr2BnrYMv+w1B0ASKH45gA+vx0xH/HlFTQ5S45ThPztj81wdtmq8Q
	hCuLjSnphfl0T
X-Received: by 2002:a05:6000:1866:b0:3eb:6c82:bb27 with SMTP id ffacd0b85a97d-40e4accc83dmr3283221f8f.61.1758816210050;
        Thu, 25 Sep 2025 09:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEolKtk07hzt/nAdhndezZGEyI0DNBNdQSNglyCE4zJD/NsrvHDr7kmZq4QCjzgvNjUhL530Q==
X-Received: by 2002:a05:6000:1866:b0:3eb:6c82:bb27 with SMTP id ffacd0b85a97d-40e4accc83dmr3283173f8f.61.1758816209543;
        Thu, 25 Sep 2025 09:03:29 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac55esm91746695e9.6.2025.09.25.09.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 09:03:28 -0700 (PDT)
Message-ID: <f89701ce-839e-4032-bb1d-40fb1b67cb70@redhat.com>
Date: Thu, 25 Sep 2025 18:03:26 +0200
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 06/15] quic: add stream management
To: Xin Long <lucien.xin@gmail.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev,
 davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
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
 <5d71a793a5f6e85160748ed30539b98d2629c5ac.1758234904.git.lucien.xin@gmail.com>
 <2ef635de-7282-4ffe-bdfc-eceafa73857e@redhat.com>
 <CADvbK_fE1KHbgtZV4zY1xXo94avimgxBcoakyoAYPOsb-U3rSw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CADvbK_fE1KHbgtZV4zY1xXo94avimgxBcoakyoAYPOsb-U3rSw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M4aFqybyauUecBj6fS4LZX0W9AM1aJP7lJsXFb0Q-jg_1758816210
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/23/25 7:57 PM, Xin Long wrote:
> On Tue, Sep 23, 2025 at 9:39 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 9/19/25 12:34 AM, Xin Long wrote:
>>> +/* Create and register new streams for sending. */
>>> +static struct quic_stream *quic_stream_send_create(struct quic_stream_table *streams,
>>> +                                                s64 max_stream_id, u8 is_serv)
>>> +{
>>> +     struct quic_stream *stream;
>>> +     s64 stream_id;
>>> +
>>> +     stream_id = streams->send.next_bidi_stream_id;
>>> +     if (quic_stream_id_uni(max_stream_id))
>>> +             stream_id = streams->send.next_uni_stream_id;
>>> +
>>> +     /* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
>>> +      * of that type with lower-numbered stream IDs also being opened.
>>> +      */
>>> +     while (stream_id <= max_stream_id) {
>>> +             stream = kzalloc(sizeof(*stream), GFP_KERNEL);
>>> +             if (!stream)
>>> +                     return NULL;
>>
>> How many streams and connections ID do you foresee per socket? Could
>> such number grow significantly (possibly under misuse/attack)? If so you
>> you likely use GFP_KERNEL_ACCOUNT here (and in conn_id allocation).
> connections ID: 8 (QUIC_CONN_ID_LIMIT) at most per socket.
> streams: 4096 (QUIC_MAX_STREAMS) at most per socket.

Will such limit fit a (very) busy server? I guess it's more a question
those who already run quic workload at scale...

> I can switch to GFP_KERNEL_ACCOUNT in quic_stream_send_create().
> 
> For quic_stream_recv_create(), it’s typically invoked in atomic context.
> Since there’s no predefined GFP_ATOMIC_ACCOUNT, I assume using
> (GFP_ATOMIC | __GFP_ACCOUNT) should be acceptable.

I see there are already a few other allocations using such flags, and I
could not find any explicit limitation/drawback for it. I hope it's not
just cargo cult programming :-P

/P

