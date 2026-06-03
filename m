Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B4043D508
	for <quic@lists.linux.dev>; Wed,  3 Jun 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496080; cv=pass; b=Eh/5Nx73KUV34luSG4xE6ktX++SjMtE0rvKlcLLmRZzWbCl8P9tZ4Qgmuub1usQHEfaMtjeTs8h4XfH4HnxqvjSI/YpSYscESIjyhBSlmkMN5Dd7gnZO1hZya8jYeWkAq0TRFHmBElPMe5i+AMs//RsJQnv9iUGsAWBCGqXAMsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496080; c=relaxed/simple;
	bh=GVn5Lv9HKRp9C9WqvkbPPVBvO9kfeaXDD5rNKVVFxPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zy6PZZ7QI/5OryUrKtcCxnEax58flU+JhfugwxBBoeihbgCtJbr+SjChC7V3/a7/tUmU/KqEHQmsHZEk6jg4uRpj7fx0mTwez7JUpcrAiGIM65rMy0O1czdjfDPk2cfRHKF9dd5DIBUHZ032SiDcHg6iTekNFSxl6rTpXhDs+JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+CPMoLt; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+CPMoLt"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842848fd613so771822b3a.3
        for <quic@lists.linux.dev>; Wed, 03 Jun 2026 07:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780496077; cv=none;
        d=google.com; s=arc-20240605;
        b=lnjFQpamT8ctRm9BFMX1mg14A+cNIiWZS0Uo/5DRy0/xzhYQ8QdmoixmnUxON9AsiQ
         B8dWnc435j8Eb82JDTyU32PSvjTyvlPyDjotUPgxt+WFP1diT9LDPE514mzgV8yn90aF
         +Y78/p0Egg/Mzy8TcLosYHzg+414mq+ODepbdFabecXSGeWtYfhjSUraVwYUtuzlOecm
         nzFtjmg97KvffDrLkLo91CKhQ2PuNPt+BywNpna1Qdndnvec7Zsatu+3S8B/L1SYdtMk
         LTTdibP92NJ8QsJtE5vFhmjfV4mo3hyNXW8zriLVBTPkadSQEdJ7dufOM+Web82+pfe6
         Aeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g99l8PDbJRSNZV5R5cNDHmMYBg+Zr6LEVHFcaCRVgy4=;
        fh=E3VAIHWZWk1UK1PZ8HXTsnzzuZZed8icOn09gSbwU0A=;
        b=O84kzYeF1RMWm7JGMsHg+vOQYkZET3KcHySiHT85pGXYobKO0yksPl//rq9xvQ8+J3
         FEMI1LHIlLBPV4QVwrAI9i7+GmNuWhISM6k6BNmLqniSc3sbReahFq0hY3R4yQgSW0is
         3WqTUcqgAVgyf32Bx0O41zvhrzYW0cbHGqlpx/5Tfa8wrGrNnwB6JNuZdTqr4I0fOhpK
         bj5x3sfPz7wCm0wm4b783tlPYd8J5BIj3rb+zAI+q/xM/OW+sibl8htcWt4bn1zt94zj
         OQ4VQw8OSw4xfkY3AWjm6D151hc8cBhee0a4YlhN3+HeOzv7KcbPxFEBxbnWHJBvtGIh
         DCNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780496077; x=1781100877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g99l8PDbJRSNZV5R5cNDHmMYBg+Zr6LEVHFcaCRVgy4=;
        b=l+CPMoLtT6Jv3r9hXUn7h1MHbptF6J6+hfSbFjwwj5k1XDTsyFmwnAZicUMW3h/KZM
         lB7B8eA88lhMd1s6TOk2uFbPtT56k+JlbCtUwmgm9Y1zldiRvrk3hdTqOduY20wVpNbw
         6fK0dU/KevqI9dHlNG3RVR7GNE4/HP2f/nn+tqPiH0rEHK2ZwD0swW3KovLmdqNMqTGF
         etwToRMEG+/tdVWVe1uY9Kj4ba+3gv4QE0aiuvvlq/od09AbLT54T9wPNC27PhvqrYg6
         6++T+NXDoHTwczW2E4UBfRNJHDPc7a1knbkXUlMLTF1gCU6JO1VDiMnuBr9gFKfbzlEC
         L9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496077; x=1781100877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g99l8PDbJRSNZV5R5cNDHmMYBg+Zr6LEVHFcaCRVgy4=;
        b=eDezJY0qg8d/h2KpA4cWfAxhzOKZNnh7AVMdZ1FMqe2acrxCiMPnDEc4BJ6N+QKW5C
         VBySjkr0syO+y/SNRIabL34FIniJxaUt3HH0Vfd5UeJtVBF5Zw6c81ACFgPy/814oeJ4
         xIAhN+ITzoSdBTEyOywZdQKU1fILuBHQUnzjWey9IyKZ5eWwu9UfNdVw3wCpldBT2Jqq
         8d+AA3AYYNlxYDez+vH7o6kIReES7k5tTjbQsFS+IvZKdlPIHJqG/jMTXen9LIinKrkX
         68lnxOPhmfhhVy0qgSbzwH13abCuHfD1wQf/cBW73Q6OP/YAxOhfigXJrMj/Sh0pIbW4
         vyGg==
X-Forwarded-Encrypted: i=1; AFNElJ++hV7ozeQR1zsMXXykW5akZqGWou/wDDwtt284C1lLZn4KCvFUuqa7L7mgLB0MdLxTKOVH@lists.linux.dev
X-Gm-Message-State: AOJu0YxYhqulruIBlKHmbLNNmbXoiL/Nh+wQoUExamke8Erq2QT2JmxG
	kfIbkZz7Qxs7GKWyxe2Wt9MgiyFoWf5quM0eUGBmq8jdLdUFonNKsZ94LXyeHWQ+rl9XaIHE0cv
	PI6QvugWQBYzl8IpxeI/XX58EBM2l1xo=
X-Gm-Gg: Acq92OG1h0nJnE9k609FgoohU55TgWYovXlAnW9X/FYETE2shl8Kui1JPlAYiC2j/Mr
	eAoPQRWYyZb//Ueeo2hB3WWuKQCEt6iN8hcFy3TT6ZSWTsutC02AbbQhIU0Ga8sTdg7oeD6xtyn
	LA9PP9974FF0SIhBg7kr2bgoMyVLpy6LK3zPGP4XyLI8bQwodVhZr6bPrW+tuRBS8/A1nAm3B+e
	W+DsUNdF2mg+llHaeZVJ4Q0U7QkEBYuyq7jAsrB7/iuBKu1eWIJKsWWqOkCLQHnaAuXwsA61b4e
	S15BB3ih2+pGfClH+vVEiT18N1Dm60Lhr1nSsjmD3f9pvapgFOwkNbgJpjDfCRTpJODL2QNQ8jO
	SPx1Tm+uIoSsn04VZwx1fkmm52+E6/rJhZ40wy0l3eoVmai9W
X-Received: by 2002:a05:6a00:1491:b0:835:366f:5da2 with SMTP id
 d2e1a72fcca58-84284f3f96dmr3416839b3a.37.1780496077086; Wed, 03 Jun 2026
 07:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780232930.git.lucien.xin@gmail.com> <CADvbK_fBbLCwY61HXsNeGCA8MhiBKcbvE0BvSZppohJgtXO+2g@mail.gmail.com>
 <20260602111823.0b1129d6@kernel.org>
In-Reply-To: <20260602111823.0b1129d6@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 3 Jun 2026 10:14:24 -0400
X-Gm-Features: AVHnY4LQ8snWAMk7idEx52eDDVjzE-lgA4L_Uyr30iAlUILJ8Ee2UHGsNH5YNQ4
Message-ID: <CADvbK_e7T=Yfb800TbO+BcpDEp=Sf6rbtiy2daLaskFAjeg=Ww@mail.gmail.com>
Subject: Re: [PATCH net-next v12 00/15] net: introduce QUIC infrastructure and
 core subcomponents
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 2:18=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue, 2 Jun 2026 09:12:30 -0400 Xin Long wrote:
> > Note: I've run Sashiko on this patchset many times locally over the pas=
t
> > month and addressed all the real issues it found. I don't see any new r=
eal
> > issues being reported on:
>
> Coccinelle had a report tho:
>
> The NIPA CI coccicheck run flagged a new Coccinelle warning introduced by
> this patch:
>
>   net/quic/crypto.c:1164:13-20: WARNING opportunity for kmemdup
>
> At line 1164 of the newly introduced net/quic/crypto.c, there is a
> kmalloc() call immediately followed by a memcpy() into the allocated
> buffer.  Coccinelle's memdup checker suggests replacing this two-step
> pattern with a single kmemdup() call, which is the preferred kernel idiom=
.
>
> The fix is straightforward - replacing:
>
>   p =3D kmalloc(len, gfp);
>   if (!p)
>       return -ENOMEM;
>   memcpy(p, src, len);
>
> with:
>
>   p =3D kmemdup(src, len, gfp);
>   if (!p)
>       return -ENOMEM;
>
> Please update the patch to use kmemdup() at that location.

Will address it in v13.

BTW, is there a public link to the Coccinelle check results?
I don't see them showing up on Patchwork.

Thanks.
