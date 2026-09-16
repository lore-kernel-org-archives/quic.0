Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977FB3859DC
	for <quic@lists.linux.dev>; Wed, 16 Sep 2026 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571920; cv=pass; b=L4vN+3SDenttHyOKzh9vCi3AczdRpC5ZpMbFKiqlNi+XbV1NR4jY76THZKaehC6Hwa22AVTGODdG/2zmDZfsF1squfjqJwIIcQ4gYYxYa0rpXy9vUUAFJABGm25d1ym1xso04q+CPi19JoSoDXny8S8r0RupfB8Hsao1UTgCTsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571920; c=relaxed/simple;
	bh=Dj+80PpyFtuTTPI24RANQuQHDc3eXfflbc+ICFvzogo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANurL6bZyB7Y0vHR5KWc0V7wTgQUVtrAjouO6Cdy90RYtTLtoTb1F64A8o2UqR2DQNN0ayGP2qErI2Plln69LksECgYw/ylrCoXB79i/tJvGJtzJ1BMJrUaw07D4lAnNTQO71WnXOhQJU3Z+u6QBLwfDtys9sd3+OvCxl4WKWa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4RWE+yL; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4RWE+yL"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so651790b3a.2
        for <quic@lists.linux.dev>; Wed, 16 Sep 2026 08:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789571916; cv=none;
        d=google.com; s=arc-20260327;
        b=af0CkWfLjmoI/opamYZT4AsWDkYsYzWiHpKiVMrRt4Btz4D4rh180meddqmAKLhTi6
         pGZkYf0Xi9L6HqJ3OTq8WYRgsidZHr8OIQG8OKFqejZ1mQ+9nOHhQvrCMB2L1+0ZIlPk
         ky+7XCVbAyGWiyMmAUXLV/tAMWBmyyqoVykg/RTGzOKD4pTaMaBDfbz5Vo/R0CcWjZ6W
         6FG4WJ6qZElxoNDhDcdfn4CMSFxMMU2al3bTALPJeV9iEsBY6QSfhY2a4ErXfDFroqgN
         pCYZnDOXwwTfcRjVvobNzJYVYlyhMadZ90N/3QXSZb1j1amTjb6onfm+UU+7AG7aAzPR
         dw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BhkqwMNKc8zR/oVQWFJv9edBfd9F+9BsRk6J/+nHhu0=;
        fh=DfqB8mfh2zZYZOb8Yd8v+Img8+HjTTNbllmR+ekxC9Q=;
        b=ljETtIAZ33gdvjOyyc95kpYMfmfSpXLqbFbpEQ8dCiW1rHduS3GyhVWH6/X4hWvup7
         OivIdmkiP9jHJDUlRD9UT+DiGOy5uy6GQGUC+FJV/ubO0wVDfVoSb5lYHpp7jHSpfsFq
         KZITSKSYke/tmrCuN17Toj01IiWc85E7yZLRIls3m9s4iUhMxrZ/MyjhJmwbdoDGqjxS
         0hyPzQ9lOlB9mQ8liW7AeuREOzumiOAQuON1W2/9BctbKD00EdOd/uxTI+55GpkECaC2
         Xblh2xVVS0pVlJlBh7n5Dv+tLvFn+sNaXLAUhsGGdcJLNZRMBiVmHfhwUl4s6Blv6m0e
         Bgig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789571916; x=1790176716; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhkqwMNKc8zR/oVQWFJv9edBfd9F+9BsRk6J/+nHhu0=;
        b=p4RWE+yLVV+sOe6aAUje3ANq+TVlh3WFQmrpA/zs7IM9un968nYEjppCd1T6WADAJ3
         p+IIiC0xeso7Pp0BSSeYUlU1n/0emfnWbt0HUcZebTvvSEu0Wz9K+U0gcDcu/FOUzngG
         TZ8+PxD2mJy+j+b+J/0hhqcs7Kjku2bOVoZurjR9lAvriw+EtYziEBK20LlVaNr2NVBC
         uXQ2jIN5ZAjKMiAFVICkbTg/ZkpVw8hm/OCB/0QPskkXvzLIES3hBkmTmdiBzYLjhDbJ
         TF/f8cpjAYOopKu+Vn9miIcEqxFZdB95/oUm7mV8EpcnAqEpk7HJheSVSTcgdECuuvmI
         LJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571916; x=1790176716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhkqwMNKc8zR/oVQWFJv9edBfd9F+9BsRk6J/+nHhu0=;
        b=AHHDUvnZIV89bEDJ22+jpGWBE/t8u7g+YiUdu3kL79jjyKW12apl8ZvE+f9l3QsETp
         jCUaE1O16OktE9r4mpcxGCfDkJyaM/lU20fhW4mMH12CsmimyeliRv5UzLrjydflzCRB
         Il3tHc0DxI8Ti+SXBgfgVvCfNVP3rGLC9RJdOKOZS9ylJfJ+l22vgWguS1ARsKQqfKrj
         9xlmpKASeSzCW/nJ+Zr5Y+CMTqgwJRYUjDSaSGiBRN71l+0n6cFHZGA4X6TS6QIEy8XN
         62nz3IPOOG9Ay3263gLDgAZVSQFCtb9hT6Z4f19aY6ZnkBgoL47/07mgrMSy1lFH8sX8
         yIYw==
X-Forwarded-Encrypted: i=1; AKwUvBxZewJxn8RkY71v/YJq//uUxBsP2g/FdiKqe6wZbtkKz5r8Od8JlhZl9paSlnyMywJDm/+Z@lists.linux.dev
X-Gm-Message-State: AFuF++m+qnp+UmWYvGI37pRqA+xRlU5eHx6vgomOBaR9JAk7JPjjlT+u
	NHJYoAIV0LIH/L2vaZ01eWfh2kCsi328bU5aQx1h3L0qn64N/BYXypLSjCeVcMsfqxEiv49k4Qi
	N78ElvuyMVugDoeV1GRdAhhX26xnnxOc=
X-Gm-Gg: AYBFou1RcCOK6M7/IQiBDidqZjAUFgm9eSG95UaBcLD5sioAQnGwrHCk1nb/B9LaXuw
	XW1UnHgWPHdwE9vyHQT+Y46Vqsq1sXRx5qSkWVto25k8485QYA+Ok5lNm2oz22BvQqYhLFxfVn9
	UAwJIwgohxWpXd1mhDcp9GZHXGUbKkjmmoOHKDPLZLIEhYYQKBejvMUIDkkaIYhZXmMDJRadU6H
	T2MUEfsKXRdy5U+fttxzvPMuaZs8rtQy+sV04tpIWY9FzbC35B4NwaB9YtdrwWwW7XexHOyMJPv
	Kpne8hMgfxCMfDI/NgVoyOXKuOK/FnGYyHR2tb+ZjmRh4EeljTCLL5VGglYpkDTFvbBHAV5xj9e
	x62kSiD5q9SArird5a/zI5fT+NTYiINybdWRzKfBGljTC/dA1llh22fwvQF4VO+50WM4=
X-Received: by 2002:a05:6a00:c481:b0:872:6004:f117 with SMTP id
 d2e1a72fcca58-8726004f36dmr4040074b3a.24.1789571915717; Wed, 16 Sep 2026
 08:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1cf83a4eb178197cd842e34468f4e357f42b9c28.1789393775.git.lucien.xin@gmail.com>
 <178950182306.22033.14152384539754204368@kernel.org>
In-Reply-To: <178950182306.22033.14152384539754204368@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 11:18:23 -0400
X-Gm-Features: AcwNN1UEOUO9io4IO0BxkvntuRVWDPeW_lFsEE-noRtB4rxUETC2sWqvf53BLHc
Message-ID: <CADvbK_ejURHE3C6BPv+b=Qnu8jPAcWDHMmqYOyEQ324_qsgknA@mail.gmail.com>
Subject: Re: [PATCH net-next v15 03/15] quic: provide common utilities and
 data structures
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
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> - [Medium] Weak hash seeding in the new QUIC hash helpers:
>   `quic_sock_hash()` (net/quic/common.c:40-53) reduces IPv6 addresses to=
=E2=80=A6
>
> --
>
> quic: provide common utilities and data structures
>
> This patch adds net/quic/common.c and net/quic/common.h with the QUIC
> packet header types, connection ID and address helpers, the socket and
> connection ID hash tables, and the varint/transport-parameter encoding
> helpers. quic_init() now initializes and tears down the hash tables.
>
> One question below about the hash helpers.
>
> > diff --git a/net/quic/common.c b/net/quic/common.c
> > new file mode 100644
> > index 0000000000000..51d71b6733c7d
> > --- /dev/null
> > +++ b/net/quic/common.c
> > @@ -0,0 +1,565 @@
>
> [ ... ]
>
> > +u32 quic_sock_hash(struct net *net, union quic_addr *s, union quic_add=
r *d)
> > +{
> > +     u32 ports =3D ((__force u32)s->v4.sin_port) << 16 |
> > +                 (__force u32)d->v4.sin_port;
> > +     u32 saddr =3D (s->sa.sa_family =3D=3D AF_INET6) ?
> > +                 jhash(&s->v6.sin6_addr, 16, 0) :
> > +                 (__force u32)s->v4.sin_addr.s_addr;
> > +     u32 daddr =3D (d->sa.sa_family =3D=3D AF_INET6) ?
> > +                 jhash(&d->v6.sin6_addr, 16, 0) :
> > +                 (__force u32)d->v4.sin_addr.s_addr;
> > +     u32 hash =3D jhash_3words(saddr, daddr, ports, net_hash_mix(net))=
;
> > +
> > +     return hash & (quic_sock_hash_size() - 1);
> > +}
>
> [Severity: Medium]
> Should the inner IPv6 fold in quic_sock_hash() be seeded?
>
> The per-netns secret is only mixed in the outer jhash_3words() call, whil=
e
> the 128-bit address is first reduced to 32 bits with jhash(..., 0). Since
> jhash_3words(a, b, c, initval) is a pure function of its inputs, two peer
> addresses whose unseeded 32-bit fold is equal produce identical (saddr,
> daddr, ports) triples and therefore the same bucket for every value of
> net_hash_mix(net).
>
> Does that let a peer controlling an IPv6 prefix pick colliding source
> addresses offline, without knowing the secret, and collapse many
> connections into one chain of quic_hashinfo.chash (capped at 16K buckets)
> that the per-packet lookup then walks?
>
> Compare with sctp_hashfn() in net/sctp/input.c, which the commit message
> cites as the model and which passes the seed into the inner fold:
>
>         if (paddr->sa.sa_family =3D=3D AF_INET6)
>                 addr =3D jhash(&paddr->v6.sin6_addr, 16, seed);
>         else
>                 addr =3D (__force __u32)paddr->v4.sin_addr.s_addr;
>
>         return  jhash_3words(addr, ((__force __u32)paddr->v4.sin_port) <<=
 16 |
>                              (__force __u32)lport, net_hash_mix(net), see=
d);
>
> Would jhash(&s->v6.sin6_addr, 16, net_hash_mix(net)) here be equivalent i=
n
> cost?
>
> [ ... ]
>
> > +struct quic_shash_head *quic_source_conn_id_head(struct net *net, u8 *=
scid,
> > +                                              u32 len)
> > +{
> > +     u32 hash =3D jhash_1word(jhash(scid, len, 0), net_hash_mix(net));
> > +     struct quic_shash_table *ht =3D &quic_hashinfo.shash;
> > +
> > +     return &ht->hash[hash & (ht->size - 1)];
> > +}
>
> [Severity: Medium]
> Same pattern here: the connection ID bytes are folded with jhash(scid, le=
n,
> 0) before the secret is applied, so any two connection IDs colliding in
> that unseeded fold share a bucket for any secret. Would passing
> net_hash_mix(net) as the initval of the inner jhash() be preferable?
>
> Note the connection IDs inserted in this series come from
> quic_conn_id_generate() using get_random_bytes(), so the practical exposu=
re
> is smaller than for the connection socket table.
>
> > +u32 quic_addr_hash(struct net *net, union quic_addr *a)
> > +{
> > +     u32 addr =3D (a->sa.sa_family =3D=3D AF_INET6) ?
> > +                jhash(&a->v6.sin6_addr, 16, 0) :
> > +                (__force u32)a->v4.sin_addr.s_addr;
> > +
> > +     return jhash_2words(addr, (__force u32)a->v4.sin_port,
> > +                         net_hash_mix(net));
> > +}
>
> [Severity: Medium]
> And the same unseeded sin6_addr fold appears in quic_addr_hash(), so
> address-keyed hashing inherits the same property. Should all three helper=
s
> be updated together?
>
False:

Not necessary. The per-netns net_hash_mix(net) is already used as the seed
of the final jhash_3words()/jhash_2words() call.

Thanks.
