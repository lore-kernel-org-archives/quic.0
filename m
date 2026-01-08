Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27892EA15C
	for <quic@lists.linux.dev>; Thu,  8 Jan 2026 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895676; cv=none; b=YR47Qw/f1ocKQxlZgIR5qKy1wyc8WIc/B31I86nAujjGz315h8HKrXmJYsMrEeXqg0og2TfpjAL1pqxk4ceGqrWKPxCulVWcZOkf2rBudrqBah1Vc0i6g+EbY898t2oXKBySujfrWwMODy+ihmbGbfW1DoRUaK4TK8nXJzcv9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895676; c=relaxed/simple;
	bh=eFlE0EEPfk3rewZOji/LmMkHrW23JLC2qQUHwRdkLWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEFsYPdO0uFBb0ECwpv0pj/828eZMgqicwTNTcwHFoEGySY6gzZ40Onb9jmBx7EPXIlgyojh3J6RUepRiIv+bWwXA4IcPsKuREudWRrlcFdW3C/2x4my2YgNkP0MCMrrkbY//pJBcylflAC7gqaW+sCy2s+ox73OFEnW9zGeS8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyA0miNm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyA0miNm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a081c163b0so25496605ad.0
        for <quic@lists.linux.dev>; Thu, 08 Jan 2026 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767895674; x=1768500474; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG0qxlR7DkmzCTUi0X2cIVFJ3HHiLT6S36Wu9RwdLVQ=;
        b=eyA0miNmKxJR05LKo48yWYF0ksrMX9R0vgR7bMkQOTB6DMD78DN546BPQYNjsvXcYS
         Jzp8A5cNEBQysvC0uDqEjiezRt+68OfFg4RfiLOujUU7fbJOO/SF7wCwFle26b3v+MAe
         PM8udzy29eATEL0Pd4WWL061oEuzhng3M8uTP6oJ2yx+iv9nnHRal9kXdqr5J65TUVpD
         yqWTMm8nhKqUAVTv7WsxYHIeFwU0MEbMC1adY0Q4F85DT9AwRdl/MaL+VsaXyeH4VeFg
         og9ZaBIpkjMrUAY1ceBkJvIJfVJ8Th7BWtw2jg+HCiQKcYNyWd16s+tIXjxp3gO5AIii
         tY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895674; x=1768500474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kG0qxlR7DkmzCTUi0X2cIVFJ3HHiLT6S36Wu9RwdLVQ=;
        b=IUWqs8fnKFVJh/ksPVZ0n8U+l83k8O9UX3H4VxSdMW90CsHJ9ckVOrLALDB97K86q1
         tRJE+eN1kj6D/c69cGiPlrI03cGi/p6Z+f3vaLsaBXGNTJE4WSwhE/VldIE8ZOYbMDyj
         Y2qr+Ks5XPe0o+IzTmvKEkPZ83JOH2q289E7EjaYum7IU/meb0DgGPk2t5ZTZMtpWfGY
         Xd1Ibe2Y0GPNolJuCPAbb/SbHL0ICvSFcNncMp8joiEhRdPQNyRWrP5xkojfOGk3uW1I
         WCDhgYLcs8MTuw1ja2Rg6aUR0j0zbnxqx8Xn/rr/qGemqDdYX/LmF4P8FOJSnW9G01mp
         R62g==
X-Forwarded-Encrypted: i=1; AJvYcCX68yJqEphk51gekZ6Hfyysaj1Qp7x8s7ck6E34qt8H3NI1XDGGvzMlIuS0d0A1sFLS3TOj@lists.linux.dev
X-Gm-Message-State: AOJu0YymPQCa+VTvmuswHv411Mwt3wwPJDcl1ZL10IWdO06zmNERj28V
	2a+o8d0kbw0SK8xSKUuALlbbsdonht9zYqDKHZ5YTnNgae0C2K703ZuDS6syOw8VvL1bXhEg8pg
	gjE01V83xw0XrVk67/T0HaUkbKrFSJfc=
X-Gm-Gg: AY/fxX5zZjc/8YXt9uLwhRMEW6r5KWJqsYWC4x63UPwTNiKy2F6hV/pNUTaVgajgJ74
	ISaODW1c6rX3Ug0CK7MOTTa5N79hIWQ59FPSwztuniDrhqLfKh7gW+dsI1BiaatR9XaR/Junmoc
	GfNJYxt4OzfLAsirFNKw/2kxOrGEvfqtkkTRhnw/bdeHrhP7iTccTq2Y8CGo1mUditYQSYxRiy/
	HUeJ6r51378Fg2r1+ZNd8Hyx/1UhI1W2W8JaS1vrtf2HACvVa+S2vGctRcABJo0Q1emlhjK9SZr
	CnqB/nD2rjcJT9WhqJvWgaztsPBQ
X-Google-Smtp-Source: AGHT+IE9Y4d720NUxx7X6c0Vop4TSZunxU0aBEXsPFaXcnftPaEKDqjIyJPqDzTbJ8MhAvkZSc7J6WYOjD4cMrQ1F1Y=
X-Received: by 2002:a17:903:124e:b0:2a1:3cd8:d2dc with SMTP id
 d9443c01a7336-2a3ee4b74a9mr74559005ad.57.1767895674105; Thu, 08 Jan 2026
 10:07:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767621882.git.lucien.xin@gmail.com> <79bf90a6e105c6e6ac692de21a90ec621af47cc5.1767621882.git.lucien.xin@gmail.com>
 <ec28c852-e80a-41c9-94ce-a0fce8ee07e7@redhat.com>
In-Reply-To: <ec28c852-e80a-41c9-94ce-a0fce8ee07e7@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Jan 2026 13:07:42 -0500
X-Gm-Features: AQt7F2q4UBD6cchiuW4fIBTslqGz6vf73cyh9XXwWjTaKPFND-PFSs14ShxZDj8
Message-ID: <CADvbK_dKYZ6_NyxcsweKRPkFEq046+1RENA7vH9hBhG-6xNxxw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 07/16] quic: add connection id management
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 10:52=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/5/26 3:04 PM, Xin Long wrote:
> > +/* Remove connection IDs from the set with sequence numbers less than =
or equal to a number. */
> > +void quic_conn_id_remove(struct quic_conn_id_set *id_set, u32 number)
> > +{
> > +     struct quic_common_conn_id *common, *tmp;
> > +     struct list_head *list;
> > +
> > +     list =3D &id_set->head;
> > +     list_for_each_entry_safe(common, tmp, list, list) {
> > +             if (common->number <=3D number) {
> > +                     if (id_set->active =3D=3D common)
> > +                             id_set->active =3D tmp;
> > +                     quic_conn_id_del(common);
> > +                     id_set->count--;
> > +             }
>
> Since the list is sorted by number you could break the loop as soon as
> common->number > number.
>
> > +     }
> > +}
> > +
> > +struct quic_conn_id *quic_conn_id_find(struct quic_conn_id_set *id_set=
, u32 number)
> > +{
> > +     struct quic_common_conn_id *common;
> > +
> > +     list_for_each_entry(common, &id_set->head, list)
> > +             if (common->number =3D=3D number)
> > +                     return &common->id;
>
> Same here, you can break the loop when common->number > number
>
Yup, this will save some rounds.

>
> > +static inline u32 quic_conn_id_first_number(struct quic_conn_id_set *i=
d_set)
> > +{
> > +     struct quic_common_conn_id *common;
> > +
> > +     common =3D list_first_entry(&id_set->head, struct quic_common_con=
n_id, list);
>
> id_set can be empty at creation time. The above assumes it contains at
> least an element. Does the caller need to check for such condition?
> Possibly moving the check here would simplify the code?
>
quic_conn_id_first_number() is always called in the socket that is not
in CLOSE state,
and there must be at least one ID in the id_set in such states. I will
leave a comment
in this function if you're okay with it.

Thanks.
