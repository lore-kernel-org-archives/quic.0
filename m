Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013336495D
	for <quic@lists.linux.dev>; Wed,  4 Mar 2026 23:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666819; cv=pass; b=oxh5qfVafOqTuk37aDI8CVJr/9h4lsTGo/m6dwGyWN7fnCiCOQyavMthHI3Mb/YxPOHxQEQu+76KUyPf0+0tWPJ74HIz55+gTsqVulnW5wqkLjwMlpgDFs3+E9HmOqGhdgTmEwLmB4wrH0uTxa+YRG2gNNe11DhAjp9Mfma/PuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666819; c=relaxed/simple;
	bh=mNEKFaRMnDHfe0orczkAXGRlU1VB7gl1INEnkvG/KwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iI3GdHd9q6lgdvgebq6ymguf6QYgdEC0d52rm0zIyhJ6zZ9FJhzY8Ueo+uYBmVNQHR7K9Mz2JMaCuN88uXvifWkXwsowC5gGJBggUMvxYb9FvXsCAUCFjiopRlUcwJZz2JnWmhy6WPr+sNPdVdHWFlreaEw/n+SaE/dM4/y/q4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3+lLNbh; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3+lLNbh"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56af41d1e0bso46717e0c.1
        for <quic@lists.linux.dev>; Wed, 04 Mar 2026 15:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772666817; cv=none;
        d=google.com; s=arc-20240605;
        b=aA1FO7vOmRBdXCe8+x6VpiXRIwOPudVK3DLSut51VtZYnt9GwIoW2BkAwxdFtJBmWq
         PptoQsjffNS7pwxDfq4K4cWhRenm4Zy1+jxE6tNzq1lMaRUhdP8/Y1RnLAm/qrfcVBY0
         ceX1g03qpibxC6Fuoqjzfqbf9XinbvEJFDc9sGVcDwopZ9BZRss5fYXjk0g/7MjGjYXw
         wQnbP6c/NrITuMxK04nQfM3fG6AO1sJLJ6B7FtCBvJHInWZhmn/4sGLclZFL2F5RpLKZ
         RUm46ZpbPEnuoMmr4tvEZfl3S10ErWWi8JqREyS+O/EPqdLyTR+Zzxjj7FfN95bk1v+E
         FInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTFDYsqZ964fQZj00eGDb1NQ/WjjGh2BRCQyhHEgw9o=;
        fh=swPNU017qHdMplRzMTkLj7790FE+0Fjzthw23mWzThY=;
        b=cVYIt2RQyWq1jjAWTTOPjCC5z7wt8MRN9HfCqYMH5/gLTxrtZVmShO+lNPArVj5zbS
         NPOhTDDMiKCqSwl2isPbbDqKS8iuLthW2R0DCffy0fHLVjWeMwDCRCNMH7PgmEBnaYo0
         Rk8lVZAVr2lWuAXc3bofqVczS4JDwckuz2KTMIZ3Gd/0Qg3AcGogvpTWFIsir8a9njNu
         Sor5icfvHgnuuZvzEh/u9/H1pacR0tOXM/zMN0GCIBCuyUV4pnl0cRZBQa1Rif4OPbP3
         Lqmlb6kuwAq2vEt3awaOtCcP2d/0ZgtTTNczWQjVYoP/nSicCtewZGjTnPs1hRLKMuPn
         WAGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772666817; x=1773271617; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTFDYsqZ964fQZj00eGDb1NQ/WjjGh2BRCQyhHEgw9o=;
        b=V3+lLNbhnU1K3E+yHod45QAYU4T6iy9Ab4O1cX5nIWOsnFMzQ/13fqWT7tCMp8tg3M
         LTwjRqC2IJ9eTKGhrOx7kZJwCMRdV6dH78YND1boWvesmpr7pkoUMPJ9ksnOGmIzd76b
         AV1SOR+3aVUu1r29U/Zx+nhQ/wEtsgWcJ3I+CzLsR1lAd9zCjaMVMAtnqFZGxN/QIqMM
         bUqsQKWV+HxyLCvG2wHP/MFqqGU8a9jlI6kB29HNXU0x5S12L0RzUkSMsUmRwOoIPW0r
         ZVZny6WqnYTmXNlYyOHB6dBotlc+MQYXjJF3MvhvxAb8AsKEMKXe/CPw6OZUNmZJlJ25
         4v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772666817; x=1773271617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTFDYsqZ964fQZj00eGDb1NQ/WjjGh2BRCQyhHEgw9o=;
        b=orK64BRLo49wffKjG4S3mfn21MTTpLCndQCM4iy40zlicGZx6vqqlRIiMGi6zowbT8
         uOr038vJsooG+zJ0fvJdf9INU/3KXTbKlg+fHg0QK2E82NiasYIEu3Z6/vP2flnlIxWy
         sGipMUY3nfJ5FWqLEvWztxi5Ata55TU4EIMFI72rVY7fvyIHFkPVylunkWulbil2ouog
         adUdMxYY3G+sZadFUE+CNF8/+MOt6fUhoDDwhiMlnYJgfG2H+IZszkutBDNxEN7VzJb1
         A1Cy3Kdag36PVBrkjMVO+ye7scJhV3SU2munlw/fPCK8xwtKtt1EJ0yP18G/SIUOr9/n
         Ai4w==
X-Forwarded-Encrypted: i=1; AJvYcCWG51dSIXkjRLjNlLFx3hG3DqZdjjEyJUYguSQXfr2qxTCJmZnaJkObYJSgqao5I3dq9EwI@lists.linux.dev
X-Gm-Message-State: AOJu0Yx01OOXAtyocgGHcwsVzz+rTrAWdsY4DJW3o311Kc3smdvKIUgd
	mbuN5EY2M5ULwF9DJwa0ezFfnqbAVkL6Fli0QxI/3RSmwn+Bmg7HRcGxImZSpF+kf09tJMV3XPD
	neaWjEjzlNN0izs3HFjUSCGFzBUyt8jU=
X-Gm-Gg: ATEYQzzHVtLlTpRklU2x5nlc1OEu9+worCYeLgNH21rSqNv9kRJ46u18H1rjcq/H0pV
	oDvHSPe7M0xdegGd1YW+es0bfNFsycWSrOAvDJjwMvEmmixtwKKEhK2mmrInbfWrcQNmsSJO15a
	Scf+HXZ3ziEACGogzYMWvfHKegj8qMaeBwD6o3YVBei0S624pYhuIc5ce1xgoFNgcOtSc2TLP5Q
	UbNDnDrCzSnAWtzCjvxeluOJBp12ge54QwVaeVN0QGt44IUezjpOFgEUfOmYFjYjKyHTSnK+7ly
	FdE+zYkd/VoZ7kZBb4H4psGGKGI2bRopw2G4HB1lR7sT/6BXo7PkW8bSgiRwyntv22CLmTLQQ85
	Wkq7f9bw9PeAc2ZyR
X-Received: by 2002:a05:6102:6106:20b0:5ff:b684:f796 with SMTP id
 ada2fe7eead31-5ffb684fcb5mr841879137.13.1772666816783; Wed, 04 Mar 2026
 15:26:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <e49a24b97a25a9c25bd33411b8212978dd566bd3.1771986861.git.lucien.xin@gmail.com>
 <CAF6piCJDWjOmgkspuk28qAF8+9xj_o-zTXkUdB+3_waZqaMXBA@mail.gmail.com>
In-Reply-To: <CAF6piCJDWjOmgkspuk28qAF8+9xj_o-zTXkUdB+3_waZqaMXBA@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 18:26:43 -0500
X-Gm-Features: AaiRm51sN3852302sTemIODlyAcPk2eG-uFfqRRmkPhePbFyqTDKIq6vNte4qKM
Message-ID: <CADvbK_djqHEaj1nO1mAR0h9qpkTUX1cXGMPEjrswySM_1bXNvw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 14/15] quic: add packet builder base
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:19=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/25/26 3:34 AM, Xin Long wrote:
> > +/* Transmit a QUIC packet, possibly encrypting and bundling it. */
> > +int quic_packet_xmit(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     struct net *net =3D sock_net(sk);
> > +     int err;
> > +
> > +     /* Skip encryption if taglen =3D=3D 0 (e.g., disable_1rtt_encrypt=
ion). */
> > +     if (!packet->taglen[quic_hdr(skb)->form])
> > +             goto xmit;
> > +
> > +     cb->crypto_done =3D quic_packet_encrypt_done;
> > +     /* Associate skb with sk to ensure sk is valid during async encry=
ption completion. */
> > +     WARN_ON(!skb_set_owner_sk_safe(skb, sk));
>
> This is the TX path, how can sk refcout be 0 here? Possibly use
> skb_set_owner_r() directly? At least use the WARN_ON_ONCE() variant and
> add a comment documenting why is needed,
>
skb_set_owner_r() will do memory account with the skb->truesize, which
is not what it wants here. skb_set_owner_sk_safe() is used to keep the
sk not released during async encryption completion, as the comment
above says.

I don't see another set_owner_sk helper for this. Please let me know if
you have a better way for this.

For now I will change from WARN_ON() to WARN_ON_ONCE(), but still keep
skb_set_owner_sk_safe().

> > +     err =3D quic_crypto_encrypt(quic_crypto(sk, packet->level), skb);
> > +     if (err) {
> > +             if (err !=3D -EINPROGRESS) {
> > +                     QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCDROP);
> > +                     kfree_skb(skb);
> > +                     return err;
> > +             }
> > +             QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCBACKLOGS);
> > +             return err;
> > +     }
> > +     if (!cb->resume) /* Encryption completes synchronously. */
> > +             QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCFASTPATHS);
> > +
> > +xmit:
> > +     if (quic_packet_bundle(sk, skb))
> > +             quic_packet_flush(sk);
> > +     return 0;
> > +}
> > +
> > +/* Create and transmit a new QUIC packet. */
> > +int quic_packet_create_and_xmit(struct sock *sk)
> > +{
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct sk_buff *skb;
> > +     int err;
> > +
> > +     err =3D quic_packet_number_check(sk);
> > +     if (err)
> > +             goto err;
> > +
> > +     if (packet->level)
> > +             skb =3D quic_packet_handshake_create(sk);
> > +     else
> > +             skb =3D quic_packet_app_create(sk);
> > +     if (!skb) {
> > +             err =3D -ENOMEM;
> > +             goto err;
> > +     }
> > +
> > +     err =3D quic_packet_xmit(sk, skb);
> > +     if (err && err !=3D -EINPROGRESS)
> > +             goto err;
> > +
> > +     /* Return 1 if at least one ACK-eliciting (non-PING) frame was se=
nt. */
> > +     return !!packet->frames;
> > +err:
> > +     pr_debug("%s: err: %d\n", __func__, err);
> > +     return 0;
> > +}
> > +
> > +/* Flush any coalesced/bundled QUIC packets. */
> > +void quic_packet_flush(struct sock *sk)
> > +{
> > +     struct quic_path_group *paths =3D quic_paths(sk);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +
> > +     if (packet->head) {
> > +             quic_lower_xmit(sk, packet->head,
> > +                             quic_path_daddr(paths, packet->path), &pa=
ths->fl);
> > +             packet->head =3D NULL;
> > +     }
> > +}
> > +
> > +void quic_packet_init(struct sock *sk)
> > +{
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +
> > +     INIT_LIST_HEAD(&packet->frame_list);
> > +     packet->taglen[0] =3D QUIC_TAG_LEN;
> > +     packet->taglen[1] =3D QUIC_TAG_LEN;
> > +     packet->mss[0] =3D QUIC_MIN_UDP_PAYLOAD;
> > +     packet->mss[1] =3D QUIC_MIN_UDP_PAYLOAD;
>
> The magic number above looks quite obscure, and AFAICS looking at struct
> quick_packet comments have different meaning. Please use some macro inste=
ad.
>
Sure.
