Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A8A389115
	for <quic@lists.linux.dev>; Fri, 12 Jun 2026 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295825; cv=pass; b=U4Jnp5EPrj39Fr5n0cERKAny5umNmVAW8PTRmcf2KN4w2x3lin+L9k7DPpTEWfEchk4Md3eLNyTKcCh2AD1BZhUaVoX7GSFDOnnVVG329wMOdoU4H87F3wFlISXIyDIuCmLTzaBn3DkkvqnnKfN39IX2tqf7GmI8Bwzr8rnUZSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295825; c=relaxed/simple;
	bh=j+Tw/DqvrvyTXJQnCqEunpYlqcUp4PdtpY9B1mt+aCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzHcPVfhz5oYRzCH1jcxUn11Z2g6RfQ/AywgtdPZL+jTAAVolQL2Q8z0EJfGI+mSlblBOgIqErd3szl+OiwxSHaNaHlVYFL2ad9fZqwgdXL1VnkPXaUxEfvlsmOIOIWSR83qWsur3aRjAEFvi/EIPyi0OaKc2nD4wULn9pROqYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxsHDY2O; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxsHDY2O"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842848fd613so1424813b3a.3
        for <quic@lists.linux.dev>; Fri, 12 Jun 2026 13:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781295823; cv=none;
        d=google.com; s=arc-20240605;
        b=WUe4qFoGUdRXdCnjowKPg6QZCwgfuy/sggaZICf0h0Cascc7p8OAabbd9TkB4gQ3TX
         9fp07ZZkFEFb8Y8Ql33Vl6kE5VzweS+3YLPhdDB3wyH+7qxhxR2MD3YICqpwzvOONxmT
         nXettO+KH0O8Efho+07bqc3l1e6ugiSF5OTowqZF2EFpaKSwu+tvaPUXnvf8tv6Nc1Br
         Y2qGlvtaebPeMaWYj3qq7+sOxoHy4uJCdXa0WNU56zFvlk0lbYpCJQG8l8lTgGVrR0wV
         n+n15Td64T5RocC8pfABADiN6j6hYHRtMNwmREFuueO75dg+dlwjTICZFGGm3viU4ePc
         xVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axLJGxYQXY76T7E7LoVtvtvjy73/TjaCst9TPiXrWdM=;
        fh=iHI+t5s9mJkbI8QK28DFPxrDqmbzCZzlGNUNUeKo4fQ=;
        b=I04reG7nrisyyGjW+YJjpmad1gHwSle5M5Ancsz3Vt6DXuXSE1sSN8Z6KPCCPHVzdD
         X3eGfFKgZbbSd4jW2sUscKmCkndNNB2Jiw7xUywYtQf0S9AxFHlIqrtSGpwaniF1rGVx
         C7Nb/2yBN8vTVpkrjXsaiFlQ+OjhvLrsamsRjEsZYf3nvns8zyh+6fT+K73qSMzu8rid
         PRmbKXiv7Eca5hpUCptUgP6BZSEWSIrRnUlxN3+4Lrnh05tzGsN0ucha2IPNgvrJwMXL
         JsJ1I7VtchpRrclrSB8Kgvb920QfWuh3wlrHc/34TttBr57UYUHSgx80ZbGFi/5cIIES
         QcLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295823; x=1781900623; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axLJGxYQXY76T7E7LoVtvtvjy73/TjaCst9TPiXrWdM=;
        b=nxsHDY2On5M2+k+gaYTUZHky3iUzhjmzLgMnyRYUiiS1eJyOZDrE4EUuqOIlB0zvKn
         zF9SeSzTYZwbgkl+tPFF6PDAU/nAw6wJJW7aFo+0tdgMiwJdHlWxAYA5lakgSn8D/8YC
         XMENHNysFHXm47M2KN1mTzjSCu0Rx2XdEMy/FPeXOMr8trW4zPvj3TJ5fC+/HwFBxAVU
         7KjQgrfiDeKZUIZtE2F5R+dLb6zLfFElKk9X6HKyFRFMFeTVd+zYGJJHXkw8VXalx50r
         yUqoJPN/MO2j3eNSS65qzHIt66Lc2h/DDaZJ02xMmaDiKdjElgi7ma7QavGuNAeMVSJT
         GO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295823; x=1781900623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axLJGxYQXY76T7E7LoVtvtvjy73/TjaCst9TPiXrWdM=;
        b=MK6MHPXumFCp6+7pIt0OWRv+sFqZyH4QhivvJvQV4dxiNgEPWndctxGyjdbbDBBojX
         QYGNEHZQdM8CZg6IKFmOTXwqKKn+hfR24UpTlvdvyxcBH0ADg5dh/1i0C3TlSdd2riZq
         gxzIZTdMBNPSSySV08LJbESNGB1zZ8tO/MrH2aaco4/svySBA/ZmZXsdOTMJ+KcGjDa0
         RBTbuYOGRLiCpWmVs/YAmWKWP8pVpSOAFl6pDkC8qSWhwlM5MEfck++dzsok/86Pitah
         yeeghWp24SDYhXyKDqECFyZ+Py+TLADil5KXOpB0b/g2NNvUiJ7h2vVH4k/E+eVWI4bt
         nrSw==
X-Forwarded-Encrypted: i=1; AFNElJ+NV16amHFHYLQkOodfBmKNwmqld16lkTCEiDlHg/OiggI7CiyWpyd6fQCBHkNbsbif4TjD@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+RJwWuqi+lXXRyfG+XO/cPr8ijAu1bXcUU8hanzs6Yd1FWod3
	d9/ksct90XkCzaj6lPtMbFVBkVehijEtTFUzuRYvSNWjIKxQzr5SU+Ul9CRajMkOcA4UPskjwNK
	aiQE9vig1ET1nR32JoXc4KHnJuIWn/+U=
X-Gm-Gg: Acq92OEuS/SEv8wRM14BisgwKkrvR2W5A99f6eah9U8Ymip8TKI438XbwmH7PQiSYTO
	w4NxCZmPqXv0ErnA/s6HUuuza4lUKsxKwJStDglf6rXgIP84qxN1xXr6K1Kn0BB0LUZ/hOSqCTf
	fZYelVZ+XjhzBM4VwX3UYbk5JNNmveoMrDvGKzUPdTcJbi4pENznSOsANB8SEwNgM5Re0fE6o8q
	aXY2w6vC2tx3ZUjgK+779uqQg8UVzi85D5sOaiDnJTcRfpMHO8Utt6KypRY76hFeHJarRblxO7M
	DYQMtgPnGcksaZunelZIWoJsmG/kTaBK0D/AaCJna6muCY2fUTzCHlhgL5bN0rtQa0Xbgv2e4S5
	qh8gWiWrydBShTuU2
X-Received: by 2002:a05:6a00:94c3:b0:842:614e:cc97 with SMTP id
 d2e1a72fcca58-8434d07afcemr4940308b3a.23.1781295823460; Fri, 12 Jun 2026
 13:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <287e6b7dd877836e08b9bcb6727f547fe80f6459.1780855297.git.lucien.xin@gmail.com>
 <20260611081948.137325-1-pabeni@redhat.com>
In-Reply-To: <20260611081948.137325-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 16:23:31 -0400
X-Gm-Features: AVVi8CezbNK4UF3r3lp5uUhw4KnTH33E-BGYuPbz2M3O-qwCLN8CyhZyYdcGzpo
Message-ID: <CADvbK_dAvqBC1j-f4Ft_HkLzVOzP-z9cwVR2B36zbxjSB44atg@mail.gmail.com>
Subject: Re: [PATCH net-next v13 12/15] quic: add crypto packet encryption and decryption
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, horms@kernel.org, metze@samba.org, 
	mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, linux-cifs@vger.kernel.org, smfrench@gmail.com, 
	linkinjeon@kernel.org, tom@talpey.com, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com, jlayton@kernel.org, steved@redhat.com, hare@suse.de, 
	aahringo@redhat.com, dhowells@redhat.com, matttbe@kernel.org, 
	mail@johnericson.me, xiyou.wangcong@gmail.com, alibuda@linux.alibaba.com, 
	jbaron@akamai.com, illiliti@protonmail.com, sd@queasysnail.net, 
	marcelo.leitner@gmail.com, daniel@haxx.se, andrew.gospodarek@broadcom.com, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 4:20=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> From: AI Reviewer <ai@example.com>
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/
> ---
> quic: add crypto packet encryption and decryption
>
> This patch adds AEAD-based packet encryption/decryption helpers, QUIC
> header protection, and Retry/address-validation token generation and
> verification primitives.
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > index c68a0b570c72..77e633096c2a 100644
> > --- a/net/quic/crypto.c
> > +++ b/net/quic/crypto.c
>
> [ ... ]
>
> > +/* Retry Packet Integrity. */
> > +int quic_crypto_get_retry_tag(struct quic_crypto *crypto, struct sk_bu=
ff *skb,
> > +                           struct quic_conn_id *odcid, u32 version, u8=
 *tag)
> > +{
> > +     /* Reuse RX AEAD (phase 1) in Initial crypto. */
> > +     struct crypto_aead *tfm =3D crypto->rx_tfm[1];
> > +     u8 *pseudo_retry, *p, *iv, *key;
> > +     DECLARE_CRYPTO_WAIT(wait);
> > +     struct aead_request *req;
> > +     struct scatterlist *sg;
> > +     u32 plen;
> > +     int err;
> > +
> > +     if (skb->len < QUIC_TAG_LEN)
> > +             return -EINVAL;
>
> [Low]
> The guard rejects skb->len < QUIC_TAG_LEN, but a later comment in the
> same function says:
>
> > +     /* The caller must ensure skb->len > QUIC_TAG_LEN. */
> > +     plen =3D 1 + odcid->len + skb->len - QUIC_TAG_LEN;
>
> Should the check be <=3D QUIC_TAG_LEN, or should the comment say >=3D to
> match the strict-less-than test?
>
> In the boundary case where skb->len =3D=3D QUIC_TAG_LEN, plen becomes
> 1 + odcid->len, and quic_put_data(p, skb->data, skb->len - QUIC_TAG_LEN)
> copies zero bytes, so the integrity tag would be computed over a
> pseudo-packet containing only the ODCID length and ODCID with no actual
> Retry header bytes.  Is that intended?
>
The callers will make sure skb->len > QUIC_TAG_LEN, and the check
(skb->len < QUIC_TAG_LEN) was added to make the last AI happy.

I will change (skb->len <=3D QUIC_TAG_LEN) to match the comment.


> [ ... ]
>
> > +/* Derives a key and IV using HKDF, configures the AEAD transform and =
performs
> > + * AEAD encryption/decryption for the provided token.
> > + */
> > +static int quic_crypto_token_protect(struct quic_crypto *crypto, u8 *t=
oken,
> > +                                  u32 len, u32 adlen, bool enc)
> > +{
> > +     u8 key[TLS_CIPHER_AES_GCM_128_KEY_SIZE], iv[QUIC_IV_LEN], *tiv;
> > +     /* Reuse TX AEAD (phase 1) in Initial crypto. */
> > +     struct crypto_aead *tfm =3D crypto->tx_tfm[1];
> > +     u32 extra =3D enc ? QUIC_TAG_LEN : 0;
> > +     struct quic_data srt =3D {}, k, i;
> > +     DECLARE_CRYPTO_WAIT(wait);
> > +     struct aead_request *req;
> > +     struct scatterlist *sg;
> > +     void *ctx =3D NULL;
> > +     int err;
> > +
> > +     quic_data(&srt, quic_random_data, QUIC_RANDOM_DATA_LEN);
> > +     quic_data(&k, key, TLS_CIPHER_AES_GCM_128_KEY_SIZE);
> > +     quic_data(&i, iv, QUIC_IV_LEN);
> > +     err =3D quic_crypto_keys_derive(crypto->secret_tfm, &srt, &k, &i,=
 NULL,
> > +                                   QUIC_VERSION_V1);
>
> [Critical]
> Can this lead to AES-GCM nonce reuse across all generated tokens?
>
> quic_random_data is a module-global buffer initialized once in
> quic_crypto_init() via get_random_bytes() and never refreshed:
>
>     static u8 quic_random_data[QUIC_RANDOM_DATA_LEN] __read_mostly;
>
> quic_crypto_keys_derive() runs HKDF-Expand-Label over that constant
> secret with constant labels "quic key" and "quic iv", so both the
> derived key and the derived IV are deterministic and identical on every
> invocation of quic_crypto_token_protect().
>
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setauthsize(tfm, QUIC_TAG_LEN);
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setkey(tfm, key, TLS_CIPHER_AES_GCM_128_KEY_S=
IZE);
> > +     if (err)
> > +             goto out;
> > +     ctx =3D quic_crypto_aead_mem_alloc(tfm, 0, &tiv, &req, &sg, 1);
> > +     if (!ctx) {
> > +             err =3D -ENOMEM;
> > +             goto out;
> > +     }
> > +     memcpy(tiv, iv, QUIC_IV_LEN);
> > +
> > +     sg_init_one(sg, token, len);
> > +     aead_request_set_tfm(req, tfm);
> > +     aead_request_set_ad(req, adlen);
> > +     aead_request_set_crypt(req, sg, sg, len - adlen - extra, tiv);
>
> Every call ends up using the same (K, N) pair under AES-GCM, with no
> per-token random prefix and no packet-number XOR like
> quic_crypto_payload_protect() does via cb->number.
>
> NIST SP 800-38D forbids reuse of (K, N) under GCM; from two valid
> ciphertexts an attacker can recover the GHASH authentication subkey H
> and forge tokens for arbitrary client addresses, which would defeat
> the address validation in quic_crypto_verify_token() and the
> anti-amplification protections in RFC 9000 section 8.
>
> Could a unique per-token nonce be derived (for example from a random
> prefix stored in the token itself), or a nonce-misuse-resistant AEAD
> be used here instead?
>

I currently don't have a better solution for this. we can't have it in the
socket, as even after the socket closes, this quic_random_data is still
needed to validate tokens.

Thanks.

> > +     aead_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
> > +                               crypto_req_done, &wait);
> > +     err =3D enc ? crypto_aead_encrypt(req) : crypto_aead_decrypt(req)=
;
> > +     if (err =3D=3D -EINPROGRESS || err =3D=3D -EBUSY)
> > +             err =3D crypto_wait_req(err, &wait);
> > +
> > +out:
> > +     memzero_explicit(key, sizeof(key));
> > +     memzero_explicit(iv, sizeof(iv));
> > +     kfree_sensitive(ctx);
> > +     return err;
> > +}
>
> [ ... ]
> --
> This is an AI-generated review.
>
