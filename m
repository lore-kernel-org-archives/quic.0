Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3B377ECF
	for <quic@lists.linux.dev>; Wed,  4 Mar 2026 22:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772663535; cv=pass; b=FQQDPbMPFj+ylKPn7MwJPy3EPaiA18UZvLXB7VmaymE8NcS222waZ6G8FohZg7Hdd0F1NrneW+/tIeUbkXp5DSkMsTB5XHJuKuRsimc1qXdsJvYN0bLybwXplZQyu5YGLqb/aXionGr8Qtx3utpzrQTh2LaV5AjIyHc4GtF4cy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772663535; c=relaxed/simple;
	bh=KXu//3EBPLrBvO/MghuctSsCjd474Oji/fve+ps6wFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biTPPou+C+2mIiGTVnUQdFPtUFB7ttyv7k+KPy4Dl807xENUkSTC+xvrxkqQKLUfOOUjSgEpiv4X8EKub50WAvdPqb0KWajWB4E1zvAQ35JEmSRPtjK8onqW+7m0r9MSlT3a0yRpZ77i+7cPU0kTxEvIJ2whKqqxYhNvSMxdDsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ul/EFpuV; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ul/EFpuV"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94dd2d71231so2202774241.0
        for <quic@lists.linux.dev>; Wed, 04 Mar 2026 14:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772663531; cv=none;
        d=google.com; s=arc-20240605;
        b=Td/+pWZ+yiL8sUsH1M84TqLWlaFoT/T/tjE9mFcRtR/C55njF+Jv3fFfmicABQ8Ugv
         alI3SsDLEHXDh3JQgEUYXVHaVWs7xp23GmnkUBGT/rznUNUbE4BssenD6ageknmZg52B
         IlbwosI2FqbbFD+uxl5Z5GY62vPOQEin2pxBGPUjJ6uyc5KnzwN+6FgprJKhy+aup5pV
         on52gYp+k84tXhnzfcdp3gngp5TcMD3Mei3OIYqWN0QEIBxIIBw2QGP4gzE9PE85gdJc
         /SJ4CpTngy5buu7tltC26IMrXdlLRSqrawC43A/cctBMPweiTpGSTICiCEP5nQDL0b1m
         lb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z/QRphmRzy8FO2fkKgVz78bs8tUVjsFCxQ1wuKvg3pk=;
        fh=ETmtm4HJk6FIJqr5+owmaR4zN2YG6d29AM4jHp4kaso=;
        b=UJIK97HJLm1IITwTns7w1j0xffzOKH6/9LgSGBtj1Tt1jgqo/HVhb/BHhhzSRXtnPe
         rFeLJLwHObnY4IHJvDHCp2nJsQ/qrt15QNG2s9PgupwQkWQqKiJLe6IA9jRfdwrjjHtH
         3JV427CPTjmSM/6oPOh+rCSUYZaRuEHQuqD8q4lSTQ1Bh0EmuxIFo4Qhr94otwof8iyH
         Ms3SBBC9dyTQsGXecMjaWV/pqn4iFDNr17AcFseB+1tf4b0rIRV5HJPGWXJiFOt+0bv/
         X9hPU931TXHjARXcqSFdsfZ3+k9hsOlK/R8xjNkYfsMkj155e685UuDdUBTfhG2ThBAT
         pDFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772663531; x=1773268331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/QRphmRzy8FO2fkKgVz78bs8tUVjsFCxQ1wuKvg3pk=;
        b=Ul/EFpuVnZ6zTJ2sgvdqiTXgo523TS6VD+ujhJ4rXnyUxHthwOuBaqI6tLwheQ9KLC
         0qNGJiXe8fuXOZpOH4vMjbJ+Y+mjlqfwKGuE6dWYg8E7hfwL40mVkS5UceUUm7Hk8Y7E
         PRBhn88EH6k4cFgDLaU1XLT8eJu5ldJenOn4cTZQi7zs2mwLDLLUJk8B2ybgGeBAf+9z
         94wSZRH8NmNuZXpccFHy9FNBEfmsOqohPwm0CdGvr3kggO/Q0h738/ibQeoCp0mdn+K7
         lUvAs0JqLSXTFx2REZbZLBOwL8vrNIrXHdZn6j6juyOcw56nh6ZSg2mdRKtTVmWHmkWi
         dBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772663531; x=1773268331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/QRphmRzy8FO2fkKgVz78bs8tUVjsFCxQ1wuKvg3pk=;
        b=GfpEDIa3zUrq/6pGvUZ7q/r+0zT8MNRFwQeVX401bElczM1wajFa1EMpSd0hmAhGsY
         pdq2zraI6HIBVqQYcufIa/7ElD7iJ0YVU9z5lf/eA/xCDSxQZ8n7FQzSerOtaIdy7m+V
         V2LcUT4irw7lYQqbvkJDYXtzT6kMyeSruzwcl4wk6S4vcGSz//y5O94soHuHWZCfuVpB
         MDnF6LqXpz0SB8qUHmTzqQ0/iljeqvFaOT6gacDzzkqjoUv7ksxSjvkZiXC1N2g41CJ4
         d/KM3ep6OhMIowvNndn/B1hLPAb3ZWE0aPk6OY11zGdS8BWt92ugAOXVUlhi01b+AE4y
         w46w==
X-Forwarded-Encrypted: i=1; AJvYcCXJp4fSAQHpYv8dVegc9ix6uhafleATLj2Yb7IgscnvayudxEcn+cJloQsBegDUi0U2QOqv@lists.linux.dev
X-Gm-Message-State: AOJu0YxIDxKioBYtjFrumZ1bP/nwYtg2AFjBQxIDNanioCO3sClqMJFV
	jY3rYlkIatFjYRCvlNEChRTOaK4vnx+NU0RK3MwJWRLXOUROdf3/VL2FZ4F3It3x5ilV/BQ2ddZ
	2pI4tVfFi0ShyEIf4R4WJuDu0b2uuAuQ=
X-Gm-Gg: ATEYQzzlnk+ya3smFQPCZSdgMQfgBaMBaHTciUuzViZCcRkQ7QQuqwCXtcMZ8pAUSus
	fwd3np6my6iQRuGfJOgFbJ0lcWF+9MqjVHEj5QrMKlPlb0mzy5unfjYuUshr/O7giYgG+WWQOg9
	hvy/orYk9jI+2Kxf1xkhv6fDP410BiO6kzhwGyXeqTEchk47bse92kbjHDeehehiUp9iIKFG5Eh
	rPR7Xm6+izfAKXtkKM+REm3G0ZsNRjoZVZkBoicJe1yAyfpHoHDEpTcUuHcr5M1xBFwHdEY7xTw
	PhGujsC2C2aS0vJ+cYgYzuVZcHOGgugq7K+FPK4bnvI1Mn9ufbQupYsxg5805PVVQR8dIe2N5W1
	RYMIjcg==
X-Received: by 2002:a05:6102:b0d:b0:5f8:e2c7:a3f2 with SMTP id
 ada2fe7eead31-5ffaa6f6c3bmr1576946137.0.1772663530592; Wed, 04 Mar 2026
 14:32:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3c6ae7299c2fff0fa689d4dcd43ef916e5697d65.1771986861.git.lucien.xin@gmail.com>
 <20260303083255.35354-1-pabeni@redhat.com>
In-Reply-To: <20260303083255.35354-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 17:31:57 -0500
X-Gm-Features: AaiRm51Y186obU2AYuGIwk5fISUHhxMUkh7jtjQG4bgQBZwaKmERG0jYjFiCfpA
Message-ID: <CADvbK_fHhrCh-5zPDY1sh16TEKhJTWhZcUS4-pw=49krocV3SA@mail.gmail.com>
Subject: Re: [net-next,v10,12/15] quic: add crypto packet encryption and decryption
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
> quic: add crypto packet encryption and decryption
>
> This patch adds core support for packet-level encryption and decryption
> using AEAD, including both payload protection and QUIC header protection.
> It introduces helpers to encrypt and decrypt packets for secure QUIC
> packet exchange and address validation.
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > index a9de418e604e..a84fd8d7bf93 100644
> > --- a/net/quic/crypto.c
> > +++ b/net/quic/crypto.c
>
> [ ... ]
>
> > @@ -231,6 +562,137 @@ static struct quic_cipher ciphers[QUIC_CIPHER_MAX=
 + 1 - QUIC_CIPHER_MIN] =3D {
>
> [ ... ]
>
> > +/* Encrypts a QUIC packet before transmission.  This function performs=
 AEAD encryption of
> > + * the packet payload and applies header protection. It handles key ph=
ase tracking and key
> > + * update timing.
> > + *
> > + * Return: 0 on success, or a negative error code.
> > + */
> > +int quic_crypto_encrypt(struct quic_crypto *crypto, struct sk_buff *sk=
b)
> > +{
> > +     u8 *iv, cha, ccm, phase =3D crypto->key_phase;
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     int err;
> > +
> > +     cb->key_phase =3D phase;
> > +     iv =3D crypto->tx_iv[phase];
> > +     /* Packet payload is already encrypted (e.g., resumed from async)=
, proceed to header
> > +      * protection only.
> > +      */
> > +     if (cb->resume)
> > +             goto out;
> > +
> > +     /* If a key update is pending and this is the first packet using =
the new key, save the
> > +      * current time. Later used to clear old keys after some time has=
 passed (see
> > +      * quic_crypto_decrypt()).
> > +      */
> > +     if (crypto->key_pending && !crypto->key_update_send_time)
> > +             crypto->key_update_send_time =3D quic_ktime_get_us();
> > +
> > +     ccm =3D quic_crypto_is_cipher_ccm(crypto);
> > +     err =3D quic_crypto_payload_encrypt(crypto->tx_tfm[phase], skb, i=
v, ccm);
> > +     if (err)
> > +             return err;
> > +out:
> > +     cha =3D quic_crypto_is_cipher_chacha(crypto);
> > +     return quic_crypto_header_encrypt(crypto->tx_hp_tfm, skb, cha);
> > +}
>
> This function calls quic_crypto_payload_encrypt(). Looking at that
> function:
>
> > +/* AEAD Usage. */
> > +static int quic_crypto_payload_encrypt(struct crypto_aead *tfm, struct=
 sk_buff *skb,
> > +                                    u8 *tx_iv, bool ccm)
> > +{
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     u8 *iv, i, nonce[QUIC_IV_LEN];
> > +     struct aead_request *req;
> > +     struct sk_buff *trailer;
> > +     struct scatterlist *sg;
> > +     struct quichdr *hdr;
> > +     u32 nsg, hlen, len;
> > +     void *ctx;
> > +     __be64 n;
> > +     int err;
> > +
> > +     len =3D skb->len;
> > +     err =3D skb_cow_data(skb, QUIC_TAG_LEN, &trailer);
> > +     if (err < 0)
> > +             return err;
> > +     nsg =3D (u32)err;
> > +     pskb_put(skb, trailer, QUIC_TAG_LEN);
> > +     hdr =3D quic_hdr(skb);
> > +     hdr->key =3D cb->key_phase;
> > +
> > +     ctx =3D quic_crypto_aead_mem_alloc(tfm, 0, &iv, &req, &sg, nsg);
> > +     if (!ctx)
> > +             return -ENOMEM;
>
> If the kzalloc(GFP_ATOMIC) inside quic_crypto_aead_mem_alloc() fails,
> this returns -ENOMEM without rolling back the SKB modifications. The
> SKB is now permanently enlarged by QUIC_TAG_LEN (16 bytes) with a
> modified hdr->key.
>
> Compare with quic_crypto_payload_decrypt():
>
> > +static int quic_crypto_payload_decrypt(struct crypto_aead *tfm, struct=
 sk_buff *skb,
> > +                                    u8 *rx_iv, bool ccm)
> > +{
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     u8 *iv, i, nonce[QUIC_IV_LEN];
> > +     struct aead_request *req;
> > +     int nsg, hlen, len, err;
> > +     struct scatterlist *sg;
> > +     void *ctx;
> > +     __be64 n;
> > +
> > +     len =3D cb->length + cb->number_offset;
> > +     hlen =3D cb->number_offset + cb->number_len;
> > +     if (len - hlen < QUIC_TAG_LEN)
> > +             return -EINVAL;
> > +     nsg =3D 1; /* skb is already linearized in quic_packet_rcv(). */
> > +     ctx =3D quic_crypto_aead_mem_alloc(tfm, 0, &iv, &req, &sg, nsg);
> > +     if (!ctx)
> > +             return -ENOMEM;
> > +
> > +     sg_init_table(sg, nsg);
> > +     err =3D skb_to_sgvec(skb, sg, 0, len);
>
> In the decrypt path, quic_crypto_aead_mem_alloc() is called before any
> SKB modifications. Should quic_crypto_payload_encrypt() do the same to
> avoid leaving the SKB in a modified state if allocation fails?
>
This is not true.

- firstly, on RX or Decrypt path, skb_cow_data() is called in
quic_crypto_header_decrypt(), which is called before
quic_crypto_payload_decrypt() in quic_crypto_decrypt(), so
skb_cow_data() is called before mem_alloc for both places.

- secondly, even if the mem_alloc is failed, the skb will be dropped,
no issue could be caused.

> [ ... ]
>
> > +     /* Similar logic to quic_crypto_payload_encrypt(). */
> > +     memcpy(nonce, rx_iv, QUIC_IV_LEN);
> > +     n =3D cpu_to_be64(cb->number);
> > +     for (i =3D 0; i < sizeof(n); i++)
> > +             nonce[QUIC_IV_LEN - sizeof(n) + i] ^=3D ((u8 *)&n)[i];
>
> This isn't a bug, but there's duplicated logic between
> quic_crypto_payload_encrypt() and quic_crypto_payload_decrypt(). The
> AEAD nonce construction sequence (memcpy nonce from IV, XOR with be64
> packet number, set CCM byte) appears in both functions.
>
> In quic_crypto_payload_encrypt():
>
> > +     hlen =3D cb->number_offset + cb->number_len;
> > +     memcpy(nonce, tx_iv, QUIC_IV_LEN);
> > +     n =3D cpu_to_be64(cb->number);
> > +     for (i =3D 0; i < sizeof(n); i++)
> > +             nonce[QUIC_IV_LEN - sizeof(n) + i] ^=3D ((u8 *)&n)[i];
> > +
> > +     /* For CCM based ciphers, first byte of IV is a constant. */
> > +     iv[0] =3D TLS_AES_CCM_IV_B0_BYTE;
> > +     memcpy(&iv[ccm], nonce, QUIC_IV_LEN);
>
> And in quic_crypto_payload_decrypt():
>
> > +     /* Similar logic to quic_crypto_payload_encrypt(). */
> > +     memcpy(nonce, rx_iv, QUIC_IV_LEN);
> > +     n =3D cpu_to_be64(cb->number);
> > +     for (i =3D 0; i < sizeof(n); i++)
> > +             nonce[QUIC_IV_LEN - sizeof(n) + i] ^=3D ((u8 *)&n)[i];
> > +
> > +     iv[0] =3D TLS_AES_CCM_IV_B0_BYTE;
> > +     memcpy(&iv[ccm], nonce, QUIC_IV_LEN);
>
> The AEAD request teardown pattern (EINPROGRESS check, kfree_sensitive,
> memzero_explicit) is also duplicated. Would a shared static helper for
> nonce construction reduce the risk of the two copies diverging during
> maintenance?
>
I will see what I can do to dedup a bit for this.

Thanks.
