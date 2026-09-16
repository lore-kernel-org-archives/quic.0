Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0226D4D7971
	for <quic@lists.linux.dev>; Wed, 16 Sep 2026 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573934; cv=pass; b=RrivwBbUU/CPV0Bx958qVnvrsJ/DnxPTdH9q57uz3DlKNeujxaiPBfIuRJnEFvGVmzBPrQ6zgRTXT488BkBw7AtmRbHO3MtT6rU4CnQj+z9UflAaHlLN3afOgqUBwOWWF4l3y/AUgeAPz4cjaheOpD4RYD0U0v5onT1SQlgSlvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573934; c=relaxed/simple;
	bh=95yWInc3f+wvYQiaDhRAR54L526l6o9/CFXKuqW3YLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPlGcEZkI53/AVGrTTcNR5D/plH7ISOPefxYlYdHGSvkwBif37LFVJ6FMomkyIXJvR7SYF/HGqRHIKKQChpMwTjUUV7Eb6c/6YHtd78BoGLCRX0NVQvJeDAVf7ttK1GfUVZ9aDEmbAVB+MNWLrVxaxPurlqrhQC2ZK2QwaWvv1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltyP9yE7; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltyP9yE7"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469f204f6so681989b3a.2
        for <quic@lists.linux.dev>; Wed, 16 Sep 2026 08:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573928; cv=none;
        d=google.com; s=arc-20260327;
        b=Sm918Z6OeO5R3nAs1lLvv5yLfaXlKeH4EpO5a/QtGZqzutgYJ3GMn0oqxtRPmNdKfx
         TCv/50Y5DgpE62lJI021eDo8+hnxfi31ES5W8UbT747OhKRunWIrW6XJH24lCj9UHv7r
         gxzzibjQpeyVAk3bvuHxVFa012OJNBdL2AQqXcKW+EeKB/BAybelQrYK1LrSKu0iWTLI
         qoL03YlhIxTeyGOwkLN2AB9cGZM99TaPZU/xUOJlJmFYATQy113aGIUsNEmhmaolUb11
         hoQAMvDS7Xy5b94Rq6BAQYMNNKX7ilvDfMj4Ofs8Ef6MB2nNPw0ry7dtXOrUNXA1R1Xj
         r4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r5EyfF2xmjvND7Ej5BcVBP3F4zIxnNANBeziUA4WJEI=;
        fh=NQySRSlC+sHrgDhWaqZEnDWdQAGmiWac1Vw3y7PKY9A=;
        b=ElbOeeY7wJ07wKuTDKP9lXxLjW97iYm8uZOdySU+Ny5WiSDh8VELvTWnkYLEihE6dR
         kRsiy5w9U+0PW1WcJginTNGtcuDLYaaGv8EvHdQ+iO4NnlhWr6kMofjZYkB/ujJP/zb5
         djKf3XrgvbKwCdbfNaL9IxQaEDSlCAhiLJIwHJBlAopQvH8exnMgX9BHSuf0jgiotHg1
         AqNOO23+nvsVNf5ivIJ3oQKlPGS4afxTcnaVU/WLlXVl2WQv6BjUPg+JPsG2evm9aAso
         mioF5fA49ZSoKXktpDrsjZ6lrqtzD/yAtxirfHIS/vjwMcQZgbQAWPtvuvxEGx2lsYYp
         xWbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573928; x=1790178728; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5EyfF2xmjvND7Ej5BcVBP3F4zIxnNANBeziUA4WJEI=;
        b=ltyP9yE75+u1VPlLwWKcr1EQVbJDRBVeN4Hjg+VCNps+ahICo7Iqjl8djg482BblgN
         mflUPxdJVTcAUwttN6UkVmoDgeT/oCmTZ2ZLnxvKa7G49RBc0RJxcX7UZvsnE+XpwXHm
         +S/Oou90jpbrg8xSCDfohH7FgeWHxV83Hv5g3UTBxMEPXMnXfFo5hvP3glbw88xBKWXT
         Ugv1nMysL/Rvt4svZtl4LaSdymq+iyLhLz1j82SRUTFiLiSVKrk/bE90vzuGi8JgOedr
         O7tzI2jb4/DQWlZGgK99/8W7g3iVGasDinJZYtk+6+9KtPSh1OlwBWtZ2tH35LjS9vH9
         Ln/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573928; x=1790178728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5EyfF2xmjvND7Ej5BcVBP3F4zIxnNANBeziUA4WJEI=;
        b=irJVqsUKFq3ISwAPz8Fqq6cXmISycXrDJ9y8pCiQmrV3uiUU0fOt+FM0PJzfAgFo99
         0J0G36TPR5t7TDXAOUMjhGvczBJjYE0z/gdndeEW3qWZba7E7dAL6iwXT1x4ZaWjtWeg
         cxg1I1a+MuKp68i4b/LwZc7QM7fPwIABIzk4plN15gNi4VvqWmNtJomsH36oNxxf6VpL
         ZsXgY/aygENbQugWKCzGiMqOHc9mDvZpHgAJnI5uxuw9OlgamS+pVYE3l8w/Cw4oFne1
         6iliLUqKGlVRPlL9gFTVl4VII9bbNRwBdaB+GMMRd2dGFaSQxH9KMzNdeFYr3c5P+bcG
         b/0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzArg2UpGsyGOwj6czU9AzfSAUSw56pbqOFmZ/I77ryLQJTesx4t/meQhSGeWOCHm7z295J@lists.linux.dev
X-Gm-Message-State: AFuF++mU/IHUuejzhgbuFe51yZ8WVyPSq0t6detzOfHHauK0nh7kC5a6
	eF9pSaLY4giZx2Rb5Xobsqq0JfzdgHSmioU6LgHmPXfhBwO9cV3LIg0psqL0/iZ6e5Fs01cY6Zi
	bWQGTLqM64tSY4fmkjpU+Bob8ZqHp3as=
X-Gm-Gg: AYBFou3rKhB/1cKD6WMtDllylv6V2dB8JUVSYksDQNNgWjn6Ak5CVlmWrQgRc3JnLnS
	5Zs+1zhldNc2wSpPE875iPG1G5kbRGcUUxZ79CffPdaas5itcmmTghNtyjeJStCauKwfv7orX6i
	MqK5aCGVnY+jR9ZscUNm77mvdamWbb0NPxdJgyPnroeq/XiKWO92sSCISzhnJcyI2E4SBdGS0+f
	xIK+UrIFBkpYEqNIS5XZDfB2uxXSCa7PFB2qCLphBnNy/RvGcawnND6DSZK1SPgH8Y/OpdQEO+7
	Rl5y94cK2/keNPCIW8X0qSkU9jofPKLHEVLaN+AYh6tB1C/hystDUiialDbA2Xi2MOd8nRUOS0L
	KJ2P113dVIUP2O0czV3THIcYegv8lXftSywsVNyvlhFCdd87vmLhttENC
X-Received: by 2002:a05:6a00:4b0f:b0:857:7317:cff4 with SMTP id
 d2e1a72fcca58-8723a199a5amr6423934b3a.21.1789573927943; Wed, 16 Sep 2026
 08:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f886c618bd560e42692c0ac3296bae4878755cc1.1789393775.git.lucien.xin@gmail.com>
 <178950185147.22033.10922498784930147476@kernel.org>
In-Reply-To: <178950185147.22033.10922498784930147476@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 11:51:55 -0400
X-Gm-Features: AcwNN1UzfBxaJOMB6iv3Yg7aIgS3jN1akwkjx3YEKnt_lo6ALcoTP6dYS_KHoK0
Message-ID: <CADvbK_f8PF0uvQsULf2Z6ZO4Ln4b4=670EH8ixZZLjE_1uSM5g@mail.gmail.com>
Subject: Re: [PATCH net-next v15 11/15] quic: add crypto key derivation and installation
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
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] net/quic/Kconfig selects CRYPTO_HMAC but not a concrete digest
>   implementation, while every entry of the new ciphers[] table in=E2=80=
=A6
> - [Low] quic_crypto_set_secret() consumes the uAPI struct
>   quic_crypto_secret but never reads `level` or `reserved`, and honours=
=E2=80=A6
>
> --
>
> quic: add crypto key derivation and installation
>
> This adds net/quic/crypto.c with the QUIC key schedule: HKDF-Extract and
> HKDF-Expand-Label helpers, Initial secret derivation, traffic secret
> installation, key update, and stateless reset token derivation.  The new
> struct quic_crypto is embedded per encryption level in struct quic_sock a=
nd
> freed from the new quic_sock_destruct().
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > new file mode 100644
> > index 0000000000000..910557b680524
> > --- /dev/null
> > +++ b/net/quic/crypto.c
> > @@ -0,0 +1,567 @@
>
> [ ... ]
>
> > +static const struct quic_cipher
> > +ciphers[QUIC_CIPHER_MAX + 1 - QUIC_CIPHER_MIN] =3D {
> > +     CIPHER_DESC(TLS_CIPHER_AES_GCM_128,
> > +                 "gcm(aes)", "ecb(aes)", "hmac(sha256)"),
> > +     CIPHER_DESC(TLS_CIPHER_AES_GCM_256,
> > +                 "gcm(aes)", "ecb(aes)", "hmac(sha384)"),
> > +     CIPHER_DESC(TLS_CIPHER_AES_CCM_128,
> > +                 "ccm(aes)", "ecb(aes)", "hmac(sha256)"),
> > +     CIPHER_DESC(TLS_CIPHER_CHACHA20_POLY1305,
> > +                 "rfc7539(chacha20,poly1305)", "chacha20", "hmac(sha25=
6)"),
> > +};
> > +
> > +int quic_crypto_set_cipher(struct quic_crypto *crypto, u32 type)
> > +{
> > +     const struct quic_cipher *cipher;
> > +     void *tfm;
> > +     int err;
> > +
> > +     if (type < QUIC_CIPHER_MIN || type > QUIC_CIPHER_MAX)
> > +             return -EINVAL;
> > +
> > +     cipher =3D &ciphers[type - QUIC_CIPHER_MIN];
> > +     tfm =3D crypto_alloc_shash(cipher->shash, 0, 0);
> > +     if (IS_ERR(tfm))
> > +             return PTR_ERR(tfm);
> > +     crypto->secret_tfm =3D tfm;
>
> [Severity: Medium]
>
> Every entry of ciphers[] requests either hmac(sha256) or hmac(sha384), bu=
t
> net/quic/Kconfig does not select a digest implementation:
>
>         select CRYPTO
>         select CRYPTO_HMAC
>         select CRYPTO_AES
>         select CRYPTO_GCM
>         select CRYPTO_CCM
>         select CRYPTO_CHACHA20POLY1305
>         select NET_UDP_TUNNEL
>
> CRYPTO_HMAC is only the template (it selects CRYPTO_HASH and
> CRYPTO_MANAGER), while CRYPTO_SHA256 and CRYPTO_SHA512 are independent
> tristates without default y.
>
> With IP_QUIC=3Dy/m and CRYPTO_SHA256=3Dn, does crypto_alloc_shash(cipher-=
>shash,
> 0, 0) in quic_crypto_set_cipher() fail with -ENOENT, so that
> quic_crypto_set_secret() and quic_crypto_initial_keys_install() can never
> install keys and no connection can be established?
>
> Should IP_QUIC also select CRYPTO_SHA256 and CRYPTO_SHA512 (the latter fo=
r
> the hmac(sha384) entry)?
>
True:

Verified that CRYPTO_SHA512 can be disabled while QUIC is enabled. I'll add
CRYPTO_SHA256 and CRYPTO_SHA512 to the select list.

Thanks.
