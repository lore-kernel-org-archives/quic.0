Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F72D3A6D
	for <quic@lists.linux.dev>; Thu,  6 Nov 2025 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447761; cv=none; b=DlpYxfs5YxpmNW3N83uoNbegj5Gt+VmpjqC0NoggLhpgpuoMFkNGxzy6LriXibhAp+B38LZb5F0/M1M82t72iu/0tkQ7X9qcmwVqe3LaYO+uqe/CkhFrMJfX5dDxtpbtjN/m/gx6rrpiXGBAOQMWVvs6vQc7cUG+HNn64sBzC7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447761; c=relaxed/simple;
	bh=gPC9VPLFYbjfVxBSFkmUOkcw3DGZnlisHf1J732GkLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGaB9gSqFPzzxftSL65mCk8R6PYhX7PTBQi8OP0ZQMGVEo3u01RcQwsm21wCenx7I1ksEmMaebLcGNqwV+EUeeGn+s4qQ6rWlfyKxqvHUlF2ZJJmY4uj1Ina0lJ9fJdgS3Rw9sCA5J5xLta4eqbX5dVetj3d32rMyyEffoOCxmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwO5YYfI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwO5YYfI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2953ad5517dso12237545ad.0
        for <quic@lists.linux.dev>; Thu, 06 Nov 2025 08:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762447760; x=1763052560; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qzn6+Sh35pzxbK3z/xOK777J6LI54V1OZ2Oy1H+1YU=;
        b=VwO5YYfIfUhj+i9TpNodBFRyiICY5b7mtzGOWitaWCSEbPjHwziLKRytT4TNC17Vf9
         eJFFTno3/Eid86wLUMIuC3e44MTxzPw361pFB+pVcAjzTM9KWFvkMltMwsWWS/OrLbHm
         S30CuEDmRc+DTU4GpqNHKKZaDd6FlFPUpu5Uzp7AVfYHgse73XgeY4Tuv8aBkN28gD0+
         wZPcD92cWYKQPW80fQ52b67hkWenQ0c0TyhsvWurog15Ne7ZP38D7jxf+bKd4bFMH2LY
         wdwz05FkrYYED4zwOQCc9KGJBFKaK+F2Gxq1VmGbFBfSEJq2baxFDfXdP151P/lcA089
         qbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447760; x=1763052560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qzn6+Sh35pzxbK3z/xOK777J6LI54V1OZ2Oy1H+1YU=;
        b=xKbv3awGTgqcMsoOxtI1etTgrJdyaOV9G5i0us8qAP/h8FE8KaGnL3CbdPkHuCXLRF
         sGg5b/mwRIjMWqojgVjiGyCtfbWOoFnViklb2CJIgbAOJezjOb/PFr+xAC8Ab9y5Un8K
         +SQyRecMk1WkZSmgfnVB/ntbPYhfooOTw0z1UpRMvL0ig/Yj+6V9fJd+otArNYD02ukf
         tEaWBSWx+FFer7NSUsmx7XGZMMqleHQIhEu1uFvjKwUdJnyTogOK2iDWk+BRFny148IV
         Wn/V7moEHJe4OCgBR9iqHlShHiOKk08adqvlQB6F+GGc56so/6VOU/mExrhtH+Y9ayQt
         R36A==
X-Forwarded-Encrypted: i=1; AJvYcCWBQEuSw4MU0meNWbvgnJP2hQ4plDI+QZoNoI/MrTc6B4dkH41mEvDD0qvenofT2CnUUkq5@lists.linux.dev
X-Gm-Message-State: AOJu0Yynx0uiqHZiyvw/+VRWdz1EaxRpxnC4TVcJkr4nq0qaVC1jfNaN
	dkLt0BZABYUXD9uPO90nd2NmD/C66lyhGIN0M2k9Q5NtEAMFC4DJ9NQgHsx/FJz1JuGAvAV+4lD
	YfDqd8O+IkIwIsjIBp2q3SdPRLWL1m54=
X-Gm-Gg: ASbGncsNW68vYlmr42Blbh8yOvQx0RlOiT4vWl+AifI3TwA9LPSGB7p4ynl3xYZ/i1z
	jOpeneWocjJ2kWJdc7O5neaF51Ej4WZDWpcURRmG5qMI+2At+i2lb1FWpEoTBaXeaZ1l6mFIirK
	ees0ielzajtLwNLiJVC5j9j42dzbFgfNAhPiOh3iDZ93K6MpeTmKXqHHgYa+vnbpndlo7a08E2y
	ml+dCMVgK06671eGR3+3o3QIS4LZdIm1R0prTjfB5Q+7BbVPDwfA1rnZYLcM1CDJjrs5SX+Swt6
	xPlMq4wnGQIhry1ZeOmJDy1ak9tKxA==
X-Google-Smtp-Source: AGHT+IF5xt57zcNq+U+HwDSwBlT/1oLe/u7UB3heYQ1Kbhs29xTrM/I6aw5xgiWPTyWZevpEl+UkTdOu25fxJ6wmzM0=
X-Received: by 2002:a17:902:ef4f:b0:290:dd1f:3d60 with SMTP id
 d9443c01a7336-297c04931c8mr1358545ad.51.1762447759701; Thu, 06 Nov 2025
 08:49:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <cc874b85134ba00f8d1d334e93633fbfa04b5a9a.1761748557.git.lucien.xin@gmail.com>
 <3618948d-8372-4f8d-9a0e-97a059bbf6eb@redhat.com>
In-Reply-To: <3618948d-8372-4f8d-9a0e-97a059bbf6eb@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 11:49:08 -0500
X-Gm-Features: AWmQ_bkulaWnvSaWsxVAziWY-nd-sBA09kWceVf7bj-CFTKpUJNHZl6a4fE2Pjg
Message-ID: <CADvbK_f9o=_L=K+Vo_MbJk3mXFgriUUtGCSVm6GNo6hFHk5Kzw@mail.gmail.com>
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

On Tue, Nov 4, 2025 at 7:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > +void quic_timer_stop(struct sock *sk, u8 type)
> > +{
> > +     if (type =3D=3D QUIC_TIMER_PACE) {
> > +             if (hrtimer_try_to_cancel(quic_timer(sk, type)) =3D=3D 1)
> > +                     sock_put(sk);
> > +             return;
> > +     }
> > +     if (timer_delete(quic_timer(sk, type)))
>
> timer_shutdown()
Will update. Thanks.

>
> Other than that:
>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>
