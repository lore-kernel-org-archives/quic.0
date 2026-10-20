Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792529759;
	b=XpeYzSxHjE/SFi2vw/QDxFORTe+IMoktA6Rr5pEDgRd0EmTvcKWGyE98MwGzhw6vi0KK
	 j6y7vSv/sBHmoWtNL0WVLGNaeEd+gOPaNfa3/V6oUVCMzftjvSGoG8uRg+B4wDVXb4kGJ
	 lx2lpsHBceTggJYnQsAJ0ZYolTw7DJrmrT+ftgPPRaRlMYLVKNiYatdU5R5rmtwEgCXUs
	 MktF1kczbpNJXBkeuiNI8gjPoodZdSuoKh4yp9cwZ2wgPN/eLYkb6jxgBmV468bhBNw77
	 FqYY7hLuaxYtGD9hKW+udXvkS58YGyM0wwsgnArALI1PvtcmBSbGhKg8TT3LPbIREsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9va69Z70VDBET6RC2fy59u2Ycvr0LSmJxWPH1bvD2co=;
	b=3AwSvXOOHXVGvi4FCn5fC5XdfQaW6slhBBRKE3EIGNvqjoFnb4RKdRR1s08nhhjJiPp9
	 7JZDlDXM+jq5VmeaZ7OJdjvykZD2WyaC7Rf6hk0dNvETgQBjRhUVjElAHYn9UF9AKwaVs
	 BomUa6rfpDzmN5eODjNf7r8DR/GxZXQaZkycy0fSGygve5Fo16UrUNvnxmK2BlM6ZNvYo
	 UfZ+34dFpTyrb7hV5o5A2Oslevu5z5NMmA9Tkmv/mj+xFlwI3Ri61dnuzmOrt46s45rmH
	 f3cMPHUuhWUC0eoOMG2UsUPqPdQ/FJsypFN2q0/nFXALzhk5zZ2oSLJhDis458PuX4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PDEXopoO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ACC606A31D
	for <quic@lists.linux.dev>; Tue, 20 Oct 2026 20:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83ACC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PDEXopoO
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06b436dffso16904b3a.3
        for <quic@lists.linux.dev>; Tue, 20 Oct 2026 13:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792529758; cv=none;
        d=google.com; s=arc-20260327;
        b=LUw1kNSDq1WnaHgd3HTKRcvo5XMDuVbh1qmcJd0cb209mYQo26lm4lfVO5qIkLSVbN
         ZRscSInUmUNAQL5OM5Ke7s3TSW4AmS+NNnrFKdEU9+4o99vtWYEAeGh8I71tMidQdit7
         P9E3+lBUFEemRhApucYj8kyCzQ2KfHvHhhweFwqZ26TMhMSrWwWSslNP8jK8XopO0sZg
         6me6lgpIdLlFlt1X4uVjIvtHDw7jxKunS4E1cWZrg8DPW8qFZ0II9E023rQapdyOIubd
         wOXr44mr98halwXTUM7aJKOEwVmeofycIAvVryFCwkYS7MJrhpEX9qdakIDp9bYPcJWT
         yM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9va69Z70VDBET6RC2fy59u2Ycvr0LSmJxWPH1bvD2co=;
        fh=hHZP7O7h02mDfArsjAvnKh5rp5cKOv8hTbI2SLxYS40=;
        b=OJCZo5KxsymMoGQz8b5d+xNocPUHwBKIaKu3lDePB1dqHolonlmJrzlowF52Vr5A4P
         YyjVS9JpH5YV0u1R8T4CY7NmRxOqKj3aB+Lg2nlP5Zpf0c8IG+WULVjDDHo5uiVHudlx
         dsgC5/Nvjjsnwo62tWApxPsJb3IfjN/PvcEo40+rzc84S1Q5IJIXFU0e7ocBF+iXHAyG
         SSspoHcKMRHTUhNTV+Z6xK4QCEtNu3Hai60QiUJ9kYBMCSjc2PnMmf+kFdZTGNwY1itR
         hdtMldvpjL1POlgDECjjjdT1hsryF8El1xe+aqSbOX6cX9jc3EcRZR2pJrAsdwChI/06
         m6BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792529758; x=1793134558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9va69Z70VDBET6RC2fy59u2Ycvr0LSmJxWPH1bvD2co=;
        b=PDEXopoOQZvlNMysAWJAISCMzUjoaMLPQZTXDk6FzA15mcpjCXZqZY6HbhQMt7c5pP
         RX6QzsOLjBR3zgmObVdqujNbzlDIAz5gP+04rHBkNe5nhIUSCGHJaOKsNdcyNpv+e/+c
         MxknR2nK/VAl6mbAmMQHbIalUjl2a6cKBH81B7IyZDyUK01XdWSY4sP5qLg15nqgbdLP
         7LHYoo9ss4Bi6JGjmu3cFjjP1+sCV7cDPThHp5hnllR4jxPaSmGa5Cdyry6+dNWifHfz
         mpf5yfHjsFG5xzIruDs/ajAhBVnkHbxvI1l0Z8E/7ejmUqzEl2inL2Ox3l0MN4uys2RH
         GPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529758; x=1793134558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9va69Z70VDBET6RC2fy59u2Ycvr0LSmJxWPH1bvD2co=;
        b=ORYrn/tSwpRE1xQ6FbrSgDh1tkwK75sfvAVSybQ54uU2RYp+vY9FdNWHN4x4ieZYuA
         0sgqmffW7HqNaHIFDVALQmm02Z+n6e+7jALhXsvHl4WiCChQjAY2gG1k3q8jxi/l9FjT
         tKLHw6VkdMQqiGXRso4Y6i5pLp0QDweAzA2bZgg5QoNDXZA+Zjo9ToQmH+qL7rN5Y+PO
         k3lc4US8S6S/GD3W399O9lUHPw18Cj///slxBWay+/2Z9qSLaJw9xlbD6vXu1PhRVFfq
         CDtzztxJ2MDeQK1rZXiV5iXCeQyw8j7/jjyAL3H7g5BnlCDcq2qdby4H1/0y+WDsG1rd
         fJlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLPn0NeWnYIh1SYWXu7r89BPSTkDoHENpiVzJkSYtKsi/ypaD1w6Zyej+L4Ke+nlC/jSBN@lists.linux.dev
X-Gm-Message-State: AFq9FYJBqTR5Jx1+ZRH3IilpBl6V/d9PcsmndjOWuQieH+xGl1WahgGd
	6H2hgIy4/ku1MEHkjWs6nqtt6H2ubjBam8XbOM79reyEa8R00DIP54NhnigaNakoOA4FeTgrF/o
	z+Wv6CfWg6ocfro+PF7oq521FJcXffPw=
X-Gm-Gg: AYBFou1VLd6Yq48CUbQcqg/aalfvjkQab2Rnj4neJgL5N9LoZxUNKvEtOBDOU48ch1P
	zsRSf6dFoYpjIWcTthIydWvp+gRWscebHBRBlsOTRclHn8UhzZtleubU+X24KrokQeClSxJLBBM
	YQnarHB0yzfnu7A56417jQM4HQNPJXF/K4qBUIu4vDyD2UW+jVbQLiWwxDlnyDhgHHFWTMmtLWv
	IMeXTTPI0q6CuU5oSHqtUuC8ta2RHFlSF4PFGMooZQTej7evbQRrVe8IdWm8Hlq5mtfBf29pxaC
	UlPQPQORMVveTlOHYUbXX2eqwe/fPyP9dHQbpgnYaMzPgSE0fLUanlgjccGtNX9bE8435gTIpOp
	hTIU++8RY1ycsWQYoqgjMexVvKtsp1oTQTJ3IGV0IdF9qup7TYoQ7ScWEwJSp/gEH4RoP8+ytEg
	A7EKtAiU2nmeCLuA==
X-Received: by 2002:a05:6a00:4c92:b0:89e:261c:447a with SMTP id
 d2e1a72fcca58-8a089d8f4cdmr110909b3a.7.1792529757792; Tue, 20 Oct 2026
 13:55:57 -0700 (PDT)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <1da72318e969eb252977ccf5d8e3e506c2fa2e69.1792164438.git.lucien.xin@gmail.com>
 <179244540463.3135.17132817693152829356@kernel.org>
In-Reply-To: <179244540463.3135.17132817693152829356@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 16:55:46 -0400
X-Gm-Features: AclHuK_xypNF_3ZupZmQ5gCHrMwwp4u_9BbDfwJ9qW_3NU4_ksSvUmCEVd-BZ04
Message-ID: <CADvbK_d=J7Oq8VQFRYzoxX0YPs26tnJvxE7wMa4hyoe_M5n39A@mail.gmail.com>
Subject: Re: [PATCH net-next v17 11/15] quic: add crypto key derivation and installation
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

On Mon, Oct 19, 2026 at 5:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] quic_init_sock() (net/quic/socket.c:58) sets sk->sk_destruct =3D
>   quic_sock_destruct.
>
> --
>
> quic: add crypto key derivation and installation
>
> This patch adds quic_crypto, which derives and installs QUIC packet
> protection keys for the Initial, Handshake, 0-RTT and 1-RTT levels. It
> handles key updates and stateless reset token generation. It also adds a
> quic_sock_destruct() callback that frees the per-level crypto transforms
> when the last socket reference goes away.
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 12f0817c8b55f..9b1106a9f5e73 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -40,10 +40,22 @@ static void quic_write_space(struct sock *sk)
> >       rcu_read_unlock();
> >  }
> >
> > +static void quic_sock_destruct(struct sock *sk)
> > +{
> > +     u8 i;
> > +
> > +     /* Deferred crypto free for async encryption/decryption. */
> > +     for (i =3D 0; i < QUIC_CRYPTO_MAX; i++)
> > +             quic_crypto_free(quic_crypto(sk, i));
>
> [Severity: High]
> Is it safe to free the crypto transforms from sk_destruct, given the
> context it can run in?
>
> sk_destruct runs in whatever context drops the last socket reference.
> Later in this series, several of those contexts are softirq:
>
>   quic_packet_rcv() (UDP encap receive) ends with sock_put(sk)
>   quic_timer_timeout() ends with sock_put(sk)
>   quic_packet_rcv_err() drops its reference with sock_put()
>   quic_packet_xmit() takes a reference per TX skb through
>     skb_set_owner_sk_safe(); sock_efree() releases it on TX completion,
>     usually in NAPI
>
> If the user has already closed the socket, any of these can end up as:
>
>   sock_put()
>     __sk_destruct()
>       quic_sock_destruct()
>         quic_crypto_free()
>           crypto_free_aead()
>             crypto_destroy_tfm()
>               alg->cra_exit()
>
> The AEADs come from crypto_alloc_aead(cipher->aead, 0, 0), so an async
> hardware implementation can be selected. hisi_sec2, for example, register=
s
> both "gcm(aes)" and "ccm(aes)". Its sec_aead_exit() calls
> dma_free_coherent(). Behind an IOMMU that leads to __iommu_dma_free() and
> then vunmap(), which begins with:
>
> mm/vmalloc.c:vunmap() {
>         ...
>         BUG_ON(in_interrupt());
>         ...
> }
>
> Can this hit that BUG when a QUIC socket is destroyed from softirq?
> Listen sockets already hold AEAD transforms in this series, via
> quic_packet_get_alpn()->quic_crypto_initial_keys_install().
>
> macsec hit the same crash and fixed it in commit 6624bba469a3 ("macsec:
> use rcu_work to defer RX SA crypto cleanup out of softirq").
>
> The note about in-flight async requests holding a socket reference covers
> the lifetime of the transforms. It does not cover the context in which
> the free runs.
>
> Would it work to defer the tfm teardown to process context, for example
> with a work item or rcu_work queued from quic_sock_destruct()?
>
True.

Didn't know crypto_free_aead() must be called in process context
due to the async hardware crypto implementation.

I will  defer crypto cleanup to a work thread like quic_udp_sock.

Thanks.
