Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A53242CA
	for <quic@lists.linux.dev>; Thu,  5 Feb 2026 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319092; cv=pass; b=UBsZ0Oj+/GNLSKCr5baqYJzsrlk0DFhXOBOHEl0onQbfq9iJc32OkHCVq/aQtUOk88IfnmfufN/KXy298OTU1ogM+8l+hOzdgPrVNIfRGMKwcw626IHCV7T/GxKnn06u5Tr+l9xJ1bH4aGp3eUsMYBqOdM7Auov+2KBPDC39Jhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319092; c=relaxed/simple;
	bh=QRhy0aaIatw5X2ingQ3dP6bzvBtQ67P0/48x91gmp1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVZ7gf88Iv8vDTQ6qHt/DI5nAC214Cigx5CnWjX8m37340e2PzJpM10Dxqd1ajG5hqUjA6tMiKfvpWE/iP6V48Aj0u+p2CK8SKwzTTc+/i7ucOB15dA0b/mZlInsW7mrrMEccJgspFl6FuMQyseIhyUXmNIGMdyzxT4Nx/4GEYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuM1ZwVQ; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuM1ZwVQ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso728970b3a.0
        for <quic@lists.linux.dev>; Thu, 05 Feb 2026 11:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770319092; cv=none;
        d=google.com; s=arc-20240605;
        b=avzQFb6w0p+hLnazLj4fzBlS8DeJG23ZekLmT0ASmdKUiBw09kHrnqHgIXGAtPtECN
         SBk94/HTev8CIkFReO74S105jbxGd5BG1myz7VdUEJLwQhDzfl3oP/ciP2VDMU8UCPMO
         6zLG6qCp4XWl1Kql2O7vpwpMQxbuuuen2uErxYL3ZXmg1nOFX/jYQ8DmqX+0IF3FOWuX
         LJ8YnkZfKflcOT15grUHHyLMQ/hiaLlmLHF5HoiN/+hD7CPwjG9dt907d+bz3zKCLBZm
         AAY70jJEhQpFCidzXnBUgGXvp/eVK+SkXrEk9xAhAqeItorYHCh6RFWIAA9g1QDUQ1EN
         zh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vp6eSjM8r19A+ldOLHO2Ln5yqplokvRmWPI5a2FR3lU=;
        fh=p08KAm0ux3pqDS35PpgQa7VvFGFNGmtoXLwC8TfShQY=;
        b=MYmHqLDHZQxLmuDgsQHVvZceiudDgv1jCzh/9PSMIqP4ykE8H5oSuEgIvFv1WJZIvI
         22jTonH5EfflG6Nk9B8u4YuJ1QH8JxtZvqsgy44Eiu2ceezgT/qWpXp/K17WW42BKfBy
         BjT3kulpCJYt7FDXxkRnSxPpgWXv/vCim9wzFA1OlZ9harwpLqzQ8f0HS2yLjodwpOJ1
         q3DewQYFxoLn0Hns61CGp5XxpHsJHXw/UIxKN4HoWLnemNvE4x7c/UdhGTBUlE9zqrhE
         8jcg3Z7Ngfrjt1MSOgdV8+cglShda0uQhGyG7fVpfKRjWF9xW5C/6tSACfYzht1aCSS/
         fsCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770319092; x=1770923892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp6eSjM8r19A+ldOLHO2Ln5yqplokvRmWPI5a2FR3lU=;
        b=fuM1ZwVQQk38RrRnnluzn2ez73dsDsHrFEZFPmXwByx5ulSQhUqItMlrnh1LKQHxDm
         YPlQvgq6I5vmNwjXzjDpoKH5JwtIPUfRLG/jfRBGT3EXa2H1NE04pEDnVufrnWVjezCj
         zng7h/zJSHmID45oRNx8gj6oE5cF50eGyGqjUcnqTqbPYVtCQzEK7yEyfoOTSN25uzyD
         cQtWIDIWPLHQA4eToEF5fv+Nyml/xcuKyD0wH39JxoS1+Ez/uDBpaTsJ7iMiGwEFnqbS
         j4iqFBPxa2YxsAd3pRM6UQPDERkQlybgamdj2pGt9hCqCNd8Hg6Yt/a/QuGFVCHBcGeA
         2vKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770319092; x=1770923892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vp6eSjM8r19A+ldOLHO2Ln5yqplokvRmWPI5a2FR3lU=;
        b=drGm288gTsNb7/giRZ7wN5oOtO7oLNWF8TQ2VuFm1M7UqP3li0ZdztONm4VqV4RJUb
         pFPxkNDY2UnWTAfCOfj9SCEDZGaSiOUEA03lLn55yPrXRNN9leiVXAWaLbVvvzp3c1ox
         GrgjFiAgT2rHPJ43oWl/2FPPwcsh4EN3iahTMmOJ53ULmuiSctV8JHuASJCDmY7Ll5ml
         tmgtitrd00dNDYj/ciJMHl+FyGMKQHkDXiAeM6xIaJA/SbMCH5NcniE3+f7/ACa6RNQP
         xz5k/1IThJwIh2r5Fpw9TpKRRPIhKBHfHbADtBSvFBDhrRrKdQpWbmorXV0aTPEuqrum
         3Z8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWT1+po3v0VMP2VHIG2hYqar4dATjvAd1RIQK4vb8xdXs9tIYvBuhw5RipkOtgjLD/oQ3NW@lists.linux.dev
X-Gm-Message-State: AOJu0YyNZhKRRkEOmWmOi/7/BzyryzM3pk7x638AhExnYKeyVXrfPQoZ
	2c2WCtUO882lgOonLLc7XichMiiXBYV4Rzn2G4xdsC4gkKGOoob6rngVPbkz4wQBkW1n5V1XN6Q
	JzRyK7ovm2uKJSJUuinvUoUSpEq8ZnHo=
X-Gm-Gg: AZuq6aKa67UsNd751qHxmTfLPkr8VPqSMPT32JC5gaOKqCN7ZxD8VBBS3oA0flT83Wr
	NMiqe5/cwPVhTE2favRnHTLyBnTH/OO7E7XkwMYYDobk11T0Xotvg1YsNa2nZ8FznPTq5yTN4iP
	fuYdCFRpVM2NGw+KTfqpPhmcgYHtj+M0hgwaMsnazKa3ac4tbgnWYOV9JOZk9lS0+ZptRbPoAu3
	l39ZQdOSHqiIxMHUrMA6zJ6tzk80jdkLksb797mEhLbFQQWHpEhb4J1vyTdIWUvS2DfLoZscO82
	jWBw/2sbfsMf9uEIWB3rnzyQS+ct
X-Received: by 2002:a17:90b:268b:b0:34f:63b7:a1f5 with SMTP id
 98e67ed59e1d1-354b3e2f135mr64355a91.21.1770319091958; Thu, 05 Feb 2026
 11:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <74174c085fb11b8a63e72a7df730b6f4a7479c5c.1770042461.git.lucien.xin@gmail.com>
 <20260205115449.2195294-1-horms@kernel.org> <1bcfe20e-0103-44a5-82b5-90cba7ba5a60@redhat.com>
In-Reply-To: <1bcfe20e-0103-44a5-82b5-90cba7ba5a60@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:18:00 -0500
X-Gm-Features: AZwV_Qh_mc3jaIOzqDW1hY_eOgDZvqz5PolYvBWVQrjtRoVkuvNydWMH3Z6Pil0
Message-ID: <CADvbK_eLJ2HWxx5G8PBwePCUZ7dXdDw6X8pryWWyn7SRx1NdDg@mail.gmail.com>
Subject: Re: [net-next,v9,03/15] quic: provide common utilities and data structures
To: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, steved@redhat.com, marcelo.leitner@gmail.com, 
	aahringo@redhat.com, alibuda@linux.alibaba.com, jbaron@akamai.com, 
	hare@suse.de, kuba@kernel.org, tom@talpey.com, linux-cifs@vger.kernel.org, 
	daniel@haxx.se, quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com, 
	dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com, 
	pc@manguebit.com, kernel-tls-handshake@lists.linux.dev, 
	illiliti@protonmail.com, xiyou.wangcong@gmail.com, 
	andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com, 
	matttbe@kernel.org, netdev@vger.kernel.org, smfrench@gmail.com, 
	metze@samba.org, mbuhl@openbsd.org, chuck.lever@oracle.com, dreibh@simula.no, 
	davem@davemloft.net, sd@queasysnail.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 7:51=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/5/26 12:54 PM, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> >
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-lo=
cal.html
> > ---
> > quic: provide common utilities and data structures
> >
> > This patch provides foundational data structures and utilities for
> > the QUIC stack, including hash tables for socket lookup, connection
> > ID management, and helpers for encoding/decoding transport parameters.
> >
> >> diff --git a/net/quic/common.c b/net/quic/common.c
> >> new file mode 100644
> >> index 000000000000..94321f3f213d
> >> --- /dev/null
> >> +++ b/net/quic/common.c
> >
> > [ ... ]
> >
> >> +/* Reads a QUIC transport parameter value. */
> >> +u8 quic_get_param(u64 *pdest, u8 **pp, u32 *plen)
> >> +{
> >> +    u64 valuelen;
> >> +
> >> +    if (!quic_get_var(pp, plen, &valuelen))
> >> +            return 0;
> >> +
> >> +    if (*plen < valuelen)
> >> +            return 0;
> >> +
> >> +    if (!quic_get_var(pp, plen, pdest))
> >> +            return 0;
> >> +
> >> +    return (u8)valuelen;
> >> +}
> >
> > Does quic_get_param() need to verify that quic_get_var() consumed exact=
ly
> > valuelen bytes?
> >
> > The function reads valuelen at the first quic_get_var() call, then deco=
des
> > the value with the second quic_get_var(). However, quic_get_var() deter=
mines
> > how many bytes to consume based on the varint prefix in the data, not f=
rom
> > valuelen.
> >
> > If a malformed packet has valuelen=3D2 but the varint encoding requires=
 4 bytes,
> > quic_get_var() will consume 4 bytes while the function returns valuelen=
=3D2.
> > This could desynchronize parsing of subsequent parameters since the cal=
ler
> > expects the buffer to have advanced by valuelen bytes based on the retu=
rn
> > value.
>
> Hard to tell without any caller for this function. Possibly you could
> drop it? IDK if enforcing such check would be correct/safe from an
> interoperability PoV.
I kind of forgot why I didn't validate it, I will decide if it should be
added after interop testing with those userland implementations.

>
> >> diff --git a/net/quic/common.h b/net/quic/common.h
> >> new file mode 100644
> >> index 000000000000..bfec0aaf2907
> >> --- /dev/null
> >> +++ b/net/quic/common.h
> >
> > [ ... ]
> >
> >> +#define QUIC_CONN_ID_MAX_LEN        20
> >
> > [ ... ]
> >
> >> +struct quic_conn_id {
> >> +    u8 data[QUIC_CONN_ID_MAX_LEN];
> >> +    u8 len;
> >> +};
> >> +
> >> +static inline void quic_conn_id_update(struct quic_conn_id *conn_id, =
u8 *data, u32 len)
> >> +{
> >> +    memcpy(conn_id->data, data, len);
> >> +    conn_id->len =3D (u8)len;
> >> +}
> >
> > Should quic_conn_id_update() validate that len does not exceed
> > QUIC_CONN_ID_MAX_LEN before the memcpy?
> >
> > The destination buffer conn_id->data is a 20-byte array, but the len
> > parameter is u32 with no bounds check. If a caller passes len > 20, the
> > memcpy would overflow the buffer.
>
> It looks like the check responsibility is on the callers. I guess it
> would make things more robust and simpler move the check here.
>
Parsing the connid from incoming packets will always check its length,
not good to move the check here then return an error for coding.

I will only leave a comment here. like:

/* Caller must ensure len does not exceed QUIC_CONN_ID_MAX_LEN. */

Thanks.
