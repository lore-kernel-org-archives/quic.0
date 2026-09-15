Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B33AFB06
	for <quic@lists.linux.dev>; Tue, 15 Sep 2026 21:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508071; cv=pass; b=GV3Se/XklptDQ3bOWkVQ0w1XOe5BRjhQSepN8hXRt8tNa2BsJ+870Z11KkPbIkUKVhdCQPfpBcXUTUgRzgV8jamhL+5uSPTtBzZYy8O7ll5ALVIHvhwbLmIjiqYS63NDIo7WzHxv83o1YSeStdPoBZvkuwj3X4nS00g9IPvqvEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508071; c=relaxed/simple;
	bh=3tSi6YPO6dZgLOttRBqCdbt4IoBwpA72PAaMe+M45Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2F/vixbj36LtZQ2vSmscyS1+HmGw0by1CdKVOikqVb51xVzqAa2VoVn//F46ISRWEfjCJ2yHXGbqATBdUesyhDRwq6FWWS+PBM46mzkkYWE+PZkk/Ax/Bn7IiWnwFMC6bRgqoWXwUQr2dYQ/jI1DoIXyqVkJ4r5TOBN+cDHsnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeF6IWkj; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeF6IWkj"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a3490bso197179b3a.3
        for <quic@lists.linux.dev>; Tue, 15 Sep 2026 14:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508069; cv=none;
        d=google.com; s=arc-20260327;
        b=OeJ5/0S1URG8wqoRN3QfRn7pckY1kLXNu+aINlcm3UUXdHvaYq/qJk9Iim5hYX6b/5
         GxI6Uv3flnT+T6A3TeI96lAhLPER5mBvmfeCGAdosga63pToJm6Z1Y4LdQ6TVGIENO9D
         z0AgqNHUrWV8w1J3H/HKJbtHJ+cM2KzTPQsgRcEhzEFN+ztYACLV1dSo76895i/putTz
         im4Hqro5xYdYqwlkaoahMKdswz3f/2IMfZFBngprqDY0p5OgkPPeWWCJ+eixH4+Z+htZ
         RIVKMt4IkIdR5k/9n3w8GEhRg5kFtdzDrNpJH3HwiKjG8j1FeMAOlhHO07RrSSk0qzyF
         /BwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fEUb43A7umW3ihvJnwkK88IB+JsXUCBhQ/HexoLCXg=;
        fh=l1p0UzKpojTosCpX5uIZKxfp/0ZPt7buYflg3lUnlkw=;
        b=Hf9zeCYrqSNS5mOsucQbTao16PnWjCLbyal/7k6ORfWYp7JppTF3HRxVAKyZW0iupF
         NS8lWuaN90mj78sh6hFwM9fj7aCQpAcjLHn5GbCKzE7C5Nl90Yce+g0hfp/rWSYEYnkF
         gAv2qBXhw8ptBfgDx3vy6c5fuAmazFAgvs9ixi/h7LpodsIqnQwXRucVV+/xPnizckiX
         7lLdvs7xXgK+1envN6ngbG4pi4OEpq/K8wH4MjpG4lX7FEgltVtj97Y8MdJoEziOsrac
         1ItyeA4IYGZ+l6j/3d2TrWj8ibVS14tINGD3bSGlgZgF6aS5pr9yepKRSRxnJaTY7b5w
         eTPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789508069; x=1790112869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fEUb43A7umW3ihvJnwkK88IB+JsXUCBhQ/HexoLCXg=;
        b=HeF6IWkjp2y1826RN0ImWtM5n+6GMLPtW0Vnoq2BtmqSz7h4c4yQtex/9aTbvUQz4g
         QyC8LUMJmpSlTkUPxzOBJC+Nj36yw76Hun9IQtBmapwBXWNqfRnBafbii1kReVX2BECV
         ItI8e0qt0Gmr9/CKmO+4eqUlUNrEOdnm/6SZNhq+x5mmMYUd5OVdB0GY/Y15UwEuyD5s
         JJYFzqB4f9eYMaAHH/KehZhWJ0cAnJAkc2jcvV0k32hh4W40HS7du0KrN8MlNIfBEzng
         mGTNeTLnlt60hwnQe4QjsNcBUa4AXwjkkUNEjuvVdKK55NL34R6TVCeStH8rdt8owhtX
         TNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508069; x=1790112869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fEUb43A7umW3ihvJnwkK88IB+JsXUCBhQ/HexoLCXg=;
        b=TpSAYyFYiDNQhnki6Cjg9ImroSG1ecy6sX+8mxHFm+K9iAS5QDhyfbQPW/e4lzamkc
         WNH0OJVUkWhjhMB7BsyhKtlHcVJB0yK8wuyqRxPACiRyBVBw6RyHFF2bTJqpHoi0Twox
         yAGTOwwuhB1R1QYzaG5tLncyXjrUVeV1KVEzzxz0a59UsIVo2lcC6wOYt5nLqldNfPbe
         g6FN7RYJHBKudRhrS9c2QDb+gB8JRhhAgH8XU2G7Y0bPNEvCyaGtqmvftTlIVelKQ4OK
         CTmp9exqH+p5PwEoF3VtRKQToae9NtAX7SiRBfi4kN2vg9eg5/YGpPq2HuaH1WFea5G1
         gsQg==
X-Forwarded-Encrypted: i=1; AKwUvByz66gfOLN9XIPUFHQTxsJCitqdS1H3U6iaMoQNVZOZO2KocA1YTIXh4arYwaVtjo57Zwkl@lists.linux.dev
X-Gm-Message-State: AFuF++lEu/E7dq3UyTEsbA0SOuQnFVg9Q3PEBlS796Vzap8DrGn1T1sQ
	b7tUrY8n+PEXvpPwjfuMU0wKxodPPAhU7EIJbDkW6s04/UWRNkGhWjXfuDkXYqeEtPBd4adIOZ7
	T8n69GHjJ6TiDyC7hSLr2ipfgF8z5F8Y=
X-Gm-Gg: AYBFou34Oa73HuKZe7ZvQkKXFL5bWYXHM3DzQ4JI4aoXiS27/PeE8e6kJYpX0QSvrmE
	lYlDNEpkhvCa8mZZkasitaMbxhzylXJupQf1Zg24xkqi+N2KYWjCB9g6aCPW+s7z806wt/eLoFv
	gZ1T7PGDrJs3xUOwkxXaozpYr0y8DmIwy9IsXVByfGGWXq51gI8wXgHM/UInpZijV+Bke1kuptC
	MC9sHpqSuJzG917aSIQpi40v50qZxq+5Ue9CcSRCOCRd6K6mSgZynDGuWWY0AgIBexkXwZM8l2Z
	QhOFk3xKO38GtHNtARux7byAgigIYgxnTkZ/N3ej6XRa/AyyWvELAXt08lh21AFWag02te3L1cD
	+zgLIURBsVs+9C9flCaw0a9oLfcve9xCvN6Vwv3C9oLeYINyFdA+tnw==
X-Received: by 2002:a05:6a20:914f:b0:3da:bd6d:bef4 with SMTP id
 adf61e73a8af0-3dd5f5ab21cmr393026637.13.1789508069183; Tue, 15 Sep 2026
 14:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <40d0796769992c78bffe59b179833d71ed80e771.1789393775.git.lucien.xin@gmail.com>
 <178950186149.22033.824022402798948504@kernel.org>
In-Reply-To: <178950186149.22033.824022402798948504@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 15 Sep 2026 17:34:17 -0400
X-Gm-Features: AcwNN1UCuBUgm-EOueiaZPczPJIdPSEaimJ2WD6qHGHnlwNL-00IDB4em_SMmw4
Message-ID: <CADvbK_foTup7AgsmLPa0=Wabmkj=6QFrzYZ1jFRQX+Wti1_Vbw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
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
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:51=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 5 =C2=B7 Low: 1
>
> - [High] quic_request_sock_create() publishes a newly allocated request
>   before its first packet is successfully queued: it links req into=E2=80=
=A6
> - [Medium] Commit message understates the scope of the patch and does not
>   disclose that the newly added listen-side connection-establishment=E2=
=80=A6
> - [Medium] quic_listen_sock_lookup() passes hdr_len =3D 1 to
>   reuseport_select_sock() (net/quic/socket.c:292-293), but by the time=E2=
=80=A6
> - [Medium] In quic_accept_sock_exists() (net/quic/socket.c:132-135) and
>   quic_listen_sock_switch() (socket.c:~330) the indirect call is=E2=80=A6
> - [Medium] A QUIC Initial decryption failure inside
>   quic_packet_get_alpn() is counted twice and once under the wrong=E2=80=
=A6
> - [Medium] quic_packet_listen_process() treats every non-zero return of
>   quic_crypto_verify_token() as a peer token-validation failure.
> - [Low] The documented meanings of struct quic_packet's saddr/daddr are
>   the reverse of the new receive-side implementation.
>
> --
>
> quic: add packet parser base
>
> This adds the RX side of the QUIC packet handling: quic_packet_rcv() look=
s
> up the socket for an incoming datagram, quic_packet_process() dispatches =
it,
> and ICMP Packet Too Big errors are turned into PMTU updates.  A listener
> path with ALPN parsing, request sock creation and a per-socket deferred
> workqueue is added as well.
>
> A few questions on the new code below.
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 1e278a2109b2f..0fcb123d31bba 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -24,6 +24,324 @@ static void quic_enter_memory_pressure(struct sock =
*sk)
>
> [ ... ]
>
> > +/* Create and enqueue a QUIC request sock for a new incoming connectio=
n. */
> > +struct quic_request_sock *quic_request_sock_create(struct sock *sk,
> > +                                                struct quic_conn_id *o=
dcid,
> > +                                                u8 retry, gfp_t gfp)
> > +{
>
> [ ... ]
>
> > +     /* Enqueue request into listen socket=E2=80=99s pending list for =
accept(). */
> > +     list_add_tail(&req->list, quic_reqs(sk));
> > +     sk_acceptq_added(sk);
> > +     return req;
> > +}
> > +
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
>
> [Severity: High]
> Can this path leak the quic_request_sock and permanently consume an accep=
t
> queue slot?
>
> quic_request_sock_create() already published the request before the first
> packet was queued:
>
>         list_add_tail(&req->list, quic_reqs(sk));
>         sk_acceptq_added(sk);
>
> and quic_packet_listen_process() then hands it straight to the enqueue:
>
> net/quic/packet.c:
>         out:
>                 /* Add to backlog list and wake blocked accept() calls */
>                 return quic_request_sock_backlog_tail(sk, req, skb);
>
> On the -ENOBUFS path above only the skb is freed.  The request stays link=
ed in
> quic_reqs(sk) with an empty backlog, and sk_acceptq_added() is not undone=
.
>
> The size test is deterministic for a given packet size, since limit is
> max(sk_rcvbuf / sk_max_ack_backlog, QUIC_MIN_UDP_PAYLOAD * 4), so a clien=
t
> sending a large Initial fails on the first attempt and on every
> retransmission, and the slot is never reclaimed.  Repeating with differen=
t
> addresses or DCIDs would then make sk_acceptq_is_full() refuse all furthe=
r
> connections.
>
> Should this failure path unlink and free a freshly created request, or sh=
ould
> the request only be created after the first packet is successfully queued=
?
>
False:

This does not leak the quic_request_sock. The request remains on the
listener's accept queue, so accept() can still consume it and create the
accept socket.

Dropping the skb here only means that this particular packet was not queued
due to the buffer limit. The peer is expected to retransmit the packet, and
once the connection is accepted, the retransmitted packet will be processed
by the accept socket.

(I will check those with 'Severity: Medium' of this patchset tomorrow.)

Thanks.
