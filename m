Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792530193;
	b=v6zRahtGVIC1jQPTry27G0EKAtJrVnAZL4kcgSgFHaJsF4+wppkjzfhEWGMD0HOUwB81
	 gw15kYci1DJ6rvFNK1XWcCe1wgMYHtOpV1uFcipzx5Oq+fuSZ8OBGBO1t/gc4Qw6jmDUu
	 W2QJ/rV4xw6coQ7T1nYq/TQ1nZohw+xQbEYstft0OI9JW5ZzYh9Bwa7IOJ+KHuwL55BbQ
	 4+YxgjxKClcaquuOMArQ8iu5zoDYY2gVsY/dx4bpLk6eaXI+LyvXOkCRiNdxBui+smq5e
	 uKoLv3qGS+UTxoMs2nz6lvslyp+nYPlSYtfW/g92X5db4AOL6+ZlBW80fsdz6Nt821A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P+M7CfskTRpfCCmHZHh6Qk0GgoGpx6QjJDA8d2t+rA0=;
	b=4QCtE6YHz8eyMjta8n8B8S5DLp96uH/eKxKX4sfDT4TcJLJrwfsAAHp6nnrIa8Rtf1pT
	 vaBZt9xPW2U0YdG6PvXkWGLrHeOMcj0zIWCs11O4LjHLpXWzQ6N7cEW/Rpf00jWTKAex3
	 TThFuotLekPGzp4UL13Gkhh0ehMlznaVOBMP/8X+Zh4KNy8Wi2WqB+tHeJKJD8UKKp4T7
	 3tPO+fpLBSNnd1F7eFK6bctrtHDLzg+OaXh5nNaIMhMXHtzgtNRPbdxSYmd1VbD8+GGw1
	 ht6/gYw6eusszd60N6HNnCv2KionW1UtQYE/sZv4ZFFrJ3kk07RbTL1/FnWqtq/hJ+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LvxxkWD5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3369606A31D
	for <quic@lists.linux.dev>; Tue, 20 Oct 2026 21:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3369606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LvxxkWD5
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06c60065fso33549b3a.1
        for <quic@lists.linux.dev>; Tue, 20 Oct 2026 14:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792530192; cv=none;
        d=google.com; s=arc-20260327;
        b=nnclYQeLCPUPjOs1jK9t72FIKm7JcniOz3ukMIyKLMlKTLvc0pY0Vsj1mGy80WMab3
         sAt3UV+RS6swhqmj5oz4/aEQiNxthdefGXO4FdPLwBEmdQaF1DRvoAh/YrNi34zFEhxM
         tVz6vltkk697wv35CIvORBKh6Vsywg8KyM9+mfb0ZA5GP1WVtVejCSjMHQ7y1MiUQLl3
         k2jYKGaEsw4SCh1Ok1ltpDVhGuX4bKRLwPSIubmckQrWjJCOx+GXGEFd2O4+4JEvySvL
         ceCZQ/j9Ka0iU9wCrns75XZV6Y3qQRacbIjM/kNFARNvpdrwuWdm2Z7CPMeBQCaCXPgE
         jEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P+M7CfskTRpfCCmHZHh6Qk0GgoGpx6QjJDA8d2t+rA0=;
        fh=EbD37QVIjXSMSTMkauAyFB4ckm6tZSjqMmGCAjw6RU4=;
        b=G9Gkr2fXtN+a3LpTUD9GT6CkhPxKSoOqP39l1aBWwbrmKyn0J2kiW293klCuV180mw
         bW5oNH8Vbx01z1xrFwpG5keFbZXb1mpFy4ADfLCOXbi3aoL/DMkHIgGLDgvrxSL3vHAq
         vOxqrHqlvOC3GeX262uEdyJry34dcvJ0NonC0CNrYWrQ6kr6iMvMu4iuoL8qS1ypN2XC
         cPYgtOvxBcyByMlPDtwXpvWkTDvwlLrJ3TydmJjGakfT7yhU6KXprhB89MY1T9G1avbp
         AenlmByFfBtFHlJuugEsaVWFl2bcUo7FtHcJY88CbT7TPJcQIJjC8LUTIAssmDQZ51jz
         OGJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792530192; x=1793134992; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P+M7CfskTRpfCCmHZHh6Qk0GgoGpx6QjJDA8d2t+rA0=;
        b=LvxxkWD5vquEJRFMWfYnVxHiiJzqjDQjCL3vAmtp5AXWDkm18YIX8UTwobO0Yj14hT
         nEOOzQj1zzpyFXdGKKm8EHjAmPxQvKaIvxWO/+qJ56EEp7O06dDnkFf2NjKpOBZOjDEK
         USMslg6dqfL3w3gibomCgsj6rF71Wx66BQ9t5JkESZmPU8NTb7F1tR1z/88OnnkueNC4
         TgO2tzs0lBA12yQtj6n88HrU/fxkNRSdufVEDc8eC4Nzej7e7yDaC/8CKZSiZu9I4nB/
         zre4fiAPGIuVJBFGrA+qb+oG973kff4wuWWEeWl8LNbAoI6oZ9gW3LgVjGe+MwNO+5n2
         TolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530192; x=1793134992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+M7CfskTRpfCCmHZHh6Qk0GgoGpx6QjJDA8d2t+rA0=;
        b=SnNcBYzD6RuWwNjxYmzO3BuZrGGhEqAfZJxOprkwaeo+smCXxp/YwDYpcMh1LesAZD
         lYHj3yfhAmXYedalVGpxpacH2AE+gSTAhXM8lFgsr40GXbFlcQP3hE3O/PAhUoClC78h
         y5LuB93WMA+jEiu7quEGkc6rn4pWssJQRdo/C98SmfeDj6WDafzJJF1H9XDlBSBzNTbW
         gT04+jWXXaUo6kP7W2YlEUoM9Fc2aCoaZzMWANo+KWJaeXzxl3z8FINs+TuMdRkWBHEo
         4udM5fp2DgjJNoS0Ct2JsC+ET5DRYmP+QZ3D7+mv0KchYE20ooMDpGBrncgqCCAF8O3O
         NDkw==
X-Forwarded-Encrypted: i=1; AKwUvBw5YXtj7fp9ZmmcVrP4RgWmuiwnxwQQZ/MV/xCHdYw0OMNX1ZX1ZwymLmc1p+I1BUQuxydA@lists.linux.dev
X-Gm-Message-State: AFq9FYIYWHxTF7/7TVLgwhldHKrp0UuedDZ8iklXTYUwYuQ6BnMBPcxQ
	F0IERk382F1DOYueJqo3w9RmLAWy3odteAtQWfYOJ8MxznQQf/LcXx+mWlvoBU0pPyaRmfJu4PD
	uBye5cEKoCpm775J3tCdgP3Wt/Guf1xo=
X-Gm-Gg: AYBFou03noAraJyeVaYOU4RzARbUYjcFtdP19crqdnEbzYhVcvPB4PAj3Ff1MOqXsks
	5Tpl/Rw0YK4lG801kKZAC3dwvBGnzy0HmK4od54ymLOGbIgNGik9XqOAsz2keT+mRz9vSOl4sbz
	0ygBcJ2ZP/QTOKw7xMbA9pM7jfEYIacJpFTQCD3ioe81O6EdNMRBjiciIFnjBacfTM0l/JN75cE
	ygMy56eKXaqZWQHYyu53zqznio2TELxHELbwwU9JckJsf7iOTvQEPFWJMo+nZOIf5gtCEGJqRUY
	y11oykKltUtcCjcILplnZFZOkSf5qT9CkhxS9G2oH/g3rlxhABhgGNSuO/fuz1s4z66oeitH8sK
	qYmivehfQXv12CM3vQrGpnsjdk2thGO07eM2AxiPo8LMykrlQ/CGfhyX6ndy7S/lsKO26KebQ6Q
	5iKqJNRC58ruoE
X-Received: by 2002:a05:6a00:2da9:b0:8a0:8848:8c6c with SMTP id
 d2e1a72fcca58-8a089ce8f78mr109412b3a.12.1792530191760; Tue, 20 Oct 2026
 14:03:11 -0700 (PDT)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <47ec29f97f3986e6b9cb5b07f109dcae340916e6.1792164438.git.lucien.xin@gmail.com>
 <179244541026.3135.1595523596507400028@kernel.org>
In-Reply-To: <179244541026.3135.1595523596507400028@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 17:02:58 -0400
X-Gm-Features: AclHuK8v95g8ztNuG9E9AbrqjvVlozrNsBMaZdXl4ZuQOU1-dXrL-PgzpONNaKU
Message-ID: <CADvbK_eiVcp=00D=2D5WToq+1P-U2n8FenQMqqTPbgS_3goDPw@mail.gmail.com>
Subject: Re: [PATCH net-next v17 15/15] quic: add packet parser base
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, linux-cifs@vger.kernel.org, pc@manguebit.org, 
	linkinjeon@kernel.org, tom@talpey.com, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com, jlayton@kernel.org, steved@redhat.com, hare@suse.de, 
	aahringo@redhat.com, dhowells@redhat.com, matttbe@kernel.org, 
	mail@johnericson.me, xiyou.wangcong@gmail.com, alibuda@linux.alibaba.com, 
	jbaron@akamai.com, illiliti@protonmail.com, sd@queasysnail.net, 
	marcelo.leitner@gmail.com, daniel@haxx.se, andrew.gospodarek@broadcom.com, 
	mef@scarletmail.rutgers.edu, paul@jakma.org, kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 4
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] When PLPMTUD is disabled, ICMP Packet Too Big messages never
>   lower the MSS.
> - [Medium] quic_accept_sock_exists() (net/quic/socket.c) passes an skb to
>   an accept socket's sk_backlog_rcv() while atomic: local_bh_disable()=E2=
=80=A6
> - [Low] quic_packet_get_connid() rejects any connection ID longer than
>   QUIC_CONN_ID_MAX_LEN (20) regardless of version.
> - [Low] quic_request_sock_backlog_tail() calls __sk_rmem_schedule(sk,
>   len) before skb_set_owner_r().
> - [Low] quic_packet_deferred_work() drains deferred_list while holding
>   lock_sock(sk) and never calls cond_resched(): `while ((skb =3D=E2=80=A6
> - [Low] quic_packet_get_alpn() prints the u32 field alpn->len (struct
>   quic_data in net/quic/common.h) with %d: `pr_debug("%s: alpn_len:=E2=80=
=A6
>
> --
>
> quic: add packet parser base
>
> This patch adds the QUIC receive path. Sockets are looked up by
> connection ID and address, and packets are dispatched by socket state.
> Listen sockets handle client Initial packets (request sockets, ALPN
> demux, deferred work), and ICMP Packet Too Big errors update the path
> MTU.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index 56d2b8df292a0..a2f836cc22d70 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
> > @@ -14,6 +14,801 @@
>
> [ ... ]
>
> > +/* Extracts a QUIC Connection ID from a buffer in the long header pack=
et. */
> > +static int quic_packet_get_connid(struct quic_conn_id *connid, u8 **pp=
,
> > +                               u32 *plen)
> > +{
> > +     u64 len;
> > +
> > +     if (!quic_get_int(pp, plen, &len, 1) ||
> > +         len > *plen || len > QUIC_CONN_ID_MAX_LEN)
> > +             return -EINVAL;
>
> [Severity: Low]
> Should the 20-byte connection ID limit be applied before we know the
> version is supported?
>
> quic_packet_get_long_header() is called from quic_packet_get_sock() and
> from quic_packet_listen_process(). Both calls happen before the
> !quic_packet_compatible_versions(version) branch that sends Version
> Negotiation.
>
> So a long-header packet with an unknown version and a CID longer than
> 20 bytes is dropped as an invalid header, and no Version Negotiation is
> sent.
>
> RFC 9000 section 17.2 limits CIDs to 20 bytes only for version 1.
> Sections 5.2.2 and 6.1 say a server SHOULD be able to read longer CIDs
> from other versions so that it can send Version Negotiation.
>
> [ ... ]
>
> > +/* Process PMTU reduction event on a QUIC socket. */
> > +void quic_packet_rcv_err_pmtu(struct sock *sk)
> > +{
>
> [ ... ]
>
> > +     info =3D clamp(paths->mtu_info, QUIC_PATH_MIN_PMTU, QUIC_PATH_MAX=
_PMTU);
> > +     /* If PLPMTUD is not enabled, update MSS using route and ICMP inf=
o. */
> > +     if (!paths->plpmtud_interval) {
> > +             if (quic_packet_route(sk))
> > +                     return;
> > +
> > +             dst =3D __sk_dst_get(sk);
> > +             if (dst) {
> > +                     dst->ops->update_pmtu(dst, sk, NULL, info, true);
> > +                     /* Re-read actual MTU after update_pmtu, which ma=
y have
> > +                      * rejected the increase. Only use values accepte=
d by
> > +                      * route layer to prevent spoofed ICMP from raisi=
ng MSS.
> > +                      */
> > +                     info =3D clamp(dst_mtu(dst), QUIC_PATH_MIN_PMTU,
> > +                                  QUIC_PATH_MAX_PMTU);
> > +             }
> > +             quic_packet_mss_update(sk, info - packet->hlen);
>
> [Severity: High]
> Does this ever lower the MSS when PLPMTUD is disabled?
>
> With skb =3D=3D NULL, ip_rt_update_pmtu() builds its flow key through
> ip_rt_build_flow_key()->build_sk_flow_key(), which takes the
> destination from the socket:
>
> net/ipv4/route.c:build_sk_flow_key() {
>     ...
>         __be32 daddr =3D inet->inet_daddr;
>     ...
> }
>
> When there is no packet header, __ip6_rt_update_pmtu() does the same
> with sk->sk_v6_daddr.
>
> Nothing in net/quic sets inet_daddr or sk_v6_daddr, and ip6_dst_store()
> is called with daddr_set false. The exception would then be created for
> 0.0.0.0 or :: instead of the peer.
False.

inet_daddr/sk_v6_daddr is always set whenever the dadd is updated/set
in the quic sk.

>
> Even with the right key there is a second problem. When
> update_or_create_fnhe() creates a new exception, it only marks the
> cached routes obsolete:
>
>         WRITE_ONCE(rt->dst.obsolete, DST_OBSOLETE_KILL);
>
> It does not change their MTU. The IPv6 path inserts a new RTF_CACHE
> route and leaves the old dst unchanged.
>
> So re-reading dst_mtu(dst) on the same cached dst would return the old
> MTU, and quic_packet_mss_update() keeps the old MSS.
>
> If that's right, the v17 change to re-read the MTU after update_pmtu()
> makes the ICMP-driven reduction a no-op. plpmtud_interval is 0 by
> default, so a path whose PMTU is below the local MTU could stall:
> full-size DF packets are dropped and the PTBs are ignored.
>
> For comparison, SCTP temporarily sets the socket daddr around
> update_pmtu() (to_sk_daddr()), and inet_csk_update_pmtu() re-checks the
> dst with __sk_dst_check() afterwards. Is something similar needed here?
True.

I will change to just call __sk_dst_reset() after .update_pmtu() and later
quic_packet_mss_update() will be called to update mss whenever
quic_packet_route() is called.

Thanks.

>
> [ ... ]
>
> > +     pr_debug("%s: alpn_len: %d\n", __func__, alpn->len);
>
> [Severity: Low]
> This isn't a bug, but alpn->len is a u32 in struct quic_data, so %u
> would match it. The v16 changelog made the same fix in quic_packet_rcv().
>
> [ ... ]
>
> > +/* Work function to process packets in the deferred list. */
> > +static void quic_packet_deferred_work(struct work_struct *work)
> > +{
> > +     struct quic_sock *qs =3D container_of(work, struct quic_sock, wor=
k);
> > +     struct sock *sk =3D &qs->inet.sk;
> > +     struct sk_buff_head *head;
> > +     struct sk_buff *skb;
> > +
> > +     lock_sock(sk);
> > +     head =3D &quic_packet(sk)->deferred_list;
> > +     while ((skb =3D __skb_dequeue(head)) !=3D NULL)
> > +             quic_packet_process(sk, skb, GFP_KERNEL);
>
> [Severity: Low]
> Was the cond_resched() from the v12 changelog lost in the v15 rework?
> The v12 entry reads:
>
>   "Call cond_resched() in the loop inside quic_packet_backlog_work()."
>
> Each iteration here can run synchronous AEAD decryption (cb->sync =3D 1),
> GFP_KERNEL allocations and token verification, all under lock_sock().
>
> On the quic_listen_sock_switch() path, the listener lock is dropped and
> re-taken in the middle of this loop. Under sustained traffic, packets
> processed from the socket backlog in that window can keep adding to
> deferred_list, so the loop keeps running.
>
> > +     release_sock(sk);
> > +     sock_put(sk);
> > +}
>
> [ ... ]
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 0173416d0368a..c75d2dcaba9d4 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -24,6 +24,319 @@ static void quic_enter_memory_pressure(struct sock =
*sk)
>
> [ ... ]
>
> > +int quic_request_sock_backlog_tail(struct sock *sk,
> > +                                struct quic_request_sock *req,
> > +                                struct sk_buff *skb)
> > +{
> > +     u32 limit =3D sk->sk_rcvbuf / sk->sk_max_ack_backlog;
> > +     int len =3D skb->truesize;
> > +
> > +     limit =3D  max_t(u32, limit, QUIC_MIN_UDP_PAYLOAD * 4);
> > +     if (req->blen + len > limit || !__sk_rmem_schedule(sk, len, false=
)) {
> > +             QUIC_INC_STATS(sock_net(sk), QUIC_MIB_PKT_RCVDROP);
> > +             kfree_skb(skb);
> > +             return -ENOBUFS;
> > +     }
> > +
> > +     QUIC_SKB_CB(skb)->backlog =3D 1;
> > +     skb_set_owner_r(skb, sk);
>
> [Severity: Low]
> Can this push sk_forward_alloc negative when the skb is already charged
> to this listener?
>
> Consider a second Initial packet for the same connection that was
> deferred through quic_packet_deferred_schedule(). Its destructor is
> already sock_rfree, and in quic_packet_listen_process() it takes this
> path, which skips skb_set_owner_sk_safe():
>
>         req =3D quic_request_sock_lookup(sk);
>         if (req) /* If request sock already exists, enqueue packet direct=
ly. */
>                 goto out;
>
> In quic_request_sock_backlog_tail(), __sk_rmem_schedule() reserves the
> memory first. skb_set_owner_r() then orphans the skb
> (sock_rfree()->sk_mem_uncharge()->sk_mem_reclaim()) and charges it
> again.
>
> The reclaim can return the pages that were just reserved, so the
> sk_mem_charge() that follows can leave sk_forward_alloc below zero.
>
> For example, start with forward_alloc 2000 and truesize 2304:
>
>   schedule adds a page:      6096
>   uncharge:                  8400
>   reclaim leaves:            208
>   charge leaves:             -2096
>
> Would orphaning the skb before the __sk_rmem_schedule() check avoid
> this?
>
> > +     __skb_queue_tail(&req->backlog_list, skb);
> > +     req->blen +=3D len;
>
> [ ... ]
>
> > +     /* Look up accepted socket matching packet addresses and DCID. */
> > +     local_bh_disable();
> > +     sk =3D quic_sock_lookup(skb, &packet->daddr, &packet->saddr,
> > +                           quic_path_usock(quic_paths(sk), 0),
> > +                           &packet->dcid);
> > +     if (!sk)
> > +             goto out;
> > +
> > +     /* Found a matching accept socket. Process packet with this socke=
t. */
> > +     skb_orphan(skb);
> > +     bh_lock_sock_nested(sk);
> > +     if (sock_owned_by_user(sk)) {
> > +             /* Socket is busy (owned by user context): queue to backl=
og. */
> > +             if (sk_add_backlog(sk, skb, READ_ONCE(sk->sk_rcvbuf))) {
> > +                     QUIC_INC_STATS(sock_net(sk), QUIC_MIB_PKT_RCVDROP=
);
> > +                     kfree_skb(skb);
> > +             }
> > +     } else {
> > +             /* Socket not busy: process immediately. */
> > +             sk->sk_backlog_rcv(sk, skb); /* quic_backlog_rcv(). */
> > +     }
>
> [Severity: Medium]
> Should cb->backlog and cb->sync be cleared before the skb is handed to
> the accept socket here?
>
> When this runs from quic_packet_deferred_work(), the skb came off
> deferred_list with cb->backlog =3D 1. An skb that went through
> quic_listen_sock_switch() also has cb->sync =3D 1 and cb->resume =3D 1, s=
et
> by quic_packet_get_alpn().
>
> The call path here is atomic:
>
> quic_packet_deferred_work()
>   quic_packet_process()
>     quic_packet_listen_process()
>       quic_accept_sock_exists()
>         local_bh_disable()
>         bh_lock_sock_nested(accept_sk)
>         accept_sk->sk_backlog_rcv()
>           quic_packet_process(..., GFP_ATOMIC)
>
> Elsewhere the patch treats cb->backlog as meaning the context can sleep,
> for example in quic_packet_deferred_schedule():
>
>         if (cb->backlog)
>                 return 0;
>
> quic_crypto_decrypt() also checks !cb->backlog before doing a key
> update, and cb->sync forces a blocking crypto wait.
>
> The handshake and app handlers are still stubs in this patch. Once they
> are filled in, could these leftover flags make them sleep while holding
> the spinlock with BH disabled?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1792164438.git.lucien.xin%40gmail.com
