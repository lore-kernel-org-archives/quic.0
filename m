Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936322C21F2
	for <quic@lists.linux.dev>; Thu,  8 Jan 2026 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894297; cv=none; b=d+o/DQiMMwZ3ZIzrGjt9TBQT6wA1+DOwGfEtZc7ex8B3M5mTR/mwgmhWHRZGSeNY3+ZQI3Bdj2WUpBpNSXnSHdk7vSNLWhhOJqlbGtmka6eO01xoRnYfMcIRn2Qbcr/HuF3Cb69//AnAzFtyL6/QOOXz+cKTll2SUP7cX69UCGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894297; c=relaxed/simple;
	bh=ss/QmZtegoT8QUE92ql/8y/No8UIkLe6lLm4BxyGzgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmyxxGgw40Yw/iuph60Wn3MA9i84SUdlYVmgARWSU7sVGIK8lFRr6OR5J2xqjx6fBwQQ/mjClVb1lIeiC+X0EOeRof8n4tDI3ij+3723ZX/8HLa0gzomskujwUzUtHmpblGlp2EhXlIOk/rBrfae2DzsLMOYPmuPTpUIlz7gaxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeNKhWQi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeNKhWQi"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a09d981507so17210795ad.1
        for <quic@lists.linux.dev>; Thu, 08 Jan 2026 09:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767894291; x=1768499091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ss/QmZtegoT8QUE92ql/8y/No8UIkLe6lLm4BxyGzgg=;
        b=BeNKhWQiXYJ8VapN+lS598s7aWlAg3ZkN5x48Iszhtr+ZYxzIzcLJauYMrKVA/Lfd5
         xUz5JHi1VsDQc/NiTND44G1qGP3nhUXtm0Zrbzk8orAAWwvUnzLS3CgbmBj6DqDEa/UI
         ODu7/NU15d5EXvHZd/yaXY1SOJHzwXmrU51Mir1OQ1gj68JqkGgnULhI4LVjBB06TfvX
         Rx1eNsEgNjP/psKCrDmbcOqApvjH/oWl0PNf+QdhzOblHQJuY8A/JjcOOg5nTYPefLNG
         VuI2R3YBiHrNyFenbzGeyMfwJTirq9QHiV/HgcVLmq+PRLT0TFIp/cigc8ScWiZWSXDo
         nuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767894291; x=1768499091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ss/QmZtegoT8QUE92ql/8y/No8UIkLe6lLm4BxyGzgg=;
        b=SUNMdUS6P9YjVqo72QA9/bg19uewEtv4r4oizJ60G5bp66kIgkEZNeD3AwXM40BViX
         N0LuRp+YzV9OL4o2Ul5IMCpqH7U4UcZboogutgsbh4aNHpgWjNnMPywmToCuvSTjBYjD
         wnKAQpN/lgCBv1a4LoDG2ZSddCfDZaipM1mYAcC7p7uYsE4CwcnX8SI893pMdoa6K+ZY
         S1nLLDE/O5qQhucwXqHug3o9aH6IgF9rymbLnqeIl5iqus3xEfuHNYfVe3aqnUMy/pwq
         qD0zSPCgDh/aukuusRz841SpJHpeVUgOh/N7et0nSBvI57YUVoyVLDZPyowi9xDYlJn5
         FSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwB76MsGWO1ZIcwCd/+20gdWoe/OxwPrctftiEk1uXS8RKiMNSktLu9x4QR0AaSVzPXk/C@lists.linux.dev
X-Gm-Message-State: AOJu0YyNB9UN3Yu8XX1x3zorycVzAUy4m2f6uXRUI0Xi9gUMvJo9ACtv
	aE7wBQLjbHZtrZkAZXYz2k5JqWPZV2K3x1nXRQwT5Yb2Ll8/roX0DGonPoF5OZ87w4UQuN1Nnvf
	Sy9jt9h9eltfSqEp2GWR4+6WJf2y0/4k=
X-Gm-Gg: AY/fxX4wgneQEmkHdeaye/It64/VRETn0opbTqzHYlpkkrDhEm3ROCvcGD1ToBPjlJi
	2Z3devhkUvDnA/zWl2Nf+dp/cpIrcouZ1+9+8vr+6ldKWqF8QHjPe2StSbO4hAVzR5AFWpd0d7e
	mTDDZhinb3VW4qrcb6Y/zf5ikPS+VJ7WKyMOuUvjqZQH4j8feUX7ecO2JM2sX6pAomiZZwqJtpI
	/ETCjkrJggWRJnPxm3npy/D1Kv1MoQEhld78lwZIEyaVV1Xtj5LFlWZ+2Z4Z4lUa1qCGivGZB0D
	ezJpRFNjv0An56dgtqj+MzzryCx8lO7/5tsFGWg=
X-Google-Smtp-Source: AGHT+IGo23JTAhDe6YZ04HEPRhsvfMI0iFv39hHhbnRbHjZlEOShm5/5yd/f68zNrStyS0OL76jXKcU4YQTPqscbaUY=
X-Received: by 2002:a17:902:d4d1:b0:2a0:b432:4a6 with SMTP id
 d9443c01a7336-2a3edb775abmr78034655ad.15.1767894290166; Thu, 08 Jan 2026
 09:44:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767621882.git.lucien.xin@gmail.com> <127ed26fc7689a580c52316a2a82d8f418228b23.1767621882.git.lucien.xin@gmail.com>
 <1f31a9ac-01dd-4bb1-9a5a-ec67b381c5c0@redhat.com>
In-Reply-To: <1f31a9ac-01dd-4bb1-9a5a-ec67b381c5c0@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Jan 2026 12:44:37 -0500
X-Gm-Features: AQt7F2o6dW95jyJ167axiY2PfCkYBHxaTuo-Pd8v15qVpoBoDqajatltW2Rygls
Message-ID: <CADvbK_c2YE8KfXE2KP0=a_zaUm-AWNOwpmyeDCQURA3AtbDpOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 05/16] quic: provide quic.h header files for
 kernel and userspace
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

On Thu, Jan 8, 2026 at 10:01=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/5/26 3:04 PM, Xin Long wrote:
> > This commit adds quic.h to include/uapi/linux, providing the necessary
> > definitions for the QUIC socket API. Exporting this header allows both
> > user space applications and kernel subsystems to access QUIC-related
> > control messages, socket options, and event/notification interfaces.
> >
> > Since kernel_get/setsockopt() is no longer available to kernel consumer=
s,
> > a corresponding internal header, include/linux/quic.h, is added.
>
> Re-adding kernel_get/setsockopt() variants after removal, but just for a
> single protocol is a bit ackward. The current series does not have any
> user.
>
> Do such helpers save a lot of duplicate code? Otherwise I would instead
> expose quic_do_{get,set}sockopt().
>
Not much, just when using quic_do_{get,set}sockopt(), KERNEL_SOCKPTR()
will be used around the optval and optlen.

It should be fine to change to expose quic_do_{get,set}sockopt().

Thanks.
