Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A39376489
	for <quic@lists.linux.dev>; Wed,  4 Mar 2026 23:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666012; cv=pass; b=gpluwWSSy0BZOUi/y4zIMZx+zip3+u+3olRwDxvtrYkBZUM3JI5ay2YPj0Cw2oZgQkqSOsV25Di3s3RrwHRQPf1rzIdSPxRXiifHnkTrEOVq4LG9TmmUvEwziUIJ6djU7mv9CSM2nL361prQyvQ5kNRaIMiRHS34ecNm42x42sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666012; c=relaxed/simple;
	bh=5l7t5GUb2D/4t62FXPSct37+0hReMV23ketRmHriGMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGPo0biV1/aDUaeFXVDJyONRWuh/G5E9WX8+pzUiMrEKEFp1PjP18ORNiRMZz3xAWXg9Eel0xOwZqkHXqlC8VIugbZpCHIYraaOYJEBlksa31shjrMWZKXadkZ0G06C5J5PVnDZDqD+Vg7kSEwwUdjE8l3Hj/I0wDaHjhAOfu9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWr7CFEL; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWr7CFEL"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffbbf07c11so638369137.2
        for <quic@lists.linux.dev>; Wed, 04 Mar 2026 15:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772666008; cv=none;
        d=google.com; s=arc-20240605;
        b=CbiKkPLVMyr+iNbz0AJ/K9aMcKTRlXk+y1laTatyoJ+IRSlpzuUZaksuNosA8aDIzp
         Q1mZAKi0EqMadZLschdZXW3i8kyH3+MVDU3Uq1VAXN/ZnhKEiOIPigb/l0KFGpMZWXy1
         gn3FXiv/7HnipYawJi6U1v4m19PJgG1HWg7EX1WJoFhY1YxoNntIXZCEe4KCpuOboZMn
         OB7xMS7/NVrtpt0qWhBYlh+ipY0ENAKQXpOke/+Udvhl1IRbI4A2BKTAqRDZ2QoXtFon
         v8FYDgqtsEn4yPrU/LwYEY9vDO52KgXeyJ//poLYjmsgCzzY9NbooJANhtCCL1YLqvzV
         ErpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cT8TknxJNuHJgHXdge5Ni6drCi6rxzjYWQCjsyroxlk=;
        fh=cHOS3w01sudvhIESWIIjfO16npPYmoN4Fcfpjwm0PF0=;
        b=iQXsqTgi1uHKGQJTleA4/uRDouMd7vUMIMcqpVpp70WfBJAorsaLcXjoN2uLk+UA2Y
         bNDreZgiCvaZCssaRygr5VsjfBYkXlpgC298+04zetZ8wK8XC/iBN1BRpDBEKzsOARgY
         SmobhsOQfkZVSviH4UAHMb7YTAhYsO8xkEWcNKO+toioUxV56tkqdXtF61t2n8oGIocy
         l1Sf6f/VHBgl91pHOKsqOvD2tnE3OCYLd2zFqZHzcWz++d0Px6BaZCGQPCMwJ33F4Pnd
         T3SlMOuoPvnThnp6UlgBNTP6NAkIombqrejvnkYZ4vaBlvLfh3llitHSqTr/yohAmGQy
         kWQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772666008; x=1773270808; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT8TknxJNuHJgHXdge5Ni6drCi6rxzjYWQCjsyroxlk=;
        b=PWr7CFEL4d/SvZHB6fxpSXHBSxetPR2k4BUy7ROWZj1iSXegJkUP9KLzALnQlN4b23
         8hmsTE7A1L3VtiVRQSlxjP/vzqhlDwVi4d9Bb75v0CJ73x6wxpWpAErlI70BqzzLuHiq
         L1jV4NyZ3mtlflUSJKt3D0Mrqv4NwnssNm6tJG98qIAi/8io4VdUGuiP68DSXp6kWGMh
         7fTafrTU9Xvi1K/B7CMvJNeqPuOXXOAWYs/rE9vI6JF8+rb9oSZxGNG3ALPapCmjBs13
         Ju49eWIg1NW7UCqxcQ9A7wOjIGQLhnxK5zudUpKh0eus/tflgD91mCmwc4OGFEMM5YTF
         SG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772666008; x=1773270808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cT8TknxJNuHJgHXdge5Ni6drCi6rxzjYWQCjsyroxlk=;
        b=bxC/sDWmB8EY1ouoUz4sQRXihZuWIzciSUdqwcwlUcgDJqqPI9YCL+WAZDNHYjK00n
         14kJZh/FlcYDl6XWOPyfHGJX0OLvDM6NvJs64zoGSqzrODLdQ/OcZNlWVsjyhr/OFRTI
         4UDs/fE9EZIgld4anENZjokHLcxeZNsa1TK5nFfRP/wabYKpvZOCWZ40VREGtMR0XlMa
         9DDwg1HWNZSiqiBrSFGC2pr/oUyeXeaqwMbW4xxtJCq2ntsuqVFz5VDH1pKMFEL/9NP0
         y4Ur09j/s+oM/LSVxeBDTzdP1M5yBL0KQSd4EFYjSE7KK/LkWqvG2q2/0yIdyOzmFY1q
         DRPg==
X-Forwarded-Encrypted: i=1; AJvYcCWoCpavQawZlqZE3d3xQao5FFhymSBoBxnUYqMmDBWpDMuuQwwKpNd+olpaVNo7tFJI9L4g@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz12TDFxZkOwUi4BzIcGK9OoMi1cQkw24aUrDIkFIT7JObAgYT
	VbrhOM8oVfgcMIBMvn9qej2vXaj5SFOTUC3HNU6o6NVQBFkNWcpKrGWXqxfBl5fN4zIyQIxSW+Y
	RedNPvcc07yvn64fx0BcGEM8BPBvIe2Y=
X-Gm-Gg: ATEYQzz+ZQ56fEIPRYSJa+G+bW3zPdVajV4BtuNpy3Rrs5DfXIPhmWfhUdQ5qAJcPB2
	vRY3qDN/aJQeXzCE4C32iPZPlsBZ0Bf6NV1mmAeYL0Qp6qvDC4GrSZRo/yn/N8akQ9ZVmZ5IHYX
	w2aSwJ4SYdSUZ1pWioNN8fr3Bb5aMFityYXyFj1DMm+7WMmVqL1YuwOdJ/No+4HNfCFMtzyJPXv
	sDjy0Q6EMu1ZJC7K/Z5gzrNOkacrhNZpdoz995nTbqhC9vmWyV5AnW76TY/Loo1XGwZVFi1MfN1
	RY6OcQuBcmQ6VyEbBP0TSjTUGwTyYqGpbB1MWOsXERGVew2myZUq2yyml1r3avSw0eNs7Bb7/wh
	3EPgSCxZLm9aQ0PgW
X-Received: by 2002:a05:6102:5489:b0:5fe:652:5d2e with SMTP id
 ada2fe7eead31-5ffaaef0e47mr1704970137.24.1772666008447; Wed, 04 Mar 2026
 15:13:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e49a24b97a25a9c25bd33411b8212978dd566bd3.1771986861.git.lucien.xin@gmail.com>
 <20260303083338.35544-1-pabeni@redhat.com>
In-Reply-To: <20260303083338.35544-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 18:13:15 -0500
X-Gm-Features: AaiRm527Z74RAkiN-mCfJkeNg8yTAxvy5WGzpm2A5_gQLEbJOF1OYgOVWbRr1Wc
Message-ID: <CADvbK_eo-aMrhr39ai6i+QU4d30_-Z=_5Cn4K9Yr2=XQat_51w@mail.gmail.com>
Subject: Re: [net-next,v10,14/15] quic: add packet builder base
To: Paolo Abeni <pabeni@redhat.com>
Cc: hepengtao@xiaomi.com, kuba@kernel.org, jlayton@kernel.org, metze@samba.org, 
	davem@davemloft.net, kernel-tls-handshake@lists.linux.dev, horms@kernel.org, 
	hare@suse.de, aahringo@redhat.com, tfanelli@redhat.com, mail@johnericson.me, 
	andrew.gospodarek@broadcom.com, linkinjeon@kernel.org, dhowells@redhat.com, 
	matttbe@kernel.org, xiyou.wangcong@gmail.com, dreibh@simula.no, 
	jbaron@akamai.com, quic@lists.linux.dev, pc@manguebit.com, 
	marc@fiuczynski.com, edumazet@google.com, alibuda@linux.alibaba.com, 
	steved@redhat.com, illiliti@protonmail.com, tom@talpey.com, 
	marcelo.leitner@gmail.com, sd@queasysnail.net, linux-cifs@vger.kernel.org, 
	netdev@vger.kernel.org, mbuhl@openbsd.org, smfrench@gmail.com, 
	chuck.lever@oracle.com, daniel@haxx.se
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: add packet builder base
>
> This patch introduces 'quic_packet' to handle packing of QUIC packets on
> the transmit path, including frame packing, packet construction,
> encryption, bundling, and transmission logic.
>
> > diff --git a/net/quic/Makefile b/net/quic/Makefile
> > index 2ccf01ad9e22..0f903f4a7ff1 100644
> > --- a/net/quic/Makefile
> > +++ b/net/quic/Makefile
> > @@ -6,4 +6,4 @@
> >  obj-$(CONFIG_IP_QUIC) +=3D quic.o
> >
> >  quic-y :=3D common.o family.o protocol.o socket.o stream.o connid.o pa=
th.o \
> > -       cong.o pnspace.o crypto.o timer.o
> > +       cong.o pnspace.o crypto.o timer.o packet.o
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > new file mode 100644
> > index 000000000000..a56edc745bb1
> > --- /dev/null
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > +/* Perform routing for the QUIC packet on the specified path, update h=
eader length and MSS
> > + * accordingly, reset path and start PMTU timer.
> > + */
> > +int quic_packet_route(struct sock *sk)
> > +{
> > +     struct quic_path_group *paths =3D quic_paths(sk);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     union quic_addr *sa, *da;
> > +     u32 pmtu;
> > +     int err;
> > +
> > +     da =3D quic_path_daddr(paths, packet->path);
> > +     sa =3D quic_path_saddr(paths, packet->path);
> > +     err =3D quic_flow_route(sk, da, sa, &paths->fl);
> > +     if (err)
> > +             return err;
> > +
> > +     packet->hlen =3D quic_encap_len(da);
> > +     pmtu =3D min_t(u32, dst_mtu(__sk_dst_get(sk)), QUIC_PATH_MAX_PMTU=
);
> > +     quic_packet_mss_update(sk, pmtu - packet->hlen);
> > +
> > +     quic_path_pl_reset(paths);
> > +     quic_timer_reset(sk, QUIC_TIMER_PMTU, paths->plpmtud_interval);
> > +     return 0;
> > +}
> > +
> > +/* Configure the QUIC packet header and routing based on encryption le=
vel and path. */
> > +int quic_packet_config(struct sock *sk, u8 level, u8 path)
> > +{
>
> [ ... ]
>
> > +
> > +     /* Perform routing and MSS update for the configured packet. */
> > +     if (quic_packet_route(sk) < 0)
> > +             return -1;
> > +     return 0;
> > +}
>
> Should quic_packet_config() propagate the error code from
> quic_packet_route() instead of returning -1?
>
> The function quic_packet_route() returns proper negative errno values
> (via quic_flow_route()), but quic_packet_config() replaces any error
> with -1 (which is -EPERM). This could be misleading when diagnosing
> routing failures.
Currently quic_packet_config() callers will either skip the process or
return -ENETUNREACH on the failures. But maybe it's better to use the
errno from quic_packet_route(). I will try to improve this.

>
> > diff --git a/net/quic/packet.h b/net/quic/packet.h
> > new file mode 100644
> > index 000000000000..8c23be386207
> > --- /dev/null
> > +++ b/net/quic/packet.h
>
> [ ... ]
>
> > +static inline u8 quic_packet_taglen(struct quic_packet *packet)
> > +{
> > +     return packet->taglen[!!packet->level];
> > +}
> > +
> > +static inline void quic_packet_set_taglen(struct quic_packet *packet, =
u8 taglen)
> > +{
> > +     packet->taglen[0] =3D taglen;
> > +}
> > +
> > +static inline u32 quic_packet_mss(struct quic_packet *packet)
> > +{
> > +     return packet->mss[0] - packet->taglen[!!packet->level];
> > +}
> > +
> > +static inline u32 quic_packet_max_payload(struct quic_packet *packet)
> > +{
> > +     return packet->mss[0] - packet->overhead - packet->taglen[!!packe=
t->level];
> > +}
> > +
> > +static inline u32 quic_packet_max_payload_dgram(struct quic_packet *pa=
cket)
> > +{
> > +     return packet->mss[1] - packet->overhead - packet->taglen[!!packe=
t->level];
> > +}
>
> This isn't a bug, but quic_packet_mss(), quic_packet_max_payload(),
> and quic_packet_max_payload_dgram() all repeat the expression
> 'packet->taglen[!!packet->level]'.
>
> Could these use quic_packet_taglen(packet) instead for consistency?
>
OK.

Thanks.
