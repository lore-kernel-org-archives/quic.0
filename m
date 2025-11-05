Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A539F2E888C
	for <quic@lists.linux.dev>; Wed,  5 Nov 2025 22:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381247; cv=none; b=V+HTyhC12B/Br9K37Jj07KGsEd8etqHdPWYFWGkG72lu6m6BHHfxILhlCLJvtAC5OOmY0IbxgmBkWSa8dFqmaS9Quw9bzLwI3JE1WyGpz6VQwwr2Bo8D3r3vPlH1oiyIYfoZxRaWWy3+9xTJQPGWcC5jVMdxHKNPQNg84saT5+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381247; c=relaxed/simple;
	bh=I2Hsg/B2GBcgQ3xLGmh7nx19s9mgd3/8xUEED7dpNHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9udhuO8/ye8Lt/+RpGE+fkS/E34WQP6SAjNB0PMkGblY6/HVMAaz9VBJVuw7agsGcMXVI4Nh7PuRE0XIDB0nuudftmOoGMK54hV3S/p5wxlXPaDd2cG7lwlBhD3GWeSy3KYxAFKSzIxdlCyVIZC9NHseNIgtrzRx3nm946So20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXS9R6/y; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXS9R6/y"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33be037cf73so394063a91.2
        for <quic@lists.linux.dev>; Wed, 05 Nov 2025 14:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762381245; x=1762986045; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2iC3i/NABlxjjFozwtUiIBPGgmouctXhyOdEE/QiTU=;
        b=NXS9R6/yA4oqj1vxBsxtnS15wehyOzaa9Jj5EgfRO+afB3Phuex92nT/MbzlrKcy04
         hjxgpskd0iuEf+sqc/KHVbtBPTY7G9CEtv1EJuvs/hr0fkN+IQrtZOD7P2qPQ1J8lSW+
         32wg8A0i6yFjXSbbzzl0+mWaBfG+jNd4HROmM3Rdfqr/HSj/0UAe9CtbJn/9nOVIzbWo
         77ck98jb100B/kW4WYq7NHFBc/+oHBW3OvW8SADC3wqu8fq3uDN7m7sLIJCZIMMykDpn
         Ik3AUieGeWKMyeXJz5myKBIJJPQZqdxETSCBPLovjwL8Np7eiPVHrfFtxmrJ741rRpLf
         NVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762381245; x=1762986045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2iC3i/NABlxjjFozwtUiIBPGgmouctXhyOdEE/QiTU=;
        b=Q+RrjLs1vqnCnwaS3lQlMNETMS9T43NB+SiO5uyVqqVROd7ndERlxwjHJ/RIqe0ud3
         qBlr7edy8X87D2KHtVGDv0JbDe3sOL2XXSYlg1ydSXjw72eEBwWYDRRiD0T1iZaXz4U+
         pFi1QkEh1UNB9bRSEDwSCcDTfQ04oU5LXLNLcfWloqO2Fzqk256c3HYcssJupWvcLHLs
         J+6ReAQRj86YL2S010/HV+mx7JAYZ6ErMdWYFzzyTfMiLQx32F40pJm7qNgGPwhbFO3M
         Fdj2oqxlKIakEbZL6aFWjihMUHv2itdmldGZsXifoDDye43VUgmOxnb6reMjJ1Hj7R/R
         Kjew==
X-Forwarded-Encrypted: i=1; AJvYcCWSMajKcmpo/VYgINj9D0IbVmHwItkEII5e0GnOa1cnK81TXaEh1KH41as7PM9d0lMq/vkl@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy9DtO07geh0igyb+3h1M2jsFFOp10zw/BZM6WUxnukaElo2S/
	YxQT6WmHEUzD5PDtCDI+VqhuI79mfzdaf6hm7ZqqYDr2Q0DVekeKNqQ3EthJsLTgR3mgpINFf8F
	jDTTnS0kYS+xeCFs4QfX4qsDZdW0CGnA=
X-Gm-Gg: ASbGnct7KyYjAKNIVadO1D0S2GxCwkkEDpkwqSNfZwJVnidjAPxuMH4c9mm4pupgAC0
	hPOOI/KxUvmUBOkyWpo5/OQ2Mjy+Cph1ugCAQde3BB5jIMhw43tTuIcNPrlXntFvukss94g1dEe
	oZGt7TMM88+n1jbYSLtRD8dHOyvJY6DP4uDJSGvzNNNtzL1+TVHFoBn50Vs2AJxnqYN/DW9ekwL
	fsRmqzfabRsjOJMUkOvKJWo2w50estkoprJ9rSmGS4WPZOTOVcH3U1XBHBB
X-Google-Smtp-Source: AGHT+IF9huOMB6L9BBqEVqTdSAoOXtne1VO5JWHa16xjKf9IxuOLvUQRWxxDT69nj5IfkbHYDZVPmIIL4ocNXonBxEc=
X-Received: by 2002:a17:90b:48ca:b0:340:bfcd:6af8 with SMTP id
 98e67ed59e1d1-341a6bfb6bdmr5773377a91.4.1762381245005; Wed, 05 Nov 2025
 14:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
 <ffe0715b-7a60-49a4-802a-a2bd75c7dac4@redhat.com>
In-Reply-To: <ffe0715b-7a60-49a4-802a-a2bd75c7dac4@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 5 Nov 2025 17:20:33 -0500
X-Gm-Features: AWmQ_bnm5UfKvMR91-3ijvc6b8x8StJ9v75fS15sCmi9yT7hm61wUIVxJ8Ij89E
Message-ID: <CADvbK_e=UbsN2W7zqsRRHzbwZcSzR7GwZ9-YPrPcxvaHZ0ZjMw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 02/15] net: build socket infrastructure for
 QUIC protocol
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 4:38=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> [...]
> > +static struct ctl_table quic_table[] =3D {
> > +     {
> > +             .procname       =3D "quic_mem",
> > +             .data           =3D &sysctl_quic_mem,
> > +             .maxlen         =3D sizeof(sysctl_quic_mem),
> > +             .mode           =3D 0644,
> > +             .proc_handler   =3D proc_doulongvec_minmax
> > +     },
> > +     {
> > +             .procname       =3D "quic_rmem",
> > +             .data           =3D &sysctl_quic_rmem,
> > +             .maxlen         =3D sizeof(sysctl_quic_rmem),
> > +             .mode           =3D 0644,
> > +             .proc_handler   =3D proc_dointvec,
> > +     },
> > +     {
> > +             .procname       =3D "quic_wmem",
> > +             .data           =3D &sysctl_quic_wmem,
> > +             .maxlen         =3D sizeof(sysctl_quic_wmem),
> > +             .mode           =3D 0644,
> > +             .proc_handler   =3D proc_dointvec,
> > +     },
> > +     {
> > +             .procname       =3D "alpn_demux",
> > +             .data           =3D &sysctl_quic_alpn_demux,
> > +             .maxlen         =3D sizeof(sysctl_quic_alpn_demux),
> > +             .mode           =3D 0644,
> > +             .proc_handler   =3D proc_dointvec_minmax,
> > +             .extra1         =3D SYSCTL_ZERO,
> > +             .extra2         =3D SYSCTL_ONE,
> > +     },
>
> I'm sorry for not nothing this before, but please add a Documentation
> entry for the above sysctl.
>
Sure, will do, thanks.
