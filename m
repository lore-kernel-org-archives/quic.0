Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6ED38D3F1
	for <quic@lists.linux.dev>; Wed,  3 Jun 2026 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780510514; cv=pass; b=hEP9TRDC4EcsIgn0rvQWwIkfC4DTkXJBCMYkqSdYofTOhYYqm/boxybWuL9G/Ife10Mhww6H2dstRvj3Gy2oOWJ/4d08LukLpFru541zxcBiYWldUY3b/tfI8YSpCEjohMZvkELaBoCVtptdP8OH4fA/0I0UL+QtJW9B0SS3TZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780510514; c=relaxed/simple;
	bh=bc8yf+vDwLYZktVpT0wu1uj2q7kMRTlyg5TCqNOarGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ug8fC6kaU/UXugBx9fhkqeipFrC0Clq7KTcGdAybxYCfoUBGB0ZuKAIz3etOuRZw2WU1SbZ10saOd9z3uHzw5GjMe9f3w6o8BRTVg7CXl/9E+71INpfXtkmjfmLONMIAwiDqZSpjyG5hRbmc9rvc48HYSJPfNufpVomhdjt6zzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkc2Dbos; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkc2Dbos"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso3813162a91.1
        for <quic@lists.linux.dev>; Wed, 03 Jun 2026 11:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780510512; cv=none;
        d=google.com; s=arc-20240605;
        b=FusNP879oAcmL6jxmLdD0rmzgnI0BiOCS0YsnUlVCmtZH+nEg7ZiM9pm9ERwrQ03h9
         XgZAzRzIroITVGZnPW3GZ9l24cm45PT4CozHY7krJRgqvgnLqWvpTI9fm0nyip1SS2VO
         +Hoaq2YN+Orhi1p8eZ7p+eYz9GsnW94qrERit8H0V96fXPNUMZfA/NK/5xP4b8F38xZe
         tLkiEDWDkrY75f+2fpXB4NBSfhSAEr2REUEnKsdRo64UwBUQpnDAVggYXu9tzDyBCVAX
         +qPdcrypzOoHY88RCIX79Yv+xjVSTmXhnRxWK9FhCxO4tEEndlY1zP4g/CSudWNaS2AF
         QR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bc8yf+vDwLYZktVpT0wu1uj2q7kMRTlyg5TCqNOarGo=;
        fh=lVFJ9dKy/u1Lz3XPbZ+ppvcJWcHSe5HIz9+BKlYPYFQ=;
        b=WfT/as3bGhDvnxQtB37dTbY4+aEhfdH29omV7L7OyvoVqmUTh4WmxzbjOuHHwUhiM4
         20kStOsQwxVXmOrYD3xbnCVT8WXvuS+E962R20rCyAfr8qkCvWrmGnWJSm2SGwDift1t
         nEXkmX2F2s3vE3hJgH1MKoXuojJKJ1Cnu/sTlUIXDEDjSBuMpegKBrcWKZBYQqAkds1D
         UrmSSH8iJDSxyDa/XaKRSB2LJbqPiuASfeV3tzVGOU1XblByHyDhaAKM5+9a3+txR682
         U3KPHJt+MWpLVgwUEbe2vYQZ4KC69EybwrexTdp6LXExRCriBXUe2ygf189kLIS5PT0v
         RC6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780510512; x=1781115312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc8yf+vDwLYZktVpT0wu1uj2q7kMRTlyg5TCqNOarGo=;
        b=kkc2DbosJFKQzwxDADLpLyGoNr+NEc8ZCnZ9MRj1ART9t3T5ttEV6/tZnNYSB7h8Yu
         opGWzH3JqjM96M8yXNdSNwHvYF4ujApycwHXu+SWKZ3wCLw9kFBPx30jOXYhmuOALx+0
         qeVs1cfVlF8qZPZtrlX3fMxZjGbxC7v4liQqn0SuIt2I0hx+sQT3yOLH5WQ2SuvynElm
         8YM8QNK3ZR+jd3xfu1Wo2wIPH6Fha0pO6ClFzOEmciFTGsFYyEvJZLV9QHbs+x5Fwd9y
         MyJevuczAP1I5x5bKVttwuyGLdFF/dw1cN8ILZqPPzspS2wXftQmxkFHObUnmxrB5VC/
         c/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780510512; x=1781115312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bc8yf+vDwLYZktVpT0wu1uj2q7kMRTlyg5TCqNOarGo=;
        b=BaDH6IFLfcRodEtuoZISMQxyL2/L05Iylu82e6pBQTYNhYSSTzPAp+jlsj9QWhBeeh
         8maN+OMBtEJuPf3siOYe2W/asNmpvjHwyPRRcwPKpp3KDBoEmo/9/LYXzSGzICtpWKsh
         VuWBqx5VKynyINoPXDNF4KAqy2MNmzxiYQhIxYC+IqLpdR/A6JKhMeDUkMYFP/oTIuYp
         uRh/mxaL1r7zUK9fVdS2f1aazFUFmqs1KRS34Z62TUupZFeouur6MJCjKEwpACm4Ymy+
         aZRohQQgT42YtFUMoTnSYEudXAHtqgLUHuF09tj2j0smUt7iKyw9vLqC5h6Vqb1KDNHX
         zwDg==
X-Forwarded-Encrypted: i=1; AFNElJ/Zj79bVvUMcNQ7R+L6sIByq+Jju19FZj/uZiZvsnNXEHWYmMG3XnDidDDGUW5JfDPdu9cX@lists.linux.dev
X-Gm-Message-State: AOJu0YwvltMG9Jogqlr/F55mrcg6XDUu6jqEGbQnQyJ/XzgcFo1QKH26
	ovnpEaTQATd3UG/vGnx6nLSoIO0IdWQr5vtMy7QkPnFJzhHt1InQu35WDX2d5XXfyvK1kkPjD7/
	eEyx42M/Sbr767jAHDYB8ENvVmKPRYMg=
X-Gm-Gg: Acq92OHRzaoesgaWFwX46lVabUAh2uvweKbV5xkgtUg/X47W5dCVpZyCRQtYVwExj2c
	nvQsCQop5i71sgsabAw1wA5WOn64YI/aIJ8BpKKMIADb2IjgvCZv+F7j2pXv0Hqala9PhQxr+cY
	g6HH7H6mH7g+gClZ22jCoaI+lFrHCFslcXcvYx4qb/i4eAh229MEkpm8wxLbeir0luZiWDs8NPk
	hQEUwootbN+mGRjknQuonHdWMRdVU4T89Yv/Iqtz0Yd443+3o/I6TnOrdmof5KmJatwz3vElHcj
	diMtmWVz17U+IyEyh+mgKBXvbp78y+102HFHXWkb2+tlzuLSIo4n6aoIK8niGnRGm6JOHUSVITZ
	m7BmEigtYgh8gIWmkOQ==
X-Received: by 2002:a17:90b:3f90:b0:36b:71e6:3de3 with SMTP id
 98e67ed59e1d1-36e308379b2mr4410234a91.3.1780510512536; Wed, 03 Jun 2026
 11:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780232930.git.lucien.xin@gmail.com> <CADvbK_fBbLCwY61HXsNeGCA8MhiBKcbvE0BvSZppohJgtXO+2g@mail.gmail.com>
 <20260602111823.0b1129d6@kernel.org> <CADvbK_e7T=Yfb800TbO+BcpDEp=Sf6rbtiy2daLaskFAjeg=Ww@mail.gmail.com>
 <20260603103924.643f1ea4@kernel.org>
In-Reply-To: <20260603103924.643f1ea4@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 3 Jun 2026 14:15:01 -0400
X-Gm-Features: AVHnY4Iv1uP_QmOrLNz1hlCQg2FIUIb0L_vtpgS-GxknImKiY2MQj6lnEeZbzQ4
Message-ID: <CADvbK_eSh_b7kVRkkgXoRwygCVoxuwB=Dg3qxEbYdW5cscSfHg@mail.gmail.com>
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

On Wed, Jun 3, 2026 at 1:39=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 3 Jun 2026 10:14:24 -0400 Xin Long wrote:
> > Will address it in v13.
> >
> > BTW, is there a public link to the Coccinelle check results?
> > I don't see them showing up on Patchwork.
>
> They are part of the CI that runs ksft because they are very slow.
> So they should show up if you click on the "contest" check in patchwork.
> (caveat - I haven't actually check if that still works :))

I can see it from "contest" now, and it's a long list.

Thanks!
