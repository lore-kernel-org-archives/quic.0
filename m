Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7B2580F3
	for <quic@lists.linux.dev>; Thu, 13 Nov 2025 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069041; cv=none; b=JbGIpose99P4zA43jSCRZNnWSYLrYzQbPbyZEm2oQtaF5VHMxwtyIh+BkBpR36o8us7j+wZXuSWglCaF+NizVNOZqWTm9cO0XTWIBk1nkTx/Yiy0/8MMgvuPQRKF5vmk6e3WARFui7bcyr88LriZ33U5iVpFvaXpJVc+Qa2W4L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069041; c=relaxed/simple;
	bh=pO5srCnJ/G8Wtg56D/7o5a0CmnBEcn72CLEb/fHokxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPYM+Jz9DWiMaZhlbMltxv0lz+3Hhb2LJvYVCJoaXXmm18TPJpNDs9JPu3JACQg5VZgq+Z5Rs15ooR73tXNPsY+EccgekJJjlIQlndcar58wqbDOcqh61cTuV0ZOmwrFefIXG/eRi/opRDrILrejK9j6EGYQaaQJkyWHeUGpHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+I8IjHD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+I8IjHD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-298287a26c3so14950085ad.0
        for <quic@lists.linux.dev>; Thu, 13 Nov 2025 13:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763069039; x=1763673839; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh73fAdHPRVMVUq30CorTp1R5F8aS3XmyyV4X7uyU7E=;
        b=S+I8IjHD7BMtGswqHXrSMJ1LLhvcNC+s6hjr8PpSEWloaMdDdw3be6o2M+6+gPFBZp
         XdwPSUq0bun/JlkYRKykPlntMMo5UQhqXO0FEPY0AUAsGcCKmKYOYsQOPSPtMHYMwQkQ
         EfAsvOg9O5LtS030U44Oy2wG3t1Fj8434XK/mL6vqaONJoeTUoGpT5r41kPVUd3CDT+U
         t5Q0VrXI1ymkxwVEn9Z7CfvpCneDUSEXOPzEFe9KDAKLulBy9tfZ/UxC3O4BdFMcGvVB
         D4BHhthYSoFeqGT8UpvEEUO7ATRkN2UDjYYahWR+mZsOxUIomoR/KHfXYB4IwiIBIJSX
         Okrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763069039; x=1763673839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eh73fAdHPRVMVUq30CorTp1R5F8aS3XmyyV4X7uyU7E=;
        b=Qpo12W+bZy1EqmDmJn1BSI3PE+L2/V8I65E9AP1HTijd+ie3VSDa0PkHguW6KdhP9l
         gCD6/bPdC/RBkLcuPpx9p0fVh0HWamdD8jYiIqbw3CcApsAzkpZ1AF5BV2e1xg1V8NIS
         rl57bbuN3gfd77LNIOsRXi4/Q7ncXFenxy2bwlkBIUJXzSIdiOrJCy3xLbNHXgec78t4
         xqTjgbUv6mx5NJkxa7fNxwbmkmv+WiEZrEGfT7VJlm1NGTqh7Zg2lDcMc0mebdC3AUKH
         petJI1WU/CPbyfXWeSNOi6FHzT+MpDZZ7w6MwB4Su/zBnBuiiTdfFw6wnnNT+ifCAk5l
         onlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm21TtnHdj1MQZGiMPxbPd2Un6knfXDYcNFM8ECGcoHshNTrTXXxpa8V/NNlnmK2sA3Tnf@lists.linux.dev
X-Gm-Message-State: AOJu0YxZNgHjUZ85kgVfuJNF5Om1RG5eNxTfAmOowJAdHpK+NTgLMUR1
	/vEpGqv9EAkYXd9QYrGqUA41pfku/9rNHoJPhKF64ER4kYnVERHmpVf0d5z4iITlpJSf48SKgZi
	2UkPJD4w3bFU0+aI0ypGmQf0rvQCF/g0=
X-Gm-Gg: ASbGncuNDooZbDozPtZiSVaz4ByRgbuE/fWslibWw51wz/kb33KI99yIE/6EsdL3V42
	KhZTJ1E4h5hRm+sPFBA6hE0d2tlWe1JWJlB5h8E45GUEBKKJ2mNALjcpnO9PHk0E8VdpfGTG2kw
	H9Nj75gYrC67YUKJuAHBdyXpoZg/rcgtxk1HssiZ3eEWnu64gh7S8Et4nZDrL7ZfhDmX9FCYmVI
	exgHAuK5txiltbbVoJgWbEnjcln7ZzvxRAfGb5zYYmO5cmED2iIyq32iIaL
X-Google-Smtp-Source: AGHT+IHIy62FYNI2+fsss76ZAxstDpGuH13CcKtwJwf7q37KPjXXhYyeWXtZJfedfcdinC12R6BE741QmBSKtVPCgHU=
X-Received: by 2002:a17:903:1a10:b0:295:21ac:352b with SMTP id
 d9443c01a7336-2986a6d6834mr4511285ad.15.1763069038948; Thu, 13 Nov 2025
 13:23:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <cc874b85134ba00f8d1d334e93633fbfa04b5a9a.1761748557.git.lucien.xin@gmail.com>
 <3618948d-8372-4f8d-9a0e-97a059bbf6eb@redhat.com> <CADvbK_f9o=_L=K+Vo_MbJk3mXFgriUUtGCSVm6GNo6hFHk5Kzw@mail.gmail.com>
In-Reply-To: <CADvbK_f9o=_L=K+Vo_MbJk3mXFgriUUtGCSVm6GNo6hFHk5Kzw@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 13 Nov 2025 16:23:47 -0500
X-Gm-Features: AWmQ_bl_mzAmk37GvxSMi73Wl76L8rzqwm6CGLE5Z5FgVRtg24EVCmyQJDOWLoo
Message-ID: <CADvbK_fi6GDOwpo_vRNWDXLn9v7Kys5zuz8RGNxFYEm6y0KcTQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 13/15] quic: add timer management
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

On Thu, Nov 6, 2025 at 11:49=E2=80=AFAM Xin Long <lucien.xin@gmail.com> wro=
te:
>
> On Tue, Nov 4, 2025 at 7:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
> >
> > On 10/29/25 3:35 PM, Xin Long wrote:
> > > +void quic_timer_stop(struct sock *sk, u8 type)
> > > +{
> > > +     if (type =3D=3D QUIC_TIMER_PACE) {
> > > +             if (hrtimer_try_to_cancel(quic_timer(sk, type)) =3D=3D =
1)
> > > +                     sock_put(sk);
> > > +             return;
> > > +     }
> > > +     if (timer_delete(quic_timer(sk, type)))
> >
> > timer_shutdown()
> Will update. Thanks.
timer_shutdown() sets timer->function to NULL, and it causes mod_timer()
to return 0 without enqueuing the timer. This breaks the code:

                if (!mod_timer(t, jiffies + usecs_to_jiffies(timeout)))
                        sock_hold(sk);

in quic_timer_start(), and cause sk leak.

So I will keep timer_delete() here.

Thanks.

>
> >
> > Other than that:
> >
> > Acked-by: Paolo Abeni <pabeni@redhat.com>
> >
