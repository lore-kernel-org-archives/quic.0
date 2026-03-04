Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D4347513
	for <quic@lists.linux.dev>; Wed,  4 Mar 2026 23:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772667482; cv=pass; b=RgA7q1r9sWvGEn3vtairXOWrhMmGD2tbVZJGy/3u3UYXtvch4NqkMHjLyUjVq5PIvIeRUlmUp25CwZVIo6Jy9WOf+ii7mVmbJqPIu7ldm4Dwq5M9QWd5pUQljdSnyNcFIXQlM+JO6qKik4YwTqY7MCWoDW3zm7MCfr5FQEfFrYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772667482; c=relaxed/simple;
	bh=w1TG5DyyD/MOa39o2nEmPuagdIYdEe1dCKPHHwXRuCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJOVOQDloFdsezRbf0pbnjkIHQ1s9J1q82CC1Um4jc9Xzny41WXXuMffGXY1ladL0EBYXvqgiVS3wrVJHPF/w6TsF68JvRVn+Ct8E13chG2RhIj/5Vy9vunbWZYQDvDdZ3mw0+8dIM4ybY9Y0akJvmy8VIpv6NZ0TKBzH0VuedM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSfHo6su; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSfHo6su"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ff14dd9be4so5114766137.1
        for <quic@lists.linux.dev>; Wed, 04 Mar 2026 15:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772667479; cv=none;
        d=google.com; s=arc-20240605;
        b=TLi8BOfiRen38g0p1ZKr3wPWCLwtspWkkIx6+d+JvnKSSwBoo/XjAqu5xegidFLhwN
         ggCLs3aI0dUVH6wEyBPSQMlob07MpGoQxyb2hglOXirCRFDtpnBvkgFBzKXU/d1YmYMx
         iT6bVaJCMNJ6Xcvif1cPour3ju6oVvfxDxN3hfgHYm5yQbGEThL9ZIHZYlJ1C+Z0+VW5
         IEidbyWoE2g2j4KlxBQx3HwmSvPh2ezqlFXEOBUpei+TdK6FZCcDq6jClqgmlxtoPow1
         OLEpJl7w2TEpV2+kkXHS63ifmMc7lE1Q+rAM3i0VMqPPJCN9bdxy3DsC0SvU9fTxNyfb
         sUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f2lsS6J1KrbGRFoggFb+7TwDvtJ+7CgdNNb0+XNMCDA=;
        fh=iqh6iq+y6UMNHlQNAnDvav6H84Sbpp40iBDgvBUM4QA=;
        b=OaWYrErStf9GrLBWwJE8g6CbW3+jqw7to4hn5CGUtMy+J2vg5WTvYMsz6Yf+io+7Rb
         XNVElaoL4FZO3My23xKcQ0sNjpUpX3OgWAHC3ibje8ZpFFsuFTLXQIn9eIZTz2txGolX
         jzUWBHxMA7EvtTmGc/UuZXCfGlGaEavhI6FTVa2Xq2BDTFbZXlkRU5g6EF3FwRyV7h2K
         rEhgnO9QB7xVDLPdMFBZlx7V4FqGq2JHVkpQEOUAP82W4XldIvg9gQyga1gXiyL7/uGZ
         Ls0+ncGHuV5Iyl0Chs8NztXZ/kj5z+FAIIwfuToUE5dVCTSNmaEdwBrJaZyipyNuBzXu
         oCRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772667479; x=1773272279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2lsS6J1KrbGRFoggFb+7TwDvtJ+7CgdNNb0+XNMCDA=;
        b=KSfHo6suUzI3B/zQnaRxfVV5tH3NAfsNBiVFDNl9GdKyLnqUK0rp+Ikr4U1Jq5LuCa
         bhatc3+K0RwmzE+4iUQZKN5LcoAQR7u1CsuCd0yr2OYi8bjyoVQorluKTODsgS9Dg4yZ
         ax99z+XVtPJmnDBRWbL4sc1JhDMuocvrvDTkjBJAdesTO8SNtq/HEQRDWOHXfrrs5NNO
         N3fBtJKbxLYbvD8ZfBKtiqfZLySNbAr8FOeq/f59XfBLFWTjm7MjUMuJNI+Ovtlu/kGQ
         /QLuaf8q7vV5lxI1NLFO5N47Ff9xxUVmbg7Eu12jJhMmkZNk3Xqb/e91l2ERNY04ax3N
         nqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772667479; x=1773272279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f2lsS6J1KrbGRFoggFb+7TwDvtJ+7CgdNNb0+XNMCDA=;
        b=equqJQDC5nYvDXA4AgIZt751yZzqVEzBajnfUpWoTiZH+EjQIjphonYegO2w6M3lft
         oZ+U/mnF8NIoRZqUg86YmePKdlkAgtJ1o3b6/QNUTybWtoGlb7w09g69QHx9iq499JJk
         OgVLoHJjM6EIhJomAqhCw4mHANcu7WXB0BEP3hZg/aZfRQpiF3bBO3w+f05zilYoNCiD
         7xzbBeE758j3P3tzQcc2Ky6L5HKDCLvGF1nnPD3FWH/2TfCdxz8uDEyABgg93Htn//YQ
         K+404GPaZacap6ztRXhrcGXD7xNOn+zngKSVIrXkYGYBU8VZwqw1/klo2+zwGesBmR6N
         +BJw==
X-Forwarded-Encrypted: i=1; AJvYcCVJH8ipjFz83OyYbqk7TtC4bT/5sx6iJOFLgiUvKcYzRaHsqWL0cy6Bvzf6lEcsEgdKvWmT@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1dznnD+0NfjIsbgUjj3p6du1xkVER7oFSw+DT66fUChjxGbl7
	Aw8NYYXSJU5+cpv2ea4SJGOwS7LC/TsmR3mUye1sA6K+tyh3B8zsi8TbEsGz47kXy0tg2dN+1Rh
	imhPAKhMECYXuv/CIAZSx9+tHtZPf/hc=
X-Gm-Gg: ATEYQzyMz5h1wLS0vvtm+pWX0U43fzegqRT+moCmFo034atmsavmOmHmTVhHCwOu+hi
	lbkWeqbPVIpMQe1Za8AlJuOsBW9G/LclTf5SuWo7le+Z5a5PMUPe+4qHb4xceLD32xAGcfnX1AM
	HO7sUAXzyNDZ8iqyR/EpyG+lJDl3N3LBflIdMNsADVVPB+Qahd412RR3Bwi8JiUq0K/XTqjAl7X
	LN9D9GQs6BUGEAxfMZCFQlP04FChu++nzDQAaskRJdrJQd1/KbjflDYwkvSO/Z+t/cuP7yRg2bl
	aI7i9t2GkkltMFBuQV3A9VoRcJcJsDsKRyjxfkuKHi3BGghw/Ka7e/TqJ+dsD/PnCcH9yhRunyQ
	tmDqT5MhbaAzBG56S
X-Received: by 2002:a05:6102:510f:b0:5ff:a34:6ce8 with SMTP id
 ada2fe7eead31-5ffaaf1af3amr1982362137.20.1772667479118; Wed, 04 Mar 2026
 15:37:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
 <20260303083351.35558-1-pabeni@redhat.com>
In-Reply-To: <20260303083351.35558-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 18:37:46 -0500
X-Gm-Features: AaiRm51OBlwUOZC4nFNNd6vu4H5gc_uzuMHgB2908jHUlSejY2ws0x0OMALq7Fk
Message-ID: <CADvbK_e-Tkb8aVzSy4WhVogETvQy16TrFdtWROtf3Y6oC+PczQ@mail.gmail.com>
Subject: Re: [net-next,v10,15/15] quic: add packet parser base
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

On Tue, Mar 3, 2026 at 3:34=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
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
> receive (RX) path. It introduces mechanisms to parse the ALPN from
> client Initial packets to determine the correct listener socket.
> Received packets are then routed and processed accordingly.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index a56edc745bb1..a23ce99a6656 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > +/* Extract the Destination Connection ID (DCID) from a QUIC Long heade=
r packet. */
> > +int quic_packet_get_dcid(struct quic_conn_id *dcid, struct sk_buff *sk=
b)
> > +{
> > +     u32 plen =3D skb->len;
> > +     u8 *p =3D skb->data;
> > +     u64 len;
> > +
> > +     if (plen < QUIC_HLEN + QUIC_VERSION_LEN)
> > +             return -EINVAL;
> > +     plen -=3D (QUIC_HLEN + QUIC_VERSION_LEN);
> > +     p +=3D (QUIC_HLEN + QUIC_VERSION_LEN);
> > +
> > +     if (!quic_get_int(&p, &plen, &len, 1) ||
> > +         len > plen || len > QUIC_CONN_ID_MAX_LEN)
> > +             return -EINVAL;
> > +     quic_conn_id_update(dcid, p, len);
> > +     return 0;
> > +}
>
> This parsing logic looks nearly identical to what's already in
> quic_packet_get_version_and_connid().  Both skip QUIC_HLEN +
> QUIC_VERSION_LEN, read the length byte, validate against
> QUIC_CONN_ID_MAX_LEN, and call quic_conn_id_update().
>
> Could quic_packet_get_dcid() call quic_packet_get_version_and_connid()
> with dummy parameters, or could both share a helper to extract just the
> DCID portion?
>
No, they work on different forms of QUIC packet, one for short header and
the other for long header packets.

> > diff --git a/net/quic/path.c b/net/quic/path.c
> > index 9414c4f813c5..655f38af4107 100644
> > --- a/net/quic/path.c
> > +++ b/net/quic/path.c
> > @@ -17,6 +17,8 @@
> >  #include "family.h"
> >  #include "path.h"
> >
> > +extern int quic_packet_rcv(struct sock *sk, struct sk_buff *skb, u8 er=
r);
>
> Could this include packet.h instead? The canonical declaration already
> exists in packet.h (after this patch). Using 'extern' here creates a
> duplicate signature.
>
> If the signature in packet.h changes later, this extern could silently
> become stale depending on calling conventions. Since packet.h has no
> include directives and wouldn't create a circular dependency, including
> it would keep the declaration in sync.
>
No, let's not have this dependency for now.

Thanks.
> > +
> >  static int quic_udp_rcv(struct sock *sk, struct sk_buff *skb)
> >  {
> >       memset(skb->cb, 0, sizeof(skb->cb));
>
