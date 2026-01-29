Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6A328B47
	for <quic@lists.linux.dev>; Thu, 29 Jan 2026 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715589; cv=pass; b=i6MdKI/5argn2h5YZMDha+yTdMrxXhuohtlCpcgFHfsR1uWcf77slLYSbq0m9QQsa7pDDngH7ELyLvWvS8xgFrQVRbgr62ro++4AOF8nAV2rNVu/f933rQ+lE3X8aFpxo5YOz/RMwQLeWa1HBhiic/GLw2DiCz0grOTJFtwdn4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715589; c=relaxed/simple;
	bh=slWb1gPv2FtqXq1twLRiSOtOOA1QvUUzSYzROoZg1Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMzlIaORqB7gdifpTFCR66Bxbw/5TaEQYAZOHMOyzv1dH3iS6axdd/WNxzgXVjV/+aMGOJRz37HLlf259CMyR+4dkP8lRN05acMN6vZwokNbdkboVQlpPtnG8LNHJQKSKYI9i00IGFh6ozYTfY9KkNGJeEXIjFhS6tA1zbWiues=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhgW/Zfq; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhgW/Zfq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso1535261a91.1
        for <quic@lists.linux.dev>; Thu, 29 Jan 2026 11:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769715587; cv=none;
        d=google.com; s=arc-20240605;
        b=bRqHDZbjZp1bdtFo5vZDfEAsOlGgy8Ft7m68KBqxfNfDcPdUtybGOMeEDfumsFuDPg
         AhHoc1KNMHij4Ap/1KxtjaP3kDMWHEmfljscBgl+xxxJhW7T42ey9rZ0a8f2XRSX9rTW
         N/eAPYZYBeyC2bVc+HAv8fPVmvuPstJvwMMtEy7aYt9aOlXuEJz6ekVtiTmYs+uf70bm
         g8a42eCk7fLZNqrHml2U8G6iVW8RgcmgrTRSikcdA1t86xjD/nydUPFM5MEhzKW0ELy1
         I6fDFf5tBUfP/r5jxMVa1eswI1+Rc8xFXpqaGencR8qKbQx7tzsxqf0NoCKACq1Xr57V
         drWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=76tIsRX/4Fg/g4PCHkk+TBEOGwkN2KFdE8yBjFB4Hrg=;
        fh=VoONzOCzJd+MGpUnRNnc/fx5DYVX+JoPch7K8xPC2VQ=;
        b=EEeDX9o91KdGtqm3ju3pjDVUBVlhvZK3gbydpPH31Q50wNfBxtaKl7b3ji0gZaL3Ij
         210b4UKcosj/fDyGAqYx065t4hIkXqQEe6F8D77q43w3D0vLF3PDth8LZbOhhztsKcMu
         j1MlaUBnDk00QLhUeoe90Jk18fQWjfwYMowDP2uXuNyoaLZSJumRMNu3DTWyyx6A8TTE
         woXnPqAPJSh73iytW33NORErolNtpIGa7PhYCtDOxJjeu3wJhbssrEBarRTn/HU1zRAp
         lirUaNcVTk5FnyoNC976zdXdjApTpNw0CEP+O4TP7Z8H/LgfCn0vPyKZRi7rZ0F9cJq7
         ZCRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715587; x=1770320387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76tIsRX/4Fg/g4PCHkk+TBEOGwkN2KFdE8yBjFB4Hrg=;
        b=hhgW/ZfqRvQ8VSfLuR+VxLm/v7IEt02wMHUGv3x/qemwMw3lhM0GjuCnXLWbSWLxoa
         5f3R5RbOtN7++WDbNlADpjldD7mk/38daIQWs0aKzJzqXGHADwBf7Plm3oXQGHHL5szs
         GO5VRhQZq1BB24mVlQevl0ktzoVEFrFHIC3XH8J+tylCib3iVEW9KneRfTuLhuDZr3vc
         An0gBS3R83rnYxYP99JMW/SIP9lBD1wbVdXFC7r1oGBklR7r5o7UgrvBRmdMctuqkpoe
         Z2sEeV8V5D5CGi3rNwsZhF3aeSSHrovNUYWWKRPSA3lx019EWd9RZsFgaV5FZaSSgM01
         OubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715587; x=1770320387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76tIsRX/4Fg/g4PCHkk+TBEOGwkN2KFdE8yBjFB4Hrg=;
        b=nazWEVutDQLSyJflfo2SXQhbtDArBL1/lJSjn3a1/b7+cPaetIirPQcR2S7f1opmWy
         qOGqhGyPq/jevHRND3KDCfjCU89pY5zIcapb5GQgADzGGJW05b0tBL5IfqgHMaAQWbgM
         pOoSfWCWMflEeNOFMvXGI1MzYsEQE2YFYHWE/AvjC98QthCbT7M31b2p8Z/tMRxFavcG
         w2/k91HRW2sy07lSxGCNC4lSS+2KNWAfB+6efe1WQJokXvXmYLj+8snW/4lHWcvF7a+2
         X/nxRgKmPC1lalI0zJfh51sas4ejoKuTZthbWE5KFeZw250zkyArZSu+nlXvqcm1hyzF
         evyA==
X-Forwarded-Encrypted: i=1; AJvYcCW9eLjLS6B7LYvx6xda0qc+UF0r5cPubttPrTdLfhKN5kS2UEPu4KwMqPc/mSPzzQcIhpb0@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq5Z1kyCXqbCpCVxpusc//Qg/lA2lymEK7eVCe/f3AgS/6kQDg
	yZnHWorCuwUB+8myuofQN3EDq6bqxTo1TgjVE0nkrO/lHoH29ccFaOdR9WSM2vlUFU0rlrzyM+8
	BL7Qs+ORyv9gn7al9F+m/3xKDP/c17S8=
X-Gm-Gg: AZuq6aKAt1dAZIrB/Wir/lVyv1bTZEwuP3hEzZQP9+IE3FJs4TZ0K0fXASHNchDLUgG
	KIPM9Ap7xhpGX0A6ZaUBQB/Sbfw1uydk5qjJ1eO9v861euXxTHh8R7cKBTukZNUZjsyup8hLs4A
	w6cqvpWXmViPE9RLqgMn0/IzKLZhMKCvZ1Avz+LWZfVDHXoyW5JM9LGvuS2XLfNM4tAn2Jg/SY/
	ucaNl/Bo9dWiVrShUc45f9YpaSnI7L2R8EPhJMpyMjvjN6A79feia1gXFxCRZbrtzXgzt12iZQH
	dalnLLP5JPeOgLzRtAk+9EPWLSRpcQ==
X-Received: by 2002:a17:90b:33c1:b0:34a:c671:50df with SMTP id
 98e67ed59e1d1-35429b2e55cmr3308198a91.17.1769715587450; Thu, 29 Jan 2026
 11:39:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769439073.git.lucien.xin@gmail.com> <4ec3ade7dfc709658a2b1839dbe29c9467b25fdf.1769439073.git.lucien.xin@gmail.com>
 <b0045978-ea65-422b-8260-d079b43eb553@redhat.com>
In-Reply-To: <b0045978-ea65-422b-8260-d079b43eb553@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 29 Jan 2026 14:39:36 -0500
X-Gm-Features: AZwV_QhlVoBaCiIz5kopBTHIpw23-lZlR_vHRkTAGEfDtCF_CgQBWEVXy3dNJWo
Message-ID: <CADvbK_d9FE+Z72JpdFER65dJ7X19Or_m0sLBPdWOZP9DPbksQA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 14/15] quic: add packet builder base
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

On Thu, Jan 29, 2026 at 11:40=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 1/26/26 3:51 PM, Xin Long wrote:
> > +/* Configure the QUIC packet header and routing based on encryption le=
vel and path. */
> > +int quic_packet_config(struct sock *sk, u8 level, u8 path)
> > +{
> > +     struct quic_conn_id_set *dest =3D quic_dest(sk), *source =3D quic=
_source(sk);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct quic_config *c =3D quic_config(sk);
> > +     u32 hlen =3D QUIC_HLEN;
> > +
> > +     /* If packet already has data, no need to reconfigure. */
> > +     if (!quic_packet_empty(packet))
> > +             return 0;
> > +
> > +     packet->ack_eliciting =3D 0;
> > +     packet->frame_len =3D 0;
> > +     packet->ipfragok =3D 0;
> > +     packet->padding =3D 0;
> > +     packet->frames =3D 0;
> > +     hlen +=3D QUIC_PACKET_NUMBER_LEN; /* Packet number length. */
> > +     hlen +=3D quic_conn_id_choose(dest, path)->len; /* DCID length. *=
/
> > +     if (level) {
> > +             hlen +=3D 1; /* Length byte for DCID. */
> > +             hlen +=3D 1 + quic_conn_id_active(source)->len; /* Length=
 byte + SCID length. */
> > +             if (level =3D=3D QUIC_CRYPTO_INITIAL) /* Include token fo=
r Initial packets. */
> > +                     hlen +=3D quic_var_len(quic_token(sk)->len) + qui=
c_token(sk)->len;
> > +             hlen +=3D QUIC_VERSION_LEN; /* Version length. */
> > +             hlen +=3D QUIC_PACKET_LENGTH_LEN; /* Packet length field =
length. */
> > +             /* Allow fragmentation if PLPMTUD is enabled, as it no lo=
nger relies on ICMP
> > +              * Toobig messages to discover the path MTU.
> > +              */
> > +             packet->ipfragok =3D !!c->plpmtud_probe_interval;
> > +     }
> > +     packet->level =3D level;
> > +     packet->len =3D (u16)hlen;
> > +     packet->overhead =3D (u8)hlen;
>
> Given the above math, it looks like hlen can never be > 255, but
> possibly a DEBUG_NET_WARN_ON_ONCE() could save from future bug and make
> the code more clear?
>
sounds good.

> > +
> > +     if (packet->path !=3D path) { /* If the path changed, update and =
reset routing cache. */
> > +             packet->path =3D path;
> > +             __sk_dst_reset(sk);
> > +     }
> > +
> > +     /* Perform routing and MSS update for the configured packet. */
> > +     if (quic_packet_route(sk) < 0)
> > +             return -1;
> > +     return 0;
> > +}
> > +
> > +static void quic_packet_encrypt_done(struct sk_buff *skb, int err)
> > +{
> > +     /* Free it for now, future patches will implement the actual defe=
rred transmission logic. */
> > +     kfree_skb(skb);
> > +}
> > +
> > +/* Coalescing Packets. */
> > +static int quic_packet_bundle(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     struct quic_skb_cb *head_cb, *cb =3D QUIC_SKB_CB(skb);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct sk_buff *p;
> > +
> > +     if (!packet->head) { /* First packet to bundle: initialize the he=
ad. */
> > +             packet->head =3D skb;
> > +             cb->last =3D skb;
> > +             goto out;
> > +     }
> > +
> > +     /* If bundling would exceed MSS, flush the current bundle. */
> > +     if (packet->head->len + skb->len >=3D packet->mss[0]) {
> > +             quic_packet_flush(sk);
> > +             packet->head =3D skb;
> > +             cb->last =3D skb;
> > +             goto out;
>
> The same code is duplicate a few lines above; you could reduce
> duplication jumping to a common label.
>
will add a goto label at the end for this:

init:
        packet->head =3D skb;
        cb->last =3D skb;
        goto out;

Thanks.
