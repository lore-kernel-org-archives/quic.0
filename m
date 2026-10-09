Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C922D7A9
	for <quic@lists.linux.dev>; Fri,  9 Oct 2026 01:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508710; cv=pass; b=r8iOiuKlhJIbA/VJH+vHAx1bhUIRf8It0uv2tNinchpRcPW4N9Geo9oPBMlBxoZeSWqRdwpX9ipknuM96D1C/phwv3WWEbjfLyfTiDuOZljZtCaKwqa5Vb8d/qPoe2hWvTw3caKugIgybihIJG7oIB3/fEx0HypHydrbuGPkGAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508710; c=relaxed/simple;
	bh=c9CjlnVPd4o4XL9YpiKPxOeOhu8R/tdDB1BAxuD+vTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgGFpWNSNDo47HDnxVhq7s24s4WAaIjPFhkJl7c0wuhzRYm1zecAUzYLN9IU9XEg9NWqzJ5d+YIqZYLj6Z2SJDACAC5qQ45tmU0km7rQfKUfEo8LVpb3Kk3qS1FIK8/c1rLhec1KtEEYlykWmwt+ckDBQfEE2cRPOs0kh/UpY6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tN4aTeCb; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tN4aTeCb"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so1190413241.3
        for <quic@lists.linux.dev>; Thu, 08 Oct 2026 18:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791508707; cv=none;
        d=google.com; s=arc-20260327;
        b=JEO4okRn5EMTEXhN78Mg+j20boIyuk2mfPc/uczzIJjCbDn5puHCS7AtQ54iEOXdJW
         fcgxS1yU4UCJ0EYPx/1JbA2xMQztULHHuIemtwBJjnHyyt79406Zdyyy79GjUcYz1zTQ
         jaS+zzfh0IuubNWBGVugFfpAqI+35/hbLTGGxP0hEzzgGwH1nchBMAYodOwDq515trz6
         drbBBRo0TXJVSli9WU9mB5KNxmXiBzfkltdXKOk3iiIIgmA7CgQ4itNdFBeK1NJMZRdf
         tKsNknC+phOx5dC73Mki9IYjaTs2JD32KCKD0kMqBsUleBkVUuj+gDLNCPhuKfOW4VbK
         JW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ccFCxrKoPjc9e2PwgegYLeAvnE1L5LIxyZbjH6ovNE=;
        fh=dc/O2GdegwprxXkcddO5HqU+p+nvvXl9eZjC9XoAi6o=;
        b=JRy2MmELUG31aCB+EbDdNTXswB8IVltHdTzdhqyIwxsxmXnuNy0G7z6CkPJ6iGvDZ/
         5/wlijRtvMQIb8FPmndDRERw6ZtPmhjB+Y8qdtrUJ3MnYZr1j4HTdDnYWApQegE8a7zL
         tp397MOB5TmbhJK+Ok7XChjrMFPz/u7XatmLxpzI+P1uTJIWpWyqE4GqSwjDJi1GIWeY
         QnS/TomWcaShm+JEuiqAxvQtL9BTJ8zg+gPrIeTAKWrt1yWWKv0En2J5jlI3SWl3XaKi
         eDt197JnUpA+Lxp51UkdXivyrRDCZ59b1tJJ2xjGMmRXkEYW0qc2Y4dGtfp6/JsaVKMp
         y4Pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508707; x=1792113507; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ccFCxrKoPjc9e2PwgegYLeAvnE1L5LIxyZbjH6ovNE=;
        b=tN4aTeCb2CSNwWTyjSPvPjN6L24ewIPbcuqN+bb/wh8tEeNetdUPLnufkTrBZGqGLn
         kle/7h4pgMp0OucO2MiimJYMYMtCa1KLz1C9CqTtWOD84zTRN7cQfU15DTahtrhfKyt7
         IGf3t5S/MeR02LPfb9683Qxgenow6z4LrMS4VGSj77XOwpCPyz5+LB+NKvHG3Hbb4zjR
         2eKRW1BQ1Z73VaHyg2xwycTWmLZmcppbh6BK1oSuL804by/jURy9wWRLbRC1pDfKNBEb
         PqzRonX3I1JmFMBt8G7vJRbV+I9x6ix7xg7tcuGBWkupYUrojJ4E7sdwv5gAxIxMQ7H9
         yfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508707; x=1792113507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ccFCxrKoPjc9e2PwgegYLeAvnE1L5LIxyZbjH6ovNE=;
        b=HmAox7+0Jph+Q/FRYtclHJgt5+Hujts7WROuouXGNlp+IpQXcN27rqbNt4v6kcoiCX
         fp/Tk+FbvfekiVjNxvYrgiQ0LBs82J2bui7cflJ8n6sPI1U2zaHbcLpQbId+SPzgwbQF
         TeIvkY4MuxxAv88RF/yMpQ6U8we59Ww5OlKcp4ZMn3TiZLVlPgHDNx02tC20NBdTyaVC
         3It9+S2BCA/2DIc3PPvCRqEusGsR4VH4oH+HZGMDK6OUOt7GaneiHiO/Qv2u5O3bNh1S
         amgDYNIGYxryPwzSvKV+BkGuLRBhEFIW9Sy8QauFJeGiXiNNGmnbD8aLJQsQrM0PR3/t
         /yhw==
X-Forwarded-Encrypted: i=1; AKwUvBwf4g5PDl1bK5C3xozd/IorlmF5tyEXg3zS894SzkkRo4No3UkUHWzQHpL+TdR0JyEKG7pE@lists.linux.dev
X-Gm-Message-State: AFq9FYKTeQqa955p1muJqpbQo/2M2jwiZ7mUz/AJRLj2Rp1z1JrUM3Ay
	B3DlfFofOfOTwculRidbzzrCAABBCjOuwyiygSO+1pLlv5NMvWEQ/7jAbZoF2k+DmnocYTZ+VIz
	Vsjy9Bj3BeqR2YDWuMxTImJYahbnAFOY=
X-Gm-Gg: AYBFou01futBd/cZ/nA3Qh4WL3J4eyoAWIkTKhEM/aDbPH1PkdX0aq6DfcHXm2EwiOp
	w4iXGoo8OofraOEfCMuXU4PPBQGfTroSD7gnZu0ogEpC1aaCZ8wz30dVnp26bGjTovNkDjNhtE3
	7H39UCrEOS2kCeRH+EyThnJ0281EhVs20YE6HOI4CyfMB93qOtQK9DxIS06+YQr6vak5AQEBg6Q
	R4ZnkMIzJ7Pb3dPOZ17PIrxcC1BjQnFSpibcMisgtmhCeJkqjzw2MuP26QTeRVqINuT4Gf37zmL
	CXENZ1Pdtj+72DjLyK5qSbiauau5TiKKpM3auXF0h/R4g5d2c6akUKKnoKhKPzj8rluWR0cLW7l
	IQu3St0vO3kSKYPoP0XAk7caxdnIEd43BzBJ/jVAhKnZL0LytGhsQVUbfyKeDh7mC
X-Received: by 2002:a05:6102:419e:b0:7c3:2f33:54bb with SMTP id
 ada2fe7eead31-7cb373e811cmr152210137.28.1791508707307; Thu, 08 Oct 2026
 18:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fff91f2c9ae1bdbbf76aa46c618b440c896d131f.1791227050.git.lucien.xin@gmail.com>
 <179133510313.434549.8082953410374436828@kernel.org>
In-Reply-To: <179133510313.434549.8082953410374436828@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Oct 2026 21:18:13 -0400
X-Gm-Features: AclHuK9c2BpoJaP_NQ_cWlQ3zO_k9dwwxwpTvHTQoPZEgRyYQiN9Vhds78VFtzE
Message-ID: <CADvbK_dxM1On-83vuH9hF38kpZ5+Hf5vZ_j2CwLYdRVNkKKrrg@mail.gmail.com>
Subject: Re: [PATCH net-next v16 04/15] quic: provide family ops for address
 and protocol
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

On Tue, Oct 6, 2026 at 9:05=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] An unprivileged sticky IPv6 routing header makes the route
>   lookup and the transmitted packet disagree, so packets go to the real=
=E2=80=A6
> - [Medium] IP_TTL and IPV6_UNICAST_HOPS are accepted but ignored on
>   transmit.
> - [Low] The commit message leaves out user-visible changes and describes
>   the code inaccurately.
> - [Low] IP_OPTIONS is accepted and stored but never sent.
>
> --
>
> quic: provide family ops for address and protocol
>
> This commit adds net/quic/family.{c,h} with IPv4/IPv6 helpers for route
> lookup, UDP tunnel transmit, address parsing and comparison, and UDP port
> config setup. It also connects quic_inet_getname() and the setsockopt()
> and getsockopt() levels other than SOL_QUIC to the inet and inet6 code.
>
> > Introduce QUIC address and protocol family operations to handle IPv4/IP=
v6
> > specifics consistently, similar to SCTP. The new quic_family.{c,h} prov=
ide
> > helpers for routing, skb transmit handling, address parsing and compari=
son
> > and UDP socket config initializing etc.
>
> [Severity: Low]
> This isn't a bug, but the patch creates net/quic/family.{c,h}, not
> quic_family.{c,h}.
>
> The wording "family operations ... similar to SCTP" looks left over from
> before v3. That version replaced the ops abstraction with if statements.
>
> Could the message also mention the changes userspace can see?
> quic_inet_getname() used to return -EOPNOTSUPP. It now returns real
> addresses through inet_getname() or inet6_getname().
>
> quic_setsockopt() and quic_getsockopt() now send every level other than
> SOL_QUIC to ip_setsockopt()/ipv6_setsockopt() and
> ip_getsockopt()/ipv6_getsockopt(). All SOL_IP and SOL_IPV6 options can
> now be set on QUIC sockets. An unknown level also returns -ENOPROTOOPT
> now, where it used to return -EOPNOTSUPP.
>
> > diff --git a/net/quic/family.c b/net/quic/family.c
> > new file mode 100644
> > index 0000000000000..f5d859b337b10
> > --- /dev/null
> > +++ b/net/quic/family.c
> > @@ -0,0 +1,449 @@
>
> [ ... ]
>
> > +static int quic_v6_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
> > +     struct ipv6_pinfo *np =3D inet6_sk(sk);
>
> [ ... ]
>
> > +     security_sk_classify_flow(sk, flowi6_to_flowi_common(fl6));
> > +
> > +     rcu_read_lock();
> > +     final_p =3D fl6_update_dst(fl6, rcu_dereference(np->opt), &final)=
;
> > +     rcu_read_unlock();
> > +
> > +     dst =3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
> > +     if (IS_ERR(dst))
> > +             return PTR_ERR(dst);
>
> [Severity: High]
> Can a sticky routing header make the route lookup disagree with the packe=
t
> that is actually sent?
>
> quic_common_setsockopt() now passes SOL_IPV6 to ipv6_setsockopt(). That
> lets an unprivileged user set IPV6_RTHDR, because ipv6_set_opt_hdr() only
> requires CAP_NET_RAW for the other option headers:
>
> net/ipv6/ipv6_sockglue.c:ipv6_set_opt_hdr() {
>     ...
>         /* hop-by-hop / destination options are privileged option */
>         if (optname !=3D IPV6_RTHDR && !sockopt_ns_capable(net->user_ns, =
CAP_NET_RAW))
>                 return -EPERM;
>     ...
> }
>
> Suppose np->opt holds a type-4 SRH or a type-2 routing header. Then
> fl6_update_dst() replaces fl6->daddr with a segment Y that the user picks=
.
> ip6_dst_lookup_flow() looks up a route for Y and then puts the real
> destination X back into fl6->daddr. ip6_dst_store() caches that dst.
>
> quic_v6_lower_xmit() then calls udp_tunnel6_xmit_skb(). That helper build=
s
> a plain IPv6 header addressed to X and never adds the np->opt extension
> headers:
>
> net/ipv6/ip6_udp_tunnel.c:udp_tunnel6_xmit_skb() {
>     ...
>         ip6h->nexthdr     =3D IPPROTO_UDP;
>         ip6h->hop_limit   =3D ttl;
>         ip6h->daddr       =3D *daddr;
>         ip6h->saddr       =3D *saddr;
>
>         ip6tunnel_xmit(sk, skb, dev, ip6cb_flags);
> }
>
> Doesn't this send packets to X using the device, gateway and MTU of the
> route for Y? Neighbour discovery for X would then run on Y's link. Local
> route policy for X, such as prohibit, blackhole, unreachable or policy
> routes, would also be bypassed.
>
> UDP and SCTP avoid this because they pass opt to
> ip6_append_data()/ip6_xmit(), which put the routing header on the wire.
>
> The transmit path is only connected in the next patchset. This code is
> the same at the end of this series.
>
> Should fl6_update_dst() be dropped here, since the tunnel transmit cannot
> send extension headers? Alternatively, should QUIC sockets reject sticky
> routing headers?
>
> [ ... ]
>
> > +static void quic_v4_lower_xmit(struct sock *sk, struct sk_buff *skb,
> > +                            struct flowi *fl)
> > +{
>
> [ ... ]
>
> > +     if (cb->ecn)
> > +             tos =3D (tos & ~INET_ECN_MASK) | cb->ecn;
> > +     ttl =3D (u8)ip4_dst_hoplimit(dst);
>
> [Severity: Medium]
> Are IP_TTL and IPV6_UNICAST_HOPS silently ignored here?
>
> Through quic_common_setsockopt(), setsockopt(SOL_IP, IP_TTL) stores its
> value in inet->uc_ttl. setsockopt(SOL_IPV6, IPV6_UNICAST_HOPS) stores its
> value in np->hop_limit. Both calls succeed, and getsockopt(IP_TTL) return=
s
> the stored value.
>
> However, this function always takes the TTL from the route.
> quic_v6_lower_xmit() does the same:
>
>         ttl =3D (u8)ip6_dst_hoplimit(dst);
>
> UDP and SCTP apply these options through ip_select_ttl() and
> ip6_sk_dst_hoplimit(). These functions already apply IP_TOS and
> IPV6_TCLASS through inet_sk(sk)->tos and inet6_sk(sk)->tclass.
>
> Should the hop limit use the socket setting as well?
>
> > +     udp_tunnel_xmit_skb((struct rtable *)dst, sk, skb, fl4->saddr,
> > +                         fl4->daddr, tos, ttl, df, fl4->fl4_sport,
> > +                         fl4->fl4_dport, false, false, 0);
> > +}
>
True.

I will add them for both quic_v4_lower_xmit() and quic_v6_lower_xmit().

Thanks.

> [Severity: Low]
> What happens to IP_OPTIONS on a PF_INET QUIC socket?
>
> ip_setsockopt(IP_OPTIONS) parses the options and stores them in
> inet->inet_opt, and getsockopt(IP_OPTIONS) returns them.
>
> udp_tunnel_xmit_skb() ends up in iptunnel_xmit(). That function never
> reads inet->inet_opt and builds a header with no options:
>
> net/ipv4/ip_tunnel_core.c:iptunnel_xmit() {
>     ...
>         memset(IPCB(skb), 0, sizeof(*IPCB(skb)));
>     ...
>         iph->ihl        =3D       sizeof(struct iphdr) >> 2;
>     ...
> }
>
> Options such as Record Route or Timestamp are reported as set, but they
> never appear in any packet. quic_encap_len() also reserves no room for
> them.
>
> Should QUIC sockets reject IP_OPTIONS?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1791227050.git.lucien.xin%40gmail.com
