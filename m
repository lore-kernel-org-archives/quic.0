Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA71E0E1F
	for <quic@lists.linux.dev>; Thu, 25 Sep 2025 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815417; cv=none; b=G1RZhOraEsL1mzraRC0JppaIFlaJSwwKlXm6Qdo+9av3QqsMUjCmvdeEmv2S4qyQ9Bb9BCXPuEl0Y1hrXRkFAIuGiDz/F4SJU4KLl4rHAcjs33wuc309DE2UgX5ZbDhQHqhN84WdatfdMefh427rzUFUIknFhtjv1orafFcv2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815417; c=relaxed/simple;
	bh=6U561RsZS+7ehXxxbAaXaCZdLb/rf1WSXkRONpEB64k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxOHghL3NiOcY95L93tG6uQ08dUwrD4R5+ua7kBRLJL4KvUEIs8TiAsLQjZp/bH28et4D+Cqw3Xm9Rb/BjL2mp/R58AXU+PAOp4U9w/F7jn6hY+F4bIUuJErfJAnLCc6XPUshxz5EWYJTkftni3cTBHBoCKtSXa8LLwO3HisFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f/lxhIT5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f/lxhIT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758815414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPOIdtGuD9l53wCDZgvs8CoLuOUrw0SyvwaoNtPWj00=;
	b=f/lxhIT5Pu9HHugrqnOg/sGfGsJlZF6xuEwo/F7FNWkZ3VQDTUOVRn+iFvtqBWAhasXQJp
	3NDeJn2Zf1YKRyhw9lT1dAm2j6PhXul1ODKN9JAWlele3e+ZkATclWKykZeArh77c2D94R
	dRd+xIEyjR4qpaw55mCuZmbsld9OkoY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-whcDJIjENsaKLraD-lgEQg-1; Thu, 25 Sep 2025 11:50:11 -0400
X-MC-Unique: whcDJIjENsaKLraD-lgEQg-1
X-Mimecast-MFC-AGG-ID: whcDJIjENsaKLraD-lgEQg_1758815410
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45f2a1660fcso9612165e9.1
        for <quic@lists.linux.dev>; Thu, 25 Sep 2025 08:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758815410; x=1759420210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPOIdtGuD9l53wCDZgvs8CoLuOUrw0SyvwaoNtPWj00=;
        b=PhtjrXOWldhjbs7GXAaV7EZelVYJ4BMQqwVbD0/QVoWASY2foxZpdWxgB+n5pU4HZV
         TLSkCuqeB8jxFq8nbOUtXIybLdjIiGPoY5c2tXiDDexV9eFO6Fym0CUa/ghViH36ImQW
         iPlV+oZYRL+mYM7yisnq3TeOu8dLyFFAPsZ5OXljp5bLUZQ/SobTKLYMvi30YopqoUkg
         mdrkghuW6IobSToSqB4LjCQL5ado8D8woJaKXgSlD/Wr2duD7ksvp+oORix6wUc/fLpw
         PEAUCQ5hIwHOmn7ZR4BRYNeS4xXJyhvrRLOy7oo/WDjx5yLXdh593a7EnJoXVcQddzdr
         KAIg==
X-Forwarded-Encrypted: i=1; AJvYcCX1EB+maPv2o4vMR1h/hLAGFW9nyYekERNJ1M896yfn1o1Xiw+BREnCffFfKFauPNwpin4a@lists.linux.dev
X-Gm-Message-State: AOJu0YxOeBiN/2Qz21yZV4SeGS5jn7cs3WOxmH5umhS8jk9Vno5a1bUk
	ca0SK1tAHiQpAI6MLFqBI/rpgcexOMkMiDCEkJJeVqcPMWrYppDYnZAJFlWI6TllS5Su1ghmIy6
	nSF0ZGEdZNi7MOlnx0Ie3Rm/DwSJctUV/2nH+VW3qZDI2BdwVPQs9uvk=
X-Gm-Gg: ASbGncv40xcMhzgcVmPawtUsXb3XGQNRYBEuJOKmxGLSZ2xFRX0oSizjwJOjb5e1caj
	rCiY4553CKEVO6ZGkJtwEcyBuCi5C9w7oM5T+ILlkL5FRq4eVgfHNVxUK5z744q408pKaIiUi1B
	SdB53C6NQieYOdgd2e4PMY+cEzY8ketry0/FUjjHImSK8qdIkwPeHiIA70paw8vjkv21r2KQej5
	N+Z2fCDAdERHm0rP0CgMXQuGk1x/Xuj6B8zUu7D0PLxvyfHg8rIB4L468baELIXRm4YRQfym10Z
	qJEMceZSAES4I1qDX/d5FmzakkGJ2z8AaNo5ziIb4wOpHI793ie7Zj5GltbLC8jvaMM+LmgFuyW
	C7JL1Mg0InzEe
X-Received: by 2002:a05:600c:1ca5:b0:46e:2637:d182 with SMTP id 5b1f17b1804b1-46e32a08feamr49009365e9.28.1758815410232;
        Thu, 25 Sep 2025 08:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFifX77hGxL2O4FYAU+ptB+L8YPLKwsnLSuT5OPi4ABcaTgR4jE6/4IbKEl3gD+G+IQTmbShw==
X-Received: by 2002:a05:600c:1ca5:b0:46e:2637:d182 with SMTP id 5b1f17b1804b1-46e32a08feamr49008725e9.28.1758815409731;
        Thu, 25 Sep 2025 08:50:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bf6ecbsm42448815e9.22.2025.09.25.08.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 08:50:09 -0700 (PDT)
Message-ID: <2152c576-68ce-4bc4-9658-bb1e8ccce423@redhat.com>
Date: Thu, 25 Sep 2025 17:50:07 +0200
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 03/15] quic: provide common utilities and data
 structures
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
 <a7fb75136c7c2e51b7081d3bff421e01b435288f.1758234904.git.lucien.xin@gmail.com>
 <871ed254-c3d8-49aa-9aac-eeb72e82f55d@redhat.com>
 <CADvbK_e20TrcgprXmnZzvoEO6yzoo4Zx7B0qFS0kQPT8Sf63LQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CADvbK_e20TrcgprXmnZzvoEO6yzoo4Zx7B0qFS0kQPT8Sf63LQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DTi3iVvmRgsKjkQ6T6IGDfkz1WG2dMMa16aefQetFUs_1758815410
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/23/25 6:06 PM, Xin Long wrote:
> On Tue, Sep 23, 2025 at 7:21 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 9/19/25 12:34 AM, Xin Long wrote:
>>> +static int quic_uhash_table_init(struct quic_uhash_table *ht, u32 max_size, int order)
>>> +{
>>> +     int i, max_order, size;
>>> +
>>> +     /* Same sizing logic as in quic_shash_table_init(). */
>>> +     max_order = get_order(max_size * sizeof(struct quic_uhash_head));
>>> +     order = min(order, max_order);
>>> +     do {
>>> +             ht->hash = (struct quic_uhash_head *)
>>> +                     __get_free_pages(GFP_KERNEL | __GFP_NOWARN, order);
>>> +     } while (!ht->hash && --order > 0);
>>
>> You can avoid a little complexity, and see more consistent behaviour,
>> using plain vmalloc() or alloc_large_system_hash() with no fallback.
>>
> I wanted to use alloc_large_system_hash(), but the memory allocated
> by it is usually NOT meant to be freed at runtime. I don't see a free_
> function to do it either.
> 
> If QUIC works as a kernel module, what should I do with this memory
> in module_exit()?

Right, I did not think about such case. I suggest using a plain
vmalloc() without the loop than.

>>> +/* rfc9000#section-a.3: DecodePacketNumber()
>>> + *
>>> + * Reconstructs the full packet number from a truncated one.
>>> + */
>>> +s64 quic_get_num(s64 max_pkt_num, s64 pkt_num, u32 n)
>>> +{
>>> +     s64 expected = max_pkt_num + 1;
>>> +     s64 win = BIT_ULL(n * 8);
>>> +     s64 hwin = win / 2;
>>> +     s64 mask = win - 1;
>>> +     s64 cand;
>>> +
>>> +     cand = (expected & ~mask) | pkt_num;
>>> +     if (cand <= expected - hwin && cand < (1ULL << 62) - win)
>>> +             return cand + win;
>>> +     if (cand > expected + hwin && cand >= win)
>>> +             return cand - win;
>>> +     return cand;
>>
>> The above is a bit obscure to me; replacing magic nubers (62) with macro
>> could help. Some more comments also would do.
>>
> The code is exactly from the commented doc:
> /* rfc9000#section-a.3: DecodePacketNumber()
> 
> See:
> https://datatracker.ietf.org/doc/html/rfc9000#section-a.3
> 
> I will bring some comments from there.

You can quote or make a synopsis of the RFC where it makes sense. In any
case, please try to reduce magic numbers usage.

Thanks,

Paolo

