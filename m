Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA2E53CA94
	for <quic@lists.linux.dev>; Thu, 17 Sep 2026 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652297; cv=pass; b=lBEZ9dXlh8QtOVjlWi23pCSE/MaJXp4Oi8C4lUt4yO55cU2aL5hXF1B59r5K+IXGrcaMsoR1IcEqmvRrgV+YC295ZHXwD2xqs3uhT9IIp8gGANSm4UI13GkVlxFN6Z1vWb69h9UwqgFoLp87+oof6Y7fNr/bV8CHYezkNZ8I9w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652297; c=relaxed/simple;
	bh=QNgM/kGDeBltidJ5TEbfEpxfYTzoLMWF0KKEi/Dse7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auYUSH/UGVJ537DXgJ+0GodWC0kzct34C35beBExO15yOWGXMwXuzgOYLBhHEDtpXDBZljcjzUIVd7xVnif8pijNhp1oIQqvQMVypWtwQp4wO2i0JPmPu+NZZ1+UL8IvAN+dXV8OzL2V4PbbehgeIpi/zkcXJDJfAuLj4SCqPxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYR00vt+; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYR00vt+"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso728325b3a.1
        for <quic@lists.linux.dev>; Thu, 17 Sep 2026 06:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789652292; cv=none;
        d=google.com; s=arc-20260327;
        b=LQJkVtSEmX0FWv4E9j6jvpq1ensbeCNeYNK9bxkVJZ3UoPgsG4Wy8X8LE2+lq/eoRV
         B/T9D9edA5U4bL5cWQXYIplofzIYwOV+/aHUUYmo0TvoA1HfnojYcrunJD7LCnsoj8ta
         gDo1PQwXIi+Lwv1SGSh6G+NhAEmn+0bregooszZvvwsp0t+suTFT73cSSs0y+6+bkMme
         PZrKpy/N1xX95qTH2ctqfnf3xgjaLXqMYIt0D04DRThaRuFDVSTyc3ZX9KjG2HZQ1X5V
         TPGKa5YH8yAP1jki8xkTXWL0VEzWDpajyWoYsJ02iF5Kcdyv2TuYE8oSVDZCyb5xfePO
         EPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuO1BQZ4V2eevpIqkFGI24nl/ujAkD0tm8XPYi2iD1M=;
        fh=n2mYyWm752QY7QMnLrWTsBOtbRZE67c5x3dEvVuo+uE=;
        b=mHIvrLf1O906xxPDfz6BSC2GaANYdY/vrtY5NOmwneS8W3ZiblOw366CRY8d1bawkh
         vpUwphcpsLXtontPNl2GUDM+cHc6LBP44BuWJHLZYbhx6IY0AiFmLqlIkzSvf8DdZ3Mx
         2HgneVz95BGv6aEY3wFLsKxE8R89qGJ3Pjhv63pPO9W9lFTzCQ7H9u4Sd4nKxwbPGIPW
         u2tfBE2w3TrG3giLVIkJu1SOlCmwnvEMlXd4uXcTsqtU90AfMph1mIITx0Nnll9c3CnS
         xJZX6ng3ziYUsWymQH3Ler1013wpNZtWntAvum/f5XJe28O6f1A90IwL1A9DeoHSX1/2
         JgiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789652292; x=1790257092; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iuO1BQZ4V2eevpIqkFGI24nl/ujAkD0tm8XPYi2iD1M=;
        b=sYR00vt+22yNVX2SkcVHGXwiAnO9H/TEGwJau47C3G2ZlVwW3dPY1EdCf9+iJwSQ50
         Jl97/Z4J75hTjFJlxjzjeuHo0NA+PpmrTWST9yr+9lnR9b8eBeDtXZhqDbhATNBFn356
         9Et3Kbxe/0oJ4Rum3IeVf5hwbRwYQB7N7fU3pVv0PURS3eTLOfI+uPdZk1dVNXsqOAut
         /IERrODHf3eIpz3WJjATnFd62zhiBaImcO44Hw+/Gr2Tx4GBm+d57tCRhcTSkTJ80av1
         fcO+O+x8WxztubuJvsiPGzWtMqoQ8U4TM/MQ8x06VrDIrteJMLPq9SN5b71/JC6D4X8w
         JbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789652292; x=1790257092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iuO1BQZ4V2eevpIqkFGI24nl/ujAkD0tm8XPYi2iD1M=;
        b=qghUGXaUiB5P2JGp6opJrPPt+zSwufk0ubchqVsRrOIx7JGS1enG4YXCWDTDcXxKBF
         eMRS80z7BcnmXOTxX8ZwuWK4adVTOR6IjPsLQbyYbhaEW1ggrCrYavlJLmABkUirbtzQ
         1ppey2x1xo7k3MV+hAyn96ksal3i6u8Sbd3y+hx82Bb0f2INwkFWFo9O9obv6UrqztzY
         4Ez5B52aREkgRwClIT80MIFBeeF2puwnAgrnWhjCbvBN9nYDS5ZBiQesMNot13QoajrQ
         vXHPiYzj9bpJrpt1Fo2wRqfojzEZeqFPmTqIFcTBA4nK9LxDQTUcuzMBH4XUUyTYfvv0
         sywg==
X-Forwarded-Encrypted: i=1; AKwUvBzgL4q6zkhTfuMM5Kz5d+ant4nHMhAokVEAaS7CJgfDwUW5YkUl5E3ucT/Oa/0IPoT/uS/+@lists.linux.dev
X-Gm-Message-State: AFuF++mZqMXgmtH/y2hgO6QToVCjLC3ngIE06pOyjsOLIzTOiV76rg9v
	jXc/zkJl6105MKn+BMZGm/y9723T5JNcoEyoyejgtXq+zPJnSW6UaI5zytuK27oG47WTEeIv61C
	Kmp/LP47iSJxindeQJrZCQiaVjOplI8I=
X-Gm-Gg: AYBFou3Gfnalp5wN4bl8gS2FgNtPilKjmtSqO/vj1HH/qGm6aqcfOMnblC4JVGuzvAb
	6mlOdqBA9gtL6J65DxbBWZROOSmdYBrYiFLoOU7UEdSIE6CCLOFIQZNe1PsJ75IpIs+FUsj7L0R
	McIqD6jqz9twQdbZp9sxTYast7JsoEBPzWZ3yozQ/WGSRX6bvryb9o9LCTb2pzDwI0cjTnp6zES
	CfIPJbSfYndRylaXokNnZXIWc6+f8ySwTAWKdnvTlGNxf6JScfsZoU/Wd34mCoAEcADF6Yv3LC9
	QyGrxNOFH8kC1T9/LXIpD3W3qnDjL7Tty70bkYAvs+RMxZKIHDYx0Ev98VLnYnwNF2DBw3NRNig
	qaliNPa+TjyOrw1clCaz6oj73YADYR2DDKvB281ItKEZWq8w4ajEJSl0=
X-Received: by 2002:a05:6a00:c58e:10b0:874:72b6:7dac with SMTP id
 d2e1a72fcca58-87472b68104mr229753b3a.39.1789652291802; Thu, 17 Sep 2026
 06:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
 <20260916234654.420056-1-kuniyu@google.com>
In-Reply-To: <20260916234654.420056-1-kuniyu@google.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 17 Sep 2026 09:38:00 -0400
X-Gm-Features: AcwNN1WyswquGpQo0eLBq8SospQls0DTN_D79sTSRdER_SDP9o7rXxWvgz7asJ4
Message-ID: <CADvbK_df5X=Szsd-d8=0gndhoBSHJhnEqSh826iYUW6=Ce_xEw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: aahringo@redhat.com, alibuda@linux.alibaba.com, 
	andrew.gospodarek@broadcom.com, chuck.lever@oracle.com, daniel@haxx.se, 
	davem@davemloft.net, dhowells@redhat.com, dreibh@simula.no, 
	edumazet@google.com, hare@suse.de, hepengtao@xiaomi.com, horms@kernel.org, 
	illiliti@protonmail.com, jbaron@akamai.com, jlayton@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, kuba@kernel.org, linkinjeon@kernel.org, 
	linux-cifs@vger.kernel.org, mail@johnericson.me, marcelo.leitner@gmail.com, 
	matttbe@kernel.org, mbuhl@openbsd.org, mef@scarletmail.rutgers.edu, 
	metze@samba.org, netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, paul@jakma.org, pc@manguebit.org, quic@lists.linux.dev, 
	sd@queasysnail.net, steved@redhat.com, tfanelli@redhat.com, tom@talpey.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 7:46=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> From: Xin Long <lucien.xin@gmail.com>
> Date: Wed, 16 Sep 2026 14:08:22 -0400
> > > > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union qu=
ic_addr *sa,
> > > > +                                  union quic_addr *da, struct sock=
 *usk,
> > > > +                                  struct quic_data *alpns)
> > > > +{
> > >
> > > [ ... ]
> > >
> > > > +out:
> > > > +     if (sk && sk->sk_reuseport)
> > > > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(net, =
da), skb, 1);
> > >
> > > [Severity: Medium]
> > > Should the hdr_len argument be 0 rather than 1 here?
> > >
> > > quic_udp_rcv() already did skb_pull(skb, sizeof(struct udphdr)) befor=
e
> > > quic_packet_rcv() is reached, so skb->data points at the QUIC payload=
, and
> > > reuseport_select_sock() documents hdr_len as how far the pointer must=
 advance
> > > to reach the payload.
> > >
> > > With a classic SO_ATTACH_REUSEPORT_CBPF program, run_bpf_filter() doe=
s:
> > >
> > > net/core/sock_reuseport.c:
> > >         if (unlikely(!pskb_may_pull(skb, hdr_len)))
> > >                 return -EINVAL;
> > >         ...
> > >         pskb_pull(skb, hdr_len);
> > >         ...
> > >         __skb_push(skb, hdr_len);
> > >
> > > so the filter would see the datagram starting one byte into the QUIC =
header:
> > > all its offsets are shifted and the first byte (form/fixed/type bits)=
 is
> > > invisible, which can select the wrong socket in the reuseport group.
> > >
> > > [ ... ]
> > >
> > True:
> >
> > BPF programs may need to access the QUIC header, so I will pass 0 to
> > reuseport_select_sock() to ensure the full QUIC packet is visible.
>
> Why do you use reuseport_select_sock() here ?

Because QUIC socket supports SO_REUSEPORT and allows multiple sockets
listening on the same addr/port/ALPNs:

https://github.com/lxin/quic/blob/main/modules/net/quic/socket.c#L724

The client Initial packet can select the listening socket based on the
packet's source address and port, or by a BPF program that can inspect
the QUIC packet.

Thanks.
