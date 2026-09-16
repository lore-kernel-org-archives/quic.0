Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB355013D4
	for <quic@lists.linux.dev>; Wed, 16 Sep 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575662; cv=pass; b=MF1nR284/hf8PD6t4RvQ5/95MFMsBcvKKDTikqQ9m9wxwP4T8Ng6ghSG/SkLC4VdkpVW6Q/72EHFJ1Cz8TFNNUHnMJ25iWQWZqjggXJb7HdxFbPjFDceV6jDiAd0LaK+hS+yP1dGCTEzyAFCagRxNCXtwaQHxqp57OB8Y1N4UEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575662; c=relaxed/simple;
	bh=FPz/2WUVvjgw7KkPB3vp0v3QrEeT+i8/AjpDko6jgx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CELmMeOSlAPzTk1xijjvCFviA3Wzv+vs52oMMzzbmIL3zqp/ba5s0mguhoIlMXIHTD2WCZBvMKJv795uUg5QfMDowWp+veFTSqGBvA2erx+315YTsLOTuIwmxPaeN1ch0GpdZKodrWFQieoWaQwVTQpTkJKWNv/z8XNOPJI4yIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6gq4a8H; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6gq4a8H"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a3so876774b3a.2
        for <quic@lists.linux.dev>; Wed, 16 Sep 2026 09:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789575659; cv=none;
        d=google.com; s=arc-20260327;
        b=scgy2DB9FteT/ladahfocpb0iQw//E/tC+LAO8NBb8jJC+cscrTShgxG7Ydv77f8Hw
         FBG1JNxXw4Zs9+usgyBQcYFW8aKqERdnKYHyXTpyLirWikc6pEP/mEFqRss9OfdWzKRL
         CGaCCNbqQqkS63pbxpt+aaCb7EVoWedsXo0gh/e37ydux8l4zbRvS6btvrEp3pRO7IO7
         g5yvr1eXrFQQv+PODghERG5FHWpqu3XET9wYRSropsaS8rHMddRVcPlamwOrhTcHOwin
         KUkiFwmCziMBTn6pR3DNQt+2MOCZIw7ICfA9vjblnGtrWwJUg8964lyGratfdhf3UbEY
         I3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x758SQiPr4F20CkTzm4wFsu2ipWDv2Ry++hF6Myngkc=;
        fh=Pg3DDJ7Zkg+Kk40PS8jl4k0kj+yZiJjLUArPvc41DW4=;
        b=Z1WEN3DWDV8AVv1E9BriOiacGgZRQ9AXzZEfOzira4q2muq4Pnx5z4t0vqk7Q3Yc3k
         eFMO+P7SFJJLeMA5Xq8SR51MgLtqUg3Q/aNW64vUM8oRxzpxd0m+tadws9nmf6zAioa6
         v2v2oP0HSSpw65O2co4IFqYTfEBrC1EPHci241FMmnAnVtKqFZ+sJzy6jn6FH04sYi1A
         heaxq5IZSfVR/A5i3x7bxwB/0DqawmZ0guruXaIRrNuXhujQaFnTPXDed5oE47OBEaqM
         00flJwPILray48Zg/3dX8gzw/8GLVYq5T5kR/51dx/a0JkhbH7VvQrImgVg9x1S+6D18
         p/tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575659; x=1790180459; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x758SQiPr4F20CkTzm4wFsu2ipWDv2Ry++hF6Myngkc=;
        b=L6gq4a8Hfa2nVRne5+076j+9dF/HmpZZ37UXNtAZa6iisj1A2Z8kHW8+AAV8puvqpS
         1JHk6F9gPgZXuAq6TXkG0GwHsXIY6MpDfwCb118B/u/DR5qtFsbMNpov2Zg2pw/NFG/p
         POOC/Lf1cmN3/38m6QWymObvsmmNRPXN09cZri6Lraf1RWQ0yq41Pg6vpm8KUfsXMZF4
         NoYbcSYiBHOsAql9oD2oaKHrZQzdz1hw3OX1i0jnxZBk1+qVjoVzG0ZlhdKENOBQwSwq
         Zzor4ILe8BBwP/Et6HrqDMq7e7Nu8iJtwTtdIqZYoNkmOHRbxlA7HW2vR6kGjzgvJuwW
         oRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575659; x=1790180459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x758SQiPr4F20CkTzm4wFsu2ipWDv2Ry++hF6Myngkc=;
        b=LG3ST4XXovphUZMPu3WfwfAv9EuEbievqXVSoL57r+kf4LU69Yl+HEBsQ++4lfP7KO
         qda6+43HOCoEhCTf7SefGIqQ7Zt1gKGEPH/hwwiGSinm0GvUEQTa9aYIwnHXCNEVhhCo
         4hgYLpB+8PCsU5VKskEJVl4sSbluRB87hvpRDfm0v0pXhkHPNLnubJaFjlzpqIV8KzW5
         pDoKbncIhY8ND0yiVu9EfKz4WYv9v7Lnu9DPIqbtHILDOXTbE7W1sVZcA9WHw5vy2MSq
         3eqUpuP91IT1otIK0N8YJg0WH+5sjsKrXrNRBUskAUyrWJ9NOS5mu1mIuEuIm3738SnV
         mL0A==
X-Forwarded-Encrypted: i=1; AKwUvBw8l89M0T++NtYtjKoQaPyCcamBcTkaK9n+uaJus38UdmC1h7kDWjAd9O7E8Z62NyXUhrAt@lists.linux.dev
X-Gm-Message-State: AFuF++nD2Qcn88SHPu6BRpK57860pkDIui8lW3TioRsGC2u3Zz5jrtsb
	9jynJNJ96tS77c8u2L/PWpf9PnOW6j9RCeqoBngk4AkjJIXb0lDqaY4+1xXKimPKH7pRVV/mu0S
	SRpwSc0ffoeJBGIc6tdwLzDXWR5z8hUY=
X-Gm-Gg: AYBFou0Va+ze0ZCCvAN6SosQuwuYu3vlbgSFa3rbxzlG1XJr4OHK1TvykVfT3r0d42G
	62ow+q5/pbHBiNlOlPP8mydmBKJgoiRzNZIw8xhVFihrnLHZd9gEuJEn+ahcGmZbnJVh8GaoaF3
	WZHBHrgxYojl571KgsZKtgVEz44IPwqHAVF+LCtktKisQFpDiN6AkeKMiAgsZqpdZmkYnVDP0Bn
	k2Ng1Q4Rnhj43+BEnKM/7h6EY6LfW6dukHwYjJPIb8+gfaDV3MX7keHB6XSfXVt0mp81hKQUm/e
	PUfc7qu4j7eHFhYg9A/NCeIaGcWaVDfuKpAausrsiRXI5PThqadPuT+sJZ1xnpqLS5SY3UF1F7i
	y6gcVm704OayW9c2WU4BqZoHP+EpW7RjnxRMKfq0+fsWvds3yAl2mwXVz
X-Received: by 2002:a05:6a00:1888:b0:84a:60a4:2651 with SMTP id
 d2e1a72fcca58-87238c8aad3mr5950497b3a.6.1789575659295; Wed, 16 Sep 2026
 09:20:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <927bfa67165193368d642396c4b8fcfc580d494d.1789393775.git.lucien.xin@gmail.com>
 <178950185914.22033.7074901863240008115@kernel.org>
In-Reply-To: <178950185914.22033.7074901863240008115@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 12:20:47 -0400
X-Gm-Features: AcwNN1XmGdIGcCY3hppZmiydWNjDn39LITr2KKjk_zm8yrhQJrHdBYRINPy6wLg
Message-ID: <CADvbK_eN8x=MTceZrgNJRTGsGphQ2QsfJ0oNBET99VKBh=b9gA@mail.gmail.com>
Subject: Re: [PATCH net-next v15 14/15] quic: add packet builder base
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
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 3
>
> - [Medium] Unit mismatch in quic_packet_route()
>   (net/quic/packet.c:63-66): the *IP-level* MTU returned by dst_mtu() is=
=E2=80=A6
> - [Low] Claim that the commit message over-advertises the packet builder:
>   quic_packet_handshake_create()/quic_packet_app_create()=E2=80=A6
> - [Low] In struct quic_packet (net/quic/packet.h:24) the field comment
>   reads 'u16 mss[2]; /* MSS for datagram and non-datagram packets */',=E2=
=80=A6
> - [Low] Claim that quic_packet_xmit() (net/quic/packet.c:199) must bail
>   out instead of only warning when skb_set_owner_sk_safe(skb, sk) fails,=
=E2=80=A6
>
> --
>
> quic: add packet builder base
>
> This adds net/quic/packet.c and net/quic/packet.h with the TX-side
> 'quic_packet' state: quic_packet_config() sets the path and computes head=
er
> overhead, quic_packet_create_and_xmit() builds and sends a packet, and
> quic_packet_flush() sends any bundled packets.  quic_packet_init() is wir=
ed
> into quic_init_sock().
>
> A few questions on the new code below.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > new file mode 100644
> > index 0000000000000..a1967f39c9242
> > --- /dev/null
> > +++ b/net/quic/packet.c
> > @@ -0,0 +1,280 @@
>
> [ ... ]
>
> > +static struct sk_buff *quic_packet_handshake_create(struct sock *sk, g=
fp_t gfp)
> > +{
> > +     return NULL;
> > +}
> > +
> > +static int quic_packet_number_check(struct sock *sk, gfp_t gfp)
> > +{
> > +     return 0;
> > +}
> > +
> > +static struct sk_buff *quic_packet_app_create(struct sock *sk, gfp_t g=
fp)
> > +{
> > +     return NULL;
> > +}
>
> [Severity: Low]
> This isn't a bug, but could the commit message list all of the placeholde=
rs?
>
> It mentions that "Functions to create application (short) and handshake
> (long) packets are currently placeholders for future implementation", whi=
ch
> covers quic_packet_handshake_create() and quic_packet_app_create() above,
> but quic_packet_encrypt_done() is also a stub that frees every
> asynchronously encrypted packet:
>
> net/quic/packet.c:quic_packet_encrypt_done() {
>         /* Free it for now, future patches will implement the actual defe=
rred
>          * transmission logic.
>          */
>         kfree_skb(skb);
> }
>
> Worth naming that one in the changelog too?
>
> [ ... ]
>
> > +/* Perform routing for the QUIC packet on the specified path, update h=
eader
> > + * length and MSS accordingly, reset path and start PMTU timer.
> > + */
> > +int quic_packet_route(struct sock *sk)
> > +{
> > +     struct quic_path_group *paths =3D quic_paths(sk);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     union quic_addr *sa, *da;
> > +     u32 pmtu;
> > +     int err;
> > +
> > +     da =3D quic_path_daddr(paths, packet->path);
> > +     sa =3D quic_path_saddr(paths, packet->path);
> > +     err =3D quic_flow_route(sk, da, sa, &paths->fl);
> > +     if (err)
> > +             return err < 0 ? err : 0;
> > +
> > +     packet->hlen =3D quic_encap_len(da);
> > +     pmtu =3D clamp(dst_mtu(__sk_dst_get(sk)),
> > +                  QUIC_PATH_MIN_PMTU, QUIC_PATH_MAX_PMTU);
> > +     quic_packet_mss_update(sk, pmtu - packet->hlen);
>
> [Severity: Medium]
> Are the units on both sides of this subtraction the same?
>
> The clamp floor is applied to the IP-level MTU returned by dst_mtu(), and
> packet->hlen (the full IP plus UDP encapsulation length from
> quic_encap_len(), 28 for IPv4 and 48 for IPv6) is subtracted afterwards.
> So for a route whose dst_mtu() is at or below 1228 (IPv4) the result is
> 1172, and at or below 1248 (IPv6) it is 1152:
>
>         pmtu  =3D clamp(dst_mtu(...), 1200, 65535);   /* IP MTU */
>         mss   =3D pmtu - packet->hlen;                /* UDP payload */
>
> That value then lands in packet->mss[QUIC_PACKET_MSS_NORMAL] and in
> congestion control via quic_packet_mss_update() -> quic_cong_set_mss(),
> and it is also the coalescing limit in quic_packet_bundle():
>
>         if (packet->head->len + skb->len >
>             packet->mss[QUIC_PACKET_MSS_NORMAL]) {
>
> Can that put the UDP payload size below the 1200-byte minimum that
> quic_packet_init() installs as QUIC_MIN_UDP_PAYLOAD, and below
> QUIC_BASE_PLPMTU (also 1200, in net/quic/path.c) that quic_path_pl_reset(=
)
> writes into paths->pl.pmtu two lines later?
>
> Note dst_mtu() can legitimately come back well under 1200 after a remote
> ICMP "fragmentation needed", which is presumably why the clamp is there a=
t
> all.  Should the floor be QUIC_MIN_UDP_PAYLOAD + packet->hlen, or the
> resulting MSS clamped to 1200 instead?
>
> The three 1200 constants in this codebase denote three different layers
> (net/quic/path.h QUIC_PATH_MIN_PMTU as an IP MTU floor, path.h
> QUIC_MIN_UDP_PAYLOAD as a UDP payload size, path.c QUIC_BASE_PLPMTU as a
> packetization-layer size), which makes this easy to mix up.
>
False:

QUIC_MIN_UDP_PAYLOAD is only used for the minimum size of the Initial
packet when building or parsing it. There is no requirement for it to match
QUIC_PATH_MIN_PMTU or QUIC_BASE_PLPMTU.

Thanks.
