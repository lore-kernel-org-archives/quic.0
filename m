Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8856A441051
	for <quic@lists.linux.dev>; Tue, 20 Jan 2026 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925269; cv=pass; b=Ckw6AfJSoRtWTOSEVPemm+wi2CnUGNPHn1LQISt5J3eqGHG+Ar9UnQG4iG6W4goh6IDA3CXWyXFvw2uzf1whuq/qfECzNox5C1j3DddHQGIIxp5DAOh5Ao77hesDaMp4Gv3EvNYgKpmOtyrlsxQ99ZkrSv4XS8KsBYgE8sfxLhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925269; c=relaxed/simple;
	bh=67lJ0kNh1HNTrTPswLOz4RdeuIvnZ8b8fX/uZYsptR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8gC28zLzFwYpo63/dIVO2gyFUR9xzcIUXGuxbTUz2iq8A2Y7i+VVQ/YzyDBmMaChjoaQaVTEGm4AgHksuCQPAuvQT2WfIRgHTEnHl4Cx3ke2P2OfF8lC/xWFgxvalea85DioRJnZW/mwgScC6aj6ZkLbE04Fi1y7D1rRGR5IJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJy1LgT8; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJy1LgT8"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c5e051a47ddso3607445a12.1
        for <quic@lists.linux.dev>; Tue, 20 Jan 2026 08:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768925267; cv=none;
        d=google.com; s=arc-20240605;
        b=im+uFWGO3tUCMm4WCaQ1U82Qb7OlRvffZqxqMnBJK4NEnr9V6rpAGP6GIAOx7SY8Xs
         hwrd+YpZ+Pv0VHXvjM7UV4HIew6puMXdyGIBSF9DHCHHsUH5GnF3iG19acEnW9UQUeXU
         dnEv3BE8Qy6awuRoWlU8xNy6rGUHyq6U2tgk3cWBuxWge0Sye134TR1vxVsHfKrBU6jr
         t3s5+NmJ//MnTm93obA0kLU9dDlqBfU1fi1mbDYmAUT/Y8gdhxwOyt9oBC4Uho1cdHtj
         84piD+cf9vABjK9a1y8T/9Cp+AgEtud0A8zEt+bw0P+dKDpLc6i9Mo2m7jnArLlWF43c
         yBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=upRjEeHQQRzQP6jy3c8t8EGW4Gu+OzsotYdbGrZ3w2g=;
        fh=LR5JQL1JGGUC3EPx+K4VF1LpLamXcgTJJs+vNXdoeLg=;
        b=eLzhQ9P9SO85BWPF/N6BZZ2CfiLMCn3KItdo/2B/8f4Re0kr2InAgQ3SYPaom5c9II
         OL1fNhpRIf3kvjjUf/1ErczZWoRcY/gDNLAPrcFUU9G+DjDBJYnN3rz6Dnfg5VMc7G7K
         b+eCZZ9euZbcFabKmGirHp6KrW5U0Uj6KXxW1KM3tdGEmFoEefGK8CJBMS6ikzAFTCnz
         fyyt5ikS579oDhc0PDVZLPmqGCrB/aWMo1gtRT2NGxJ0gYFAm8nBEpyzl52SLFmJj5rc
         K+7B5PiBfmKRrVKA8gBKmvFLnXOV6W89Eb0sA44d6XzSAytR0ZLLfbHH49lWfliKsIKK
         ThXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768925267; x=1769530067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upRjEeHQQRzQP6jy3c8t8EGW4Gu+OzsotYdbGrZ3w2g=;
        b=YJy1LgT8j7Vdw1FYn4Qccs3gDzu3ku77Ma9ka/8BvNpkqqR8VgJZGD1M7DshxJDoEK
         bvV/TEf9mCM+rp+sqR+ppZIKG531b30a8IwBXQEBLORBwJuImRJDEmwy53mgScybI1YK
         Lq0ZI5iyLZg0TcTxruNaBRtGHlH7YvgERY3UwPJbfnpDYTcJNdmPQYI63clsJINMGC/t
         HfiHFmaLyeXObWL/wWrqqx0sPcVPLQ1cbpHx1FCO3x8uQcprg6/cO66hluSHFTz0TpyH
         Zr7aat0fMVIUi3tN+K3QRhSEwFWI691MemQTbashUvdHoLEHebVzhgkDa2hQB1yrSPh7
         KsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768925267; x=1769530067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=upRjEeHQQRzQP6jy3c8t8EGW4Gu+OzsotYdbGrZ3w2g=;
        b=IDlfCuVJP/LnKDOJEs4Wl4pKGfgCtg47gvHr8uDltYgA40QTs55q68NLaucdpG6QYn
         62JTV9KetpXkujhsLa7Zn/uoRw044zgPfrz2BEh8HGlFD9Ua3UDlkyyR+o+CGNiXg8fq
         exDcCYHHsbmbDvzPVN4xpqZz4+LghUHkb2HOpbn5xhpkS6QCc9LV9e/iFAT86/GqcJ18
         OX420GiQPaWqbBYdL2GZmrFISDSEHGexDtzimRzQ7WBTge8Qy+2F71I7mWpJw37RYx8H
         Wr8jq4VwWieVR//3sgBd7GgyexpMzpoijy/dxbm2dvBobHY8M3tVSMiZc8XA7YgG3k88
         +uYw==
X-Forwarded-Encrypted: i=1; AJvYcCWzwtb+Z2+qG7bOgxqmMw5aRnU+sCuk/QVXXegTFxnAOP4H/y85tE0sk+iVCG/Rt85MlVDw@lists.linux.dev
X-Gm-Message-State: AOJu0YwM0/GKOotSpN6Kr4qTBlwQzZB9LmFMYs5qYvIrpDZPrtuPy/Y9
	p6xAtEfWRSH6rK+60dAwuJa7DPhKXSeGRy6m9/EcnnV9okV45xbpQKqOLpnAC6M5/Wp2YNYjczi
	J9TvV277A3fmx/+FsaUy3/9t0UqnJHA0=
X-Gm-Gg: AZuq6aKveEYrxnzoxKnZqlzTy8etezsFWU3tk5NKyBNlkOtOkBetOPdR9vzvDBAvKZG
	AEZzaLZe3NteiEmnaMPCof/Eu996KlsGx+imEv6KLLV1Yq/pt58QAGbaSszdZg1chwcmEfdHUaE
	pfhH6QzwyxxZoTFKYvBOTS4mdBEYa4m297TRgZy2fKaBL4xaA/s7jNMbfXTef56lp2Q5NDplwXG
	RQXtSb76Z9JKXN6n30UZ4xzpw6GpBJEY7ZIdykHXIbdDk8keOJgFwycuzUClfEIkxczDmgvmbzO
	QCZT0Mo8eZHeNLpcZ4hlyDHzmcVz/P0SG6c1ais=
X-Received: by 2002:a17:90b:240e:b0:352:c146:dc39 with SMTP id
 98e67ed59e1d1-352c146dc7amr1573652a91.30.1768925266857; Tue, 20 Jan 2026
 08:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768489876.git.lucien.xin@gmail.com> <e4753dbdd12ca45edef6815830c1bd437bd635bf.1768489876.git.lucien.xin@gmail.com>
 <001178f3-aea1-4886-92e9-1012ea6d6c76@redhat.com>
In-Reply-To: <001178f3-aea1-4886-92e9-1012ea6d6c76@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Jan 2026 11:07:35 -0500
X-Gm-Features: AZwV_Qi-fSbMUEaDUskVF2b8pxcUG-nT6lofmi0ehgNJjkJjIxLYY_l2FerCdKE
Message-ID: <CADvbK_eUfuuwMg28nxo4g4+fLjJNrRDDWro8oape3uXu6GvoQA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 15/16] quic: add packet builder base
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

On Tue, Jan 20, 2026 at 9:31=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/15/26 4:11 PM, Xin Long wrote:
> > +static struct sk_buff *quic_packet_handshake_create(struct sock *sk)
> > +{
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct quic_frame *frame, *next;
> > +
> > +     /* Free all frames for now, and future patches will implement the=
 actual creation logic. */
> > +     list_for_each_entry_safe(frame, next, &packet->frame_list, list) =
{
> > +             list_del(&frame->list);
> > +             quic_frame_put(frame);
>
> If you leave this function body empty and do the same for
> quic_packet_app_create(), you could additionally strip patch 14 from
> this series and avoid leaving several function defined there as unused.
>
I will give it a try, to move patch 14 to patchset-2.

Thanks.
