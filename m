Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C6F34F24B
	for <quic@lists.linux.dev>; Thu,  6 Nov 2025 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762457076; cv=none; b=AVy9LBvHeqHFBNuWW28dhKBVzvVqo2zU5RQVwFOdz/0MlDNqyphqx3SgafS9InQbHajMz8jVxm/JtCcYFckXkYz375E909ky9At9otc33vQHGGAAoWtfBjO9Dwg9im36rTaCvPTxa4iITxfWb8Nc5mj5I61Qmb/vkG01STbn31w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762457076; c=relaxed/simple;
	bh=2E0rHcjSg2g7ddxHtaXVab9HpB/ebxqIuX3rNsYxzu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLolsjugjVbmua/TEV8u7bpEHjS5yMX0im39Hcl6nQR8zjlmGTRuyBJqIp3PwVY+VdFK8MyvKpbzsga6HWUvrEn+8KAjwVAOdF8cVII5qTBPbaI+gsyc7NJ3IcfDwEb8y7bAAWLvw/SbXIWBx6S3Lr/lbF6Y3u9GEiSMFfHxxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrSfsuIb; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrSfsuIb"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3434700be69so3271a91.1
        for <quic@lists.linux.dev>; Thu, 06 Nov 2025 11:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762457074; x=1763061874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v9XM3ZKPMTOA5s31o/9IMxhFP/c6V4aNgO9S0cm3yA=;
        b=VrSfsuIb/IokO9eM26uljr4BaORLo+g+Kw6Ye0eycnnYZIrKIgMDEqFIshFc8akP6A
         UCcutwKk/a0WtqV8mRXWrF7NT7BlYNqTJmqVANh8mLAjkqdEtCJtu832ZR6laS9fuP5K
         z5BJDK3imHjN/ocw735+kiEqKvMYF/0TJrSvp9jPE1gKVxxh899xKnJvvgnE8gA9QqIW
         WHRLwItsfTw9QtREfrPcJP/xIi/jWagJ7Xjz3FnC6HHIGEFjahDXOiUhHK+r2yfex++W
         h7WUnfMI/Ybmgpf9qAE5ubF/2CH6gyI6rWZ4Yovy+Y49EPb/CCVH974e11EFI3T4VOuM
         r6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762457074; x=1763061874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/v9XM3ZKPMTOA5s31o/9IMxhFP/c6V4aNgO9S0cm3yA=;
        b=PnssgOJqukAT8fxzJhS40X26sT9MNKMD8q3l5ZE5KxHB02rJx2P+Pi4cJ+tyI47aIe
         UYn8Z68CRh9RPCMumE3D5wd+fcUVwSwWHArSx5yEqtyQuMt4L10jyQZeXLgLzvun29r1
         Z5yq/t/KQfKvIZjLrK4xJwwsmlYlWgNYriJ7Xb29QvLjsANbK6MZyF6xPcnGSJgVl96a
         3FldKRXVRWiEf9ma4C2FC+0HLYM1lHcFzuoeXaV09YJKygO1ZfDGNmK0TeHjuRcfUbjG
         4ku7ew+zqJzekGQrD6j2EmSGPmAo/4WVcnv7hrZdtm0aHqFiDmJXOmyHTkByHc3QK1ci
         1rxw==
X-Forwarded-Encrypted: i=1; AJvYcCUOIi+pGOx/VCcrL2xfWfcjadOC2EzNN/uTQYqYF29gSgQA3DYMwJqo+jbhbOPsPyRyzYrk@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7W1Ejebr0eNI9/9v7xAfp1xQOsxUOb8hmIlCy/RqEeQQx//vn
	rx8hvOPnd0hdOWR4x4EaR4kd3yu8j1sSejCOsI33iOj1YfAwT8g1BtvhmgcS4zIr4gV0/19VEEs
	IpmCKmmVONDQqo3TRWm9QiJwi0ovrU0k=
X-Gm-Gg: ASbGncsOQT9oT15zMBHnPgCQ7DXI16M0/zoEmibycVeBbKJZaSIWOFuOVzgfObwMLNX
	DONBQQTApbwkfJ8YuGtftb8cFef9UX8yoCqob25nY65aS8SZf84KMaSL3XxjI/wcxbCcO6tn9Ff
	i5pQ+6/teaAOGjFQrrE7lgmWpm1uf8heK6ClY7MSXwPx/YCEeBTLHt6knlTrdtJQqQ9eyp4f3ao
	2hCVxCtE1a2B+6s89UcNGj1k4UOB6Q61ZknLRrRfnSzAVUfNi5W+3/UxE61Jb8qhWfQWhUGorgx
	Bz0BQFD1K0PfTwFW2NY=
X-Google-Smtp-Source: AGHT+IHsWDUBCle2bN62W9WnIZt8SABJKzazabmlzKoxEh2fh9WUo/f/sCCDA+DLzL/juPkbnIR7PPimmjlHkDiHw6o=
X-Received: by 2002:a17:90b:2fcf:b0:330:6f13:53fc with SMTP id
 98e67ed59e1d1-3434c5896e4mr315760a91.27.1762457074202; Thu, 06 Nov 2025
 11:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <c9b7d644059fcd181a710ef2aff089e002133046.1761748557.git.lucien.xin@gmail.com>
 <6dfd2fe8-65b6-40db-b0f2-34aa0e4f3e9b@redhat.com>
In-Reply-To: <6dfd2fe8-65b6-40db-b0f2-34aa0e4f3e9b@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 14:24:21 -0500
X-Gm-Features: AWmQ_bl2ElznIpZ2pV-C2koFAtJ0Dh9ui1NXrXbVWIj7Jzye-OCrSic0jsfMEEs
Message-ID: <CADvbK_evd2=Cs5EZGf3EVBiY5SvF_aOtbu6wMjj_mSgFgfBpzw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 15/15] quic: add packet builder and parser base
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

On Tue, Nov 4, 2025 at 9:44=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > +/* Process PMTU reduction event on a QUIC socket. */
> > +void quic_packet_rcv_err_pmtu(struct sock *sk)
> > +{
> > +     struct quic_path_group *paths =3D quic_paths(sk);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct quic_config *c =3D quic_config(sk);
> > +     u32 pathmtu, info, taglen;
> > +     struct dst_entry *dst;
> > +     bool reset_timer;
> > +
> > +     if (!ip_sk_accept_pmtu(sk))
> > +             return;
> > +
> > +     info =3D clamp(paths->mtu_info, QUIC_PATH_MIN_PMTU, QUIC_PATH_MAX=
_PMTU);
> > +     /* If PLPMTUD is not enabled, update MSS using the route and ICMP=
 info. */
> > +     if (!c->plpmtud_probe_interval) {
> > +             if (quic_packet_route(sk) < 0)
> > +                     return;
> > +
> > +             dst =3D __sk_dst_get(sk);
> > +             dst->ops->update_pmtu(dst, sk, NULL, info, true);
> > +             quic_packet_mss_update(sk, info - packet->hlen);
> > +             return;
> > +     }
> > +     /* PLPMTUD is enabled: adjust to smaller PMTU, subtract headers a=
nd AEAD tag.  Also
> > +      * notify the QUIC path layer for possible state changes and prob=
ing.
> > +      */
> > +     taglen =3D quic_packet_taglen(packet);
> > +     info =3D info - packet->hlen - taglen;
> > +     pathmtu =3D quic_path_pl_toobig(paths, info, &reset_timer);
> > +     if (reset_timer)
> > +             quic_timer_reset(sk, QUIC_TIMER_PMTU, c->plpmtud_probe_in=
terval);
> > +     if (pathmtu)
> > +             quic_packet_mss_update(sk, pathmtu + taglen);
> > +}
> > +
> > +/* Handle ICMP Toobig packet and update QUIC socket path MTU. */
> > +static int quic_packet_rcv_err(struct sk_buff *skb)
> > +{
> > +     union quic_addr daddr, saddr;
> > +     struct sock *sk =3D NULL;
> > +     int ret =3D 0;
> > +     u32 info;
> > +
> > +     /* All we can do is lookup the matching QUIC socket by addresses.=
 */
> > +     quic_get_msg_addrs(skb, &saddr, &daddr);
> > +     sk =3D quic_sock_lookup(skb, &daddr, &saddr, NULL);
> > +     if (!sk)
> > +             return -ENOENT;
> > +
> > +     bh_lock_sock(sk);
> > +     if (quic_is_listen(sk))
>
> The above looks race-prone. You should check the status only when
> holding the sk socket lock, i.e. if !sock_owned_by_user(sk)
This check can be deleted now, as quic_sock_lookup()
has only returned regular socket since I moved listen socket to
another hashtable.

>
> > +             goto out;
> > +
> > +     if (quic_get_mtu_info(skb, &info))
> > +             goto out;
>
> This can be moved outside the lock.
>
Right.

> > +
> > +     ret =3D 1; /* Success: update socket path MTU info. */
> > +     quic_paths(sk)->mtu_info =3D info;
> > +     if (sock_owned_by_user(sk)) {
> > +             /* Socket is in use by userspace context.  Defer MTU proc=
essing to later via
> > +              * tasklet.  Ensure the socket is not dropped before defe=
rral.
> > +              */
> > +             if (!test_and_set_bit(QUIC_MTU_REDUCED_DEFERRED, &sk->sk_=
tsq_flags))
> > +                     sock_hold(sk);
> > +             goto out;
> > +     }
> > +     /* Otherwise, process the MTU reduction now. */
> > +     quic_packet_rcv_err_pmtu(sk);
> > +out:
> > +     bh_unlock_sock(sk);
> > +     sock_put(sk);
> > +     return ret;
> > +}
> > +
> > +#define QUIC_PACKET_BACKLOG_MAX              4096
> > +
> > +/* Queue a packet for later processing when sleeping is allowed. */
> > +static int quic_packet_backlog_schedule(struct net *net, struct sk_buf=
f *skb)
> > +{
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     struct quic_net *qn =3D quic_net(net);
> > +
> > +     if (cb->backlog)
> > +             return 0;
>
> The above test is present also in the only caller of this function. It
> should be removed from there.
I may delete the one from the caller, as there will be other
callers in the 2nd patchset need it to be checked in here.

>
> [...]> +/* Work function to process packets in the backlog queue. */
> > +void quic_packet_backlog_work(struct work_struct *work)
> > +{
> > +     struct quic_net *qn =3D container_of(work, struct quic_net, work)=
;
> > +     struct sk_buff *skb;
> > +     struct sock *sk;
> > +
> > +     skb =3D skb_dequeue(&qn->backlog_list);
> > +     while (skb) {
> > +             sk =3D quic_packet_get_listen_sock(skb);
> > +             if (!sk)
> > +                     continue;
> > +
> > +             lock_sock(sk);
>
> Possibly lock_sock_fast(sk);
These are some control QUIC packets (not on the main data path) for
which we need to generate keys from header fields in order to process
them.

However, the kernel crypto API cannot install a key into a tfm in
atomic context, so we must use a workqueue to handle key generation,
installation, and then decryption.

lock_sock_fast() can not be used here,  otherwise this path runs in
atomic context again.

>
> > +             quic_packet_process(sk, skb);
> > +             release_sock(sk);
> > +             sock_put(sk);
> > +
> > +             skb =3D skb_dequeue(&qn->backlog_list);
> > +     }
> > +}
>
> [...]> +/* Create and transmit a new QUIC packet. */
> > +int quic_packet_create(struct sock *sk)
> Possibly rename the function accordingly to its actual action, i.e.
> quic_packet_create_xmit()
I will use quic_packet_create_and_xmit().

>
> [...]> @@ -291,6 +294,8 @@ static void __net_exit quic_net_exit(struct
> net *net)
> >  #ifdef CONFIG_PROC_FS
> >       quic_net_proc_exit(net);
> >  #endif
> > +     skb_queue_purge(&qn->backlog_list);
> > +     cancel_work_sync(&qn->work);
>
> Likely: disable_work_sync()
>
Will update it.

> >       quic_crypto_free(&qn->crypto);
> >       free_percpu(qn->stat);
> >       qn->stat =3D NULL;
>
> EPATCHISTOOBIG, very hard to process. Please split this one it at least
> 2 (i.e. rx and tx part), even if the series will grow above 15
>
Sure, I will do it.

BTW, about the MAINTAINERS entry Jakub mentioned, should I
create a new patch for it, or append it in one of these patches, like into:

[PATCH net-next 02/15] net: build socket infrastructure for QUIC protocol

Thanks.
