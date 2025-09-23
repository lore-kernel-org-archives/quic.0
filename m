Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FA022DF86
	for <quic@lists.linux.dev>; Tue, 23 Sep 2025 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758642555; cv=none; b=gqaU5QeHG7axQtTUYKzJPBZCcG9wUkDvuYUHVIROCsMTdQSWphue3KNVPS5fnMtB+reSO/92Kcv85RDpijfdqYjANkhnjDH+ofn4msuA4dbO+WVIcEgc7MlTcIm4vZQtlVzUZJm528uGBNnC8E+eZ7u4F1X2HOJtgJYUog7vlSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758642555; c=relaxed/simple;
	bh=a6gz1VpqLfP2Qo81xJtC/LGGtIJs3zssm8VUofjyi+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmvwhxFW3MGIgtdc9gLbApK0cLbcDxvH4KTEgo8+RIkFQOUbfRYBpt0QKg8tHpcLEtAcs3jYl5mrc3anvnMScQRtFx6LxevyW8kwRUWMS3641mzo4qgsLsIv1G95l2IE+6F0aSgRvlGmUxwaL6Jw8oKP40myfrTjAAC6r19M6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnpZsrDg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnpZsrDg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-330469eb750so6438181a91.2
        for <quic@lists.linux.dev>; Tue, 23 Sep 2025 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758642553; x=1759247353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pgkmz7Yia2mUyCjlHvvFUXxL30TIgrGepaFfyyHrQY4=;
        b=OnpZsrDgR5QwN4QX8UhoE5jnnoNMmRGCLyeO99aMLli4c7FCykkt0Xf4ONHIB6rjqB
         4RHxg++59POKejzHcCIX34NtRxsa0DnGKK4EPqlKb/k7VWHNLnxxHBi5xjvQx+LMxYva
         cdK1IlLOB8oQG9NQjmUk61Ips0aydWoFJQeOFYeVh+DlbmJmzTMkMiOEI1b2EwdvpWAq
         9RPRNZYPYaVueAtJ2fukog3/P2oCuZAxNR8etE9dSZUxZ6BjtFzuEUX0wRWr37ZP51mT
         N80hyel1OgkI6tt47avTkeY97Ih1XyzBeVu7/TQVwhbLqK0y0yv/WCuhu251C2lLO6Ds
         gKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758642553; x=1759247353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pgkmz7Yia2mUyCjlHvvFUXxL30TIgrGepaFfyyHrQY4=;
        b=MPwJ6pSbqoxdmVPTUllhRfJf8LkkwemwctbzXpKvuJlq5Kc1/C3rz04+LivXZocYJ8
         a2eutlhre1ClsRYk7LIaqNH9kmD9f/aVN+zc1tFddSf7LAPfXdS6gUZDzq9WoGyJAVBm
         hO7UCDM7hDPe/FIWrmASZK+kQKH3jhYmQv67e2U8zm/pJp48RWMizACn78a4ayCVSZis
         xbtfE7odRgIFGZMgPKDbLcw9wSHX0nSuZNUsBuop9p4QNdLx7a+Lj731abXYdIFRq1wV
         BMIKsaCmnxdNq9fbu735BZHsB1nZn7QA1Ioigjm9THzPKSbb2a0i1sbv5IccIZwYLMTP
         aunA==
X-Forwarded-Encrypted: i=1; AJvYcCWTyb5hehJC+0dadEm9Lp0xJx7mSQ70gBlYLyxy14GGBrSvdpPNdPl3gsaCTjxv26pFE5uB@lists.linux.dev
X-Gm-Message-State: AOJu0YwZMLR7h4adJR80q5zpx8uV8a7tKO8O4ER3ZEVvzkFUHkysVox/
	UqnQetOohvoEc24Yy/Ate7uZVOf3lyF+4YyrpYkQRHkbbwOJVxy4RcJ7Sd0voofBSb9L4mIjTFV
	pU9H9k7r9notsvbV3eSqM8Z93YOt610M=
X-Gm-Gg: ASbGncvV6k+Nag/MNxS4BhJy447FSa7aBRnxWEX65zbSbXOFic5LY0eXqyfM1xYbicZ
	bEsRn1hk8CxwiBCUrzir+TfzoKmEnX2on9Z3lRBh9P9diukH5K6GQ2vmd5kNcicc6Wokq2lTL9G
	9DYqtRQYtg5RrK+O40HQIMjmp/1b2hv3l2wh8B1mq5KyuldLNfPe3DPWLxARu4XBKDzuE/rI1lX
	42ITOxK/X15Z5caeRWSxgR76lXh5VWVc7Wol3xrQQ==
X-Google-Smtp-Source: AGHT+IG7o9i2dC43ioTn7wIZWQ8fZEx36/pwtA6UL0v+ENVD318XjL1HnK/qVloz+EM5tn9E+0yFRx7wuB1Epbm1wH4=
X-Received: by 2002:a17:90b:3d0b:b0:31e:cc6b:320f with SMTP id
 98e67ed59e1d1-332a94e17d4mr3928720a91.5.1758642553164; Tue, 23 Sep 2025
 08:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758234904.git.lucien.xin@gmail.com> <a7fb75136c7c2e51b7081d3bff421e01b435288f.1758234904.git.lucien.xin@gmail.com>
 <20250923090641.GE836419@horms.kernel.org>
In-Reply-To: <20250923090641.GE836419@horms.kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 11:49:01 -0400
X-Gm-Features: AS18NWAbFH9Ui-fpEfRTHKNs6RYmJyoXlKo6RimozANIMCZAAraSfSWOKbynGIY
Message-ID: <CADvbK_e9w0vW225G++wmHPrBj9d=7MBYXT4i8aeMvZ=Oc-g-ug@mail.gmail.com>
Subject: Re: [PATCH net-next v3 03/15] quic: provide common utilities and data structures
To: Simon Horman <horms@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
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

On Tue, Sep 23, 2025 at 5:06=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Thu, Sep 18, 2025 at 06:34:52PM -0400, Xin Long wrote:
>
> > index f79f43f0c17f..b54532916aa2 100644
> > --- a/net/quic/protocol.c
> > +++ b/net/quic/protocol.c
> > @@ -336,6 +336,9 @@ static __init int quic_init(void)
> >       if (err)
> >               goto err_percpu_counter;
> >
> > +     if (quic_hash_tables_init())
>
> Hi Xin,
>
> If we reach here then the function will return err, which is 0.
> So it seems that err should be set to a negative error value instead.
> Perhaps the return value of quic_hash_tables_init.
Good catch!
