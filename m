Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E72D662F
	for <quic@lists.linux.dev>; Fri,  9 Oct 2026 01:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510187; cv=pass; b=prbnP6n9qSKshfQHt5ULciovoc9WpJP7lVQ+NDGyHehT1rni5hv8OrbSEv6Q60/gKMTSqV+vVwpr21dEO1ukVqIO67dLwdAOwZTQiJZydcy5FIqdSWDjbVgURQ2bCyqpSWOUQnmKXN933t5OgWnzDCwcDQEc0b76lpbPHe9AxTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510187; c=relaxed/simple;
	bh=n8YcwL7I6ncHN6Di+TjkLj9HcqFEku0JBz9C1UzgFh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dA83LvOXgCILBrme8wlqRoy0rkh++Y+y4yd6xvxXQsbU990pGj5zOMLSvaH6ZwapwUF/6MWH000/rYRQHepT9qfemRoZ/5KTs0TR1EZAgvWRa7enoHP3/fiAqEQF3ZpFsiKj97yJCqkQ43/HszxYzvWjkYkjBsuN8nQPLIjmAeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsFZ5dZO; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsFZ5dZO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-88a627ce016so1744691b3a.0
        for <quic@lists.linux.dev>; Thu, 08 Oct 2026 18:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791510185; cv=none;
        d=google.com; s=arc-20260327;
        b=PrfG5sLtX7+ZerUUgXbCP6Gxouvwr8x2hKp5zlbZC3okDXl7vnCK3PXO0rVT8HYkYI
         A2GA7JNWcD6Flfr8sCF9Fvqs6XYO2790rtJKIY5vkB6yBji0LA8EUVHZt+S8hVzmwEzR
         1csQ+RfO22o4oA4lCiZ4DOZMsTXZUunpYTbD3xsHXxcaxqLqQvqCbtj6eTx/uTNp559U
         dPZd5/PJPz93UhjoOCpGDeownyBLFdbbY3DuNjdq8xgMu2kePAKlyYN0eyD/gFS2Hpdq
         9askeLlMkZCmvsu9lnKDtVUgUHyY005wp8Z9rybLxxtT3mqhj7LMKb80/4LfTyHVEOVr
         vv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nvNO4+uRT42xaw6c57vhH/gJBgCPU/zxf+gr5Cfeshg=;
        fh=7h0Bi1MHHmXUcrxH6yX4Y02EInz3vkTAUa4k2i3/G4U=;
        b=Qa6rDJ8lsT7wMKW/dihZi5DREyix8/19vrdIfb6qgL0mYk9gsSDfHG73TlY5W6c54M
         qush8nuZ/jJJMi+RHpaW6+xrrC1TXnNT6BYS/NJdvWaNh/TXJ4/NT3SJhNE+afYh7F71
         Llq6+2b7NnFhAdRFzoTOm/OXitI0d0pCNhx/366XZu3GvRlbT9OLDTZwNtcfmoMgW1eS
         doFZJhvU4Ho21CkTSAKgCSJc6Q2B2bzPOxT+XXlhoAGW61/3mGQB/Cjj3pdgbK1Usw9o
         ovIR8FFlwGJS/APK1egmT3I2UhmTk5UVhb/EreRCpmhDhO72AQivDcS5z7CMpSknxUQt
         GyHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510185; x=1792114985; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nvNO4+uRT42xaw6c57vhH/gJBgCPU/zxf+gr5Cfeshg=;
        b=qsFZ5dZOJp+R8TbtcVUppDjWQhjLM1CsfkkS9JR2J5FvVxwHR9E9V4gfyAhXmzTPDI
         iaVRJJL5/2xgMW+CCAJiQLlusOBo03h1j6Tj7vZ/tskVjHZAsvF/0h1FBBM4hbzDsMpE
         qK0zzgQgTzRHzX5UQxRFeTRcM3PwjxLsyRxVu2L4L+bS0TSKjznx2QxqmarIigSjY49m
         BiEe73UCmrr7nEhHKm/6Xf8wDSbdzoo0qNazbPuA4lDXg3MLwQ8gslST+dkzYOKDY2Bi
         LtPW1779hca9LmAKNcwtIK8plqWlNdoSghPg5wUF72LCnO2awXty76tRTkPRk93GykMb
         DVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510185; x=1792114985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvNO4+uRT42xaw6c57vhH/gJBgCPU/zxf+gr5Cfeshg=;
        b=td/BKl9pd+MqycMNHLM3Z1DMlzRaaPu+bMg+PSjj8J4Sa16yJpzWA/wOtOPz2+CNaj
         gEEdtDp7gcm+a/EZ6RavYE/tbFHlBX2lYT2R1n0XAi+OTsHg7ysyU44vVcbDG/oq0/Go
         8O/U0LpYqoUc7lrDnTf5qe+a6z/VWZEh/+iZ8bQ+nZhUgWhEGMXnu6Nl6Re9Kn/loaKn
         rQ+HWTsXhe9QJgOuEeGG5VwvfYnA6n3kSFgdKzftv9l6Vdyhy9k3TvMx+drXsQ042LWl
         PQHSvhpY8ipT09FheYOw/9LvgEGnuJL/RUyX71o8BCVtbDh1ttcLywChK11L/5VNSt/O
         S6RA==
X-Forwarded-Encrypted: i=1; AKwUvBxB7/ZFwb0eKY7rK1h7nl6c9MVvgZueCRRoNYydHXR/IHnfkpGV8IaoTr5FLRriNBkhl9Le@lists.linux.dev
X-Gm-Message-State: AFuF++lvfRIAjxbwY/Pvt4FbSPVUahnqyC43cKTYHYF0FI1iLnVYgTjP
	l9GKnm7xVT0Xx1OJWnuEoQ9fh+2YGYkyJKyad3aEOAuiaBjKuAucUIyUomZ1OrsTlr2IzT7PFAm
	yy9+k9hAOh8pXkpowMu9aXFvWbl5gh+I=
X-Gm-Gg: AYBFou0bihwI4iIwbdFwGb5xpRL5yzItIUyOGRfWaoayws7Av/EEE6tc8IvQ3d3i7Lq
	jeNePy2N3cp3SI+mfswHj/yk0ITJhA2OlnOpPNSXQbOywgbnYXcAEJ1DhU2biig7GJs1a6c3qvS
	LBLGhGquy/9z6Z1K6D7FhYPCuqa4PLbICjgd4EKEiP5TWRoTI4ynZ17tYXIo3NA6uGTpqnMDUZu
	z1JfVwIs+8ZbLCkbMRbDTfr9hkGFNEgc/x0q/Xm3tNYjRAoDHnw5X5GWdKYzuv6EyJ/VGqQnAYc
	zBY87C5/ljzMwwl8wK/FX0/aoZQ4WDT6ga9yikqpCl1cMvY6zTkIQSapmaEoY7V2zcAzYLkVFEM
	AdhvXDqcQ/UBij2MJf0NYjWE8udJnMwVATqN+Itn3Ln/7EmIAltrtgmG5uAu3+tY=
X-Received: by 2002:a05:6a21:483:b0:3e0:da23:874e with SMTP id
 adf61e73a8af0-3e16bdae7acmr234756637.21.1791510185039; Thu, 08 Oct 2026
 18:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <04d71cfc6acd9df9eb52e4f998c35eee568c4319.1791227050.git.lucien.xin@gmail.com>
 <179133511607.434549.17774997950314089010@kernel.org>
In-Reply-To: <179133511607.434549.17774997950314089010@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Oct 2026 21:42:53 -0400
X-Gm-Features: AclHuK8W1Wf3zRSa6LnwypKbXEMa4xVD7fPbE6nLopWcgl-4MV4wP3DczF0C_mI
Message-ID: <CADvbK_cYEE8nb3H8CB=sy_8HRmC+uxxFq+EC4bctyWQ+SnbOVQ@mail.gmail.com>
Subject: Re: [PATCH net-next v16 09/15] quic: add congestion control
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

On Tue, Oct 6, 2026 at 9:05=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_cong_on_packet_lost() (net/quic/cong.c) lets a packet
>   that was sent before the first RTT sample start the persistent-=E2=80=
=A6
> - [Medium] The New Reno handlers in net/quic/cong.c decide whether to
>   react to loss or ECN using only cong->state.
>
> --
>
> quic: add congestion control
>
> This patch adds struct quic_cong for RTT measurement and congestion
> control, and a quic_cong_ops interface for congestion control
> algorithms. It implements the RFC 9002 state machine (slow start,
> congestion avoidance, recovery) with New Reno as the only algorithm. It
> also adds persistent congestion detection and pacing.
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 0000000000000..4779ffe90a3f2
> > --- /dev/null
> > +++ b/net/quic/cong.c
> > @@ -0,0 +1,319 @@
>
> [ ... ]
>
> > +/* NEW RENO APIs */
> > +static void quic_reno_handle_packet_lost(struct quic_cong *cong)
> > +{
> > +     switch (cong->state) {
> > +     case QUIC_CONG_SLOW_START:
> > +             pr_debug("%s: slow_start -> recovery, cwnd: %u, ssth: %u\=
n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     case QUIC_CONG_RECOVERY_PERIOD:
> > +             return;
> > +     case QUIC_CONG_CONGESTION_AVOIDANCE:
>
> [ ... ]
>
> > +     cong->recovery_time =3D cong->time;
> > +     cong->state =3D QUIC_CONG_RECOVERY_PERIOD;
> > +     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
> > +     cong->window =3D cong->ssthresh;
> > +}
> > +
> > +static void quic_reno_on_packet_lost(struct quic_cong *cong, u64 time,
> > +                                  u32 bytes, s64 number)
> > +{
> > +     quic_reno_handle_packet_lost(cong);
> > +}
>
> [Severity: Medium]
> Can one congestion event halve the window twice here?
> quic_reno_on_packet_lost() gets the lost packet's send time in time, but
> never uses it. quic_reno_handle_packet_lost() skips the reduction only
> when cong->state is QUIC_CONG_RECOVERY_PERIOD.
>
> In quic_reno_on_packet_acked(), the state leaves recovery as soon as one
> packet sent after recovery_time is acked:
>
>         case QUIC_CONG_RECOVERY_PERIOD:
>                 if (cong->recovery_time >=3D time)
>                         break;
>                 cong->state =3D QUIC_CONG_CONGESTION_AVOIDANCE;
>                 ...
>                 fallthrough;
>
> Here is one sequence:
>
>   - A loss at time T starts recovery.
>   - P20 was sent just before T and is lost in the network.
>   - An ACK of P21, sent after T, ends recovery.
>
> Later, P20 is declared lost, either by packet threshold on a later ACK
> or by the time-threshold loss timer. At that point the state is
> QUIC_CONG_CONGESTION_AVOIDANCE. A new recovery period starts and both
> ssthresh and window are halved again.
>
> In RFC 9002 Appendix B.6, OnCongestionEvent(sent_time) returns early
> when sent_time <=3D congestion_recovery_start_time. B.7 applies the same
> rule to ECN-CE.
>
> Should quic_reno_on_packet_lost() compare time against
> cong->recovery_time instead of relying only on cong->state?
> quic_reno_on_process_ecn() gets no send time at all, so this check can't
> be done there either.
>
> The ACK side has a similar gap. In B.5, acked packets sent before the
> recovery start don't grow cwnd. In QUIC_CONG_CONGESTION_AVOIDANCE,
> quic_reno_on_packet_acked() grows the window for every acked packet,
> whatever its send time.
>
True.

Will check quic_cong_in_recovery() before calling .on_process_ecn,
.on_packet_acked and .on_packet_lost.

I may also remove these cong->state switches to simplify the code.

> [ ... ]
>
> > +/* COMMON APIs */
> > +void quic_cong_on_packet_lost(struct quic_cong *cong, u64 time, u32 by=
tes,
> > +                           s64 number)
> > +{
> > +     if (cong->pc_detected)
> > +             return;
> > +
> > +     if (cong->pc_start_time && time > cong->pc_start_time &&
> > +         quic_cong_check_persistent_congestion(cong, time)) {
> > +             cong->pc_detected =3D 1;
> > +             cong->min_rtt_valid =3D 0;
> > +             cong->window =3D cong->min_window;
> > +             cong->state =3D QUIC_CONG_SLOW_START;
> > +             return;
> > +     }
> > +
> > +     if (!cong->pc_start_time && cong->is_rtt_set)
> > +             cong->pc_start_time =3D time;
>
> [Severity: Medium]
> Can a packet sent before the first RTT sample start the persistent
> congestion period here? time is the lost packet's send time. is_rtt_set
> shows the state when the loss is detected, not when the packet was sent.
>
> RFC 9002 section 7.6.2 says the persistent congestion period should not
> start until there is at least one RTT sample. Appendix B.8 only looks at
> lost packets with lost.time_sent > first_rtt_sample.
>
> struct quic_cong has no field for the time of the first RTT sample.
> quic_cong_rtt_update() sets cong->is_rtt_set =3D 1 but doesn't record
> when.
>
> Here is an example:
>
>   - A client sends Initial PN0 at T0.
>   - It sends a PTO probe PN1 at about T0 + 1s. The PTO from
>     QUIC_RTT_INIT is about 999ms.
>   - Both packets are lost.
>   - A later probe, PN2, is acked and gives a first RTT sample of 50ms.
>
> Loss detection on that ACK marks PN0 lost. is_rtt_set is now 1, so
> PN0's send time becomes pc_start_time.
>
> PN1 is then marked lost. The gap of about 1s is larger than
> (50 + max(4 * 25, 1) + 25) * 3 =3D 525ms. So the persistent congestion
> branch above runs, cwnd drops to 2 * mss, and min_rtt_valid is cleared,
> right after the handshake.
>
> Should quic_cong_rtt_update() record the time of the first RTT sample?
> quic_cong_on_packet_lost() could then use only lost packets sent after
> that time.
>
True.

Will replace is_rtt_set with first_rtt_time, and check it before recording
persistent_congestion.

Thanks.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1791227050.git.lucien.xin%40gmail.com
