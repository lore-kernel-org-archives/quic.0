Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01055386432
	for <quic@lists.linux.dev>; Wed,  4 Mar 2026 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659563; cv=pass; b=Ti0e+vkUh7YuYbz9mdk2vQeFCu+VTsu4ODXgZ54oFbaXBVOJ22yfwppn/NGrogc2q3Y0QAhCu2qEf+zvzbyW/QcyT9JhLZLcA/Un0QJ3m1IZGvv0lUDbUc8oyU4xrbsdjUuWQVniIpShDCkg2Mgh2U64prnzCIdL5IDBzy2cFBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659563; c=relaxed/simple;
	bh=KLXKEYtmB4SEqI4A4FSyQZAfj2jvvWR0iwdwG84js9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwW77ltkVxle1YQk7V7aMYOVdm23toWiKdelZaGTQeYZMf7jesd+D0baHeNri+wPMwbdvhXnq9Pbfqa9a3cTtM6Qj8V7umXxidO+bsvBo7M+4LYqA6AYObmsHRS8zD0KqNrUoVdCHC9CFLJfc5ldQAH1LU5J1Oaavg4rH6xLTK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2RVyI73; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2RVyI73"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-824af5e5c81so7393752b3a.0
        for <quic@lists.linux.dev>; Wed, 04 Mar 2026 13:26:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772659561; cv=none;
        d=google.com; s=arc-20240605;
        b=kCp3DUAK8CIXBZVKkAKgVjuGuMRoBfLMJmDAtLMjl6uwoYvhaKDG0eV/Yh0qe6nkLn
         IJU693LYZRrnZEvR3l3jrBBxvJlBJz0bHIKnDQgppFQOVrESFOA6XRDDi/vvZGD89rp1
         60Jym9FcMcZiWZSJTq3KyPNV3TlK535lDkknsumGkaTny48hPmWwfQCoXDWUtxvLx6vI
         MZ4kvuaYeK3PsQm+VQLhMGb5t8cq80hZgFGiw48gffQKqXPWoeyTcEaKcQ5/a58gz1/8
         reDFeVJ1Vi48XxckHtF0n26oh4C6Ye4cNZfUt2lS1+dU7xl9jBVS1tO+HQhh0PIR0gtr
         1MHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yL8TME+Vn0JkBONxs9K32ojI9vGSbFL0WZFBDJPwgpg=;
        fh=Kl22ledljStuXl5MDgNInKCOTD5KidDOJPv4Myf4H+g=;
        b=kstvtIZuAnsMtsckfdn3IRsKEQLMr95QhPnn+cmqc+8u102qYo8e3WwSUHdU7C0pBv
         jThIpAvLPKXmu3DvaG0U3P9ut2VkSYFyZc4lfNGAsp8nxpNXqIt8wfPrh2v0b2IHPKr1
         JAs3QvBV2Wn3A1C3/2d2XPUmleaRfHr6gNwN0oC8pYDU/8EScKJVFGL1nEFlrRYC93jk
         u+DKQlJOHHHIn1+5Wt/l9xltc/pJfvawtS6puX9nnu5M2UDaARMvZhutDbKDjenSel8W
         DKsIplxxBHsFowumXiiA5DUxL9YsAYtEZybI4EKH1iTd9YO8n+xfmCCLOK1j26e6aL/T
         bieg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772659561; x=1773264361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL8TME+Vn0JkBONxs9K32ojI9vGSbFL0WZFBDJPwgpg=;
        b=l2RVyI73urpkzDG+lsy+UrbXw4PVh1fMhOV4XYYD98huIo9Hemtnn9t8piGg02sqcs
         Nje/rGtSP/mSos+ureogMf0l0BdTjY2BUWNY/W46Bz3lIEeQrTdhJuAp46OKRelRwgqT
         qtZeXW92Bs5qvKZaBGvAP0QniueeJcuhsoFRRLpYyfKML3bzKk4HZhJkSGbmuvz6Pwfk
         hp0XFD+MY61kiwLFyzCJlH6WCP07TlFTFXY7YFGNAr3lFMVTx1UjkS+5LBSRk3u/FAfs
         Ex2/kSZpb+PG/uOj8vftVSHY/GJ2Ku2+3P61qpfPPph62Y4RRScgYlm/f9eCYnK1RRxW
         tC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772659561; x=1773264361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yL8TME+Vn0JkBONxs9K32ojI9vGSbFL0WZFBDJPwgpg=;
        b=IayyO9xi0RG8wTeZ55qMzBfm4xmEGyEUI6G8Hui4MZNNYx0NxtIWCdm5YxqNHtWgVl
         JLBD7xXmN3GhkPPKxOJmERIo3xejPxpqTe8D8+QV2SyxcKoTqKAbjhwAiikEE2CmHqPY
         bE0xOeGWWUKh0YbqEyTBlcPLlx57Vde0uXxiv4DHxhjDaj+JiU/UaMwHEucmahqQmOag
         mJMY/0B1q+LchkKxoROT/Uc4Y9x33NVK73nYaCOLRbHYP+teRIDXKthEh1bJHiisfnvp
         8vT+x6bX1ETelKXdN/bcs/8P/nwhSl1aRYOWY1t7cDD7Dg4auFR6kcDhQAC5XNxyl5/r
         kjOw==
X-Forwarded-Encrypted: i=1; AJvYcCXy9oob/Mt7DEP7J2B4VSCj+7zIAo+pYGjgOuV7STfAF7gQlxMopiqNRlXeEF+WzpVdIrPJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzCghgBxU6izevdEJztndbCCgI7iAKZ4bfZYTQXjUNdYVMq4RLE
	8Wm+HgJGQu959jSuJvDUXMQxat3AzmAFabqiKXJKMgc7m+m2gvCa+1J2p7BPhfceE5h/m5kSoQD
	wAHDlv+/k3Z+jfpGlKhjwOxkmQXM9I4U=
X-Gm-Gg: ATEYQzzvYn+eT0Vd3/FrJawF9qMQf1ccQkMqsDMcW6s9/zuD64XoEFvGGvE8JwA3+AU
	9hMblAMo504SusL397HcOeJv6pha0mkQSyCnIhoWKXXQgy4EuSnmvlPw84sAwSJPmYhqRYwAUYD
	x5Ps4Ru/G72rU997DhsY9cxiOtov0CAr97bbpd2CGqbW4AnteorBuKJA/XsnrmgLV3sh3UmGaxa
	mNwRZXa9IoN6q9t0u8qYEbVGN6s2qTHWuqj1O0OcLH19zJvGLbDRavmDgNwzpf64npPHT7nDxR7
	96UnVtrOoGtEKO+SWjH+lTFRafp8eC+LRS37JxDSL2kkU+h+939CqhKptZR9rAD4jmEZixz1eM1
	ATumq/wghaYgMitxjt0xo3baF3FblKvorR5DGPsY3
X-Received: by 2002:a05:6a21:44c8:b0:38b:e9eb:b12c with SMTP id
 adf61e73a8af0-3982defa8fdmr3188341637.31.1772659561307; Wed, 04 Mar 2026
 13:26:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <4e03deebdc944d9c963b0732abe8ba631893d82e.1771986861.git.lucien.xin@gmail.com>
 <CAF6piC+W=QKU53vix1f8JxxFhRKCcMvXaX1NKBT3kcZLfCydEA@mail.gmail.com>
In-Reply-To: <CAF6piC+W=QKU53vix1f8JxxFhRKCcMvXaX1NKBT3kcZLfCydEA@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 16:25:50 -0500
X-Gm-Features: AaiRm50sq6Q3ttOp0vRNqW0uaev0YqHa-ggFkCiWTmshlDbHcjOdnyr83v7j-LI
Message-ID: <CADvbK_f84jwQPRq-xztO9mN+m_NWXaf6Q+9Ao-YtDiGQfmudLw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 08/15] quic: add path management
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:23=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/25/26 3:34 AM, Xin Long wrote:
> > +/* Binds a QUIC path to a local port and sets up a UDP socket. */
> > +int quic_path_bind(struct sock *sk, struct quic_path_group *paths, u8 =
path)
> > +{
> > +     union quic_addr *a =3D quic_path_saddr(paths, path);
> > +     int rover, low, high, remaining;
> > +     struct net *net =3D sock_net(sk);
> > +     struct quic_uhash_head *head;
> > +     struct quic_udp_sock *us;
> > +     u16 port;
> > +
> > +     port =3D ntohs(a->v4.sin_port);
> > +     if (port) {
> > +             head =3D quic_udp_sock_head(net, port);
> > +             mutex_lock(&head->lock);
> > +             us =3D quic_udp_sock_lookup(sk, a, port);
> > +             if (us) {
>
> When the quick socket is already bound to a local port, reusing an
> existing udp tunnel sock is allowed, but when the quick socket is not
> bound, UDP tunnel sock reused is prevented. This looks confusing and not
> documented, please clarify the behavior and/or make it consistent.
>
Yes,

/* Reuse of an existing UDP tunnel socket is allowed,
* but if it is currently being freed asynchronously by the workqueue,
* it cannot be used now =E2=80=94 retry later.
*/

Let me know if it's still not clear.
>
> > +                     if (!quic_udp_sock_get(us)) { /* Releasing in wor=
kqueue; retry later. */
> > +                             mutex_unlock(&head->lock);
> > +                             return -EAGAIN;
>
> Why not -EADDRINUSE here?
Because in this case, the us is being released in workqueue, a retry
will likely succeed.

>
> > +                     }
> > +             } else {
> > +                     us =3D quic_udp_sock_create(sk, a);
> > +                     if (!us) {
> > +                             mutex_unlock(&head->lock);
> > +                             return -EINVAL;
>
> It's probably better to propagate an error code (PTR_ERR) from
> quic_udp_sock_create(), or use -ENOMEM
>
Changing to PTR_ERR looks better.

> [...]
> > @@ -332,6 +333,12 @@ static __init int quic_init(void)
> >       if (err)
> >               goto err_hash;
> >
> > +     quic_wq =3D create_workqueue("quic_workqueue");
> > +     if (!quic_wq) {
> > +             err =3D -ENOMEM;
> > +             goto err_wq;
> > +     }
>
> AI review noted that:
>
> This isn't a bug, but create_workqueue() is a legacy API marked with
> __WQ_LEGACY in include/linux/workqueue.h. Should new subsystem code use
> alloc_workqueue() with explicit flags instead?
>
> Looking at include/linux/workqueue.h, create_workqueue() implicitly sets
> WQ_PERCPU, creating per-CPU worker threads. Since quic_wq only handles
> infrequent UDP socket cleanup via quic_udp_sock_put_work() in path.c, is
> per-CPU allocation necessary here? Would alloc_workqueue("quic_workqueue"=
,
> WQ_MEM_RECLAIM, 0) be more appropriate, or could this simply use system_w=
q
> if memory reclaim safety is not required?
>
This workqueue is also used for processing some backlog packets, which requ=
ires
process context.

I will move the infrequent UDP socket cleanup to system_wq as the AI sugges=
ts,
and leave this workqueue for the backlog packets processing only.
Then the allocation becomes:

quic_wq =3D alloc_workqueue("quic_workqueue", WQ_PERCPU, 0);

Thanks.
