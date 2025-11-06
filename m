Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BCF223DED
	for <quic@lists.linux.dev>; Thu,  6 Nov 2025 01:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762392503; cv=none; b=aPWakbdDkISHBSrZqXXvft6RVVW6j3z9zFpw/litjDQL/yJurnON/TAX+ViuAIq6iwwgLZND+ucA6w+AR1vVfW3aADPwSdp83pKRGymXh8YnlW43eV1OkeZT2hiGJNrPYUKvSqRn8bwD5IBqlz9BlcRgJAxvQsi3OZcU5cVmHmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762392503; c=relaxed/simple;
	bh=8JeJb5xG4/s5U4bPcvUBg29et4g0wO08cvyhmJHqqzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIqJolNwix1aAnCRb5+83q1oHQKctC5aN8gHFYsZWftOWTlGU1ZQPDT6Bj5gUZh2Mdv58e9wPz1vfj2gpP1kNCPpqYIK+rHIJeinQFvzhLmplhe6sEjQkhnoM1Y3XaFMbwjupG1/gaOj9W0057P0HjyuID73rdXGKRaANfM4jOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD3VGOcv; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD3VGOcv"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-89018ea5625so156726241.0
        for <quic@lists.linux.dev>; Wed, 05 Nov 2025 17:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762392500; x=1762997300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wg1fDGVNhVSvLHI8UtrXbUR95hQdkRLxiyxAEDl4tvA=;
        b=FD3VGOcvhdHB57/Iht6KTypJQGtIYNJby7kCr/b5pRTSY22cZFq33osjXkGutCx5Kj
         NFtU6TSGDm5KsGH3O0tIcg2kmUME0l3S6HjLY2zh4c4RcXI+vfZKVHIs11OEbJYQNiyV
         JVmS1tni0qzMmTnUWM/tYQzh2lEbzZfOb+dIQmbiXWAd/T7l59gAYYCooqe+sf3rEXmS
         d3n7+wvpB2Ujh0jEVLXOZ7JLs/JkA3pBD7IkFGHkh6/4FXRq4VDX+xKBlnrCwocG9igG
         GHRVOBjAdDz2oTMY0l9rEOlOFclt+CJDO5K9Md5yEf094pLl6HrSIq36ZARHNdF9qV+1
         tK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762392500; x=1762997300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wg1fDGVNhVSvLHI8UtrXbUR95hQdkRLxiyxAEDl4tvA=;
        b=Jr162Y2JslRJTN2sVAJRjdXG9b7QS2IhJI5VcUGGpjaB2+jRrqLkdTU0dhpAdtiS8Z
         SCuVwlyNZQF06D1V/ZfxjJZ4j/Sa33LPdmceEDEenCe3SKMngFuXp+R5aVRdYfjGAXdF
         XOgYLN8jwDQSGHYwFrR7gJOJiow+96nvg+qzHkj1icYfK+hJHineeAzuntyABfpZu5FJ
         d+VCH6iUX+cvVEJ8STB7uncnTNlFsH3gYt2CzlGO1t8LCzITbmYlI+Hn8tdqB26Mp5C+
         Mkg6k5pj8wLsNO+bIz/07Ion/hw8zaIZ0ZxWBe39MiYjz0kbEx+Xnc0aYV/JxYEl0kkP
         t+ow==
X-Forwarded-Encrypted: i=1; AJvYcCVXPjVmzPYERdgIiCGwg0doEENa4XCbphEuqgBw3qbzG+rJs7aZC9rQoehJcfxFGyEajev1@lists.linux.dev
X-Gm-Message-State: AOJu0YxeAsNhuzzuL8kKJOxcmjs9Ph+QScG78FqHSjit8zWM/4t3z+06
	gcarhn+1aPDsh6TKC+gZLOE17ox9hpah95lG1J4rZQwNEymOAQ5IY7K/6ubKDSinfFDdaIGIfh0
	42KCyc1KgET8+qt6aFGKxloN2B2Iem9k=
X-Gm-Gg: ASbGncvrz6jY9iz01vaVS4LqcKnoPJXg0pPpSwup3wDNtbM+XvIc1lfWmO1INLGsEDs
	x6ZF4T+w+QiLfa7AKNFBlX7Qz51iW6rbcwJc2KaTQH8pNQlxTTG+QUdc7EWWrRdOdEckDuVOBip
	r4by8PkncyWRduwWCZKzHDgdyQv7UopTJ1DutjPMY74kFNX+a8xvzDyiKBPuY6e+gRojFBYhqNT
	c0Z1GYG8to48WCzaUUZpsVV1D2xwxErQaYQaKNBqO6ilh5k+oiMrXnfTPFwGu7j0zBbtLtCp6bb
	5fbrb7H2u+AcYVTgoyb/WdvoaShLzQ==
X-Google-Smtp-Source: AGHT+IFAfsz2Zqzln6j7be0SXtzx+REd9Kb2WswFj06vVEvMuigO74T2v/7feYEPVzfhUHtS1CEmTfOB6DSeH1kFlos=
X-Received: by 2002:a05:6102:6c9:b0:5db:ca9e:b588 with SMTP id
 ada2fe7eead31-5dd892c2b52mr1963957137.26.1762392500379; Wed, 05 Nov 2025
 17:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <0ccfc094d8f69e079cc84c96bd86a31e008e1aaf.1761748557.git.lucien.xin@gmail.com>
 <914b0331-8fab-4ad6-a6a8-e511a4352cea@redhat.com>
In-Reply-To: <914b0331-8fab-4ad6-a6a8-e511a4352cea@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 5 Nov 2025 20:28:08 -0500
X-Gm-Features: AWmQ_blK1NNu_ykARGiZM3a2YMxLJcnC4eKQDvjkKcFDiJVQwG3h2Rwk05Ot31I
Message-ID: <CADvbK_dDMA5UkS8LDqSkFwg-H2p1DNqqP_4Tv7ie1hqNp-Yrrg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 08/15] quic: add path management
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

On Tue, Nov 4, 2025 at 6:50=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > This patch introduces 'quic_path_group' for managing paths, represented
> > by 'struct quic_path'. A connection may use two paths simultaneously
> > for connection migration.
> >
> > Each path is associated with a UDP tunnel socket (sk), and a single
> > UDP tunnel socket can be related to multiple paths from different socke=
ts.
> > These UDP tunnel sockets are wrapped in 'quic_udp_sock' structures and
> > stored in a hash table.
> >
> > It includes mechanisms to bind and unbind paths, detect alternative pat=
hs
> > for migration, and swap paths to support seamless transition between
> > networks.
> >
> > - quic_path_bind(): Bind a path to a port and associate it with a UDP s=
k.
> >
> > - quic_path_free(): Unbind a path from a port and disassociate it from =
a
> >   UDP sk.
>
> I find the above name slightly misleading, as I expect such function to
> free the path argument. Possibly quic_path_unbind?
>
Makes sense.

Thanks.
