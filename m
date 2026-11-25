Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622404;
	b=phMnuhSBFm69Xd9wI/rL1PSeQDC4V8/ftPX2amI1NRBANDcwf+pSNtop7f69UHKNLwz/
	 LuDiM9ylH6CqJPDyT2TbJop+FydMGjHyLKlrnsxYfTuVAB7U9e0g/G86nyG5Zh+Ywh2JG
	 3BdAjiw0oSNw0WIRWhM1R0unLXhAs2jL4FgW5Ou04LRxVykFTqKU2EIljASX3PTiA4yDC
	 TOWcPpRwzSkg73qZkztrwbRlH1TfDfofjgsdqcFq7tCw6Ftw5w7cu6FW3B9xRY060c7fm
	 jxPqotH1Pkuk7nRIa2tLeHkrj0cnQnhtn49ZWEUNmQSq/3P0LcANbf4qOsPkYf8xMUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SzwTl3wJ5EGvPDR1ifZFuAECe6VYxaw0oJcYKT7Gpec=;
	b=S5ATcTFbK1PYk+dPbR65Kw74vG70hnH7qvVC/uRwckWtMbynQyo1GsVhdIhZeynhqfJ3
	 iEvsx6UFfdXW7RbIq054hvPvq8+8NBUwXJxEjS5LSCykjsUELDBtBXMO97qTStTLmElnH
	 Mle6zf6s2zTppFtyp9lqUPABaqRXWWvjvzg5HRr4TAtOQuzhGTKEneH8YWcK5DrVj2CWV
	 bvQChVyoOSbxFRL60VxxCpvkIWw0yplVsypTe4j4euAFO6u1f3pZ23JZsOIr5OHTYbJ4I
	 HGzwm+jco0A7N5XvmD+SKOHp9sKdWYqIsK7ZnDdX8R4ROsdieVLD/Dqa9ksIrzDCVHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hU0ClPC9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635C606A331
	for <quic@lists.linux.dev>; Wed, 25 Nov 2026 16:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6635C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hU0ClPC9
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so3506621b3a.1
        for <quic@lists.linux.dev>; Wed, 25 Nov 2026 08:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622404; cv=none;
        d=google.com; s=arc-20260327;
        b=hG3vJhj8PdjZI+Cittc7hg1uOVNko5x9kpkzuIpIivj7tQs8I4Ct09SK1t1aC1sqa5
         dCk6fydU40Qe9CkPSjS4jPTpplVoIxeKZiHahbf8Ivz0xDucXt74lltjWp7zcUXPIm9Q
         7crJiKjHrESB+eZCM1fUddrlkNF/+ueoRAGp5v7jEUGtX1qsQPVwa1PCKfkMHKE9eSZx
         p1EZciEUxic180fk9H1/j9g0GbV6qMipadQ903tio/oOPg/T6LjUtI03fnIpa04apspc
         RYcVjjF1n4lrMx9wYfqzMdTUgBUuirMWkoP8ThWydC//Ro8nzukufSG2BTKiaiCbwfvW
         lV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SzwTl3wJ5EGvPDR1ifZFuAECe6VYxaw0oJcYKT7Gpec=;
        fh=qXI/MiyBkqXQ7kQRlPw3zoXahIXE/J/gDO/eqcwIPcI=;
        b=bCMv9dakiVQR3hwlFvhb2VxxbvHHggGeCc+muE+f5EWf7n354AzZUqI1aJ7ful1xM/
         9IL4OICd7z/9ckTxnDNEte/lz2v3f4OKr/ImzKpTvgKgtevmR4UwUWX2hRF/S5fSDXWq
         AWE6tXrwZM2mjiNWarZFwW2GUM3E4isS+XlaTG+oXmXMJoCoBWaVUKWnp2qn6HxJoQ3d
         9WaGnockpDGS/rZXTBPKbzez3sULjLr+N/JI59a9uiHwrf1+ZkzHwPvK9439yY8h3cT7
         yau1HNBEnaciKfWU3wq8uSeYZhpQlykCuQzNBRyRsr2pUycHAMqY3w6ebU3JryrDOE6q
         ruHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622404; x=1796227204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SzwTl3wJ5EGvPDR1ifZFuAECe6VYxaw0oJcYKT7Gpec=;
        b=hU0ClPC9WpPi3hLBYA5vhD4ZHZg/rsvyyGM50M/XEo8V9BVR4cA6A3rYnIRGKqm6Sf
         8p/Wobq+sPaKJV2GhEWnUKPcJqJz4Jt4O01hRdqTztLFRrqRGCNrOy40tN4AXU8vjAp2
         ly91CVWI4mifXetLJvZyxAGJ7iU64f/Hd6hAjQwLgc5c0S/t3fs4anHmVQyoCtS2Ds/d
         wDfI4PnV51S8vaQU6VC0JLKR1H4BKCdztrleGLTPthfPgEbeSN3nEthB0reuCNQ+VXeJ
         U68atUx4jJXaShKqvy6Lk1Dmfa37p9XQuWnt98QufQjFZXU1LrXoYL5DDlNxVT7j4wz8
         jEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622404; x=1796227204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzwTl3wJ5EGvPDR1ifZFuAECe6VYxaw0oJcYKT7Gpec=;
        b=JX9AiY377IifkKgF9QHTdUozHO5QFZLPJx8Utnfd76GkVRLwlkREAW/kxymYM5OGCd
         d0MjwntB1rpuFM1FMbchCQHNFikBD/j+JrRPZFoMK5uydoARrrBCh95EJJsbkDSkZ7Od
         /BWKkgalGo36hTE0XTJu3cQ6vaESuLli1Knbn4rmYDPmfIzHiHIIST0ccx3OaEtO0Wm7
         j/iH28fj5DL0OEF4TwOuO88Km8O1OwUvS4GdB2hv8vDqejKLNGU2a3FOS8TAsVonv5/G
         dendGov+7AHRF3W2Z3jM3xsjXU4OGV9JXfxavbF5ZKhwj+1+NfW6pvprP8ZA3Co34STy
         1y9Q==
X-Forwarded-Encrypted: i=1; AL+hErFh+IR2T67lwMj2gMEqlHlivBwNElgFXv+LGhKxmIImiiu6rN1PEPnSVsX5z2OB/YDrS5/R@lists.linux.dev
X-Gm-Message-State: APuU4Z+t9c9Oz3yCfV31ZLxWQ5wOjeoGjOjQSONu2NimxExW5Vg2+6rJ
	tJPuJYAHjkCKijr56VwQpv0ZAhYZfq7Dueb3auRN4GbBEmKdzrvitzKXKVK+EvB4baJhq6Wbc73
	8Q4NpsUtBqSggpdfiHPLG8yD8O9HXBPQ=
X-Gm-Gg: AZFdTZeJf8sIkzl9YmFM/4U8g9ICMr3MkPenHJdgU8JDr+/1RuSum2UmUbgheXoy+L1
	VGJN5FzWw84jv5kUiJQ5Rd7cDrnjNeMcZcIqKX/iNt/qR29SFE9s5RG3PJq4AkOTa+4DxVGghH+
	wq7Lip0ykQRIbQobwaX7+BTNNaWCFolxgzHNQgfMxj4qcByrTrJyI/soIEw+R5saeHWJkxIKtA4
	S+Vdl1hy8UF/chKmh93dAy/24jvkHWoSA0B9vRDlMrXrH+/14mFUjHLH+XUli1YQ1JzBRSlaS8/
	Fwnx8w5UQpQCZwArCYRxNDI0X+9NisUW52cAG5TWOQ7h9bO57dg0xYw8HpDfL94ZUux/MECA9V/
	qjnDdlMgoNZRXwG5g48WJzQoQ1Wul5EQqnlNTfrLxTApDlkr2sqGQ0Cien3hjTZb6P6p7rRotYt
	6Crqe8O05srtwTBF6SuD20k5GGsMO3ipaux2pd0sDEJhAc11o2RLBSvixvN+cwHU8TVCiC
X-Received: by 2002:aa7:88cf:0:b0:8b6:594d:7030 with SMTP id
 d2e1a72fcca58-8c87ca51fe7mr16624530b3a.42.1795622403510; Wed, 25 Nov 2026
 08:00:03 -0800 (PST)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <035db09843f506bea729e16d523b453c56647be8.1795393691.git.lucien.xin@gmail.com>
 <179548328150.3135.7027633658882912871@kernel.org>
In-Reply-To: <179548328150.3135.7027633658882912871@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 10:59:51 -0500
X-Gm-Features: Aa3M54q3YNjzrJVhLtcHaagwpwzPqENqz5Odfa9zG0cW6ddLoL6_XWMexKurxXc
Message-ID: <CADvbK_cdNQi6YuDMpCQypyt7ij+=5gSuiPFMXOSxPm7aD+6RCg@mail.gmail.com>
Subject: Re: [PATCH net-next v19 11/15] quic: add crypto key derivation and installation
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
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Shared token key: AES-GCM nonce uniqueness across sockets
>   depends only on a random 64-bit counter start.
> - [Medium] The AEAD integrity limit is enforced per encryption level, but
>   RFC 9001 Section 6.6 requires it per connection.
> - [Low] The commit message body does not mention the socket lifecycle
>   changes in net/quic/socket.c.
> - [Low] struct quic_crypto::tx_count[2] is documented as 'Packets
>   encrypted (key phase 0 and 1)' and is compared with=E2=80=A6
> - [Low] Type mismatch between the HP transform fields and the API used to
>   allocate and free them.
>
> --
>
> quic: add crypto key derivation and installation
>
> This patch adds net/quic/crypto.c with HKDF-based derivation and
> installation of QUIC packet protection keys for the Initial, Handshake,
> 0-RTT and 1-RTT levels. It also adds key updates and token / stateless
> reset secret derivation. quic_init_sock() now allocates one struct
> quic_crypto per level, and a new quic_sock_destruct() defers freeing
> them to a workqueue.
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > new file mode 100644
> > index 0000000000000..c28c6fa565c1a
> > --- /dev/null
> > +++ b/net/quic/crypto.c
> > @@ -0,0 +1,593 @@
>
> [ ... ]
>
> > +int quic_crypto_set_cipher(struct quic_crypto *crypto, u32 type)
> > +{
>
> [ ... ]
>
> > +     crypto->rx_tfm[1] =3D tfm;
> > +     tfm =3D crypto_alloc_sync_skcipher(cipher->skc, 0, 0);
> > +     if (IS_ERR(tfm)) {
> > +             err =3D PTR_ERR(tfm);
> > +             goto err;
> > +     }
> > +     crypto->rx_hp_tfm =3D tfm;
>
> [Severity: Low]
>
> This isn't a bug, but crypto_alloc_sync_skcipher() returns a struct
> crypto_sync_skcipher pointer. In struct quic_crypto, rx_hp_tfm and
> tx_hp_tfm are declared as struct crypto_skcipher pointers. Because the
> value goes through void *tfm, the compiler does not see the mismatch.
>
> quic_crypto_free() then releases them with crypto_free_skcipher() instead
> of the matching crypto_free_sync_skcipher():
>
>         if (crypto->rx_hp_tfm)
>                 crypto_free_skcipher(crypto->rx_hp_tfm);
>
> This only works because base is the first member of struct
> crypto_sync_skcipher.
>
> Could these fields be declared as struct crypto_sync_skcipher pointers
> and freed with crypto_free_sync_skcipher()? That would also let
> SYNC_SKCIPHER_REQUEST_ON_STACK() and skcipher_request_set_sync_tfm() be
> used without casts.
>
> [ ... ]
>
> > +/* Save token secret in Initial TX secret (phase 1) for token generati=
on. */
> > +int quic_crypto_set_token_secret(struct quic_crypto *crypto)
> > +{
> > +     /* Reuse TX AEAD (phase 1) in Initial crypto. */
> > +     u8 key[TLS_CIPHER_AES_GCM_128_KEY_SIZE], *srt =3D crypto->tx_secr=
et[1];
> > +     struct crypto_aead *tfm =3D crypto->tx_tfm[1];
> > +     struct quic_data s =3D {}, k, i;
> > +     int err;
> > +
> > +     if (!memchr_inv(srt, 0, TLS_CIPHER_AES_GCM_128_SECRET_SIZE))
> > +             get_random_bytes(srt, TLS_CIPHER_AES_GCM_128_SECRET_SIZE)=
;
> > +
> > +     quic_data(&s, srt, TLS_CIPHER_AES_GCM_128_SECRET_SIZE);
> > +     quic_data(&k, key, TLS_CIPHER_AES_GCM_128_KEY_SIZE);
> > +     quic_data(&i, crypto->tx_iv[1], QUIC_IV_LEN);
> > +     err =3D quic_crypto_keys_derive(crypto->secret_tfm, &s, &k, &i, N=
ULL,
> > +                                   QUIC_VERSION_V1);
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setauthsize(tfm, QUIC_TAG_LEN);
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setkey(tfm, key, TLS_CIPHER_AES_GCM_128_KEY_S=
IZE);
> > +     if (err)
> > +             goto out;
> > +     get_random_bytes(&crypto->tx_count[1], sizeof(crypto->tx_count[1]=
));
>
> [Severity: Medium]
>
> If tx_secret[1] is already set, for example inherited from the listening
> socket, this keeps that secret. It then re-derives the token AEAD key and
> tx_iv[1] with the fixed QUIC_VERSION_V1 labels. So every socket that
> shares the listener's token secret gets the same AES-GCM key and the same
> base IV.
>
> The only per-socket difference is the random starting value of
> tx_count[1]. In the later patch "quic: add crypto packet encryption and
> decryption", quic_crypto_generate_token() does:
>
>         counter =3D crypto->tx_count[1]++;
>
> and quic_crypto_token_protect() builds the nonce as tx_iv[1] XOR counter.
>
> Won't two sockets reuse a (key, nonce) pair whenever their counter
> windows overlap? With S sockets each issuing n tokens, the chance is
> roughly S^2 * n / 2^64.
>
> The listener's own Retry token counter also starts at a random point in
> the same space. Nothing rotates the key. The counter is also sent in
> clear in the token AAD, so an observer can see collisions directly.
>
> A single GCM nonce reuse reveals the XOR of the two plaintexts and lets
> an attacker recover the GHASH key. With that key, Retry and NEW_TOKEN
> tokens can be forged, which defeats address validation on the listener.
>
> The code that copies tx_secret[1] into accepted sockets is not in this
> series. This concern is based on the memchr_inv() reuse branch above and
> on the v19 changelog, which says the randomization was added "to prevent
> AES-GCM nonce reuse across sockets accepted from the same listening
> socket".
>
> Does the randomization prevent reuse, or does it only make reuse
> unlikely within a 64-bit space? Keeping collisions under the usual 2^-32
> bound for GCM allows only about 2^16 sockets.
>
> Would a deterministic scheme fit better? Options include a per-socket key
> derived from a unique salt, one shared counter on the listener, or key
> rotation.
>
False.

The 64-bit random start gives ample collision resistance for realistic
token volumes. A per-socket key or shared counter adds complexity for a
narrow threat.

> [ ... ]
>
> > diff --git a/net/quic/crypto.h b/net/quic/crypto.h
> > new file mode 100644
> > index 0000000000000..29eaf0cbd2e17
> > --- /dev/null
> > +++ b/net/quic/crypto.h
> > @@ -0,0 +1,90 @@
>
> [ ... ]
>
> > +     u64 txlimit; /* Max packets encrypted per key */
> > +     u64 rxlimit; /* Max decryption failures per crypto level */
> > +};
> > +
> > +struct quic_crypto {
>
> [ ... ]
>
> > +     atomic_t async_pending[2]; /* Async pending count (key phase 0 an=
d 1) */
> > +     u64 tx_count[2];           /* Packets encrypted (key phase 0 and =
1) */
>
> [Severity: Low]
>
> tx_count[] is documented as a per-phase count of encrypted packets,
> compared against txlimit. quic_crypto_keys_derive_and_install() treats it
> that way and resets it on rekey:
>
>         crypto->tx_count[phase] =3D 0;
>
> quic_crypto_set_token_secret() uses tx_count[1] of the Initial crypto in
> a different way, as a random AES-GCM token nonce counter. The comments on
> tx_secret[1], tx_iv[1] and tx_tfm[1] say "key phase 0 and 1". They do not
> say that phase 1 of the Initial crypto holds the token secret and the
> token AEAD.
>
> Nothing fails at the end of the series, because Initial packets always
> use key phase 0. A later change that rekeys or limit-checks phase 1 of
> the Initial crypto could silently break token nonce generation, or hit a
> spurious -EKEYEXPIRED.
>
> Could the comments document this dual use, or could the token state move
> to dedicated fields?
>
> > +
> > +     /* Timestamp 1st packet sent after key update */
> > +     u64 key_update_send_time;
> > +     u64 key_update_time; /* Duration to retain old keys after key upd=
ate */
> > +     u64 rx_fails;        /* Failures decrypted */
>
> [Severity: Medium]
>
> Is this counter meant to be connection-wide? quic_init_sock() allocates
> a separate struct quic_crypto for each of the QUIC_CRYPTO_MAX levels, so
> each level has its own rx_fails. struct quic_cipher above also documents
> rxlimit as "Max decryption failures per crypto level".
>
> In the later patch, quic_crypto_decrypt() checks the per-level counter:
>
>         if (err =3D=3D -EBADMSG && ++crypto->rx_fails >=3D crypto->cipher=
->rxlimit)
>
> RFC 9001 Section 6.6 says:
>
>   If the total number of received packets that fail authentication
>   within the connection, across all keys, exceeds the integrity limit
>   for the selected AEAD, the endpoint MUST immediately close the
>   connection
>
> Handshake, 0-RTT and 1-RTT all use the negotiated AEAD. An attacker
> sending forged packets could therefore get up to about rxlimit failures
> at each level before any counter trips. This matters most for AES-CCM,
> where the limit is 2^21.5.
>
> The v17 changelog says rx_fails was made "a connection-wide counter ...
> as required by RFC9001 Section 6". Was that undone by the v18 per-level
> allocation and the v19 "per crypto level" comment?
>
False.

rx_fails is per level for implementation simplicity since the entire
quic_crypto struct is per level. The non-app levels are short-lived, so the
effective connection-wide budget is dominated by the 1-RTT counter. The
practical difference from a shared counter is negligible.

> [ ... ]
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 78a08dd998a8e..d717efca9b9e6 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -40,11 +40,38 @@ static void quic_write_space(struct sock *sk)
>
> [ ... ]
>
> > +static void quic_sock_destruct(struct sock *sk)
> > +{
> > +     struct quic_crypto *crypto;
> > +     u8 i;
> > +
> > +     /* Deferred crypto free for async encryption/decryption. */
> > +     for (i =3D 0; i < QUIC_CRYPTO_MAX; i++) {
> > +             crypto =3D quic_crypto(sk, i);
> > +             if (!crypto)
> > +                     continue;
> > +             queue_work(quic_wq, &crypto->work);
> > +     }
> > +
> > +     quic_sk_destruct(sk);
> > +}
> > +
> >  static int quic_init_sock(struct sock *sk)
> >  {
> >       struct quic_pnspace *space;
> > +     struct quic_crypto *crypto;
> >       u8 i;
> >
> > +     sk->sk_destruct =3D quic_sock_destruct;
>
> [Severity: Low]
>
> This isn't a bug, but the commit message body only describes the
> crypto.c helpers. It doesn't mention three changes in socket.c:
>
> - quic_init_sock() now sets sk->sk_destruct to quic_sock_destruct().
>
> - quic_init_sock() allocates one struct quic_crypto per encryption
>   level, which adds new -ENOMEM failure points to socket creation.
>
> - Crypto teardown is deferred to quic_wq through quic_crypto_free_work(),
>   and runs after the socket is gone.
>
> The async crypto lifetime argument depends on these points. Right now
> they only appear in the v12 and v18 notes below the "---" line, which
> won't end up in git history.
>
> The body also doesn't say that several new fields and helpers are not
> read or called anywhere in this patch, and are placeholders for later
> patches. These include rx_fails, async_pending, key_update_send_time,
> key_update_time, ticket_ready, send_offset, recv_offset, txlimit,
> rxlimit, the QUIC_TOKEN_* defines and quic_crypto_discard().
>
> Could the commit message cover these?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
