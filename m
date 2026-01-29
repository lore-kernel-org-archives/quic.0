Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DE12F5A36
	for <quic@lists.linux.dev>; Thu, 29 Jan 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715485; cv=pass; b=YCT6rDbZrtdSYNFiDx4FtfzAwx3m/DOd5gtLCDrujhHz/wDQqtwvV2WlgtWIbbN5hxc8wD6MosyFXFxAqVVp0Q+7EW1KFkATh+s0Xa8wQ3PzOF+bRyrMxF9Ly2t5XRzUUgOb7aW37FTO28Q5X9sdF8noFbbCc0EXcSYHvFj0XoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715485; c=relaxed/simple;
	bh=an23PzgT+ETDMUmkvQg/3z0rXD8Ts/s/wrp73SCQ/LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1DIik1ZLtsGb6t9ET4BRL7YK61nKOdOXkgxhFh9969WF3e4X2CoBmxNejp95zo1MD7R/UCG2+2xdtH8bD8DAjKzUAjjUvqDC8ECpBsx+wAq7K4AGd9Mk0+4KB5wD7ofPj1tZey4kCj02i8Wyi2bBLuyLvwFrUJiEkPRAdrqjpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThEBb4Vk; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThEBb4Vk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so1035400a91.3
        for <quic@lists.linux.dev>; Thu, 29 Jan 2026 11:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769715484; cv=none;
        d=google.com; s=arc-20240605;
        b=BCi+ceKjSm1pvfdNsDpfCZ/x/2PvOITdcihIelyrYG9St3ofUw4LV0JHU5GgVKsBXx
         yzJD3nSgO09Q3p1FKZAPvkg9bY0GIDd0J+K6ANIpNqAWqwk4BIG8ePKvuwZZreou3T9K
         NIrkzbdNX2dgcSXOpG1g6r38jDHCIQFHeSMxEIUQ+rP+V1RWmk5zK8rz8TCcDwvIesRs
         uCXT6jOg986/KtFRayuMo1ONFM6faJ0SUYtwlxVrLu1P2h2h9CWfJJ/evVHOJs3JBYaI
         LCR7rc3w5MABi6C6Fl/vuSoFSgdxjYqQFve6rvIxl68a/R6c1LhMC9I0mZFGCw+DgskP
         d7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8jgscGADAtGExE/c6eNO9k9qz7qLCMhugDMGIDtgfTs=;
        fh=dd/DZVAGdrDA+tc5DaQQXkMIHGEn169b2aDBGMXgi3g=;
        b=NfurgEDEQ/vop/sUiOYwXnpZZNcU9HIsUApDOlS4XeUX4kvf9e/1FV2YJ2P73/cc76
         UdRvQ1dfFe8IuXw1NXZy5uV2zOF+qJh1EHuKCBizd7PxSrBFEYehmma7C63YRlLY+1no
         I2yXlX+5YCIlp6luSOBuJorlpTKzQVVqFiTq+msSmSg1uwdWQppnq7V0rZXqn3W+HEK5
         rRlI3HI5IYoWp56K1o+gLwi868Wn+RlHSZuSDMWqBWPFatdn1OiPfqO6P05aqtEOiEjj
         dTTUiahTdVPCmVpRHhuJO8ElYNQvaeuSRcyLXHwMqxNEa/DxBHizDwXg6gH4aVm9ez0X
         TxZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715484; x=1770320284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jgscGADAtGExE/c6eNO9k9qz7qLCMhugDMGIDtgfTs=;
        b=ThEBb4Vkn17atQKEgsp35euGNDMUoEz0PIRDKkiOTN67PxMIUbstZf9kflWKMLFFg7
         n0YKD6QTMfm5h3SkeAtmJjdLKyJukZ96nTRXsgZgq8UsyfUlrRz6Fp/K+pffyLaCc5BN
         rldU99lTTjfUsMYL5HCxKEMEuGghCohrihnrPzDQmzKag9nE0xFf8YYixrU/BLFpPtJM
         xDBXWr9DxQAiA3h3ues84LbvDzxhQREhoAnvP2d2iRZwcZabLtrDwRxXaPatmtLGGhxB
         QDQGPpIIzW+THOapFGQmyFE7pW+4p7pRanOI0utMIasKJeteAdtIrMJKm07GJ1Lt2/Bb
         hKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715484; x=1770320284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8jgscGADAtGExE/c6eNO9k9qz7qLCMhugDMGIDtgfTs=;
        b=r7GQaCnq/uEU2bd/8WnOi8wvhy6f2mqWFzYpzm8fy82UfVnmIOJf+E1tTu9EIOhlw7
         swoipIIhvLYURU0Oz8E4fQMHnmg64SvHcq5SRGA4iC765xyL35WhrHyyFRdxsTHpXTmK
         YXU8SPwIptjCUZjbj10nr3Tx+VZXtTlqg8PFDprLLgSxnp3yTihTBfA8w8qAP2taPaDH
         shCdJ6ejUGzmR3NsgtN26cpbdja8LY1aDFTPdoB0Yeq882HwG51oqjMYFG6WH5jvNFEO
         8p2cqTlLkqHxmuQvasQjq0w7E79GvwOCk0r38w6SwVFezwYHUX1npWfOTJQdgYYGIlF+
         ZSLg==
X-Forwarded-Encrypted: i=1; AJvYcCW4wzjySv25Skb6bjn3NZBGKaSLP2PR632Vb+6AkSL1UHjso6bSfr+edwij5Zvt0PNeYVlu@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz37bJxmEVmr/5h0kej3wrfIBvXG67JDbrnNIDhslSBYq4Q2Xl
	aEAat6bXFFuRkkJOA4w9scEiOPQXELKwlFWmaQohTZHN5SFuZvnrsAamWARh2P0c5ofW34m5fv+
	sjQwgd+LZ30dUB0V0noW42B1XOoaOdiE=
X-Gm-Gg: AZuq6aKzxeBecEXj+wJv9hyhm48fKeebVy0GPiHiR+k8MsBXQEZL9/NvKgUgXji201R
	qKqlCsy7nC0+kfiqN5l+7jwypWDIXCQXKmdL2CsNFX9OZrjnZfoiPP9SO3XZaNhYUZE70SxeeUZ
	nG3jg7L0VgNAkGD154Y3QD2cI0uFFTC731X01jBaxh2EN0wv+R0fJOhPBdIdB1LXDylCQDsGYoC
	tsAxdxkbvmKtEk9WMaz5xC4QoJeM1dCx2uf/9sLtdpt7nizzjwHB9w5F5Y+WwaSZnrr79yzKM01
	7oJaSKUaBAVGYUWQ/mNBL1Gb2qbSOxXdBLgQgHoy
X-Received: by 2002:a17:90b:2e10:b0:32d:a0f7:fa19 with SMTP id
 98e67ed59e1d1-3543b39c961mr584686a91.17.1769715484009; Thu, 29 Jan 2026
 11:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769439073.git.lucien.xin@gmail.com> <46f93cbee41da1e1f7b7f408b17915fd93b39ec1.1769439073.git.lucien.xin@gmail.com>
 <bbbaf4e5-1c31-4c84-adb4-dbb94b8d07f4@redhat.com>
In-Reply-To: <bbbaf4e5-1c31-4c84-adb4-dbb94b8d07f4@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 29 Jan 2026 14:37:51 -0500
X-Gm-Features: AZwV_Qjv2qurpUKIB7y-u0yeOaDoaz7ma2YS0Xi_VtbJ92jOQ4X9Nw-fNxtkIAs
Message-ID: <CADvbK_eHu0=8G7--neMHz5CDT4_MV-MONRu8obOsYbUhCc1ocg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 15/15] quic: add packet parser base
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 11:53=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 1/26/26 3:51 PM, Xin Long wrote:
> > +/* Lookup listening socket for Client Initial packet (in process conte=
xt). */
> > +static struct sock *quic_packet_get_listen_sock(struct sk_buff *skb)
> > +{
> > +     union quic_addr daddr, saddr;
> > +     struct quic_data alpns =3D {};
> > +     struct sock *sk;
> > +
> > +     quic_get_msg_addrs(skb, &daddr, &saddr);
> > +
> > +     if (quic_packet_parse_alpn(skb, &alpns))
> > +             return NULL;
> > +
> > +     local_bh_disable();
>
> Is this really needed? If so, it needs some comment explaining the
> rationale, otherwise please drop it.
>
It was needed, as a spin_lock use in quic_listen_sock_lookup(), now
it's changed to rcu_read_lock(), maybe I should drop it. will double check.

Thanks.
