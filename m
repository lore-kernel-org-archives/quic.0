Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1C258EE0
	for <quic@lists.linux.dev>; Thu, 30 Oct 2025 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761834496; cv=none; b=pR8it8fn0civPxAvo4HWyjXdWmllNEU5rlkRqqoqRjfe19/ValOWcCmOYLHaCS+RvRklJA2yKakUaqtZH4ZRgPRGIG/bZgO7b/eIUBKxHMweUe0RpjPQSZAG17io0U9IiWflk8eR0OZr7KSMCmNxoBSyawd4409efyz3GsYGfro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761834496; c=relaxed/simple;
	bh=XofufYTIvVz0xFJFDMwmm6sP18q7o2xd40JtSUXhtAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KImcYW2UWdOpVTrqwmJDFG3xhtCYsWAodGRKmX1nZCzW4DsB/ZEgNe4Fe16J9u2sFMC4B/qr5ToxIBU07PZ+7TrK7R7ZSQVvT24bxDx3zp8OM0qswxwn5FldAaP2txFXKOrd+5amywtZ20gYTZ1M9NSacP2YLwg5WKBIHfE3xJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhKNTjbY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhKNTjbY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a26dab3a97so809136b3a.0
        for <quic@lists.linux.dev>; Thu, 30 Oct 2025 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761834493; x=1762439293; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuCA5wWQIDpUIW6qlKdvaKlw1rWMEkNLw7LaZvFkQQE=;
        b=VhKNTjbY9XU46lI/RiROh4NFcTWEsy4d2xcuakdQGXMYITWCJcgntiOJYw2bU2ZnXR
         1vfmwfRqyajDD8bnh6lLgvKVYUzfVTun6FWPJFjhfhvi4x4zUg8W31xoFrlipvxV+uZh
         ZPGavjQq7w5O4QfFBWW9Ec5mVkzvI8MNyg0SOGePFHKYJxzs/o/iqE9NC1zsfq0wFjdB
         JRbA4vZyMGw+1x38s5S/ogkQpNcf6jaoe5uiVSDYDuY9TP6FcqpifEyHIpAFIKUrU6Zo
         zm9pDSkiKAUQxsGXMlc8ToYpQDXVQNS1mvqXulJh47X64NPdL+MZwb1jTlzVieJ3Ngve
         Gsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761834493; x=1762439293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuCA5wWQIDpUIW6qlKdvaKlw1rWMEkNLw7LaZvFkQQE=;
        b=UQxSLygg1Z7Le1cz+Z9pwZTnB6i4iWgsPB+iIGfUSxlxAeT42o0B2U37O1mFUtbp/m
         ZBU08P+2ZmwVhTTvhUFf2QSmpHcILotwSli6oppescOd/u7ulwnL/yPGHTRpJyxIsnii
         Xnl/6KLh6T8XOZXzuYiHxjoQPhyZh2ULt8FjzSPulOowSlbGP6mG6Pff1k6PSEKo2YKk
         p6K1dYutexV+FiZrE6pibhUJCdIPk+OibNRLhu24Do0iEgz36S3eH72og3BUQCmaSs8n
         vgxlZ0rv8AN/567AAZPu3QiDSmJHnt6Gt1uT+/aLzdxLjZg4vEFtfdB15yzuufmLzSLA
         x7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcf4pr7zyAacaT0Lx6h7HkbUD3Dsl6Pq+aMYyObVJgmq+6zEWpY3v0AWCPM6GFOCY5aMSw@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd4qvmQGTBXcni0izK+5mwy5G/XCOFtJF/JYORZN7k/IKEf25C
	0wC0pCc3bJItm6HPkpSc5ctLZsZ1UG8xhgo0KyogMC2V1ewSGYdKz79vq+2Eoy9W7TC9/lRPVm7
	5qH29AdZMh9u5jJScneW5qieW5HHQemg=
X-Gm-Gg: ASbGncvGGlMfX+gweCUO2ZyT9pWMQ2uWu/yw0l90XCJX6t8xRH3njVRVeGYf2RJhrCO
	F6u/Hh8FX1n4fAl2dRj7K+Fn+3QSWRPAnzyobsLT2wYpnDwXrk+0nC3Mu9CLE0MaUjhZ4rHkOI6
	CegW3/uAPOsRXdvnyL0FAkAceS2bZ2PrgrSahrU6krGAIpGlqAwUJmRNR7fT5Y+WV5oUsz/wpQT
	zU1CE1UsOCbrw2U3SLXJGfvjefCSQ2YJMCGP6xna/oWKqmrjgpCd7g8T6ii32z8mKd2YfYe3TvX
	J1Lc3hUOnmlfA50NJPm71GMaFhge
X-Google-Smtp-Source: AGHT+IGSYvw5mArOho8Chrlid2Yf9zFIgqFqjnuZ41Vc14qeGP9OaC3SkBO5TkyH/r8UCkIM4dvPWepO1U0aCamvif4=
X-Received: by 2002:a05:6a00:181b:b0:7a3:455e:3fa5 with SMTP id
 d2e1a72fcca58-7a621813833mr5006811b3a.0.1761834493501; Thu, 30 Oct 2025
 07:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
 <67b38b36-b6fa-4cab-b14f-8ba271f02065@samba.org> <CADvbK_f4rN-7bvvwWDVm-B+h6QiSwQbK7EKsWh5kTuHJjuGjTA@mail.gmail.com>
 <b9300291-e828-47fa-b4d1-66934636bd7b@samba.org> <CADvbK_f=E11=dszeJos98RvBY5POXujgT0dFo-LG6QQuGW20Kg@mail.gmail.com>
 <0b65e74c-71bb-494d-9b05-0ee20f27e840@samba.org>
In-Reply-To: <0b65e74c-71bb-494d-9b05-0ee20f27e840@samba.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 30 Oct 2025 10:28:01 -0400
X-Gm-Features: AWmQ_blojTdIYKtFmYVhDD9RZMLgIE9kL3y8nlMJgL7u2g9jepaBDc3oSEs4qws
Message-ID: <CADvbK_cPEnNfcUXaHm3Aub0dkerqnwG4NB_EJ_eQZTc80c28_Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 02/15] net: build socket infrastructure for
 QUIC protocol
To: Stefan Metzmacher <metze@samba.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, 
	Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
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

On Thu, Oct 30, 2025 at 10:17=E2=80=AFAM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Am 30.10.25 um 15:13 schrieb Xin Long:
> > On Thu, Oct 30, 2025 at 7:29=E2=80=AFAM Stefan Metzmacher <metze@samba.=
org> wrote:
> >>
> >> Am 29.10.25 um 20:57 schrieb Xin Long:
> >>> On Wed, Oct 29, 2025 at 12:22=E2=80=AFPM Stefan Metzmacher <metze@sam=
ba.org> wrote:
> >>>>
> >>>> Hi Xin,
> >>>>
> >>>>> This patch lays the groundwork for QUIC socket support in the kerne=
l.
> >>>>> It defines the core structures and protocol hooks needed to create
> >>>>> QUIC sockets, without implementing any protocol behavior at this st=
age.
> >>>>>
> >>>>> Basic integration is included to allow building the module via
> >>>>> CONFIG_IP_QUIC=3Dm.
> >>>>>
> >>>>> This provides the scaffolding necessary for adding actual QUIC sock=
et
> >>>>> behavior in follow-up patches.
> >>>>>
> >>>>> Signed-off-by: Pengtao He <hepengtao@xiaomi.com>
> >>>>> Signed-off-by: Xin Long <lucien.xin@gmail.com>
> >>>>
> >>>> ...
> >>>>
> >>>>> +module_init(quic_init);
> >>>>> +module_exit(quic_exit);
> >>>>> +
> >>>>> +MODULE_ALIAS("net-pf-" __stringify(PF_INET) "-proto-261");
> >>>>> +MODULE_ALIAS("net-pf-" __stringify(PF_INET6) "-proto-261");
> >>>>
> >>>> Shouldn't this use MODULE_ALIAS_NET_PF_PROTO(PF_INET, IPPROTO_QUIC)
> >>>> instead?
> >>>>
> >>> Hi, Stefan,
> >>>
> >>> If we switch to using MODULE_ALIAS_NET_PF_PROTO(), we still need to
> >>> keep using the numeric value 261:
> >>>
> >>>     MODULE_ALIAS_NET_PF_PROTO(PF_INET, 261);
> >>>     MODULE_ALIAS_NET_PF_PROTO(PF_INET6, 261);
> >>>
> >>> IPPROTO_QUIC is defined as an enum, not a macro. Since
> >>> MODULE_ALIAS_NET_PF_PROTO() relies on __stringify(proto), it can=E2=
=80=99t
> >>> stringify enum values correctly, and it would generate:
> >>>
> >>>     alias:          net-pf-10-proto-IPPROTO_QUIC
> >>>     alias:          net-pf-2-proto-IPPROTO_QUIC
> >>
> >> Yes, now I remember...
> >>
> >> Maybe we can use something like this:
> >>
> >> -  IPPROTO_QUIC =3D 261,          /* A UDP-Based Multiplexed and Secur=
e Transport */
> >> +#define __IPPROTO_QUIC 261     /* A UDP-Based Multiplexed and Secure =
Transport */
> >> +  IPPROTO_QUIC =3D __IPPROTO_QUIC,
> >>
> >> and then
> >>
> >> MODULE_ALIAS_NET_PF_PROTO(PF_INET, __IPPROTO_QUIC)
> >>
> >> In order to make things clearer.
> >>
> >> What do you think?
> >>
> > That might be a good idea to make things clearer later on.
> >
> > But for now, I=E2=80=99d prefer not to add something special just for Q=
UIC in
> > include/uapi/linux/in.h.  We can revisit it later together with SCTP,
> > L2TP, and SMC to keep things consistent.
>
> Ok, maybe this would do it for now?
>
> MODULE_ALIAS_NET_PF_PROTO(PF_INET, 261); /* IPPROTO_QUIC =3D=3D 261 */
>
Yep, fine by me. :-)

> I'll do the same for IPPROTO_SMBDIRECT...
>
> metze
