Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625083;
	b=qOqr/rSPHQ8syGhpElMh8me6ASlFrlx81/X058RHvxPI+JtyGdg+9sKLtAI6dopuwLZD
	 8u4RKLNENNtyDjvAmDlnXvuxYaArDfMbp4v6tGX0kljA69yu3XmJdv1kUhB/29wzUEH+2
	 zE73J/5G49xBtD23LbW3ILPI4IdcbuyyDhCfVQzvytjBM3gO9kDIRxWxyljKL1zDvnB49
	 XuRGxug4idIYMqv7QtGs2usnCewMwDk9wn0vQAEVOewBP7tdJaUd+fO1iZrn1in95aDQa
	 Ty8DVKqu/+9j0FvoxgLVu7ve5FP209TlMStl3Cz0T1+3ZDLJXBlvwqKmf/5sEM0UdJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
	b=zS4T+q3tgGeONmx7J7E6Mt5QRcSXgqWorBUsqTLShTqHPHBsfRkmW05d+qa4xOAGIKMS
	 qh/unl32LE/k2NxkAxpnNf7XWZhN12tn1DfPY6DHXrRoRTUyl51MUC0SArlrgqkzNZjoJ
	 OYNM6z3GKlm8ewUkpdH3Z9/lY9ky17jX+NmecQ1TecB75A8KNQZ1MNgTmPknsJn/VyNBg
	 sNZ3qX1TfKYrI91sG2y+101zwzIOMlJNcqtjaDVHRXR4aKeptBakHIdCHXtH4KKDKTIwO
	 pper1DZcHD7FFf9FmBdOP89KWf3tvDhmvKD2CqdWV1fi8aRAKCtOCzpUsKjXigFH1PQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+CY4Ijk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26743606A321
	for <quic@lists.linux.dev>; Wed, 25 Nov 2026 16:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26743606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+CY4Ijk
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so2377130b3a.1
        for <quic@lists.linux.dev>; Wed, 25 Nov 2026 08:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625082; cv=none;
        d=google.com; s=arc-20260327;
        b=HxGLJ/A0l/Yei60UEapuy/9Rd2q4IK0Tov4KUWR2SuopPsObSpJ1OVg8tQ+h776ygP
         TYJA2oVtGMdKIACaTOYCx/Ys3HwpCDbJ8YTij9svijpvx3mK3HbQl4tjMGd4XdQbsuEC
         Lmzr0RIUrb78V03rVRzBtrA6UH7f+yVQvGT6DnZY/qbW9RJJQAEDiHpRcdBjDgLfkd/p
         N3gA2izkuu2tAAWvUQHbkY/0QAsaxyzr0aAbMOCsR6DFi56kFOhf1AFYVT8Qa2cTqJU5
         Mj6Lddf1JaPxm1R5tpUQinVExAjhj6iXudrJhjHIiXmCzjI53wPX/XpzEjIAImB/rp5H
         K6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        fh=RHqpvjaIOyeYzndG+6UAPEYCmogpOhw+lPRE0YwtZxU=;
        b=D3tSYhFWIQHTa3IbqYff40+rCicExXiLwC81WsSed32SSos249zHlz8lKV2ZqJL+mj
         gbrPMcDIiywjUS/67c/I8q7MxN19NQ2a6iliOwBa6WNIkaQsmx4qi4hTcnqPjHqi+aRV
         oJzmMj0D18OfvjhX3nqyGwPMAvwCcwHKlzaUJBMGizYQd5dkvayflIZUkYOq/lE3GD04
         owqVFmoULRxX+tURJGoLNgAE8KCi4y2HQqgb91ICwFxP33vxLK6jnd/aY+WeWvbndCtR
         bYf95+jdQEw0CgOdYAssN7gs/f6xYpw+EWYxHuP5Ca90t48YfmViQunOEO+YwDtitQtB
         6iTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625082; x=1796229882; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        b=C+CY4IjkmZtHjsUiRZhPq36pnI0Wv7dYsVDzV1XmSSeCl5Ta4WBcPPHV+kJV+2DNlH
         KtqN7pnSarNZWlFNFvEZlniRxnx+EMe6ksbrWYPlP9x2b+0J2vuK2Bm+Z3rIwC33cNU2
         zc56NkZpSEB4ApiAPwNMwUOmr8t/K8SyTYoDLG6NEtkSlGAxiJ15LQmf3yV75SKuwtMs
         gVa6fWR342iYS5kbyWiRBQokGA3XEMonFGeA7036tbEBzzdL8Gf0UIS4cJUK4YwGETFq
         axFcS2wG4ZyPCeTS+KmX8aAbGix2RRYg65f+yDPL9egQJiZrb6T+YKC0RMQyTMZ6F8zt
         iT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625082; x=1796229882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        b=RC2c5paRRenB73FwOq8ka9EXPPt6LTadGEdb/XpzLaike7pfMkYHDSAcCYwHoFV7WZ
         rjlSW+R7s2tcIpA73erQBjoEBHMUZw0j0J7FAQtdoChTrBsQi4J6gmyk7hD5hdIOO3If
         0evoBUCJgMfBpwrQc+CW66vZfE5723KLVxbMVWPwMFmAoaN8PzX5GbrCLr8ZYhwgFjZ/
         GvyFULQWpTiMkrha9Rzsw7Fzn0LVXI0MweXP3ogLgiC04a4UOrx7qnLRmckDmv7uwc5l
         tvtWB2mT9nGjlYqzTy7eQuxqLf0nx+MiUKo9f7ZreNom8farSnNnij/DXBAxQTHVzZtf
         1m9g==
X-Forwarded-Encrypted: i=1; AL+hErH79R58TXxtoETGX9wK3j0nks1UJWhF7rr7G0ifNs+oOOqmNFl2zaDUz+W7myPGWNwsTpYf@lists.linux.dev
X-Gm-Message-State: APuU4Z8UzNIbzjV1IpN++Td775FLFEtpj4ZFRu4OIhq9BJGLNH4xmLMz
	fw1/5hniRmbgOUU1YUzg+f2PgDrYLZr0FnotqCQrrcW+f7+sIc18JazuxN5uD7ACerg4cHJRRmY
	yfZFQFkfrEzUro+BLIpu4sEttnQgAIBM=
X-Gm-Gg: AZFdTZdAp5DLgG0YztoEInL4UHsoRECYfznt4Onlv2mb15j6yNlGIlNFBf50poTCkta
	xnpzKTPAoeUyNiWkXjpXN9tJDnHurY5gY0sDduk3fHYWYqr2AFdl9ei6e2A6dKad7n13Hk/5mAb
	HNo317dGsj+iMkpy9kDNTXzaFBigA/8W54BSHD1UP33HNKaCOtnVY9xNNyZdQwllxrHCZSNFekW
	VnQ3XFGMNS7To0vUneOTg+Rj/XrW1FO7p4c4aSZjYhr7KLMu2PFTr/XBUbSq6CDqqCQGu+MYTQE
	C1HVNmlgQnGAHWCQmaREVO3safIkExdCJwWofNDCDoe506wXxYcHYrQ1VBffRrh3tsCHLrC8pra
	fNev+x9WByqjpAXx/QscOq8NKmW/OPemmwywVILpn03OSecmWUQXgtc0dMAzMSONdfQNfXixN4j
	fbuPbPIEbcOM1kznvABgdSkKWg6PnG8oaF6We3gqKR5xauuifRPW9J4il+08jWScjmHSC8
X-Received: by 2002:a05:6a00:17a3:b0:881:cbb0:6a90 with SMTP id
 d2e1a72fcca58-8c87d80b24bmr16495257b3a.58.1795625082380; Wed, 25 Nov 2026
 08:44:42 -0800 (PST)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <e33f69fbe24e60c4f624c08279553be2888558ff.1795393691.git.lucien.xin@gmail.com>
 <179548326686.3135.1885327270671072036@kernel.org>
In-Reply-To: <179548326686.3135.1885327270671072036@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:44:30 -0500
X-Gm-Features: Aa3M54rwA_4B_Qvf2uz_eVnjuVavXWhSvilNzKm8mtiFvEJGwuVKtS7cR4uh2Fw
Message-ID: <CADvbK_dW3LHZq1b0Y7pbWBbi1BikLyajruJ=iJz25sp_nkXdAA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 04/15] quic: provide family ops for address
 and protocol
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 3 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_flow_route() in net/quic/family.c returns -EINVAL
>   whenever `sa->sa.sa_family` is non-zero and differs from=E2=80=A6
> - [Medium] quic_v4_flow_route() in net/quic/family.c accepts any route
>   returned by ip_route_output_flow() and passes it straight to=E2=80=A6
> - [Medium] When the selected IPv6 source is link-local,
>   quic_v6_flow_route() in net/quic/family.c runs `sa->v6.sin6_scope_id =
=3D=E2=80=A6
> - [Low] The commit message does not mention three user-visible behaviour
>   changes.
>
> --
>
> quic: provide family ops for address and protocol
>
> This patch adds net/quic/family.{c,h} with IPv4/IPv6 helpers for routing,
> transmit, address parsing and comparison, and UDP tunnel socket
> configuration. It also wires quic_inet_getname(), quic_setsockopt() and
> quic_getsockopt() to these helpers.
>
> > quic: provide family ops for address and protocol
> >
> > Introduce QUIC address and protocol family operations to handle IPv4/IP=
v6
> > specifics consistently. The new family.{c,h} provide helpers for routin=
g,
> > skb transmit handling, address parsing and comparison and UDP socket co=
nfig
> > initializing etc.
>
> [Severity: Low]
> This isn't a bug, but the commit message describes only internal helpers.
> The patch also changes user-visible behaviour on QUIC sockets.
>
> quic_inet_getname() used to return -EOPNOTSUPP. It now calls
> quic_get_sk_addr(), so getsockname() and getpeername() return real
> addresses through inet_getname() or inet6_getname().
>
> quic_setsockopt() and quic_getsockopt() used to return -EOPNOTSUPP for an=
y
> level other than SOL_QUIC. They now pass the call to ip_setsockopt() or
> ipv6_setsockopt(), and to ip_getsockopt() or ipv6_getsockopt(). With
> CONFIG_NETFILTER the call can also reach nf_setsockopt() or
> nf_getsockopt(). For unknown levels the error changes from -EOPNOTSUPP to
> -ENOPROTOOPT.
>
> SOL_IP and SOL_IPV6 options set this way change state that the new helper=
s
> read: inet_sk(sk)->tos, uc_ttl, np->tclass, SNDFLOW and ipv6_only_sock().
>
> Could the commit message mention these changes? The subject also still
> says "family ops", but v3 replaced the ops abstraction with if/else
> helpers.
>
> > diff --git a/net/quic/family.c b/net/quic/family.c
> > new file mode 100644
> > index 0000000000000..73f3b955e13c4
> > --- /dev/null
> > +++ b/net/quic/family.c
>
> [ ... ]
>
> > +static int quic_v4_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
>
> [ ... ]
>
> > +     security_sk_classify_flow(sk, flowi4_to_flowi_common(fl4));
> > +     rt =3D ip_route_output_flow(sock_net(sk), fl4, sk);
> > +     if (IS_ERR(rt))
> > +             return PTR_ERR(rt);
> > +
> > +     if (quic_v4_is_any_addr(sa)) {
> > +             sa->v4.sin_family =3D AF_INET;
> > +             sa->v4.sin_addr.s_addr =3D fl4->saddr;
> > +     }
> > +     sk_setup_caps(sk, &rt->dst);
>
> [Severity: Medium]
> Should quic_v4_flow_route() reject RTCF_BROADCAST and RTCF_MULTICAST
> routes before caching the dst?
>
> Other IPv4 socket types check rt->rt_flags at this point. For example,
> __ip4_datagram_connect() does:
>
>         if ((rt->rt_flags & RTCF_BROADCAST) && !sock_flag(sk, SOCK_BROADC=
AST)) {
>                 ip_rt_put(rt);
>                 err =3D -EACCES;
>                 goto out;
>         }
>
> raw_sendmsg() has the same check. tcp_v4_connect() returns -ENETUNREACH
> for both RTCF_MULTICAST and RTCF_BROADCAST.
>
> Without such a check, a QUIC socket can cache and send on a broadcast
> route (255.255.255.255 or a subnet-directed broadcast) without
> SO_BROADCAST.
>
> On the server side, the reply destination comes from the source address
> of a received packet. With rp_filter=3D0, the kernel default, a spoofed
> source equal to the local subnet broadcast (e.g. 192.168.1.255) gets past
> ip_route_input_slow() and fib_validate_source().
>
> Would the server's replies then go out as link-layer broadcasts to every
> host on the LAN? That multiplies the 3x anti-amplification budget by the
> number of hosts. A userspace QUIC server on a UDP socket would get -EACCE=
S
> from sendto() in this case.
>
False.

The spoofed broadcast source) is already blocked by the IP layer for
multicast and 255.255.255.255, and by fib_validate_source() for subnet
broadcast on any system with rp_filter >=3D 1. The remaining gap: subnet
broadcast with rp_filter=3D0 is narrow, and the 3x anti-amplification limit
further constrains it. It's a defense-in-depth improvement, not a security
hole.

> > +     return 0;
> > +}
> > +
> > +static int quic_v6_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
>
> [ ... ]
>
> > +     dst =3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, NULL);
> > +     if (IS_ERR(dst))
> > +             return PTR_ERR(dst);
> > +
> > +     if (quic_v6_is_any_addr(sa)) {
> > +             sa->v6.sin6_family =3D AF_INET6;
> > +             sa->v6.sin6_addr =3D fl6->saddr;
> > +             if ((ipv6_addr_type(&fl6->saddr) & IPV6_ADDR_LINKLOCAL))
> > +                     sa->v6.sin6_scope_id =3D dst->dev->ifindex;
>
> [Severity: Medium]
> Is it safe to dereference dst->dev here without rcu_read_lock()?
>
> This code runs in preemptible process context, under lock_sock() through
> quic_packet_route(). A dst reference does not pin the original
> net_device. On unregister, dst_dev_put() does:
>
>         rcu_assign_pointer(dst->dev_rcu, blackhole_netdev);
>         netdev_ref_replace(dev, blackhole_netdev, &dst->dev_tracker,
>                            GFP_ATOMIC);
>
> That drops the reference on the old device. This reader is not inside an
> RCU read-side section, so the synchronize_net() calls during unregister
> do not wait for it.
>
> If the task is preempted after loading dst->dev but before reading
> ->ifindex, can it read freed net_device memory? Even in the harmless
> case, it could store blackhole_netdev's ifindex as the scope ID.
>
> include/net/dst.h provides dst_dev() and dst_dev_rcu() for this.
> sk_setup_caps() on the IPv4 path reads the device through dst_dev_rcu()
> under rcu_read_lock().
>
True.

But the practical risk is low: this code only runs for link-local source
addresses, which is uncommon, and the window between loading dst->dev and
reading ->ifindex is tiny. Even if the race occurs, the most likely outcome
is reading blackhole_netdev->ifindex as the scope ID, incorrect but not a
crash.

There's a similar case in quic_v6_get_pref_addr() in the subsequent
patchset. I can fix both there when adding the function.

Thanks.

> > +     }
> > +     ip6_dst_store(sk, dst, false, false);
> > +     return 0;
> > +}
>
> [ ... ]
>
> > +int quic_flow_route(struct sock *sk, union quic_addr *da, union quic_a=
ddr *sa,
> > +                 struct flowi *fl)
> > +{
> > +     if (sa->sa.sa_family && da->sa.sa_family !=3D sa->sa.sa_family)
> > +             return -EINVAL;
>
> [Severity: Medium]
> Does this check reject a valid dual-stack setup?
>
> An AF_INET6 '::' source (a socket bound to the IPv6 wildcard) with an
> AF_INET destination fails here. quic_v6_cmp_sk_addr() accepts that same
> pairing on receive:
>
>         if (a->sa.sa_family !=3D addr->sa.sa_family) {
>                 if (ipv6_only_sock(sk) || a->sa.sa_family =3D=3D AF_INET)
>                         return false;
>                 return quic_is_any_addr(a);
>         }
>
> So a stored AF_INET6 '::' address matches AF_INET traffic on receive, but
> routing refuses the same combination on transmit.
>
> Suppose the later bind() and connect() code stores a bound [::] source
> as-is. Would a client bound to [::]:port that connects to an IPv4 peer
> then fail in quic_packet_route()->quic_flow_route() with -EINVAL? The v14
> changelog says IPv4-mapped addresses are converted to AF_INET, so the
> peer address would arrive here as AF_INET. Plain UDP allows this on a
> dual-stack socket.
>
> Dropping the check alone would not fix it. quic_v4_flow_route() reads
> sa->v4.sin_addr, which overlays sin6_flowinfo, so an IPv6-wildcard sa
> would need to be treated as IPv4 ANY.
>
> The v15 changelog shows the family mismatch check is intentional. Was the
> dual-stack wildcard case considered?
>
False.

The dual-stack server case works correctly. accept sockets and stateless
reply paths use addresses from the received packet, which are already
family-matched. The only affected case is a client explicitly binding to
[::] then connecting to a bare IPv4 address, which is uncommon. clients
typically either auto-bind or use IPv4-mapped addresses. We can address
this in a follow-up if needed.

> > +
> > +     return quic_af_ipv4(da) ? quic_v4_flow_route(sk, da, sa, fl) :
> > +                               quic_v6_flow_route(sk, da, sa, fl);
> > +}
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
