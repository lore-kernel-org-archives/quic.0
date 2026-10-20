Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792531995;
	b=HhvGQV6bBUMuKMEz2G96vaKnrr5UkV7HDSGRijpa+Z/MMJK2YJZzbNwb2pFBtPrEs5Ks
	 PBPGLQUtR3oz5Iut6kJ8wWhs2Gn+2gffp8SewP6WAm8Qfv24WNxFNU99DnjMFjhRdWu4Y
	 WxpLsqr8KPzK4jhjZAwiQz8aNwgcijAvlEbh9oyol7Y6ZjCz3g42tudUxsM+0AaubJ+Lf
	 kH0gQDU64qikSJKcrr4XTMO0YpTfjvYDPUVB5E2WZ1MZ/Pb1xDCWnpSLsSgtgTtWrG2li
	 M7foj/QHjMnWGuEkoi+F3Dxw5yxPhuTXmdJzHpbKl3YBoZQMCaFikJ4kIO08etqj2PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2AgfGA8Z+ldUgBgGgA9RrGOTzaa/n9KB7xtFx5qm7gA=;
	b=KuSmVOTew6mVocn9a60OLq+/BZ0cH6X5trDkKD19xLtz0CUufS1aXmFwk8P+MSCY971d
	 Af4x8A9TAEI4EjwHkomTBncBFxYQES7tguVGcrUH8HMhtBFhmSM9d0bNFgyQtUESRjcV7
	 ps+ghMcX/ISXJ5YnMYb9RS+FHzCHT3fGGKjJDQ8k/AFYphBvdaG7milxr1P5wmMbFc+S8
	 Ds/6yZNY6El2ANp8rnHcb+N/gk0AfO3YSro2eGYoY83UgbDNceIbLcOZzGdZxK+BTmMLZ
	 tVgNZ/qTyv5lWg3mUXHWnE0qxSlDBRTjnioiCFjt2iThk4LsXu/Pzk1Ia5y7daPme9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HgzAe4mP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE1606A31C
	for <quic@lists.linux.dev>; Tue, 20 Oct 2026 21:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HgzAe4mP
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-868b3248b2cso38224b3a.1
        for <quic@lists.linux.dev>; Tue, 20 Oct 2026 14:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792531994; cv=none;
        d=google.com; s=arc-20260327;
        b=lbag0XQb85K1dhxDYiNHE1xrEDxgOGxsVER4DJggr4gAGDjfUXnNc+G2GJLzfUflj7
         rpM9UQ18ywnheFgZrdlEEHLhkAc+JoYtfMj9oSR08IaKKr0fSM5oliqq/90tKhZCLcsS
         fQJnk5hnOsQCA4kypwsip8DB7iQRLBZ6ekF3AUpRngL/N5o7LkVyHmTtsaNYYKLPYRiH
         Yl3Slw8anQ/CjR/KXvmfLzp5PSCMBvVNpB8KdfjIsKDcFxMs/tk7D0YG+ibt1rBzLiRK
         xlhs4CUeIH4u0AN7SjK0VZ1Zz/IJAZsBG++Yw4/RZdk5M9HuhLWsEK0rnvQm8TyMzyY9
         XqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AgfGA8Z+ldUgBgGgA9RrGOTzaa/n9KB7xtFx5qm7gA=;
        fh=gTi152VxSmh7t/Wi3ces3tUlVGZihc5uOszeefdG+oM=;
        b=gyxldawoxnz3GSWQAjcFRnSPXHqHgRKyZdV0LyrJUeiGJz6mrljpYImTRlX5KUXKMl
         Ytwml3egpRjx2Eepm8cZF7K2u7tLnRJYnE8QP+3lCQEbV5G9Q9M7t7vepgcvlLEnF0oq
         LzTHHEFu07j1z54NSjzK8Qo+RY4BYYYhWQscGQvpmoVDIf5kh7eV3Ji1c0080Mzvo2K2
         1t7dKsBzEuQhAR1yIyg4nY2AvsTecmpA4oB+HliX6uuqGM/jKr0eBNQ3uogxwCOxO2jv
         vn4clCse3dNW9yWszaYhmeKInnUAGq7pAi6cHB1kvAP6G2qbajLNhEOgm/LARSdXcYWu
         2j3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792531994; x=1793136794; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AgfGA8Z+ldUgBgGgA9RrGOTzaa/n9KB7xtFx5qm7gA=;
        b=HgzAe4mPFlHLQp8onHSEyIi1UY+NGkllpEJrmSepHN57Y+Qdau2KwrkLnX/sWT+/1e
         H8dS3P8qDoTDf4U4AWFCZLOWXTD/4cJPRvCNrFTcZwqzI3d3PBXmLh04NXv/Mhjw2uyz
         8+PpyoZPcewxeCqYF2EnBxu8zY5q/gHknZxB3QqFBBlNVWUP4rnWnYxQV0robbNNgFpR
         EPhTjrPjouQ5LvRzYA4XQ0t81wzkx1R80XD9PjOQTHe3Q96emFXPeslNTOyx4YLWyl7h
         NzLf4qg1ZoE6Ix+XZPuqfbPDg6rWdnQ/hpcQ4UHx9wJ6VZPOxbNxLT7bA+4EocFNo3Di
         mP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531994; x=1793136794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AgfGA8Z+ldUgBgGgA9RrGOTzaa/n9KB7xtFx5qm7gA=;
        b=eI8Wqf/rLeDoIhzqpCYkvn51znmVi5IRcu+AFy0U13mwL1vrwqzQxwpUeKDDvRen/+
         v4T/zi+/pV7mdTxQoU5p0rgsqPJF5D7sY4HaqdJow1JaUTJ5xDSKuKNNnPSZGrYcSQi2
         jpQhx/qh21M9utrdbKqbWypD9BHGMtGOc6vs1KiHs4A0OF1jEpEqUy+HdsFucaShgMqG
         p3x/y99EwXMnNFcEdt6TlwvJPvAuoKdxLfgVxDrFAc/Up/BSwdrVhgqUd3UENWPtCVwa
         TOYqLOdRvnXDELr5SKrObKerZxcr+gf4OAlEUOPAE++gl/wrG8JqEAsr3YMdM76gaTZH
         fRDw==
X-Forwarded-Encrypted: i=1; AKwUvBzNNoDJbybm7It2TGKhumIwy3f0JtG8BiSrHzwMEd+aIjLa/QtIBqKT0FQKq8Zq+nSzk60l@lists.linux.dev
X-Gm-Message-State: AFq9FYI8DyDXATHJeX+u7vV4/NPQBc6LTAbPO0n+vvNYXq/N84/POoGS
	Y53TNmfsNgNWI4IC68FuRlKQbe/9JUt59ucokDROo88wxlq8ME2QIsGGblddgm5BOvu8VhMPZJi
	KuZxz4zI95OllW1Gf+WsppsR8BXRDS+k=
X-Gm-Gg: AYBFou201t4h6C+MuUalmTehF/cjxA9RMT1ZXpICkjWwYut7dPpNi+ln+0ZUnN7kMU/
	kdvcIJN/1qs68rDUx+WGZkeo4kM06dcyFKxVWTlobhfMK0Jdg3C+K/Szdh2T+BIJFXVG2mBAtNw
	NhaUEjqiw8zHWWQ8UjvXdLRflpOkbydiT+3xhhQmPx6ChIz+ZBBAVKkMMK0Wp6Ysr3ZeescMOse
	MtdrTSutR5Z+HVmWToAwKO2iHeT7x9FDwarEGld6oFZ28dI5waoxu6h5aFXjXxyJZ3A/j8usX0u
	ZIWUamGPRxrrs8h0151iVo38w69eDefp0As6XraruRHbq2cx3Y+iVzbwzY2QEagr9deLaNBzrX8
	1b7LX63qF5NbAeAm+bSUG0rbqb8NVfU2buYH2uCd+Dz7DCbzdTQ65Jc6bOb1FILmNXTWYd+AisM
	789a71yp0RFo60
X-Received: by 2002:a05:6a00:a0c:b0:89e:779b:d0f with SMTP id
 d2e1a72fcca58-8a089dfdbb8mr140032b3a.37.1792531993626; Tue, 20 Oct 2026
 14:33:13 -0700 (PDT)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <ae36949f7685ef74318d3c742f02e1398db3b454.1792164438.git.lucien.xin@gmail.com>
 <179244539859.3135.15973054396060254186@kernel.org>
In-Reply-To: <179244539859.3135.15973054396060254186@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 17:33:00 -0400
X-Gm-Features: AclHuK-OS8Rlsq-Vf92z9Ck0SMvPAMUJ9Zd-S0XjwZRWioNbmezgdXlvGsvI2pg
Message-ID: <CADvbK_en5dm-psb_eXs26y1bYTNq8_76eHv6ZWX_FbcSPjv8Zg@mail.gmail.com>
Subject: Re: [PATCH net-next v17 08/15] quic: add path management
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, linux-cifs@vger.kernel.org, pc@manguebit.org, 
	linkinjeon@kernel.org, tom@talpey.com, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com, jlayton@kernel.org, steved@redhat.com, hare@suse.de, 
	aahringo@redhat.com, dhowells@redhat.com, matttbe@kernel.org, 
	mail@johnericson.me, xiyou.wangcong@gmail.com, alibuda@linux.alibaba.com, 
	jbaron@akamai.com, illiliti@protonmail.com, sd@queasysnail.net, 
	marcelo.leitner@gmail.com, daniel@haxx.se, andrew.gospodarek@broadcom.com, 
	mef@scarletmail.rutgers.edu, paul@jakma.org, kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_udp_sock_create() in net/quic/path.c zero-initializes
>   udp_conf and fills it with quic_udp_conf_init() ->=E2=80=A6
> - [Medium] IP_FREEBIND (and the IPv6 equivalent) set on a QUIC socket has
>   no effect when a new UDP tunnel socket is created.
>
> --
>
> quic: add path management
>
> This adds struct quic_path_group and struct quic_path to manage the
> active and alternate paths of a QUIC connection. Each path is bound to a
> kernel UDP tunnel socket, which can be shared and is tracked in a
> per-port hash table. The patch also adds bind, unbind and swap helpers,
> alternate path detection for migration, and basic PLPMTUD state handling.
>
> > diff --git a/net/quic/path.c b/net/quic/path.c
> > new file mode 100644
> > index 0000000000000..ba7e2c952a36a
> > --- /dev/null
> > +++ b/net/quic/path.c
> > @@ -0,0 +1,596 @@
>
> [ ... ]
>
> > +static struct quic_udp_sock *quic_udp_sock_create(struct sock *sk,
> > +                                               union quic_addr *a)
> > +{
> > +     struct udp_tunnel_sock_cfg tuncfg =3D {};
> > +     struct udp_port_cfg udp_conf =3D {};
> > +     struct net *net =3D sock_net(sk);
> > +     struct quic_uhash_head *head;
> > +     struct quic_udp_sock *us;
> > +     struct socket *sock;
> > +     int err;
> > +
> > +     us =3D kmalloc_obj(*us);
> > +     if (!us)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     quic_udp_conf_init(sk, &udp_conf, a);
>
> [Severity: Medium]
> Should the tunnel socket take its IPV6_V6ONLY setting from the QUIC
> socket that owns it?
>
> quic_udp_conf_init()->quic_v6_udp_conf_init() fills in the family,
> address, port, checksum flags and bind_ifindex. It never sets
> conf->ipv6_v6only:
>
> net/quic/family.c:quic_v6_udp_conf_init() {
>         conf->family =3D AF_INET6;
>         conf->local_ip6 =3D a->v6.sin6_addr;
>         conf->local_udp_port =3D a->v6.sin6_port;
>         conf->use_udp6_rx_checksums =3D true;
>         conf->use_udp6_tx_checksums =3D true;
>         conf->bind_ifindex =3D quic_get_dev_if(sk, a);
> }
>
> udp_sock_create6() applies v6only only when the config asks for it:
>
> net/ipv6/ip6_udp_tunnel.c:udp_sock_create6() {
>     ...
>         if (cfg->ipv6_v6only) {
>                 err =3D ip6_sock_set_v6only(sock->sk);
>     ...
> }
>
> As a result, the kernel UDP socket always gets the net.ipv6.bindv6only
> default. An IPV6_V6ONLY value set on the QUIC socket through
> quic_setsockopt()->ipv6_setsockopt() is ignored. A zero cfg value also
> can't clear an inherited bindv6only=3D1.
>
> With bindv6only=3D0, could an IPV6_V6ONLY QUIC socket bound to [::]:P get=
 a
> dual-stack tunnel? That tunnel would also hold IPv4 port P and could
> cause unexpected EADDRINUSE for IPv4 binds.
>
> With bindv6only=3D1, a QUIC socket that cleared IPV6_V6ONLY gets a v6-onl=
y
> tunnel, and IPv4 UDP lookup skips ipv6_only sockets. Would IPv4 packets
> for that dual-stack QUIC socket ever be delivered?
>
> quic_udp_sock_lookup() also decides sharing through
> quic_cmp_sk_addr(us->sk, ...), which checks ipv6_only_sock() on the
> tunnel socket. A wrong v6only state would therefore also change which
> QUIC sockets end up sharing a tunnel.
>
> quic_path_bind() has no caller yet in this series, so this would only
> show up once quic_bind() is wired in by the next patchset.
>
False.

This is on purpose, as two quic socket may share the same lower
udp tunnel socket, we try to make the lower :: bind udp socket always
with bindv6only =3D 0 (unless net.ipv6.bindv6only =3D 1), so that two socke=
ts:

- bind(sk1, ::, 1234, ALPN=3D'h3', bindv6only =3D 1)
- bind(sk2, ::, 1234, ALPN=3D'smbd', bindv6only =3D 0)

can co-exist, the bindv6only check will be performed on the quic
socket layer like when looking up the listen socket.

if the tunnel socket takes its IPV6_V6ONLY setting from the QUIC,
the sk2 will never accept IPv4 requests.

> > +     err =3D udp_sock_create(net, &udp_conf, &sock);
>
> [Severity: Medium]
> Is IP_FREEBIND (or its IPv6 equivalent) on the QUIC socket honoured
> when a new tunnel socket is created here?
>
> struct udp_port_cfg has no freebind or transparent field.
> udp_sock_create4() and udp_sock_create6() call kernel_bind() right after
> sock_create_kern(), so FREEBIND can never be set on the new socket
> before it is bound:
>
> net/ipv6/ip6_udp_tunnel.c:udp_sock_create6() {
>         err =3D sock_create_kern(net, AF_INET6, SOCK_DGRAM, 0, &sock);
>     ...
>         err =3D kernel_bind(sock, (struct sockaddr_unsized *)&udp6_addr,
>                           sizeof(udp6_addr));
>     ...
> }
>
> The bind path then calls inet_addr_valid_or_nonlocal() on the new tunnel
> socket. That socket doesn't have FREEBIND set, so a nonlocal source
> address would fail with -EADDRNOTAVAIL.
>
> The QUIC socket accepts IP_FREEBIND through
> quic_common_setsockopt()->ip_setsockopt(). quic_get_user_addr() in the
> next patchset is described as honouring FREEBIND. Could bind validation
> then accept the address, only for
> quic_path_bind()->quic_udp_sock_create() to reject it?
>
> It looks like only the netns-wide ip_nonlocal_bind sysctl would make a
> nonlocal bind work here.
>
False.

quic_get_user_addr() will be called to handle IP_FREEBIND for user
addresses in quic_bind/quic_connect/quic_sock_connection_migrate
in the next patchset.

Thanks.

> > +     if (err) {
> > +             pr_debug("%s: failed to create udp sock\n", __func__);
> > +             kfree(us);
> > +             return ERR_PTR(err);
> > +     }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1792164438.git.lucien.xin%40gmail.com
