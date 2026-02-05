Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49783D4127
	for <quic@lists.linux.dev>; Thu,  5 Feb 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295710; cv=none; b=Xaax1U56oC9XQNWJPL7QrZqQ8WksLJw8OVjvZA5b3jxD2ybGKF0YWt5yR19s6LrtLIAvaznfsYlw/4TMahsPumJEgwaBmRqk6KusclwChzrWOYLNuVhxqzeuDSIN3Kn7vZ4UstiIBw9qbLF14k6DlKp2ASgWOqOjM7ZD+D5IMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295710; c=relaxed/simple;
	bh=mIAhPyVOqRDwJMq/L+Fm+xDHGGiSnfR1mZdXuRd6K0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHC4Af/ITV3l4gSj4Px42AMpVhPko2XVzpQIb9LoZjIb3nwZeIYnZMCtG7O6VH8JNooqt+BOp/5jIm0gD3BqjcbaJ6whZ5yp8NETbYqoF3TnlhH2J1kUWoea0APl3l8+OMywTqgZBioQcJ9EpuiGhr4G1+TSkJfUMvyRgQB6ZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c++inlcP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c++inlcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770295709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWd7quC0GtIREsRfL2ubD1yE2knY7YDhEMVXNy1vPWY=;
	b=c++inlcPZOJlMp5kZxO2TsNpPRYsmsWzxnGfPAiTQIJ+l47yKN5JdMkbRWOwFtilsD31M6
	XK00fpoYl2W3051c3kxb1Q3bZg4tTTieB+8faIaJBBHRkMJoHRVy4VZ7umrTFRpYHN9enC
	ah0DazBN+xxxkGgf40ltzwq/SoeNDdE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-X1nwAGrRNmi60K2GHgIhvA-1; Thu, 05 Feb 2026 07:48:28 -0500
X-MC-Unique: X1nwAGrRNmi60K2GHgIhvA-1
X-Mimecast-MFC-AGG-ID: X1nwAGrRNmi60K2GHgIhvA_1770295707
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4358f90fe8dso644200f8f.0
        for <quic@lists.linux.dev>; Thu, 05 Feb 2026 04:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770295707; x=1770900507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWd7quC0GtIREsRfL2ubD1yE2knY7YDhEMVXNy1vPWY=;
        b=Udx/p7NpiSpL5elgudDdLIP5neIV3WH8nNKLniNJ7h5ZRby1P7gMNiKizJZfCYdHQf
         8iiWbcPrb6aMvJwDWR6Gkfgoz7ywwswsadTxSWGAI1VXVG+1BOcw9qYMmzT4iHwiJxRm
         rl1R9KCMXIWR72qmQePdKRc1jcfYMhdrE/pCumxWJX2MsGSsOaEQk+vdLzM61QlCcicY
         sadO12Hjge7QhBXjFDcrp+gM73m6DjIkA3PGBkPOOPaeFXRmra8CXADnSq2xmmW8+gZZ
         hJawI+4ZX2UlRFwaHQOqvtHXXU2TQCwYxcWudvq7NwU7JkF5BYVigZWn2SxsRe+k6jD7
         ufdw==
X-Forwarded-Encrypted: i=1; AJvYcCUYDJQlzmVEGfvgdoHZA5r0TYeGYzABOeFm4CBgYRqUoXylcefxHE2eRj0XhIm4pJ8LMmPr@lists.linux.dev
X-Gm-Message-State: AOJu0YyPZudsY/GRKEbIgKJzuPkvwCKnLc2SuCOCpkpETNkPnPdkfW7K
	S5W6NkGnQtUdrjbJz2IvgmNv2jnOqnQcxuDXmqdK3zpJrr6iUbhotnP1b2MZvhDi4wqNkOfnnPz
	/fDX5HdqoaY1QPtjTss3OY3FjdZQDoTcXbaTRxGCjXDcvdK7tNQJPtXQ=
X-Gm-Gg: AZuq6aK6+nHRZZNW16MsUOZ5aapGVZLuSdhMpJF2vA5UWmrh7qduvOcE8K3TpjApDzL
	om85fhbEYngOhHVfvlCxQccQrH1vVoa8tw2BeAplK6XvXAqnn/e2GnDAforEl+JgX4t5kO/v0nE
	PfOjsatnx1DffPjXAmfg5HAo4RoMyaSfC01Tu4ofePn3H2A5HNR5hIoILbd/glIrzwPZ1IR0bu5
	wFHqm4fuSt2SWAkEpprTavJO7oxHiLIhTRyEqiGfdZFjYb1ckTKIaqtqHJoo8594ZqZyiUxGuMu
	fdsMbUUjsA1BSd+VXHFs45e2UAI2W7jFSPxQnCuZGfMU3WWGnNoFhn8TwW+vRm/SWB72563lf7r
	CkngUbqecZLFe
X-Received: by 2002:a05:6000:4212:b0:435:dbbb:992a with SMTP id ffacd0b85a97d-43620987791mr4703645f8f.6.1770295706647;
        Thu, 05 Feb 2026 04:48:26 -0800 (PST)
X-Received: by 2002:a05:6000:4212:b0:435:dbbb:992a with SMTP id ffacd0b85a97d-43620987791mr4703595f8f.6.1770295706171;
        Thu, 05 Feb 2026 04:48:26 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e25cefsm14701496f8f.9.2026.02.05.04.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 04:48:25 -0800 (PST)
Message-ID: <e9b073b0-60b7-4a45-9b6d-85c15b51fb4f@redhat.com>
Date: Thu, 5 Feb 2026 13:48:23 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v9,02/15] net: build socket infrastructure for QUIC
 protocol
To: Simon Horman <horms@kernel.org>, lucien.xin@gmail.com
Cc: steved@redhat.com, marcelo.leitner@gmail.com, aahringo@redhat.com,
 alibuda@linux.alibaba.com, jbaron@akamai.com, hare@suse.de, kuba@kernel.org,
 tom@talpey.com, linux-cifs@vger.kernel.org, daniel@haxx.se,
 quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com,
 dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com,
 pc@manguebit.com, kernel-tls-handshake@lists.linux.dev,
 illiliti@protonmail.com, xiyou.wangcong@gmail.com,
 andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com,
 matttbe@kernel.org, netdev@vger.kernel.org, smfrench@gmail.com,
 metze@samba.org, mbuhl@openbsd.org, chuck.lever@oracle.com,
 dreibh@simula.no, davem@davemloft.net, sd@queasysnail.net
References: <28a1e36188b1a84193ef2d78f12ecbc0e43ae7f1.1770042461.git.lucien.xin@gmail.com>
 <20260205115423.2195277-1-horms@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260205115423.2195277-1-horms@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yfCGFhUzUc9FniOgPFATuAcp84E4OiS2T0mrdrsTnW4_1770295707
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/26 12:54 PM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: build socket infrastructure for QUIC protocol
> 
> This patch lays the groundwork for QUIC socket support in the kernel.
> It defines the core structures and protocol hooks needed to create
> QUIC sockets, without implementing any protocol behavior at this stage.
> Basic integration is included to allow building the module via
> CONFIG_IP_QUIC=m. This provides the scaffolding necessary for adding
> actual QUIC socket behavior in follow-up patches.
> 
>> diff --git a/net/quic/protocol.c b/net/quic/protocol.c
>> new file mode 100644
>> index 000000000000..6ab81f1c50cc
>> --- /dev/null
>> +++ b/net/quic/protocol.c
> 
> [ ... ]
> 
>> @@ -0,0 +1,369 @@
> 
> [ ... ]
> 
>> +static int quic_protosw_init(void)
>> +{
>> +	int err;
>> +
>> +	err = proto_register(&quic_prot, 1);
>> +	if (err)
>> +		return err;
>> +
>> +	err = proto_register(&quicv6_prot, 1);
>> +	if (err) {
>> +		proto_unregister(&quic_prot);
>> +		return err;
>> +	}
>> +
>> +	inet_register_protosw(&quic_stream_protosw);
>> +	inet_register_protosw(&quic_dgram_protosw);
>> +	inet6_register_protosw(&quicv6_stream_protosw);
>> +	inet6_register_protosw(&quicv6_dgram_protosw);
>> +
>> +	return 0;
>> +}
> 
> Can the return values from inet6_register_protosw() be checked?
> 
> Looking at the implementation, inet6_register_protosw() returns int and
> can fail with -EINVAL (if p->type >= SOCK_MAX) or -EPERM (if trying to
> override a permanent protocol). The calls at lines 234-235 don't check
> these return values, so if registration fails, quic_protosw_init() still
> returns 0 (success).
> 
> More critically, quic_protosw_exit() unconditionally calls
> inet6_unregister_protosw() on both structures:
> 
> static void quic_protosw_exit(void)
> {
> 	inet_unregister_protosw(&quic_dgram_protosw);
> 	inet_unregister_protosw(&quic_stream_protosw);
> 	proto_unregister(&quic_prot);
> 
> 	inet6_unregister_protosw(&quicv6_dgram_protosw);
> 	inet6_unregister_protosw(&quicv6_stream_protosw);
> 	proto_unregister(&quicv6_prot);
> }
> 
> If a protosw was never successfully registered, its list field remains
> zero-initialized (NULL pointers). inet6_unregister_protosw() calls
> list_del_rcu(&p->list), which with NULL pointers will dereference NULL
> in __list_del_entry() -> __list_del(NULL, NULL), causing a kernel crash.
> 
> Note that inet_register_protosw() returns void (cannot fail from caller's
> perspective), but inet6_register_protosw() returns int (can fail). The
> code correctly checks errors from proto_register() but not from
> inet6_register_protosw().
> 
> Should the return values from inet6_register_protosw() be checked, and
> should the cleanup path track which registrations succeeded so only those
> are unregistered?

I think it's easy to infer that that such failures are impossible, but
since a repost is needed please drop some sentence in the commit message
to help AI see the point.

Thanks,

Paolo

