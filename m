Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795621940;
	b=Nmkd1l1RhBdHl5VpxkK+OITvlZhonw8mNPLOL+dwVIwwKQ+tE2OdkJXELKFkEyosECSh
	 ntlPSxWfV3/CEPKe3YRK7s3qL6mphPIwr8GcRTURnZqZRJ/52RgL8DRvr6/eXD9br/dBL
	 WxDsVV4Kiyq2UbkEri38SkGghTiRBS5pWZfRW3CAngibXtnYW5qQD1HwtyaRuEnZvZmdI
	 dibiYS30zFIuHKjXW7GZvJ3vr68jqLz8DKASwFeexWiNaoj3E74t86NlYZ3FCFNcnHnMf
	 QcxiYKJpitoEDePaL/VsOUS6LleUxtFnmIxo/VTxhXf8MHJsKWpLCq2l0j1IMiqgqlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
	b=o3DfPEPqR8ij37JF7XTH68rWbJCu5DdoM6c+dUQMgtD1ksOhFjCt1sQocbnzxh8aAGW1
	 yI2yV7kpsQhkuWoP8Psx9Om5FfOFWQySIAmgDzOLoQEzSU9bZDNCptODh4mrJ4Udb1KVu
	 B5tEGcXDbocRXr+T9HAWYt+EDEb6qOwQrmU34F6KdFUMLmqxky6lAh0YC0SKVI4F0Xmsl
	 Hwdw7a87EqCuUM1leQ+LaAda2/VDzHSFDiqSSQXExhdurhPgMfirwz2QJTjnR+1X2kSvv
	 TDeC7T7ez2/q+z1vw410sfrTesCHvgZ1nlCJQJznhdj43WRs80vxj0gk9Pd6NEmtkMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUpuXlpO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0F606A32C
	for <quic@lists.linux.dev>; Wed, 25 Nov 2026 15:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D0F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUpuXlpO
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070755c8cso2910250b3a.0
        for <quic@lists.linux.dev>; Wed, 25 Nov 2026 07:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795621939; cv=none;
        d=google.com; s=arc-20260327;
        b=sTcfFEc2V4q5BgXivqmWnilefdzbwYSjh2PDlfaWUD7lhW2lGaV01CLZOeEjINZ8tM
         PT2ODEX9qJj1kl5EimM1dPEpTSiMZZ6ALHBd728g2C0uA2G8N2UCX1+asRMD4ph3r2WN
         EYK8wu2Pi9QaZWTohIyVjaQqsUoZidRtAaZ3XRfig2RQQqpRqR9PisEbR90KURg8zRm0
         4bBO0G6XW4rwCcCSbnfHhOZ8C/7aJIgOqPOPGFtZ7pobL4dVNW/2uxr4D2VBcrXyisto
         cYNImAHI5HY+LUbXbDO+vtFt4PeYoLKI1+n3oEluC1v4Ed/O4xp/aFagJ9VxSiH8YHGw
         FYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        fh=4DQavjddgEvnETfRDxBk20ZYrGv1RvAqaUhIS9nDink=;
        b=QR+IgPl+KP/GJRLiuAr+bJHFn+gATEAvZCQXy1ppq02n+8jHMbfSAMdiUIb/8AbGpU
         0bRxXgX82DPAL2HQ7nCkTgtlylj7D7r5k8tAo7etMrpRbXpD+lCsbRQWx7fH9bxPpJ8x
         XgJcNaEaFPL1k0FgMiZfTf8IqMZT0yj5uzXoRwNd7prxvOlMkLhdBZ7Xo3JYbhIQ+NIP
         1jdioY6rajcHcnxiH7nbX3t+MPg62vruHpoPxcbqI3syB5neLeYVf6fEsCBxwt325Vv3
         tVhqDTH+Z4qXpd9fpSVMo2uS8KaDocQCeODIti76QlEluMD5IJ3+JGojpsxFydS2tDEt
         UuIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621939; x=1796226739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        b=dUpuXlpOisquLJerK3ED14Z++JZBPL0gDHKYafcd2ofaTxbVeu3uOsYDSJyVIZODYp
         P5o9w46MFnSRkK2qynH3bzz/4yoVGTJcKkd70+eN1fCQQwgjqfk9C4Hq6juix1yCQExH
         ZNm6X3BAO2rB7o3ZY+uSr5HZEY4hmQxo5ZzGVCTLCpHiJbG4nd7j2PxjaDKL6K+utwX8
         RLtmjbpD7T14OIfgWanfIMqnVW3clHdoekEoePytjKnOh97SxKLOKzaEP4Q2krwzIVJn
         HYllfwFa8iJLRpofU6PjSEagsnSn2hP0nUuNQr4DQMeXjkAZvbSlNn4mZjeCnGBTuvCn
         05oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621939; x=1796226739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        b=lUJ033Fd48U2EijTnsZK5ztJmmLcEbyoA3NyjqED/xGIa9p1x/R9wgjK3CDNxroCLH
         YSQh5Go7cd54BEfFUnVDN5iW171srwkBgO4+3ZOoHSnXUkISAmKCBElttvjmqVgsNbTh
         FT/MBgKwrozCaB1rQ1FTOAhn1o92hXV4exhtQMu49rA/+DBKkEtN+Tz77vWSa3q3ARGU
         4fRmL8r53g2VlpV0pdFLsQn8ukUfWdcnEEZyxfr6cQI5Kizo9C6afqGXDwKhi03McqjW
         Uyw1UNBnu8cUJYdSMp6z8oPEsDsRteCgs5493ikguI50Yru1eQtt1jBpRq57JtHxVfY9
         JaIA==
X-Forwarded-Encrypted: i=1; AL+hErESJswzEkeDGlKMDvHPu8kitG7of3UTBHqwE4qqHEO4tbleIXla9pkAbtzASYuUCpnm35tL@lists.linux.dev
X-Gm-Message-State: APuU4Z+D4zZC7fR5qnymRKOqOeNrCYPyRpt4/FShFXGRLfh3ARgDR3N8
	qyup2refdI19SSzYfY+peOZ/dBuMChvuNZGzIq3FdtMfht0gt1tkJP3D3f1OR+qOcE98qSFhiKA
	GxDp/AAoKJg/vTT0QhS9mPD+6B+1ROGo=
X-Gm-Gg: AZFdTZfhA+AWQKnpp6uRAq7U8BV4DONFBGh/XnYxlzz60VcRJ651N7tJtPKpG2KORWl
	zbfxe8WZDUtx5TVdMt9Cu67nEnRD5GswUGYjYDFy9fF0ZJXmEtaYgw9vKfvzk7DhXuKblinO9n4
	j92Wcz7cYNDiPA6vdpPOcwfmVYQpDy9DhK2+ECunWnhKvzsiXKnCKHuQV+WixFKt4CFCgbSqoVW
	+y47EDl3ncEaPPjDHaIAP2TCH+Fo4gOuf1le4zxIpQtYUbEvIC/ymZvX8DIQ+uglk4vVsxkaMgG
	Ecb4Go5Z1fgpddyjslzKjtEHRahfa3l5vOr3bpumyRMrPLw+mjhSaxcEWujqNwitGBRBVSJ+ZUQ
	w0rxtvLDJSbOYTnL7vTn2krSVoBEM4/XelLc5VQjFLo16XM4Yx71A4l5Z9yMPQs6nMZ/yQFl60G
	LppoLujXpIXRllQoURARwVVNaESw/SDceEz8MUTTZ584BgSC55xkGHNTfcoA0uhPrxTTJd
X-Received: by 2002:a05:6a00:1c84:b0:89d:a947:9d58 with SMTP id
 d2e1a72fcca58-8c87bfa78d6mr15873197b3a.25.1795621938615; Wed, 25 Nov 2026
 07:52:18 -0800 (PST)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <5c305e22057f748d5c4d4cbc94a1e14271dbc485.1795393691.git.lucien.xin@gmail.com>
 <179548328755.3135.13551034983466058259@kernel.org>
In-Reply-To: <179548328755.3135.13551034983466058259@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 10:52:07 -0500
X-Gm-Features: Aa3M54pb6nKYJidOZT5TgP5nXd3wLNCTpX3AZEaTxx4hR_vcQqSA7EC-JYn_mcw
Message-ID: <CADvbK_e4PXuzSrvuErCMQ2wPSFrvOW7-JwruzUBbLeENkKOg9w@mail.gmail.com>
Subject: Re: [PATCH net-next v19 15/15] quic: add packet parser base
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] When ALPN demux is enabled, a valid ClientHello with an ALPN
>   extension longer than 128 bytes is silently dropped, so that client=E2=
=80=A6
>
> --
>
> quic: add packet parser base
>
> This patch adds RX packet parsing for QUIC. Sockets are looked up by
> connection ID and address, and Initial packets are decrypted to pull ALPN
> out of the TLS ClientHello so the right listener can be selected. It also
> adds ICMP PMTU handling, deferred packet processing, and the request sock
> and backlog infrastructure for incoming connections.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index b6f76681b6902..919745d954403 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > +     /* Read TLS extensions length (2 bytes). */
> > +     if (!quic_get_int(&p, &len, &length, 2))
> > +             return err;
> > +     if (len > (u32)length) /* Limit len to extensions length if large=
r. */
> > +             len =3D length;
> > +     while (len >=3D 4) { /* Scan extensions for ALPN (TLS_EXT_alpn). =
*/
> > +             if (exts++ >=3D TLS_MAX_EXTENSIONS)
> > +                     return err;
> > +             if (!quic_get_int(&p, &len, &type, 2))
> > +                     break;
> > +             if (!quic_get_int(&p, &len, &length, 2))
> > +                     break;
> > +             /* Incomplete TLS extensions: skip ALPN demux. */
> > +             if (len < (u32)length)
> > +                     return 0;
> > +             if (type =3D=3D TLS_EXT_alpn) { /* Found ALPN extension. =
*/
> > +                     if (length > QUIC_ALPN_MAX_LEN)
> > +                             return err;
>
> [Severity: Medium]
>
> Is returning err the right choice in quic_packet_get_alpn() when the ALPN
> extension is longer than QUIC_ALPN_MAX_LEN (128)?
>
> RFC 7301 defines ProtocolNameList<2..2^16-1>, so a ClientHello that offer=
s
> more than 128 bytes of protocol names is still well formed.
>
> Other cases this parser cannot demux return 0 and keep the current
> listener. Those cases are a missing CRYPTO frame, a non-zero CRYPTO offse=
t
> and incomplete extensions.
>
> The caller, quic_packet_listen_process(), frees the skb on any error:
>
>         err =3D quic_packet_get_alpn(skb, &alpns);
>         if (err) {
>                 kfree_skb(skb);
>                 return err;
>         }
>
> With quic_alpn_demux_key enabled, would this drop the client's first
> Initial packet with no response? No request sock is created and nothing i=
s
> sent back. Each retransmit of the same ClientHello would be dropped the
> same way, so the handshake would time out.
>
> This path also does not increment any MIB drop counter. The decrypt
> failure path above it counts QUIC_MIB_PKT_DECDROP.
>
> Would it be more consistent to return 0 here and skip demux, as the
> function already does for the other cases it cannot demux?
>
False.

We expect to handle it by either discard it or route it to the socket with
right ALPN if there's ALPN find, instead of routing it to the incorrect
socket, besides, ALPN > QUIC_ALPN_MAX_LEN (128) is very uncommon in QUIC.

> > +                     len =3D length;
> > +                     found =3D 1;
> > +                     break;
> > +             }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
