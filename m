Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266A2328B49
	for <quic@lists.linux.dev>; Thu, 29 Jan 2026 19:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715879; cv=pass; b=oN0DlRSid0ls8JDvO5bRihXWTSkqUYoeHxl2uwEpV5UOvNKJ+sNThQ95F4ebvlpVk5mdS6uuenTIGQJmjyBBUCrhQ4jfLvFn6KmQwpt3+rbD66VkrTtQVI0Sb6uDjLoi+gxEl2OH2D3DACdRk3x/EMUai62VZc9IlyYcwIvFd8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715879; c=relaxed/simple;
	bh=Y0rOjxXytJB+38cdl2LNr6UYE5fA4/7cWyfoN0StXhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YO6JVSOFS0jtq+5+utTPDfOhWBYm/ywEu4Fd0pBYIEsgGBt1R3QgprII990DsLKMWIg1pLu4EBAZhxylxKarqmJgce+W3FiUp5FWYCI+Nug0nx4cQ74xobNL3pOErCtlT9/mGM0cjFi4lDT3orFVCbUA8tpLBYHmClEhiS5/D9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGaXac+j; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGaXac+j"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5f178c83a3dso406258137.3
        for <quic@lists.linux.dev>; Thu, 29 Jan 2026 11:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769715877; cv=none;
        d=google.com; s=arc-20240605;
        b=kLb4R0HNcMX56OENLS6Ckj/CfXnf0MyQibrRDNYJbbZYF/Qlr1oOA7UZqUgzcxL16m
         cMtCxpbyoog+HMO1RnOEmMGiVxjfde+a5M+J89QfPUgU7TpjJajnj496L/j+EA7/L9ad
         7QZxbnliOVo56zpFSjootYHD8GQufqtRBmr6w2s/XgFAoXfq0Y7To5v2f0oLPfcth+6Y
         gRsZGTRwyTQpvNGwRu8+IjPhdrlDoUtjecCJKeJbB7orFoIANeG2dRuJf/0hzW2IeP+9
         P2xxAquq/CrJajHccs6sxI7Da5AOPyfBhfKVWUKRDKwZDWDnnVNFl/7ZmovzGrHjfGJx
         eCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gbwVti2MveWgbF61EO9aejU185mP/ZCSwXbR5m8XjS0=;
        fh=nqvFxy9thk2A1YEUrr4yclpLKbGDmYYAOSUbRQbxZSY=;
        b=iAk/5FT9rxYEhthUXmf1g5iOW5Ckc78KZwh8lMp5ipHFHXzSTuyk5YWXRQuN2g73nC
         1MKfqMQCfpPP89m/ErJd+733Uh1KTfoNr0FrOBQDTkCn2FSTnqemk4otvDcMKxIYongC
         Fik9EXw1DfSG+8wYxFa/oXqZx/jcM6iM72Vqsm41AhPqE8zuIApDUPxva0OYofryERR0
         80Z3yj4/tE9A+2RrP4qeV9o5jm4Tcqvv1tLPj2jYxoZYwwBqCSMYjdhyYLD3Z17860zR
         VTQtrKKonLiMBdNRaKEmreUpS1p+NvDqpFaX2R+XqEK+RnT9NWtJO4nj5OSFIMduVCTz
         YAqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715877; x=1770320677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbwVti2MveWgbF61EO9aejU185mP/ZCSwXbR5m8XjS0=;
        b=OGaXac+j+2n7Op8WZ4IAtP3UmDlXrpnu2QykePglCsOjWE05ysZjmAaGckJ+hecpzQ
         6UR0W78p5BLmQqNm3jC+0OkSva4PsRjyfOBUWIhv+ldpZ7W/G0ccycvg6yisR3yeMVee
         3Xk0uF20+tlNaoCGCJqFDDqdD3flhniZjqw+Td61AKqZRTLMryoK1oSlmFqBaYHFWnui
         0Qi+7JkFlY2S1EcN+lPFGVcQryGTMNspVRwfTMrWksEwQ97Deav7OSdYMXA6WqfEE1Pl
         SRY3EY4QUcjoUtt7/gAEjo2QAgR9+gjHtqz5u+hVCPMffow3JHThv535MRz77JxMXKis
         jLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715877; x=1770320677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gbwVti2MveWgbF61EO9aejU185mP/ZCSwXbR5m8XjS0=;
        b=lZ9VjdB5k1JcNsvChSehFCZwav80yL7wnFZKJyq8adWIgA8+bmhfm3vk0csl0xW8fk
         qZbXwmWAicpNNR2pXRkTJQxzuXIfaHsQ4uu03TJaxTPO2Jqf37KgW2QmiVvTzxAunLEe
         51nMdkzLTyJSTK20rBRLPjXOH/JFTEfHBupoi5WrOPFRQ1BoKEUSsePyFuMzQHOLwQlQ
         e3MeTs3AMYOBTckU2z2vqHMvACLfzQSmqcInYir+nd4NSWakIY65faP1WiPlzx+Dr4Aj
         9CDQN5pzLGWO8O1bBsi+f8jOnzWNzIuSc89PRcrWWDp9VpR6L+OWGASqvxFZZ3ndIHV/
         6Ftg==
X-Forwarded-Encrypted: i=1; AJvYcCX00gutTpaY/Qm6OCUzLoA7wCkmGf4pVy0rmFh9AX+EDzBELz8hUEyfL6ZFD5aPqOSvOEfa@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9CuoYMnqhmgnMFR0Fwngvf3Ns+xlNIB/TulnQr8rLLR+z1nik
	z/hp5Pt7oeK560kvWVdBYrafAESEX3KFjo5ETbbp8jHj35VBao3DBeolEP2NJ5EA4c1xd36QrFX
	6JY+vlmyQHuT7tkQcC13TfiKXl3fR9V4=
X-Gm-Gg: AZuq6aIY1CNoBKJ0IRyc1wKFPZnS+Uc+ZegX1tj2F7yN6NaW8iUuxpFH7Icfz0gyIcD
	vim1WPkTm1Q51ytvQkr0WC1eOfzkxx8Lq20rmG76HiTSpJGRoiZhKTE17pb80KmwPfg7W0FIeY+
	qSSDuln7OXPA4Wp5xz6S5niKGDCJDnjbevNTn6f4Afnljjl6kJpEBPZW523MTCe9syXUsTKZzax
	p1mRdETCQaEMJidxRltaOD848/TmUQlDm/1GmSAGpNsoWB3yDqAhW+KD5g9cRgjpnkW8FO4ETfm
	h4ocDTfm5nInQbP6lSHzz3ZZq+PQbQ==
X-Received: by 2002:a05:6102:3a0d:b0:5f5:33e4:12ea with SMTP id
 ada2fe7eead31-5f8e25b8bb5mr192452137.31.1769715876891; Thu, 29 Jan 2026
 11:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9b38b4291e2b1b47ee17f7247c4c66f5bcdccffe.1769439073.git.lucien.xin@gmail.com>
 <20260128161505.1454974-1-horms@kernel.org>
In-Reply-To: <20260128161505.1454974-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 29 Jan 2026 14:44:24 -0500
X-Gm-Features: AZwV_QiOMgB9Wkbq9Dg2c4rBLhA6Us48hykz0TzV8M9p-NxQPJtuqm3d7-FhuP0
Message-ID: <CADvbK_cNUg+N5jAnmJXGBri27+AkwuFFhbKUqONkAgu1ZAmOJg@mail.gmail.com>
Subject: Re: [net-next,v8,09/15] quic: add congestion control
To: Simon Horman <horms@kernel.org>
Cc: jlayton@kernel.org, davem@davemloft.net, daniel@haxx.se, kuba@kernel.org, 
	dhowells@redhat.com, chuck.lever@oracle.com, andrew.gospodarek@broadcom.com, 
	matttbe@kernel.org, tfanelli@redhat.com, metze@samba.org, 
	marcelo.leitner@gmail.com, edumazet@google.com, linkinjeon@kernel.org, 
	hepengtao@xiaomi.com, illiliti@protonmail.com, quic@lists.linux.dev, 
	mail@johnericson.me, jbaron@akamai.com, alibuda@linux.alibaba.com, 
	tom@talpey.com, steved@redhat.com, sd@queasysnail.net, pc@manguebit.com, 
	smfrench@gmail.com, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-cifs@vger.kernel.org, xiyou.wangcong@gmail.com, dreibh@simula.no, 
	kernel-tls-handshake@lists.linux.dev, mbuhl@openbsd.org, aahringo@redhat.com, 
	hare@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 11:15=E2=80=AFAM Simon Horman <horms@kernel.org> wr=
ote:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: add congestion control
>
> This patch introduces quic_cong for RTT measurement and congestion
> control. It implements a congestion control state machine with slow
> start, congestion avoidance, and recovery phases using New Reno.
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 000000000000..1a8b7f8db977
> > --- /dev/null
> > +++ b/net/quic/cong.c
>
> [ ... ]
>
> > +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u64 time, u32 ack_de=
lay)
> > +{
> > +     u32 adjusted_rtt, rttvar_sample;
>
> [ ... ]
>
> > +     /* rfc9002#section-5.3:
> > +      *   adjusted_rtt =3D latest_rtt
> > +      *   if (latest_rtt >=3D min_rtt + ack_delay):
> > +      *     adjusted_rtt =3D latest_rtt - ack_delay
> > +      *   smoothed_rtt =3D 7/8 * smoothed_rtt + 1/8 * adjusted_rtt
> > +      *   rttvar_sample =3D abs(smoothed_rtt - adjusted_rtt)
> > +      *   rttvar =3D 3/4 * rttvar + 1/4 * rttvar_sample
> > +      */
> > +     adjusted_rtt =3D cong->latest_rtt;
> > +     if (cong->latest_rtt >=3D cong->min_rtt + ack_delay)
> > +             adjusted_rtt =3D cong->latest_rtt - ack_delay;
> > +
> > +     cong->smoothed_rtt =3D (cong->smoothed_rtt * 7 + adjusted_rtt) / =
8;
> > +     if (cong->smoothed_rtt >=3D adjusted_rtt)
> > +             rttvar_sample =3D cong->smoothed_rtt - adjusted_rtt;
> > +     else
> > +             rttvar_sample =3D adjusted_rtt - cong->smoothed_rtt;
>
> The comment above references abs(smoothed_rtt - adjusted_rtt). Paolo Aben=
i
> suggested using abs_diff() from linux/math.h for this calculation in v3
> review, and it was acknowledged. Could abs_diff() be used here instead of
> the manual if-else?
>
> https://lore.kernel.org/netdev/a9427359-a798-4f3a-88ef-c10a0bf614ec@redha=
t.com/
>
Wow, AI truly has a good memory.
Right, I somehow missed this. will apply abs_diff() here.

> [ ... ]
>
> > diff --git a/net/quic/cong.h b/net/quic/cong.h
> > new file mode 100644
> > index 000000000000..e6cfb0fa1b6c
> > --- /dev/null
> > +++ b/net/quic/cong.h
>
> [ ... ]
>
> > +struct quic_cong {
> > +     /* RTT tracking */
> > +     u32 max_ack_delay;      /* max_ack_delay from rfc9000#section-18.=
2 */
> > +     u32 smoothed_rtt;       /* Smoothed RTT */
> > +     u32 latest_rtt;         /* Latest RTT sample */
> > +     u32 min_rtt;            /* Lowest observed RTT */
> > +     u32 rttvar;             /* RTT variation */
> > +     u32 pto;                /* Probe timeout */
> > +
> > +     /* Timing & pacing */
> > +     u64 recovery_time;      /* Recovery period start timestamp */
> > +     u64 pacing_rate;        /* Packet sending speed Bytes/sec */
> > +     u64 pacing_time;        /* Next scheduled send timestamp (ns) */
> > +     u64 time;               /* Cachedached current timestamp */
>                                    ^^^^^^^^^^
>
> There appears to be a typo here - "Cachedached" should be "Cached".
Will fix this typo.

Thanks.
