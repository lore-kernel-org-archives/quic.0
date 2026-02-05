Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F92264AB
	for <quic@lists.linux.dev>; Thu,  5 Feb 2026 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770320279; cv=pass; b=Svzqa1jSznGnAYRz+pxGpfAYz7oHIr0+vHaPUY7hcCGxx/i9rTPoLqcD9lQwOqN3ow0mt7WUTwlJDeNhhI9mqEo+nPKDOnRfXMidy8KOmpnO1UQAdFCuq3/4ZKoIs4wlpUvQUzs8hr5K4+Us00N7SMrz3HcJV/qqqjKuMI/wZAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770320279; c=relaxed/simple;
	bh=sKPzMs6ZiMMSTfcnvFTaywQRGHtQmYcHtLPKvcXf5PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SwVPuckJiJ4xLI2zmQIWzO9+8HfM3ch95jv3D7vyAbf4TMp79NdAOCGQEONsUiCpxVdRTSSQTWGTWNA+ZBOJq/xAIKqLrIYIzQAos5IevBFI+GGYLR33v+NJTOXZbjPhbd8/RlL52jeg5bSOsQlj8sjQFsuGMWOivNiBAM7EREY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fwk8H25F; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fwk8H25F"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a09d981507so10966125ad.1
        for <quic@lists.linux.dev>; Thu, 05 Feb 2026 11:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770320279; cv=none;
        d=google.com; s=arc-20240605;
        b=IguxXxjdARBfYN3L+7BrJXUGCVtvcgTJpb+8oKQexcdDh4jy9hhZjxD2DeXuGeEoGt
         tokTYFxs/P8uDul7T+eKQQEP2EFNw5/tlZZm9/BWHrSNiJoob28ZeDCCFgwuviuGAwft
         ulFr1E60wpqAwnHjyR7zEhbHmS/d0Wgd8jTMEmT7q2YKELxNSkAMg5RLDE16kUHJ8vsV
         f02YYC8OKxX8EFKRPXxCkNwM4mkYXQbgV8EVCVciNrtv4yjr30SfnHBxgFZF3Gatyqds
         Rn/o1fGkESllU39REhaFVPshE/t0jAdrZLj7NGifjWGXzJdjU4T0SUTT8CHJbZUosBtL
         X9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfrsfyhAmd8GwoduMxGfN4+1FY51xPnUMNNk+QbL/6k=;
        fh=ZzRYSUGFB7zfvDhM6P6eYOctwGUlbG+tQzhafo8vdTs=;
        b=bmJTjS444M+2L8LLVNBjrGTwL1GS1ejkscYn3YJ1p4CzHLI1h4Ey0FdMyYPvDsmyOL
         hBzlpEk5Mc9Q9yVrs6G3TuggGL6GaxH0KxXAM+QwfcZc0mYChn0OX0hfDWJ5ab83t1IO
         tiLyYeBQlIggiSONZ1wzWPKQV++DsLqdCoxlZeFa8I7I5HEpXsdtMEX/O5VUmJrNBzg9
         kJcvcCeoiv5nztv/0gNJB1H1Hirhl4GLlsXUVs4BDxXCmTcNgY6q2ijn6BU4CV6dSM9K
         o98rA0co+9/w9k3Fw3FfvLsCW4OrWbyalyoUAv8+XWTUeTNAaba8YT86dI7NcJ39fbUO
         LMWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770320279; x=1770925079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfrsfyhAmd8GwoduMxGfN4+1FY51xPnUMNNk+QbL/6k=;
        b=Fwk8H25FJPkCQOgIde4hXlNkWY38UvNrzpbM9RX1+y1p14wRrPQz7Ll1nPLaqjXYVv
         X1/dhBDnbGigBkcBVjVeN6GigpFqHdqay/wHoVgI01EGCIP5i2/7O8qag9HNb+xnDLap
         QEofJ+RxMbNYMFpjiS+2p1ezLW3E+W4M93kA3fDT53wn9RNWBS2h3eJ6Xp1igBhkHekU
         gBLk8sQWJ6+Tl9uOfRtqR0Gre1Nf/2k15KK5qfW9AI9mViaqinml90eW7ael7YRdZ2yp
         nYukcAVUeD/GG4zql4ZsqAHaBDXc+xxD3Kle1NdnJe5qUbfpjgn+iBjDvCEj1ZpMfF5l
         FGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770320279; x=1770925079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dfrsfyhAmd8GwoduMxGfN4+1FY51xPnUMNNk+QbL/6k=;
        b=hhS+std5XAfEs7qG9daJgjrdlmOvdcHPUnRys66xcl4StmWCrH6FycS2LGlrP5TRS1
         TjwQaZDTypHIitnklHlIjpCg4fQTGRuhe+TqxjOqPppmm1Jxii3wuuh/ceEuc2Zt0Z58
         rMc0e58JWRPr/p0+cKPQXcKi91oB8mS3qBNqob3tBVJz5Mj18BopZTIQWMdT0YcFj65i
         dBX0imF4z98pFLAcnDzrg5V15n40HR+TokSX9uu8G0KzZY8m7WKO7pLc4+aVBsafWlKQ
         IFO1j0C27fj/7mFc51dyUxKXHKSd2hWDj4xricxGOJQjN4ESs+C+tCjugGFgvP3XxbfW
         Tt/A==
X-Forwarded-Encrypted: i=1; AJvYcCVsPhQDb/9ZizFbhN0pDMHemlNQYsbyzuOav9wa1vDBr6lKM7oCotqYsHJ19wuSaCPm8j1m@lists.linux.dev
X-Gm-Message-State: AOJu0YwUh6y/mQvaptFO2RPn7fKSSsymfnbfBQm9spjNQHBlPiteEJFD
	e9tea6H9e39vp/YMi/gPgRLq1cf0TPEB1zKpO0kIlB0bZ0X8+tTGif2k4//R+HV9QMb2vAXq0Dc
	ehYsB4ctkvPe3+fvXIHKe6Peb/k0fWas=
X-Gm-Gg: AZuq6aJLG7NR4dXB/I1ab+DVZiTMcvmq/VJZPCZDStzK1ngypVJz+CTi0cMxn5Hfskb
	CLmgqLs9nNg7jIm4BmKgFaz2S5upSQAC2yG2ZvrKG8N8IhI7MbsV8V1/GPKt08mI+aEFMhsQ+p8
	bZ1xkyCZiJ0XVWdmtOdyH77pStBAxYKEOsYOyOewc0WKhA3Fh8WRCY7kL6B/BCoCh3bUXW6mV3E
	4R2pLLNSdcnjb6HDFtVmTms5/PmY55dxAm1MqzrrPoTo+VTUt5Y1+v/ZDmwOFSbnq4Ui3Iiydbm
	OaZbOEVy88kE9ca1bQfgcEI6zmX9
X-Received: by 2002:a17:903:3d0c:b0:2a0:b432:4a6 with SMTP id
 d9443c01a7336-2a951948829mr3889045ad.15.1770320278896; Thu, 05 Feb 2026
 11:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b3e81a27cc3e4c03fa8357c2c77b238997e48610.1770042461.git.lucien.xin@gmail.com>
 <20260205115506.2195311-1-horms@kernel.org>
In-Reply-To: <20260205115506.2195311-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:37:47 -0500
X-Gm-Features: AZwV_QgKmhAvyahpdZdywI3F6DO1BC_0r2LG19n44OMuBxjTNkYftoQ43Qsj1cY
Message-ID: <CADvbK_eTE-eRDpUQ0bLcJOTyveEYusBSqGZTYBYuujuABvm6jw@mail.gmail.com>
Subject: Re: [net-next,v9,05/15] quic: provide quic.h header files for kernel
 and userspace
To: Simon Horman <horms@kernel.org>
Cc: steved@redhat.com, marcelo.leitner@gmail.com, aahringo@redhat.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, hare@suse.de, kuba@kernel.org, 
	tom@talpey.com, linux-cifs@vger.kernel.org, daniel@haxx.se, 
	quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com, 
	dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com, 
	pc@manguebit.com, kernel-tls-handshake@lists.linux.dev, 
	illiliti@protonmail.com, xiyou.wangcong@gmail.com, 
	andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com, 
	pabeni@redhat.com, matttbe@kernel.org, netdev@vger.kernel.org, 
	smfrench@gmail.com, metze@samba.org, mbuhl@openbsd.org, 
	chuck.lever@oracle.com, dreibh@simula.no, davem@davemloft.net, 
	sd@queasysnail.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:55=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: provide quic.h header files for kernel and userspace
>
> This commit adds quic.h header files in include/uapi/linux and
> include/linux to provide the necessary definitions for the QUIC
> socket API.
>
> > diff --git a/include/uapi/linux/quic.h b/include/uapi/linux/quic.h
> > --- /dev/null
> > +++ b/include/uapi/linux/quic.h
>
> [ ... ]
>
> > +enum quic_msg_flags {
> > +     /* flags for stream_flags */
> > +     MSG_QUIC_STREAM_NEW             =3D MSG_SYN,
> > +     MSG_QUIC_STREAM_FIN             =3D MSG_FIN,
> > +     MSG_QUIC_STREAM_UNI             =3D MSG_CONFIRM,
> > +     MSG_QUIC_STREAM_DONTWAIT        =3D MSG_WAITFORONE,
> > +     MSG_QUIC_STREAM_SNDBLOCK        =3D MSG_ERRQUEUE,
> > +
> > +     /* extented flags for msg_flags */
>
> This isn't a bug, but there's a typo: "extented" should be "extended".
Cool, I actually asked my local AI to find all typos but got nothing.

Thanks.
