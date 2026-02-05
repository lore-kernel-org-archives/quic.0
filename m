Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885081DF254
	for <quic@lists.linux.dev>; Thu,  5 Feb 2026 19:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318046; cv=pass; b=qyOepq561smkCYRljiTEMmuUi5FaIzFiJ64nWikPSKcU7j/YnvfZcknZzLe5j38eLTcE+CODbMZMXFeUcj93JaAL2RufGDmtOffBPqu/uL0ePPFuPfFGla+0L89tVV2if/sYm9UDoOL+ARkbwto0/G7x60nCEoEB9OmD1dqCWV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318046; c=relaxed/simple;
	bh=AuskjtNOz6nZ0G+yrh6WViA45fpVm0rg4c0PZaDjONg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hK/1VhHLHvOvJ3xrNyZL+tc2GXX3jIWGJJ8DMwcGJmTolONSgzG/JYXb84hOJtfu76a58L2FIE2Tpy0rw4WzS+wRTTsAaUd5sj4PUGGGamx6G7AC62DAU0VhPe6JGWWTrM07vq8Xeh7xGfu/p2RSVpJK6TscaCy0gD3JALrNdyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nf/rNEqI; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nf/rNEqI"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8230c839409so1260414b3a.3
        for <quic@lists.linux.dev>; Thu, 05 Feb 2026 11:00:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770318046; cv=none;
        d=google.com; s=arc-20240605;
        b=ikjbsfk7NLT2HaGMdW6j7gTFq2s8cSchdQBFQ0ntslC1mHBFSis74T8H023geFM0yd
         ZkfWaU6VAR8GY711CWtvihg/D2frAaazoPfVNtDEP8bQqknIPG1Ekx4PUUnpFXvPKJt0
         Bqd8eINFMcjFzotuziXnq/gZqX66N/DmPhH1bA7PcJUtcNKw7tXZjCWDnia9K7u2tfbQ
         GAAEiGzmWEwxx3GE7+7twDssdQkFBLLIEeN/J4bmfZh2z2FJdFWAzcacF89xAFlcpi1n
         +4EmbegzPu5oOHFE1HYlTX22nODfS/CyDOU1yRbBnzC7Y8zRVYNl1EUw6sPn907MFBfU
         DKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CzWk8gLvE9O246b4A2vdYNLzmmHIUhQKe38cf0ISaC8=;
        fh=ACu9TFDuMKLo0xqu8fEEtr4msKntYEdX5p2907A2c4c=;
        b=ic2COS4aAAFA0e8TqA7p9xCZ6TSjKw3VFciaIuT9GPp+jh7z5OgjsbgRGG+lDlxwEq
         r/it+oxZysi1+49n+pz5YWs2CQ6oJEsh0RNzPHETGfiMTmEyXtstNv+9P2CPcZxsF7vs
         JIMBcOhC9jR5yazjLPaGNKPh7vdVv1skZ8yAyjogGsH5MJQbIfVSAF6NG91era32O1p9
         +6v29Piuz8CA3RV5NSreiuMjqd5UMStblX3PB7+nZdzIILW9SEs29x5/GM0L+PueWGLx
         F5CBHsVzHCKApIPnluOI/pnM33dJy+NP86DNCCVOXUJv11Zo8BPO+xU+1J3qpdAg9WpC
         Gtmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770318046; x=1770922846; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzWk8gLvE9O246b4A2vdYNLzmmHIUhQKe38cf0ISaC8=;
        b=nf/rNEqIVZ1/SY+hrbweh2NsuTHcqHNt2N23gRtFXBCpckCKnipyboDU7MRpDzfrdt
         sArok/zK8N/lVf5S1gJdUTsAW8kzvPkmSE2lFSeJ1V8ASvQc4fjIgPOyAVPePR9cGDe5
         FhWwBOr1qgGvm/zY9GuZBl2v3ZO7rLbWTE3fD+53EyWUG/d72bjD2Nzj8BIe/xAOVsqI
         sgkEChZwsG66xd8f02e/IOIp0FHgZgDuRcP0g5Hrda4NtJn3DNGr1gXWTUt3qTg1n3z5
         REgVE4W7bd8g40nO00RHYjaTb8xTI145r2vDTY9OKCP0Mn/eyX/jMRATAldQsjCTiO0z
         qk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770318046; x=1770922846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzWk8gLvE9O246b4A2vdYNLzmmHIUhQKe38cf0ISaC8=;
        b=T+s4Yh37pyTie0dKgLs/Rptm/F8okX5sjTRNnLFThD41RKKri4CsgFKwRqyX0JO5Os
         YNCf4vTy5B8fc/JcTHzmRzNFOrrZ8mYm9KzvYLS/GB2+01bwzXwRTZEcJpyN0kgk38Bl
         NZzb2CU8MgSniPk/mr6Q9viUk5BB3WC8NPLiuemt/+/5CpIBUe+HpSVs/l0fPFdVWEft
         Yzpzouq/Ces6LIwOyESehkdZs5kmMzEcotySyhqH3G2COcdd2Swa8FvghCGhEyElzte/
         VJIj5MKG5nPUztXd47D8wDciaR9ChVSxgQyQuMYf+ZTTVftPXn77gH0/H6hL0XFdIVxH
         YbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAJqXDrVUOVPHAJ1DplSfFDJnkxAKGsvN5o+8KGCknmGrSpUa2csiqBmMzZlJhJygJsQ7j@lists.linux.dev
X-Gm-Message-State: AOJu0YxpIyBBMaE4BVHNngZZ2Adw0iR8PWYZqVjrsAj69y5vAnvMTK7q
	k+r8q0EvMfYp6BK3Fkg29sThMO0rFkXjpmA4Dj0GwGh2ZMS8CrfM5ZO1kUZbDmH/I1PU01RP1CQ
	6gK9EDBWecBBPOuU7UM1FXoqNRFIoe9I=
X-Gm-Gg: AZuq6aKPbqn2WHUD/3XPvW1BjTjqlF/21xPehwjCRQacL+PuFyre/BmTn8TtDXvAotr
	wEEWMeWHgBUnvsA+Z8qPJ+CoTZDzaX/BB9z1E+87jh9Tw59COGTW3PxKGJPG8JRUX4Di0ZnO7wM
	47yr7jrm2sgNmaHh66JbZtvHiPg0jOjmB/dHfqjA1aIo1N4FIRWGtnn3bHbv2dMmq+dRrkf2kCq
	8rvMeTbCPbpaWzRlf4h3JuJ5B1F5NauvtywitTmZg9GN4Ult6jjXA7SVe0veAp/7mw0mXAX8n/s
	+L6rM0tUVw7zZxtisMHPLgRhqk+a
X-Received: by 2002:a05:6a00:2e07:b0:81e:711d:b26f with SMTP id
 d2e1a72fcca58-824416f7a4bmr51256b3a.43.1770318045758; Thu, 05 Feb 2026
 11:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a872188a6e4d7b39d6d6d0f6fad7e5077bce4bae.1770042461.git.lucien.xin@gmail.com>
 <20260205115532.2195345-1-horms@kernel.org>
In-Reply-To: <20260205115532.2195345-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:00:34 -0500
X-Gm-Features: AZwV_QhKP_xJtDWc386RLFvCIecEAqeBpy1wdehizIZr3NTnLt_Pak2USLctFus
Message-ID: <CADvbK_cHtubdKv4PbYf0vG=3EPMrYw_Jo=_qqNvVb6+SoDvB3w@mail.gmail.com>
Subject: Re: [net-next,v9,09/15] quic: add congestion control
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
> quic: add congestion control
>
> This patch introduces quic_cong for RTT measurement and congestion contro=
l,
> implementing a state machine with slow start, congestion avoidance, and
> recovery phases using the New Reno algorithm.
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > --- /dev/null
> > +++ b/net/quic/cong.c
>
> [ ... ]
>
> > +static int quic_cong_check_persistent_congestion(struct quic_cong *con=
g, u64 time)
> > +{
> > +     u32 ssthresh;
> > +
> > +     /* rfc9002#section-7.6.1:
> > +      *   (smoothed_rtt + max(4*rttvar, kGranularity) + max_ack_delay)=
 *
> > +      *      kPersistentCongestionThreshold
> > +      */
> > +     ssthresh =3D cong->smoothed_rtt + max(4 * cong->rttvar, QUIC_KGRA=
NULARITY);
> > +     ssthresh =3D (ssthresh + cong->max_ack_delay) * QUIC_KPERSISTENT_=
CONGESTION_THRESHOLD;
> > +     if (cong->time - time <=3D ssthresh)
> > +             return 0;
>
> [ ... ]
>
> > +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u64 time, u32 ack_de=
lay)
> > +{
> > +     u32 adjusted_rtt, rttvar_sample;
> > +
> > +     /* Ignore RTT sample if ACK delay is suspiciously large. */
> > +     if (ack_delay > cong->max_ack_delay * 2)
> > +             return;
> > +
> > +     /* rfc9002#section-5.1: latest_rtt =3D ack_time - send_time_of_la=
rgest_acked */
> > +     cong->latest_rtt =3D cong->time - time;
>
> The field cong->time is described as "Cached current timestamp" in struct
> quic_cong, but where is it written? The socket struct is zero-initialized=
,
> so cong->time will always be 0.
>
> When computing RTT with a positive packet send timestamp in the time
> parameter, does this cause unsigned integer underflow? For example, if th=
e
> packet was sent at time 12345, computing 0 - 12345 wraps to a very large
> value.
>
> The same issue appears in quic_cong_check_persistent_congestion() where
> cong->time - time is compared against ssthresh, and in quic_reno_on_packe=
t_lost()
> and quic_reno_on_process_ecn() where recovery_time is set to cong->time.
This is not a problem, cong->time will always be set before processing
the packet on the TX path in the next patch series.

Thanks.
