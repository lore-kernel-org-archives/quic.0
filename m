Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C862C17B3
	for <quic@lists.linux.dev>; Thu, 26 Mar 2026 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561746; cv=pass; b=KJV6knTK6nWc/u2VBDUaNaRwVvj7S7jjyCH4jidgNfax+4zQ087Ve9gU8z+GNArE7V2o2TEEVLkZRUCuI7EMwlnb/Ik2ckKzV5LLW4rkqZ8YmnHrTFKPBjTrWsiCf0esTIRAUqGG633VYJD5Vcy4pnqGrfyff2UP4pekDS/Fvs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561746; c=relaxed/simple;
	bh=DWb6NDjjhzhDkeF+RBAi3Ju2eFdvktKCdBS03nVrDeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKfecxS/ZQu15LA8oCbdYDeCMomooloLp7KZHpeXnfuP9jziXd4jFyOkt7MTH9lBAXrZcUBExlNRUH8UNwY99JKEhIJnoK1mfo3fdWyGA6C4fQY9128rMU5Lb81uIVuW0MhTcwmbh0MUGBeSvElMwbiwfb0u7XcHZ7FjDkFnwa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnbc/B5v; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnbc/B5v"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8299f1ca894so755503b3a.2
        for <quic@lists.linux.dev>; Thu, 26 Mar 2026 14:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774561743; cv=none;
        d=google.com; s=arc-20240605;
        b=NW+P6L9CJUALrifDkkFHvGXR+uU/r7qG3WFcCoZszOosyvI/ZsLa5snk2Y0EIxIdl7
         3PIFxfwHvBUbBWznC6y53FLIOTtBL/PvkGW7ObTjIyyLAPSIsOv7Gmye3DOe/EBS62jZ
         5YdiLB5SdwBp2aAnBQ/H6SsPUkTGnpKmvHNCzW9kP4KiGDNA5hLLtQldMGiTdELbKZlo
         nLWfeHKVHnjKXOZz26oUkmQ9eGIZLu5nzUxsuZ+VaC3e7yxcdYZGv2XEmr+T/jja+A1P
         j+a5Nwx/+MYAoHBo9vAlsHwa7Ezw65zgCloAgO2Qvd0OL7+tRyDioyo/XzyXoait3kW6
         QH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LcNk0BhBpunqYjg8xevwO9GWhKeqxSm/v/1iUobDQcs=;
        fh=T2F5ehOVegK4JAiDxvHnM1pO47MGjfnRvO/cprB3+g4=;
        b=DVbcPAbjk4AUBscLTaYpz998zaA+V4T3LPxQfbZ2nOCSECYKnZYI54aJftwJ8r9Ugy
         GHLG0QR5yEux0klrVkUdlke59ZUnZDO2Z06NzdJKCoxFVaeymm6JYJgHouda/K+GLHuI
         Rvh7bZ2gH9SDT1MR5wJ7Bk3MXk9bLoKbgQ94eXwFwpCiCLHYfKpowBgU5DPpPNmYqhTk
         ZtMW3/JwelPpkhMbOfNr075MYylJtKZijeBrcbjBgo2rXrSAXUht7q6x4hjlYHuyBrpw
         h/P3benu1AlutZjmoD/RcapnDli/wDRLbTL5cscpfuZumCs67UrGuZwAdoTGADYckD8F
         FGkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774561743; x=1775166543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcNk0BhBpunqYjg8xevwO9GWhKeqxSm/v/1iUobDQcs=;
        b=qnbc/B5vZ+/kqZjDVnAdaKHWt8cmfGE5h7KyfxX11i8bcYUdPWNJgujGD3Nw8Suz/0
         ZKJw7It82py7ldkLnMNG+2QovUVkFGLBG+Kv7i5CjwP7/d5ErKnWEuUH3FQYLLwG4Tok
         JBVjyQcP6Z22ul/Lw0yotCnH6U24X/Wx63lJlr8A39EKzVqqYkiTuIZuJUBFvb5BXneC
         UFzj3MW978foTTTRHHahIbFPY4BLfNIvOVx7eOnmOQIZMdiBvp9dRFUs7akbqG6F50v+
         t/pj+WSYRuPaVy5FhyVJpcKPR2yk6BJxg59jnnstLB7dDTmDW/Q7vyC9ofcnrNshyO1F
         bmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774561743; x=1775166543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LcNk0BhBpunqYjg8xevwO9GWhKeqxSm/v/1iUobDQcs=;
        b=eFRE8WYc6/jWWMpOOBDniR2+3FmHRFhhjnziUPeOttrr+cNr4/hz1Jwghag2mOOohL
         t5FWD7N2G+J0pwL9RXn9egpOWK048stO5IIzqbxg2tsvJQr/lCyeOHpnPk7FIqfkH/Sr
         8K2dEILGEXoEm6zNdCNpY6PtKOVZJD3wHTWimyhJHZzSsMdwVuXSXVehdMO7ZgQNshG7
         KdObPLAENsyuLYnCEMRhdiMBNta5kPWspnX4M2eNfix4V8Ze79pNAy0EGrhOjl91x+bX
         RJ6Kb8vMq3PKDBbZZgxDSpyrNZFht+vRjycgIOMzZbclZDUtkDPouFddcJQHC4JCg0wp
         NLuA==
X-Forwarded-Encrypted: i=1; AJvYcCU2PHNnljd2crEqTqXBwXen/Kd8Co/c39I5YuS+W5ltVwQ2qDcSWZbn7PWcBIO0lRWvXTVa@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu/70epTyI/AxV3rhDo4jNwf1DPoShYx7+kLpjMc+KMhmPkPkq
	bo/YI9PSEs0dtcXRUY3sBQ4hVgkcUq3xi0kmbTt5uxU8zgioAKSljqtaHnTJGp0ynZZAuCiDX/d
	Qby5AlA8N/+flq6flWjyVswJkxB80ZsE=
X-Gm-Gg: ATEYQzxLndrmEBAXSD1ypLae7BdiBnHbpQxHsjBzhI2C2PL2df+Cjz4HwSkDfkm9FY+
	d7PB1nlZ2JReyiiwFtDU5oFEthwM+TU7BDGL0264cjnV2yK/X5KDKUeOz6A8OIBLAlnQDOG2n0J
	aZgge0ML9HgzfYnHP6En2vh343a37yEyWFTIPzE+BHVjtiJG1um73NdY6T+3IE7pPLl2bxRooVw
	DdCN2eNIlR3Jl09WK5F0zA7Zcol8Os7uLetjWncQzCHarnG7OxR3DGfl5YIEhDT9SwLh656F3vT
	iM1GH5Fahv4Bseu7+7yw41H1fk1PRgeEzHMnPZIbh4Ut6qOKSV5XY8NeD5slt2LjLUYLZ3cse0D
	oxcWLNrLqFUEQKY2c7th2A3gmGGQouO2yCBRGWFM=
X-Received: by 2002:a05:6a00:148d:b0:81f:394a:4897 with SMTP id
 d2e1a72fcca58-82c96085fcdmr56960b3a.44.1774561743007; Thu, 26 Mar 2026
 14:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1774410440.git.lucien.xin@gmail.com> <91c6fd0a44eb15a98f945171ead8062badb89a60.1774410440.git.lucien.xin@gmail.com>
 <CADvbK_eXUfnGGQgGc_k-ecCW3-Co1MpGb7UvMgLonPy3HRhyFA@mail.gmail.com> <20260326130740.74b4c92f@kernel.org>
In-Reply-To: <20260326130740.74b4c92f@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 26 Mar 2026 17:48:51 -0400
X-Gm-Features: AQROBzAemDJ3qW1z4xWRURYJNQELd9N64vs5NQq1QodH8yfoSs3wYDdFxRVPhko
Message-ID: <CADvbK_eyNtAfA=JPR5Y4arFLPpkWMs8io=TO83rHAa-JJkhdAA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 06/15] quic: add stream management
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:07=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 26 Mar 2026 11:06:26 -0400 Xin Long wrote:
> > The AI report on
> >
> >   https://netdev-ai.bots.linux.dev/ai-review.html?id=3D1624d906-c0b6-4e=
12-a63f-5cbfc51b660e#patch-5
> >
> > is false positive.
> >
> > As the sk_alloc() calls sk_prot_alloc() with __GFP_ZERO, and the stream=
s->head
> > is always initialized to NULL.
>
> Can you also check the google one?
>
> https://sashiko.dev/#/patchset/4019cfba3ffd6f91aee24713d2adc778f858b4c4.1=
774410440.git.lucien.xin@gmail.com

Will do. There are quite a few reports, and it may take me some time
to review them all carefully.

BTW, what's the workflow for the Google AI feedback? should I reply to
each item in this thread like we did with Claude one, or is there a
different workflow?

Thanks.
