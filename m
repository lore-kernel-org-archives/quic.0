Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6182E8B97
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257008; cv=none; b=IT6qOzG5nS7FLptMoxKTjAXr3Xq6IDZsLXFLWUEib3mkce2J194mvD+zdXLTxVs17ESqFNBLV+/Ob4eb5CBAtiSVEWcTKsVI1UQj8cYvYQXDPFVbnXDhk/3LkDmIKcEd+AYkq3wuFYpJLhaSXkrYuradcVpx0Q2LJQwwJbNUyt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257008; c=relaxed/simple;
	bh=cZ5gDjz2QbKshZsqDifQYTuFk5BFj4GdybCog3FXEJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kt5lHT0W8tVt7Fi8PuUmVWtIWJeSPMrxkw+SEdzsqIoeOwa54AUhqUPIr+52as7WkiykA2n69nzJkuWOOG68l7zvZBNTS9bqInhWUDhZAnRySJlE3SVW/VXhmMMQakGMPJ17ln3W4FbAr4B7x6Sk6Vm1Zf6Gv3dO+zq+ZqTs/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUgJZq4/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUgJZq4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762257006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7NKqzRwzFTMUyXUXOrE/y+2M+CzQozAf5NhVcAFiTKA=;
	b=XUgJZq4/Qr6aB6gfsgi76iGiWacQFkazbKwsaFmQoUmQQzsDhafk/kelJpHB/mh7BbClqp
	cYEwjylmPur34lka/aacPLBiUIF0S3T8LsqfFfbCwVTUnS69YE4vsSEjztQLbjyYXOpKD+
	bYs2YKAEI9LFyENqq2i2u1USjv7VSq8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-otASKMeqO7Chg2zrWAacpw-1; Tue, 04 Nov 2025 06:50:05 -0500
X-MC-Unique: otASKMeqO7Chg2zrWAacpw-1
X-Mimecast-MFC-AGG-ID: otASKMeqO7Chg2zrWAacpw_1762257004
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4770eded72cso19925645e9.0
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 03:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257004; x=1762861804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NKqzRwzFTMUyXUXOrE/y+2M+CzQozAf5NhVcAFiTKA=;
        b=tsTzYs6Eq7FS84dhwv3FsEb5iBG9Xkr1yLl3wsEpfCuQOj4dqdhveXj1XJGOO9SRg8
         bkEPaCC98gICw8JrNb7EP1rJ/lNJs1L90f8yWkrC7YAXC+WFvxjVRnIzWJNzDhiMkuTM
         qL4q5KNtKRW+lZBJR3tezTqdh5ZoPorLLs/vCKY+abDSl75YUKkVB9/gdyQ9WClY/WRa
         VT2o2R3NHHzth3kP4z0dtRQpuMPBTw0pbgfGhTIjJdOiN1jDq88+K8TLphk4CXFifjqc
         WvlToTEsT/o01ddg5y2V6GC/iwfyVyhspn36jS+9FnwIZoShrnRmjWg7WdgCM/9TATRd
         ZU4w==
X-Forwarded-Encrypted: i=1; AJvYcCUINbJp6dYv9K0uPRaC8DF0tiyY6WgCmcFB9Rd9p6nohc61mOHhGyhNgBEesLLAlM4216py@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr4Js2xPm2jfr3IQS8aGNuxgDAYWZdDgbma7j6WXDAKqzsAQrL
	V06I0GiXYoVYBYVB389HIx9C7CMWaNnjcjLGsO/rV0n5TeDyHqZnCGiFvgcYgfTlD+MFWPgduT6
	1X8W4wJlWgaNzXvWrGF1Szg6mRtxNQaO5/tngnQ/p8AzkIub7M4qWkdU=
X-Gm-Gg: ASbGncvcVppkmOLI9XpRCOYx8ZkDdWeAtOh1XRlGFDqfd4bywAqLUPl+RrfSkQT7nSi
	Bl0FaFrwQSkDnm/dETNqn4Lzk2bUNmQhS4QPHTzXU1YKLDLVE6FfxyU3cDnaVnDrqaaUFz0gkT+
	1YdstDQdyKURbMt4n+QiW7B9FQg3ADVHNgHaxjqLPSNChe4NagissxnwIOCVKUp95Yxq9Vz127m
	HciaQHyIyy6xgtXPwx/8zb/kfZJ6PNQQwrBwo30XlHJL9OhlLHJagguuOiDh5j0ZuN7dtRExxPH
	L4BPdsKJPDnJu4+gGNLckLsUSIma4du5UnXjd4obhsmr9kQNPrb6Jab1BiAQdkkv/OfLeMvYrwq
	ZFJFv49fo0LtDLUkxYtL5nBzZ3aDS56Yi5YnSE+SIIbHT
X-Received: by 2002:a05:6000:2889:b0:401:c55d:2d20 with SMTP id ffacd0b85a97d-429dbd3c7bfmr2751745f8f.26.1762257003787;
        Tue, 04 Nov 2025 03:50:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFrHCmmk8I9jZU38ly0GkES+iMhlTFtfqgEF6bGR4ojffkjtcXHlyZQ+AKtVRy8Dar+aGGTw==
X-Received: by 2002:a05:6000:2889:b0:401:c55d:2d20 with SMTP id ffacd0b85a97d-429dbd3c7bfmr2751707f8f.26.1762257003406;
        Tue, 04 Nov 2025 03:50:03 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc19227csm4291317f8f.11.2025.11.04.03.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:50:02 -0800 (PST)
Message-ID: <914b0331-8fab-4ad6-a6a8-e511a4352cea@redhat.com>
Date: Tue, 4 Nov 2025 12:50:00 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 08/15] quic: add path management
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
 <0ccfc094d8f69e079cc84c96bd86a31e008e1aaf.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <0ccfc094d8f69e079cc84c96bd86a31e008e1aaf.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d1dKL-uj0tbNVMDIygnZfV6tPh7o-pe10jV9sqEj3w4_1762257004
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> This patch introduces 'quic_path_group' for managing paths, represented
> by 'struct quic_path'. A connection may use two paths simultaneously
> for connection migration.
> 
> Each path is associated with a UDP tunnel socket (sk), and a single
> UDP tunnel socket can be related to multiple paths from different sockets.
> These UDP tunnel sockets are wrapped in 'quic_udp_sock' structures and
> stored in a hash table.
> 
> It includes mechanisms to bind and unbind paths, detect alternative paths
> for migration, and swap paths to support seamless transition between
> networks.
> 
> - quic_path_bind(): Bind a path to a port and associate it with a UDP sk.
> 
> - quic_path_free(): Unbind a path from a port and disassociate it from a
>   UDP sk.

I find the above name slightly misleading, as I expect such function to
free the path argument. Possibly quic_path_unbind?

/{

