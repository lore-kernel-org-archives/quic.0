Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794329881;
	b=Sf6ACEnNQ2o4NSZ+pIsqEKCmJaVETT8wOZKnJy+mMTJvDow15IMVQXjsEOfpaaPa2g6Q
	 ZOFdh03gBbIJkX57N+eQKqxFqKqCnmg0u1UdIAX2kfidQlW+sfwiZSij/oQIQKIg4Bte5
	 1ZYjzVxeFJSLQx/QPBngM1uCYShtLbVPvMCOoxx6Qy2cwL9aH2QA04yTT5DBuisZOdZcS
	 erkec/ovruRTkqzfkR/dz505NLmSCS/Sv9RiAvTiu41MEtiwg+dLHLFoigBYLortJT8Sy
	 DHpG+gySjJ21ZaB+tgWLwUgfJM5k+jWzMk6j0qzAyHfOsvcCvLwyInFQSgFRFwVBmMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1HlRMg2f8VT1EI4K27T8+cqMdE7ojzLtyN9VMRiohws=;
	b=mH1u1TbCxLQ7+e3eSp8fOV62mcRjqI0LC3Wgs9SaRrrxv/dM9rkmsZHaM4SN9nsbimmz
	 HY3vlAeLGFM3iTrRYSFat3Lg5/F1vuySI2LcFv/8LQgh+7yYpdIXyM0I1VQXuq0DqN7Mi
	 UgdfxlixYWAmolOPa8uQjFlMH2nKIdf7fQq4E7M+prx3kFmM8VLSfWaGjmJicGw8k4d1H
	 lisS1gNiR+ZtjO3H+k6Eadd3PBEI7QHXLaANjsJETvUFs+a2JeOnJoPoxkmpiWQ9uDPYw
	 pxEY/O06/pcNtQYZuLkgYj5cD+4CLzeXCYnk/jtrv6Nlu7qhOzR1CW7PjW0lizsPcQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nE5dO+oz;
	arc=fail smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFBD606A9D9
	for <quic@lists.linux.dev>; Tue, 10 Nov 2026 16:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFBD606A9D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nE5dO+oz
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd69954c755so1590169a12.3
        for <quic@lists.linux.dev>; Tue, 10 Nov 2026 08:58:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794329880; cv=none;
        d=google.com; s=arc-20260327;
        b=bdJ2t1YMNxasN/H30J7Ujfc59oobODn3T4NHAdkNLL/b2QbX0wJYU8JSY3yzXO4YvZ
         hTf52RMJi8n1524NezBgwW1UHK5QhrtGZgASf4j2LqcCUED+Pw/dRAMSR7mT7OUI5NYa
         xJDjGlChKD/++Mn5SxjyO4Rlk5ckwj8kSfUx5heC+SosaR6o9wa/oJU6W5/WGLvhtxPF
         +dqKm5DVN4iF6VQS1ylN/yHqLNAhAhiB64oyHT6ygvtcRs6A/ZJbVRLCdDJdkdRQldF1
         YGuNtuxDtgdOZu2rr72xvhZ0ee+LuVuSF5GPLY9OrtvkgnYUbpA0SeILZf1QtQb2A1/K
         +kOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1HlRMg2f8VT1EI4K27T8+cqMdE7ojzLtyN9VMRiohws=;
        fh=0/ibZx243WaV7CRJUc4U3Hmi9iL/9xGWnYgrUovAT88=;
        b=JiuGDYqDyXZGyfRXyP7lUOek2kwNxrziDRf2l4ASz5Sf7D31c1fjiTI8jm28niZTPO
         6LGdwqCnfpCrROC4362WoSHMOZTS9/6ck8e8rcOFtaPh6XygaY2QyyuQpKQWNDXv8rd6
         Xj/SaWVbZYkWNxgedkSx4APcRrHTP+GTXQzsxopFNy8R3QSQleYO0xtfadl2ao27e+fb
         k137uY+QR5B0EukM8MXma6MKOwZtGBHdVtf1u4zy+Kdjpd3McQeBsciwGobUAiWnGjvM
         RgiY07HmJrqthVi6i3ETZF5WFqoW1Sj4AgUe4Sn0K4+fK9KmHLVUvAPlrHYV82D0URJu
         wHcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329880; x=1794934680; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1HlRMg2f8VT1EI4K27T8+cqMdE7ojzLtyN9VMRiohws=;
        b=nE5dO+oz2SjMOTcGClTOwDiUjsXlx3ZZ7goQY6AUyMWzKOZEfJq9J4TH4YTo9FASUF
         fxqxQZsS9tkmb8RRM5FyGZt9NdR2u5W8+NtDKfC0MgcBUG7t6lgylOCWfecjddIGkCbe
         m2J4BuMRvtZ+b1D0lVvSbSg+ZPUVjzCxfP7GkcILO8oAxU6OAvklfhzzWq2G+0coy2d0
         UeCp/50yODViuBZaxlvUzBZKki40oP7lkB1ynkauoY/ejQB6TCGmE8DS+8wL0nYUU+Ak
         wvAD9yN7W2r9yq6ECz1nH1Ep8lOokYk+Du57bsBhV6Orcmp1++2Xdi+wlhT0DLd06kKT
         r+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329880; x=1794934680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HlRMg2f8VT1EI4K27T8+cqMdE7ojzLtyN9VMRiohws=;
        b=D0gD0lNYXHPgKIlbLX9BPar7uS1SBtl9T8Xs/JI/mq1bifA5QKxLL40hEPIic1S+nm
         6gy1yrKOEhchMk6h7ybD16HKOhn3QWJxGdHkjeHupXBBLqAdMsa1pnTkxVnG2LP+3Q6k
         D534AbgdYHH+h5gjtahN9omZRSH/GISLq5Sc7/19ebHgYx4Gif2AptJOTXHJSydEWddd
         KgZihjXnihWA72HfHjd0YlvjONNua+CbgJefifVomsE9tTzBpmT4YxugE5AUurgWC8IR
         PG3DW8ZA6+bT6NnpeHVDoKQq4OaOvt+/DGF49wMoP4lGupCbkas1hX7BeOvGTrV+CpVb
         ki5A==
X-Forwarded-Encrypted: i=1; AL+hErFZdWIJJonEiIKDijVp7Bq3CPG+BwMrwyUsbRr1zZ0LvNktJtTys+mi2QYWPTG61JRQNAzE@lists.linux.dev
X-Gm-Message-State: APuU4Z9KGzQaCdByOkggJ3TVJoa4bgjXibFDmUrrp9thsD8C9EKO+ftL
	pvosTdegOqtbPElKyeW2nKllp2XuBmKgEg2CADmQV3flwXlocaVwcftJXEBM2fPeD0xkMHCVJCJ
	XAA5HBloO0zoVaUP4kyjqSgdyx9jYtnA=
X-Gm-Gg: AYBFou2aerPVmXGJk4xpnIKZZFsAq2/Kfql+ghJGeDR1Sn/U9+9uoOX56R9d0vMqTHn
	K0wEFnRY19+8oib0WfCJB1Xh2Ow5UQutpNeDrrDnbQoHPNFeH6xquXmObcVqyHqq1ShSw9ge2/Q
	frWi7v77vMO3V23BDUkr3FeWSEbXA3T1L+oI0wIeY5mYetIT22EAwxtmcJbkQpq8kfgwqrYPe03
	rF80rWH95j3uNX7iHpmcIyR4Gv9YmLUzxuXbKM4wT5DXwWqYy3SNO8Xu8gI1lvlMx2P5CAvmdPz
	VuWYrr48GBea409TMvsshz2wG/mpHyy4nT6lqSaRClO7GAj++94TWCj5361+zdJPUr6N9ChRWME
	LY19HU5IMRV5OTC2Dm4We15fLdlHrgz8n4e951x1KTMaxLo9ohHIbXvLR98wyvOtOF0DVpNz+I8
	sRj4wkWTKmDIYg1sExiu7ZWlRoq+cZ+9GUnHg1Jw==
X-Received: by 2002:a05:6a21:4d92:b0:3eb:292d:6667 with SMTP id
 adf61e73a8af0-3f18fc7916bmr3102272637.45.1794329880120; Tue, 10 Nov 2026
 08:58:00 -0800 (PST)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794241654.git.lucien.xin@gmail.com> <20261110074153.4b895bb6@kernel.org>
In-Reply-To: <20261110074153.4b895bb6@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 10 Nov 2026 11:57:48 -0500
X-Gm-Features: AclHuK_HpW_I6LMxVTgDVIWnA6pZgPm7vgrtWceSe67s1c1ZnBXYAOFgqXCnPVE
Message-ID: <CADvbK_e3aoDOyk3hbPtS8pk3U0QSiLtYafpH2oaoNbbR9mV9aw@mail.gmail.com>
Subject: Re: [PATCH net-next v18 00/15] net: introduce QUIC infrastructure and
 core subcomponents
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <cel@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	mef@scarletmail.rutgers.edu, paul@jakma.org, 
	Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:42=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Mon,  9 Nov 2026 11:27:21 -0500 Xin Long wrote:
> > The QUIC protocol, defined in RFC 9000, is a secure, multiplexed transp=
ort
> > built on top of UDP. It enables low-latency connection establishment,
> > stream-based communication with flow control, and supports connection
> > migration across network paths, while ensuring confidentiality, integri=
ty,
> > and availability.
>
> coccicheck says:
>
> v:250:19-25: ERROR: invalid reference to the index variable of the iterat=
or on line 241
> net/quic/connid.c:252:16-22: ERROR: invalid reference to the index variab=
le of the iterator on line 241
> --
> pw-bot: cr

This is a code pattern concern, not a real bug though, as the use_count <=
=3D 1
check guarantees the loop always hits break.

Thanks.
