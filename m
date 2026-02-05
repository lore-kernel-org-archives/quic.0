Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BFA8632A
	for <quic@lists.linux.dev>; Thu,  5 Feb 2026 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318191; cv=pass; b=Skn2N+kjMe7Juvku6C1aaJlHrRHFHAw1CrohuJlUjF0Myoxt1Xj8beBq+pGly68XiZrETwWHdwRq77TlyqdQ9fbEexfPWQuZVSqC9m1lEBUIo7ZC9c3hhHzL2f12R/dyyDRxr8NN8ruZh6rmVxXnxJ5+IRx5imGysePJoeKcfMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318191; c=relaxed/simple;
	bh=Sv7j14ymtGLHlmTqP+BoOPCTX/cQqHoGUXoIMpAvOkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFyORZ2d8+D/GLByDItoIcXE4hKdIw74OB8C81ENTYvl0goISZ32XBO1nAjLaOZ45uYvEASOMKkQxv9du+wwPJvJ6WX2np/ej2+yefKOFSEtW6gHzS2YvOaB/nLuLcWyhzUwEEipPg0Ho/yobct8fXnwY8jyapK+XWh7p6by/ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgOttGnv; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgOttGnv"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso394897a12.3
        for <quic@lists.linux.dev>; Thu, 05 Feb 2026 11:03:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770318191; cv=none;
        d=google.com; s=arc-20240605;
        b=XQmEgxbADBshQkUIt4rKQK7oBlVRGmeRSEsCYm4l6Spkiwe+U93bobZAsHEKZM4JFQ
         9s3lgnM8raII9HumrKKGt1pP3iGl4d9TcXwLNcHj214qrLC9Jg8bJ81gYFjfkXN3rdr6
         NNRlpj27/viT6nALmZzlqC6CrQ1JY8nq1YNiZyB/f53ijVsw68hqLg5K2R9NQueWoFpM
         t2AmyuInYUOGs22XalXYzZO3a58v+xAbfH35YWfDZMJ96X+mZbk3VwsetNc8c3OUd11y
         kHI+mkGTlyD4FB4aZD0/2v4Uf3tEZYoT41t4k33AaggFG7agZSQIfx90txiaOJsxX8rn
         uGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wMq2czingLs1wcNHuupFAGOHUrKeCMVUSnWEEmpxoVE=;
        fh=gA/PNvisOyVVc+qZB9xqlDjZAldbX8SI5U9hb9YPfFw=;
        b=GHyj3bl8QdroXV8WdAqMjYVMqp86w6rk7pWoT2RabfiuPTZ5MDH/g3oh5ouwNfPOEE
         vOuV2mzDxHlMAHCPP0g0OovDjjOWTxkaT13jxsikY+mFZmdP4oVYJiFoyAbwJgEGZK/k
         m/tHXKSe5EUvZOqa/gkmE4K9fhnz2uGOFAnoFKQSobeFvf43Jno2SaAhe2t+QnoXG+Az
         NQGZSnvuv8smbpzwKKeOpe86lUMXQMgt+b1uH+QaVQVXeXJDGpMzgrRLhmco/ezh8bYK
         dHjnCdI62d6dTdxtPd4WydfLFbZwkQ0nfvPvSXP1fnfzmUWZjOCDDV4VWEWK08Dtz+Cq
         Ya7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770318191; x=1770922991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMq2czingLs1wcNHuupFAGOHUrKeCMVUSnWEEmpxoVE=;
        b=AgOttGnv/GF3e0kTs9t0jsOnwHLCeiV5MK47UjdtqnSfsTb/uKs04pbR2UE0hZWVG5
         fSH+Cw7Yx8GRXDoI3PS/1CIocDwO380T7hTCd5ODTV/lk7kqJDxIwdIRFtE+EJJF/kMk
         TfVN1NF56O8wUZ5Q5cTjwCMSrEUt7xiiicfrl17k3MxAwqix7TTosjqgn4boVn/dSicw
         GxX2wPS6XHFz7hpc+BhnsJEbpSkctLtPitKv9Djf4aqD2ofhujc1WJdoNDEU2LYH0iKq
         qEn1tLGhSaVe/qcQXH90HKmTnPY7BuXEonK5peXSx/rEjhnWgjYQyJi+yuUETegjUsy6
         dotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770318191; x=1770922991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wMq2czingLs1wcNHuupFAGOHUrKeCMVUSnWEEmpxoVE=;
        b=Uz5qzf8zYR6CJVeqNakadksPLFuZkwoGkScus/8oTmno7V80Y2338xCGUH9cqXbCrB
         ITZaVU0411jdTorauMx7QjkfRCQuLhRZiNRZSfW+3wYVXYOTDIUoW8BuSdBWKCC3rRJ3
         wztlzNsWxzayCrA4QHFcNJotZbFW41pan8MrHlJrgekYAlGjYTh+gtw/v7HITzqPx/1h
         hEtURXQkHaNFX7eAWn56UjDYvl9ea82HkQwFLshznf3gLliRk58eNDMycKHB7HUU9pud
         hfIOw53iVIurKX4qfsCOklFlfsDHsxiC/DuXL6CXqpczFY6ZT0BmE2fCg4uTMS/95ozC
         Ww3A==
X-Forwarded-Encrypted: i=1; AJvYcCUo10sbkxODmH0wNtVKeSB8yWpqJYZaMlQPVDCwVEGJxDZ/f82RvfJ+bIeMTgqUjIANSN4K@lists.linux.dev
X-Gm-Message-State: AOJu0YzjTEtu6rIKxHS81LqVRhNpnCrxV4La+DJl7v0WSdCwta34+jjj
	eL+K1HJD8BTXZVHy7SO94F0NxIZl3vtjXpYA+AtZSv4pob+O4+VTXzTSqYGjmfIrMXtTFCtYiG/
	gSL1irWCiS0lZ/lRiFnFn6dxm3xYrYjs=
X-Gm-Gg: AZuq6aIR5Kxd8eDRgwLmVw5hWAMkdTL9iPjvvhqUaQ/7anEZO4KNE25fp366TJ3TctT
	rG2MECPC0Fj8a+aJihH36r3iDmxCZabWrF1blA7cGiiMC70gIHVYWhBFi+N8RUL5swamHQwVIdo
	V1yKfSY+ABxiVDeqmIeydD5/QWhykBx0NY8MOB1n72q465kPIqPK8YPn+lQCUhuu0zzDnJ1IfMt
	yvQHqUhl3NXbCbea/Vmz4OagsCoZ/x85QJrlcM/mZDw5cZFsnM92QHRuSsqt6vW6EJekB43DAwu
	oiim+/aCBhDkLx1cpsyaMmfdCWqt
X-Received: by 2002:a17:90a:dfcd:b0:352:d59a:b28 with SMTP id
 98e67ed59e1d1-354b3cae091mr42496a91.19.1770318190665; Thu, 05 Feb 2026
 11:03:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <431335747d3604c46f2e57a32d839a73aa8a8536.1770042461.git.lucien.xin@gmail.com>
 <20260205115542.2195362-1-horms@kernel.org>
In-Reply-To: <20260205115542.2195362-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:02:58 -0500
X-Gm-Features: AZwV_QhI8OwuLRWeiqC_GNUtx69lACcTHyYZmGGt6r8v7RB2RzBMyspqQrCybPk
Message-ID: <CADvbK_e8Sbm8Q3KVR=uZZDYuQLTdprRskN=jgompaSeYDkmhFw@mail.gmail.com>
Subject: Re: [net-next,v9,15/15] quic: add packet parser base
To: Simon Horman <horms@kernel.org>
Cc: steved@redhat.com, marcelo.leitner@gmail.com, aahringo@redhat.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, hare@suse.de, kuba@kernel.org, 
	tom@talpey.com, linux-cifs@vger.kernel.org, daniel@haxx.se, 
	quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com, 
	dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com, 
	pc@manguebit.com, kernel-tls-handshake@lists.linux.dev, 
	illiliti@protonmail.com, xiyou.wangcong@gmail.com, 
	andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com, 
	pabeni@redhat.com, matttbe@kernel.org, netdev@vger.kernel.org, 
	smfrench@gmail.com, metze@samba.org, mbuhl@openbsd.org, 
	chuck.lever@oracle.com, dreibh@simula.no, davem@davemloft.net, 
	sd@queasysnail.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:55=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: add packet parser base
>
> This patch uses 'quic_packet' to handle packing of QUIC packets on the
> receive (RX) path. It introduces mechanisms to parse the ALPN from client
> Initial packets to determine the correct listener socket, routes received
> packets accordingly, and adds support for ICMP-based MTU updates by
> locating the relevant socket and updating the stored PMTU.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index cf64a6aaa795..16a7db6ccd87 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > @@ -14,6 +14,637 @@
> >
> >  #define QUIC_HLEN            1
> >
> > +/* Handle ICMP Toobig packet and update QUIC socket path MTU. */
> > +static int quic_packet_rcv_err(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     union quic_addr daddr, saddr;
> > +     u32 info;
> > +
> > +     /* All we can do is lookup the matching QUIC socket by addresses.=
 */
> > +     quic_get_msg_addrs(skb, &saddr, &daddr);
> > +     sk =3D quic_sock_lookup(skb, &daddr, &saddr, sk, NULL);
>
> Are the address arguments swapped in quic_packet_rcv_err()? Looking at
> other call sites in this file, quic_get_msg_addrs is consistently called
> with &daddr first, then &saddr:
>
>   Line 476 in quic_packet_get_listen_sock():
>     quic_get_msg_addrs(skb, &daddr, &saddr);
>
>   Line 513 in quic_packet_get_sock():
>     quic_get_msg_addrs(skb, &daddr, &saddr);
>
>   Line 536 in quic_packet_get_sock():
>     quic_get_msg_addrs(skb, &daddr, &saddr);
>
> But here quic_packet_rcv_err() passes &saddr first, then &daddr.
>
> Looking at the implementation of quic_v4_get_msg_addrs() in
> net/quic/family.c, the function extracts addresses from the packet as:
>
>   sa->v4.sin_port =3D uh->source;
>   sa->v4.sin_addr.s_addr =3D ip_hdr(skb)->saddr;
>   da->v4.sin_port =3D uh->dest;
>   da->v4.sin_addr.s_addr =3D ip_hdr(skb)->daddr;
>
> So sa gets the packet's source address (remote), and da gets the packet's
> destination address (local).
>
> Then quic_sock_lookup() in net/quic/socket.c expects:
>
>   if (quic_cmp_sk_addr(tmp, quic_path_saddr(paths, 0), sa) &&
>       quic_cmp_sk_addr(tmp, quic_path_daddr(paths, 0), da) &&
>
> This compares the socket's local address with sa and the socket's remote
> address with da, meaning sa should be the local (packet dest) address and
> da should be the remote (packet source) address.
>
> With the swapped arguments, quic_packet_rcv_err() would pass the remote
> address where the local is expected and vice versa, causing the socket
> lookup to fail. This would prevent ICMP Packet Too Big messages from bein=
g
> processed correctly, breaking Path MTU Discovery.
>
The code is correct, I may add a comment for the explanation:


        /* ICMP embeds the original outgoing QUIC packet, so
saddr/daddr are reversed when
         * parsed. Only address-based socket lookup is possible in this cas=
e.
         */

Thanks.
