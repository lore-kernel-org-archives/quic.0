Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8E4D794B
	for <quic@lists.linux.dev>; Wed, 16 Sep 2026 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573744; cv=pass; b=OOnqyKmQPRIF2hWbopbRuAOuccGv0rQymoAe2/75CyUArtGXgYsDneNh7DG/xgOf6XeCcEzOWrsGNX0bE6795vRcGxKKBpkX50JunMQ0syL2S+6sozoVpYBcJ4mPOaZZ1vrwLExHueXRicRsmVGQhIvF+XCA7lnHTzxP4lZ7EDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573744; c=relaxed/simple;
	bh=2HTFcw51GJTpM0vzPofi6oeFOtDofXyLi0if3h9f4Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3dy3MgGaWgPSTWhc4iv+1slwLU4tLmtyg0OvOkNBYGgo+0r3hgZ0t//RtRsbTOxUTSDDfaXLyKVpohSO7rqt/apEEcAAGnEowdlUGaIOUzoXOYl65pEs4LsFo7p/UKLN6yyGZGawUqG2kvNXoFxx9pCslHXXiQ4PpDvTpb3ZyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVC66FWU; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVC66FWU"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86212a185dcso1019347b3a.1
        for <quic@lists.linux.dev>; Wed, 16 Sep 2026 08:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573741; cv=none;
        d=google.com; s=arc-20260327;
        b=A5GO0xM8W081ohe5rPzC0UxwvSkRkaxTyq/T8p4XVqpRBJB3oRpulTTm8+xlx+0TVq
         xy+HWGTumvODE8g8mngkP8eyGicyHruNUlMKe7OEhX0a0mNI693LpAwL8eeNgy+VTYUw
         9V5qAY05KH/dTD2MhVMnrrma9NH1KF4pNkMEXx3QuNpFGPmXyTMl/co9M/vZEP3P3bD8
         6GT5ri7yNhrwlC/8zNRLZUu7T78D/h2QBm6SI5ScBRM4OOkiqI85y3wXtmGIAbwYtO71
         DMjInTFCl0/fi+T2g9rZAYSYVTx/1PFw2FcufhX9Mi5UFJIscQIzdl7xMXNxM05Hb/QZ
         JlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gmxz7ND3t4uc8MZW2dQN60LpvsltqXz4L3oWlJ7Ftw=;
        fh=4BYIiwG6Xdz8QvPtvnDOWRakS0JbFKF52M6WYBHSQWY=;
        b=IHeP6GrAx+5qq5bkfgrl9SB3kgwc7xNwRULsXfMLIvpgwwSa4YsPwKBrL7bXsRN3lG
         iYEeQ6N2mD4+lwrJhWMJUGiyDarPGOoFyj1UYfOZg5v4lp/M/CHqEefEeerWRMerPts3
         eoUXDJUTKRAvxys1Nd5P3Ql89kp/exVjzlEfaLCHWzg9XqA9iBin9gxxJdkOFvIyykOn
         7omqELHmiCSxLjSUmnK9XedstHMUjAMZWmQpmTKdg+LBR8HzSuaDj0Z1XPqOimlkEyMS
         HLrhXDEMmSn6rFPhBamuUtUAkJOQy82q0sROZ9ArqSLoqGA0Zrjyr1zjxLpZ1J5P4Fmq
         V9bA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573741; x=1790178541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gmxz7ND3t4uc8MZW2dQN60LpvsltqXz4L3oWlJ7Ftw=;
        b=FVC66FWUJT5FKCUfp6qmK7lCtFpiVPZbGuzGv2UIMp0bENpzq9A3C4akFOXt/YsTxz
         R0KiwokjWMrPx+gipMCLZoAGgi/yZiQmJWLZwnPFZFMccT8oKsbxieWvXe44zvWrKT/n
         rc8uBnp/FyzQNwgSOKHT8m0+zP7+7GE+6aBHBrh97KujuakejpYwNQV87lq/PiGlY+fm
         s1bI0vJKa6qi43iyRTgUbE1si+qPORoadEe6pKHbRhRWfsQtJTDy5ns3oSAb4YcMIZu7
         xFvyIfn+rradm5OxE+WK8OPfQFcUpbfXYyawisPXBhSNlgDCETo8mny6Y9gVtdeNTsLU
         zEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573741; x=1790178541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gmxz7ND3t4uc8MZW2dQN60LpvsltqXz4L3oWlJ7Ftw=;
        b=tfNMdXC8NJsfrLjkj+MXz44bRT7yNvUqP4ns+Ivv1bq61Lsimzwpzy8vI1F74xlz0Q
         1yGr1ySLp1KP0mdGP+6hRTXT1JYo1IQLa9sRrW1PtCb+44GfnosTyoquTDmbSiUHS/9L
         ZetXg60wVZqU8hdIcCxpqKRWb7T78kVfIqh7iy6QWHZyWOv6pqjgAVRdI0tckFblXcrT
         PwjVwbia38g++U/qrb2uS0H4wVEoMpqK5cgFJMAiHAfWSkceHfzmex8JvJ+Af3Cg7PKX
         tLPUbvDfgdGIJhb+RpSRSCYF/YCv1MgBr4BeACkYt48p4C7Nk8J/LzNx6UJawdpKwe6/
         ShoA==
X-Forwarded-Encrypted: i=1; AKwUvBxB47IxazkaqUY7tayQIGPNlzZrnuTZ1M5u8TkKo2N9hOyux+qUPXqCuMvdKdQfUkoscPee@lists.linux.dev
X-Gm-Message-State: AFuF++kk2VaFXOMCH6NNpRnGDE03VuTEBcDMfaHt+EocS4bkFT75pdWe
	LZQixn33iXC2ucaT/iccHYF9U2x8eJdLg84EWWni7eEhX6lGqe/4BKNXubd3rhUmEXYpvqqehu8
	lDt5J99Sv4wCtt2zJdAg1p3VOhd0wktc=
X-Gm-Gg: AYBFou0zyciew0Hxonxc0njNS6z4+y82QSJ/qWnY0BWo8fbXS3ZdGjqXKbxmFJ/ITh8
	qmraoxbkaeuZVCmFU2rR4bmt4nQE1+OqFeTrQ6skklUjpPdxkINb2Rw1bBTVm2wJG26X/9/PLnF
	eL5xIebrDaEpcQ0PmmVQa2nOdNiItRJfor5QuIv/SFOCTzLOUyefuEuAw6JjFLkVqLhwPbVqKV8
	0J/De3Jdqy9IqnPCu66ufZ29ytnY8sHLq34OSd9NMDneJinA2yVE4ogIu5iVJ+vH5OQPjM+LLpv
	jXvj5X0uHHQNowxyXy0xqYmD5+uXK8bemjMtsKKKtlMcPaECfPI6ZNfcu2DGybVWuPggPi3UPf1
	4t76E0RCuMedAcrOfVnXCr6E13ypYVdBkskOheZfByJbi4FIA8h/0JgHq
X-Received: by 2002:a05:6a00:a88e:b0:872:20f2:3282 with SMTP id
 d2e1a72fcca58-8723de188d4mr6336975b3a.22.1789573740955; Wed, 16 Sep 2026
 08:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ede5ba63212b87ddfa14acf70426b81d87501e44.1789393775.git.lucien.xin@gmail.com>
 <178950184662.22033.5889968066649167674@kernel.org>
In-Reply-To: <178950184662.22033.5889968066649167674@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 11:48:49 -0400
X-Gm-Features: AcwNN1Xi8cSlHvt5PrpP04qaA_yB_ZBp9zlIFRWFrwm51DDVLQoanNnzmXwbS2M
Message-ID: <CADvbK_eU+ozoWVcCWEhKuyeBK_c78Eqp-OTKQHqUBTu8hwq+hg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 09/15] quic: add congestion control
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

On Tue, Sep 15, 2026 at 3:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] Spurious persistent-congestion detection:
>   quic_cong_on_packet_lost() (net/quic/cong.c:125-140) is the ONLY place=
=E2=80=A6
> - [Low] Commit message vs. what the patch actually enables: the message
>   says the implementation 'adjusts the congestion window accordingly=E2=
=80=A6
>
> --
>
> quic: add congestion control
>
> This adds net/quic/cong.c and net/quic/cong.h with RTT estimation, a
> congestion control state machine (slow start, recovery, congestion
> avoidance), pacing helpers and the New Reno algorithm behind a
> quic_cong_ops indirection.  quic_init_sock() now calls quic_cong_init().
>
> A couple of questions below.
>
> > This patch introduces 'quic_cong' for RTT measurement and congestion
> > control. The 'quic_cong_ops' is added to define the congestion
> > control algorithm.
> [ ... ]
> > +static bool quic_cong_check_persistent_congestion(struct quic_cong *co=
ng,
> > +                                               u64 time)
> > +{
> > +     u32 ssthresh;
> > +
> > +     time -=3D cong->pc_start_time;
> > +
> > +     /* rfc9002#section-7.6.1:
> > +      *   (smoothed_rtt + max(4*rttvar, kGranularity) + max_ack_delay)=
 *
> > +      *      kPersistentCongestionThreshold
> > +      */
> > +     ssthresh =3D cong->smoothed_rtt +
> > +                max(4 * cong->rttvar, QUIC_KGRANULARITY);
> > +     ssthresh =3D (ssthresh + cong->max_ack_delay) *
> > +                QUIC_KPERSISTENT_CONGESTION_THRESHOLD;
> > +
> > +     return time > ssthresh;
> > +}
> > +
> > +/* COMMON APIs */
> > +void quic_cong_on_packet_lost(struct quic_cong *cong, u64 time, u32 by=
tes,
> > +                           s64 number)
> > +{
> > +     if (cong->pc_start_time && time > cong->pc_start_time &&
> > +         quic_cong_check_persistent_congestion(cong, time)) {
> > +             cong->pc_start_time =3D 0;
> > +             cong->min_rtt_valid =3D 0;
> > +             cong->window =3D cong->min_window;
> > +             cong->state =3D QUIC_CONG_SLOW_START;
> > +             return;
> > +     }
> > +
> > +     if (!cong->pc_start_time && cong->is_rtt_set)
> > +             cong->pc_start_time =3D time;
>                 ^^^^
>
> [Severity: Medium]
> Can persistent congestion be declared here even though a packet sent
> inside the interval was acknowledged?
>
> quic_cong_on_packet_lost() is the only place that establishes
> cong->pc_start_time, and quic_cong_on_packet_acked() can only clear an
> interval that already exists, so an acknowledgment processed before the
> first loss callback leaves no state behind.
>
> With srtt =3D 100ms the duration threshold is roughly 400ms.  Consider
> packet A sent at t=3D0, B sent at t=3D100ms, C sent at t=3D500ms, and B
> acknowledged first (ACK processing precedes loss detection):
>
> quic_cong_on_packet_acked(time=3D100ms)
>         /* pc_start_time =3D=3D 0, so this guard is false */
>         if (cong->pc_start_time && time > cong->pc_start_time &&
>             !quic_cong_check_persistent_congestion(cong, time))
>                 cong->pc_start_time =3D 0;
>
> quic_cong_on_packet_lost(time=3D0ms)      /* A declared lost */
>         if (!cong->pc_start_time && cong->is_rtt_set)
>                 cong->pc_start_time =3D time;     /* pc_start_time =3D 0m=
s */
>
> quic_cong_on_packet_lost(time=3D500ms)    /* C declared lost */
>         /* 500ms - 0ms > 400ms */
>         quic_cong_check_persistent_congestion() =3D=3D true
>                 cong->window =3D cong->min_window;
>                 cong->state =3D QUIC_CONG_SLOW_START;
>                 cong->min_rtt_valid =3D 0;
>
> B was sent at 100ms, i.e. between the send times of A and C, and it was
> acknowledged, which rfc9002#section-7.6.2 says should disqualify the
> interval.  Since neither the acknowledgment timestamp nor the packet
> number is retained (the number argument is unused in both callbacks), is
> there a way to reject this interval, for example by recording the send
> time or packet number of the most recently acknowledged packet?
>
False:

The above case relies on packet A having a send time of 0, but packet send
times come from quic_ktime_get_us(), which cannot return 0 in practice on a
running system.

Thanks.
