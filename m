Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0B44A730
	for <quic@lists.linux.dev>; Tue, 20 Jan 2026 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919509; cv=none; b=un5CkkjWhVNM3fVGnVTMl8GV6bOsDNgpkqbohp6kVsGi4FZLAgZg0NyBYfdsheSe2AzOiYVjx74IP9EL8XFthPAT1/Ib76UmRq4fWJ/N/FkYQcQIUAFTPU5kYt6opGTVsaSdUNgajtCco6yvsMuh29MhWVl2xtlPZAh4P++Ca88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919509; c=relaxed/simple;
	bh=f11dCp7P6vtG0fXeypBN/abvJwiZ5XOizrijrXdkHk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AP9wIUKg+LRRhz4YHpi/9GtKJo24PSJLzbU/gLj94+X/swLlG1BeBRzgylmg70xppIoiF1xtwyAgWnpjfcvUinPt8XVnt5IjwYIhXbFOr0IqcU5OQglNwKFBahZtcn4Gmpbyd63cQ58K0GOo93xCjHn2mJCTSE/JMJM/A4mFUrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QDpR2jyW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QDpR2jyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768919507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trifWfZ7aWYVX11q/l4Y4wctobYfLQu9Hbg9myXq/us=;
	b=QDpR2jyWKsGAVuOMuC9veyhYQ1+INrSXP/I/zQCklN6QiXtKTJcqQOW9xEuYsBKCuuvTyj
	mIcrUmFMGJT/Qj4OXqPIv9R9TjWqXuF9Yu4p6jpTs1+oAMbQA6q0nTWaEBooyG6dQBYDg+
	vyRKU62qpWh616bXTv9r71WYPFdi2iI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-ocxpYrCEOKO7SJAGM5WEoA-1; Tue, 20 Jan 2026 09:31:45 -0500
X-MC-Unique: ocxpYrCEOKO7SJAGM5WEoA-1
X-Mimecast-MFC-AGG-ID: ocxpYrCEOKO7SJAGM5WEoA_1768919505
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-430f4609e80so3722143f8f.3
        for <quic@lists.linux.dev>; Tue, 20 Jan 2026 06:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768919504; x=1769524304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trifWfZ7aWYVX11q/l4Y4wctobYfLQu9Hbg9myXq/us=;
        b=A9po+tAUSZ5o3kLUI9hv2zKoSKfKC2rzu3GBukm4VvdRBmLv3wqm5yjav5EiTKBHHF
         CfLXSyPE5YMF598ZgdytI71FSsZMaffbTGEJr7Pj3yWF/EGPhnlNPODb6Rv6WENfTnrB
         3lZVvg8/+iyKlLoNGg/qq9dkJjk6wRhXl3o6huJ3un2Wcme9w+iV3cZ0nojHdGvADz14
         iBDtVBm7j0h8pDx64xcNvLv9gCnhMOcRxORvA8yxTjGSv0dDHoR7HiA54cl/4zOO4Lcw
         mfuALjdG2J2HtkSO/6PMEPnBA4Y2TAZggI2PSMHJ9SXMB25on0Lo9xC3smUeSMe7ASp9
         Dddw==
X-Forwarded-Encrypted: i=1; AJvYcCW725gK1NHX5jXVROdtOT2y8JqhdY4kPDm+FYiuLdKvGqGIwEq7v4gHG1tljtud7aUfjTdt@lists.linux.dev
X-Gm-Message-State: AOJu0YxMomJOMJgNnlOBFosJTrW7QGRCleOyaWuxXRyIp9qSQcv3a+Mc
	Dmi2ArHmS8jCgrTcV0Q/X1Haw/lT7gAR6pQIXwdDZ00+JvZG1kwopmt2yykYGGKQbi8JcisSNai
	oOmCHau8MfYu4YA+3bk4aVcvwsiv1WkMen4PXmmazWwBf98tbAFUMRqc=
X-Gm-Gg: AZuq6aLWjg1jhDWhqhFec2xnRBaKxIBkrDW7nJW5BO0oyjvMBRsO5htPhK00t5ha0Rc
	Kjv1FAEmjwuAdH0hGy1NM4z49aOFEuj9Pl8UEteE+juw18YWJFLhZvNB1GFeQ5Lyul8nMB0Vsg5
	U2cgPHV/FOVNn5c47vI3L7XGxnwRpMeIA3pUG8cGM+ASz7eF0jInEKTw8lSZ2abMKOqt4oBwDd/
	hxKW5piuRDKr5b94D9A5uruo7+poTveFiQrHPg1VyOP4X2XkyMQS1I1WBxsL09i7nuF1UGUqzIf
	kMHEveGCkck7Ms+QK4Y61DJ27E0rhxluTidUEgTMf+zcZW1lsTrz2LwyH00HLuqbrPh2fBVDfpP
	rBnylnAcRxRSo
X-Received: by 2002:a5d:64c4:0:b0:431:488:b9bc with SMTP id ffacd0b85a97d-4356a026502mr20090525f8f.10.1768919504561;
        Tue, 20 Jan 2026 06:31:44 -0800 (PST)
X-Received: by 2002:a5d:64c4:0:b0:431:488:b9bc with SMTP id ffacd0b85a97d-4356a026502mr20090480f8f.10.1768919504090;
        Tue, 20 Jan 2026 06:31:44 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356999810bsm29866110f8f.40.2026.01.20.06.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 06:31:43 -0800 (PST)
Message-ID: <001178f3-aea1-4886-92e9-1012ea6d6c76@redhat.com>
Date: Tue, 20 Jan 2026 15:31:38 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 15/16] quic: add packet builder base
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
References: <cover.1768489876.git.lucien.xin@gmail.com>
 <e4753dbdd12ca45edef6815830c1bd437bd635bf.1768489876.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <e4753dbdd12ca45edef6815830c1bd437bd635bf.1768489876.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tBcOQoGeHLg8wpcn3a-E_c5LtOR6W35y5jqJsRDX7Cc_1768919505
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/15/26 4:11 PM, Xin Long wrote:
> +static struct sk_buff *quic_packet_handshake_create(struct sock *sk)
> +{
> +	struct quic_packet *packet = quic_packet(sk);
> +	struct quic_frame *frame, *next;
> +
> +	/* Free all frames for now, and future patches will implement the actual creation logic. */
> +	list_for_each_entry_safe(frame, next, &packet->frame_list, list) {
> +		list_del(&frame->list);
> +		quic_frame_put(frame);

If you leave this function body empty and do the same for
quic_packet_app_create(), you could additionally strip patch 14 from
this series and avoid leaving several function defined there as unused.

/P

