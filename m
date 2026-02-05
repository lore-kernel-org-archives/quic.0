Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219173093A7
	for <quic@lists.linux.dev>; Thu,  5 Feb 2026 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770317773; cv=pass; b=uB9puvtSu+KRDU1S2C1IkpC2aOAUQUaUTiWpauNe+PipFWfqqldO8GlhVGzC2S5riVX68RoJopaWMH7sXZze1KU2S835H6Az7HM4716RQHy3AJF6OGb/sQO+9nHL3kDCVH+r3gDLHT0Qsy7emo2WMLLuqjFt3Uivv1cC69t/2Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770317773; c=relaxed/simple;
	bh=UTAeTogqMPOzWsl43rYalxijcnMd4QsYh0uYCJzTId8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nz1sGU5clD8KZ3KqvuWwsgDXG9wiI8ZbQKAcGJ1Ot4s6ZtoFY4eAUjUWObSPZvzomATC2TtKr4gIIjNAcJYrYRnaZi4AuE/sqhhJF4knhiGi2x/aH9mmGdeidSYuOtQ5jRZIZWoqYfQvdxnoCD1HrLbjRJN8s8efaTsG4hJX71o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C03A7cO/; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C03A7cO/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso687036a91.3
        for <quic@lists.linux.dev>; Thu, 05 Feb 2026 10:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770317772; cv=none;
        d=google.com; s=arc-20240605;
        b=Jn5DA7ppzXaYrqwbPozz5z0ZoKrWMq/OOzImAZY5Ll8+di+OEys9iqkYeHcEsYINBJ
         0zIJtY4iYFIa4P2weYO6lf+h4mson87D1SJkWi9ufzAT+2Fl+OFTxBbJk57z8w7kBBPp
         1BkE9GQMeJ24A4xzKrZLS4MOBOOUJ2VTBg1N03fgqAigDoHQt6pcTxmFV8NXCi1M4Vsf
         zFNDt4DDNkmdzfjuhLdnA/+0H6IYpzFo7eles+BPp5turMoV50OJ/QIBpw0crvnuiEDY
         c5QRFJIM4H1L0jbVP4E9MCPELmwpwF1ckmgmyrVRAN1dXgNYP87e9aySA9Y+Si1ILOlk
         UUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80WFsFgkgPBLtk7OvSKjFaYy+3cWwSZUPkBNVljL2Sk=;
        fh=ewlZkvR1WbZgec9IXxDlkFL3uLKglpYHIAEvxISqJ7I=;
        b=Qn3Hg/Vx8fAD/0FmcTcoFTW/jazAGHwNto2w2ZZW0nzQKqqIxXtZ5+6+S3Ub9EBdp1
         CdkfNA3iPhRzDGqAghprbsYfvvMEQTQ68kEpHIjCU36fzxYOU3NfNoLkWdb9lzzNvwsm
         LsY+tyGecoOSo8bgO5I0Ven1AUYfOIk+X+u7wLPLiu9elRSEbYcPjHmCiI29TGFiKcNt
         fRdhalyq8hD3kgfT3Dx4CPLD5a1FyDIEMQcT2h2Uf6oNRzHuzeEfHNu8S7XuXfE9en22
         hFcEMyc7sMcQ16fDID4zH8cy4Sc4Ei2RCqJYjqIJtowf4DSZqYTeI22Cy47cPdC0oGim
         ga/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770317772; x=1770922572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80WFsFgkgPBLtk7OvSKjFaYy+3cWwSZUPkBNVljL2Sk=;
        b=C03A7cO/A2TDYkGWSGKV05vB97YhFLbyetPiGHasR4cEVBm/xEPli8+zyZeV8cglOV
         MyB9mdcHKZ7AFLtr3V/eEC1nzMBumyffTbVMZsVJw8UwQDoDrps4kAa44u37OTHtPxxe
         wNKTXM1RnByQZA7WXuLRW9tuab22ElrtjYYNbo6ePxNNU4ctRtc5sbUEV/NpPjkVbasQ
         LtqsxgaZTqgSS1ll2Hy8jSLLoPzm3CXkkyF4oQo6yFkVN9/rxsAMVBVeGDdpagpAySqu
         x/GaNjihwKe0ratG2TOqF15D4JD36HC/gW7YPRpDHMWMAhOnCD1hsRho16DkK8fFLm0Q
         j7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770317772; x=1770922572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80WFsFgkgPBLtk7OvSKjFaYy+3cWwSZUPkBNVljL2Sk=;
        b=ZNa9Gf3kPNsO4M9VjsVuTnDMjYHXNbwvb+hK0HM19A5r3WBEhUFbO538x04Y74AeiN
         4SP9tD57VQrzve//7lVO75SquH26ikT15yuhQ4/JmZHFW3SXzXVeTJE3diH89u/oGp6O
         iDbA44nsM9VnvsAVI3LRf2NJJOLxjoEcs6I04yVF9ynqrLXLSt52ouQxPWdocrmd+tck
         w0IpEf9LtLDXz8Wzpz2PRNw/b8CiYzpAJ7dG473lLItDMrpL8TSvpS89JmevL+ytvWRm
         GClmhH+byiTOGjNmaXi1ntluv+5BVh1ZV97pxn+ppLLyRdgvIDTco8+Wu1SUGF0Y7UH8
         eyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGK1Dt00Aj4G23MV3Urrcx44v2zkefbCeGVsfAp12uWgGqnqFds1+zgYQft6ROAlIuELtp@lists.linux.dev
X-Gm-Message-State: AOJu0YxXJ4aS1pLrSqZGi5IlWLpI1C/yI1y2L4KS+Ktqqem/+Pec7kQA
	eGm+9Zjo96SpIwlpr52Ed07vnWFUd2bpehqR27ovNkk2AqiH7fya5LCfJPXdB/DR2TD9O538Y5w
	kiSNFx2msKNEpDNRgKWU2wTWLmYjm9dI=
X-Gm-Gg: AZuq6aI2v+B+3+DXh7V3iR/jjqKN0dwmQzBf5+eU5NDfoBJvZ/xSiMifTM1rQRA9bSP
	M87Etwc6Ik6f9EuAp0eYuNhu93ParclQlis8jVMSfLXWz7tlqEAB13eV2qkW1EZacThcg+OxSmN
	8KFJ4e1xBBhfZ8CXzkQ68IrkXdkL1iIfCUhm1O8W0eCCO4b2vSdcDa/laNjlGdacDU//SZ2EjuE
	p4i0wtMU2Q4fa9vMtmhjqGmKyuY+zT27HeTXXJoflM+d1Kg2eNoYDGeYiRlcf8pfb/5d6UMFsHb
	98VRovnyExJsl8Ohn8ECnhxb/B9v
X-Received: by 2002:a17:90b:3d89:b0:34c:2db6:57a7 with SMTP id
 98e67ed59e1d1-354b3c50bcdmr29630a91.8.1770317772303; Thu, 05 Feb 2026
 10:56:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d3a376cf555e7740330a50d83e6201c9084bff01.1770042461.git.lucien.xin@gmail.com>
 <20260205115518.2195328-1-horms@kernel.org>
In-Reply-To: <20260205115518.2195328-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 13:56:01 -0500
X-Gm-Features: AZwV_QhMX6JEvl213fgLGN4KP_FM-9zVeYTAxoLTMPmESDUtW4x9IOxJ01wxKVg
Message-ID: <CADvbK_fsXE6MkgF9KMVThTgsid9Tgkyjrvwyek9NM1jd0KZ4Vg@mail.gmail.com>
Subject: Re: [net-next,v9,06/15] quic: add stream management
To: Simon Horman <horms@kernel.org>
Cc: steved@redhat.com, marcelo.leitner@gmail.com, aahringo@redhat.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, hare@suse.de, kuba@kernel.org, 
	tom@talpey.com, linux-cifs@vger.kernel.org, daniel@haxx.se, 
	quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com, 
	dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com, 
	pc@manguebit.com, kernel-tls-handshake@lists.linux.dev, 
	illiliti@protonmail.com, xiyou.wangcong@gmail.com, 
	andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com, 
	pabeni@redhat.com, matttbe@kernel.org, netdev@vger.kernel.org, 
	smfrench@gmail.com, metze@samba.org, mbuhl@openbsd.org, 
	chuck.lever@oracle.com, dreibh@simula.no, davem@davemloft.net, 
	sd@queasysnail.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:55=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: add stream management
>
> This patch introduces stream management infrastructure for the QUIC
> protocol, including a hash table for tracking active streams, functions
> for acquiring and releasing streams, and logic for detecting stream
> ID limits.
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index b86989080184..d6f25669c693 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -41,6 +41,9 @@ static int quic_init_sock(struct sock *sk)
> >       sk->sk_write_space =3D quic_write_space;
> >       sock_set_flag(sk, SOCK_USE_WRITE_QUEUE);
> >
> > +     if (quic_stream_init(quic_streams(sk)))
> > +             return -ENOMEM;
>
> If quic_stream_init() fails here, the function returns before calling
> sk_sockets_allocated_inc() and sock_prot_inuse_add() below. However,
> when initialization fails, inet_create() calls sk_common_release() which
> invokes quic_destroy_sock():
>
> quic_init_sock()
>     quic_stream_init() fails
>     return -ENOMEM
>         -> sk_common_release()
>             -> quic_destroy_sock()
>                 -> sk_sockets_allocated_dec()  // underflow
>                 -> sock_prot_inuse_add(..., -1)  // underflow
>
> Can this cause counter underflow since the increments never executed but
> the decrements in quic_destroy_sock() are unconditional?
This is a good catch, will fix it.

Thanks.
>
> > +
> >       WRITE_ONCE(sk->sk_sndbuf, READ_ONCE(sysctl_quic_wmem[1]));
> >       WRITE_ONCE(sk->sk_rcvbuf, READ_ONCE(sysctl_quic_rmem[1]));
> >
> > @@ -52,6 +55,8 @@ static int quic_init_sock(struct sock *sk)
> >
> >  static void quic_destroy_sock(struct sock *sk)
> >  {
> > +     quic_stream_free(quic_streams(sk));
> > +
> >       quic_data_free(quic_ticket(sk));
>
> [ ... ]
