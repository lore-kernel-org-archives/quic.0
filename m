Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623688;
	b=snL4vjS7jfK+KFzUJG+YIUWLy3IxDNK09MqUVlQvriw4oBHQ/Tt5IDpNceTDk44yyW9M
	 kt4xCY252axKa5m2ptJF6Q6tJaIQX5+Y86FZiPacYqi7Rghu3yMhyBIExSh4LJsujQS37
	 sA11bRXgOQmg/gyrb+Y5DCBY41Meir6xOPPBfn6bHk6aJYgUsoO0USxKI63/yQx9e+dXh
	 69V9c8i2Cl7SOpNbBNR28CM++IbV4q9qw9bHMhGAUuooAyQT2Ldhmqrrv/1dEWUrOXwom
	 Bh14Q1C6qLf9qlOwrVWHZJ3JqK+ppVXH/7uuJaaa6/hc25wn0r57v3X2NE5pQDU4jbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
	b=jBM5LRN3s0Q6I1ToF7cT1FXh3JqjbRuRwbBad3swG6BW5vYLkx0bgEiym1zpoyDW2KSe
	 QhgfDSdeWclLQtNnHLJ4EFd5xsdr14JYiU6qgtrJz2L08ydENUECv5AJAXYyDmM4F3/Qe
	 2usXp/QBYBlLyOTXWOa6iYt6omj1edK7LtEHT2ftQJuUOeBRil4FanOfMtNFKWm6l+J1N
	 bjV9gVufXUm8RDcBm712qQJo3qDAqhwIqKgloii/ZiE5Worfp0AE99Lf6sTicXRnCMQwD
	 fvR6iXooSPkN8vbMEsyYtsjEzwgRPdShHqxq10sEalUztDEfL0gAVpSAP3k73lWh6+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FEwYl/SJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E3606A337
	for <quic@lists.linux.dev>; Wed, 25 Nov 2026 16:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3E3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEwYl/SJ
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b2f59de176so4649085b3a.2
        for <quic@lists.linux.dev>; Wed, 25 Nov 2026 08:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795623686; cv=none;
        d=google.com; s=arc-20260327;
        b=h3/LuccxUQ4s7Vy6ihqmw4VIskOAZJRBZVrcUJK7/oOimTiyPfHfAoICRvUy0q0Dvd
         hhZocBvJXYiWboghld54D05K6m8pwWMzcxmvcfnLFByLtQ2QXlekzn/xEpXt3kzL1R8v
         XYYBkXdA24BRQ0GVk1YF8zqPFIYyhM4/EE5M4O/Y9S4hGvXfibvdIBmKBpIp/3m42/UV
         ZygwfSku+03rdi6Ou2CVyEhcOgL/btjLKduNNL/7oK35HaG8wCqArurlkKNCmTT2z7Fk
         iTV6HiUmZJ03tzIOUSjTh82+pF9Cwz4+zKivNxt9ri60cYFdLjVEljFEYkSplQFU7NNf
         QNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        fh=uU/39CofmSPwEEpnoC8WlcILpDVytd7TX93b1Xku8ZA=;
        b=m7+3A7dcwad0rv4QWhmMwmcF3GGwMkI1SzF55k42CeffXNUtMfXFTp9iCYoP5yWyhr
         +PAbpwemu89W18oRZalm1rhgUs336KZnK9FPUUEuYLBu6Cl3vqut8xK91It5Q0irfeib
         61abtvTGQYedgJ8/QgSXbpHvpmWzf1KjQjxfzCW853VEjTcFXnUHshPbQkjdHinYtnCx
         3UPhs0uXd4gGHoDR3kBVaa6WjJJkr7TjhZW4BE/KKE2DJ7ctXpFR4CYCOmotB3PrcCUO
         9MVphPf0THfD4JBfXUH3OPJ7xzc4mHSKIAq54y57Kuwoi+1PJcGP4exV8fn9pMZ9Pv6a
         cdbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623686; x=1796228486; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        b=FEwYl/SJfRo7wIef1+EjK1MsxEjJtJpzIHY3J7Y2R+w9dbWwJP9dMRlS798PXzVGyM
         w/9AGYnr6o50nxmKrs+Ib4QExjRPJN1j+6nJN8Scdy+KWmZH+G+FgjfOhRqY3xLVG2x/
         jGPQz+8lWBhyPw/nJ7sI5Oxp23qy+42fLB5HJOmBv4exkdYNshG1LJGfvvJX9uHynWsL
         T6d9Rl5ETbyGfC3uk+0p3YvMSwVwxSZBiI4+cPZJFMuFnugadzd/7FXcbo9jfWggP/rv
         SJ5vMZrym+6SAwY+c+6fQ60KdFd0jEaF7KR3OZtEnGnctslLXPUw/lintIvEGPUWzDpN
         JFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623686; x=1796228486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        b=UqH8Cw3IYkyeXUqb8rrj1hCcmk/UIRTpJ8Wg9qaGgqvTAGU4NeEJBbv7S8s2OrUL/U
         Q4LVcJirMZ91hGGQwHT+RnkKmSfV4gXLGtuYHFP2tbsbpAY7LVA5c4g0/XRKV7wKg058
         va9sP0Jv5e9B9S3FECPhBSv29HM8qHkmMaB3yE73zrUpN7VRNIs1ge77RQtACD+ecDEz
         RhF5joLrT7M4e4nFyhKAVFIRYXKlhjhO6gNYCjaT3PKqqu4n8rrFgVZaAtgWMbvySwzR
         q3YJKAdAMAhIx48B/REei8Ot850gBGRsR76AMt8ADR40s7CSoan9/vYdE5tyU3XFn4/J
         bR6w==
X-Forwarded-Encrypted: i=1; AL+hErHWcDqfVm5zOel83Jnh8+U57zDr/zSTJIjVlbmSc8nJVR8iXTaZYiEm2wV52kfg2oOFxHj4@lists.linux.dev
X-Gm-Message-State: APuU4Z+Ul/h1gxiRJgyJyXyML0xfdPKYI4pyyu7Fc1MJXDBMeOW2K1Sk
	VEuRFdUcZczPHDP+F48DV2aNyMXRSu/+9LiFVOiyyJmaMb5olJCL3xlNLHXMvkRrPEXiCcqIm+x
	0feaKAPM/BEXamg+UKy4RbbljnHZJFdU=
X-Gm-Gg: AZFdTZcV6+TdJYg6TDgSo9VpJE0W/F1hkWj1RsyQBxbMe2crcEHIxlYcc+IENpMoeYu
	TurU3j8SKY7Ql4i1xS9kjhJ/NWa0FVemcuSAPabJMgFYyVzCRYbPmxK3tOgnsYD5Y2mKQHDty3X
	aH4blTVtBT8wiodpQF+JiPqBMPtE5bjw7gJKZpnmAqjeFeE4K5asFFLLymJ0N87Hvx9+iiOr1DL
	aoZtz39XprNaOe1/WPUmN6d4NU9l6PKDUIiNzdQsUIAlKGo83PFUOnCG1YU31yT1c740Pe0xUsC
	8WUTAvK469+b7phaNUsu5LgUdyJyO3ReaQe13Fz5ZgBrSuCOAPp1PgoLI46UooNIy5NPZEWMVVK
	LVvtvUSWjgGszAp9kQOR0hS5r92kcKqPS/pSV+BZu12RvI6CbEWGwGAexCGZ/XE2PG/pFdmm2vZ
	3odAH9aVvrsukV7k3hKrwCtNMGYYXJXVOcfmjNrCRlODvqjec1CTl23Z6oYi7BMUp1tqZa
X-Received: by 2002:a05:6a00:2185:b0:8b5:8fcd:a5d6 with SMTP id
 d2e1a72fcca58-8c87ca51d89mr16484911b3a.41.1795623685392; Wed, 25 Nov 2026
 08:21:25 -0800 (PST)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <b69a2cad6c2faeab9ee1e90ad11c4b64168c8235.1795393691.git.lucien.xin@gmail.com>
 <179548327865.3135.16261562840994895440@kernel.org>
In-Reply-To: <179548327865.3135.16261562840994895440@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:21:13 -0500
X-Gm-Features: Aa3M54rsWzghsJWI76cZEUFf_JplE3C1oHkXrqs2BiFz_WXGdtzu3O8u2H29aYA
Message-ID: <CADvbK_fRG1sXR97cXfMMMG30RyM+-vyHMamOje5oxUO6=UEnpw@mail.gmail.com>
Subject: Re: [PATCH net-next v19 09/15] quic: add congestion control
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_cong_rtt_update() in net/quic/cong.c begins with `if
>   (ack_delay > cong->max_ack_delay * 2) return;`.
>
> --
>
> quic: add congestion control
>
> This patch adds struct quic_cong for RTT measurement and congestion
> control, along with struct quic_cong_ops for congestion control
> algorithms. It implements a slow start, congestion avoidance and
> recovery state machine, and currently provides New Reno only.
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 0000000000000..99fe8045d0170
> > --- /dev/null
> > +++ b/net/quic/cong.c
>
> [ ... ]
>
> > +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u64 time, u32 ack_de=
lay)
> > +{
> > +     u32 adjusted_rtt, rttvar_sample;
> > +     u64 raw_rtt;
> > +
> > +     /* Ignore RTT sample if ACK delay is suspiciously large. */
> > +     if (ack_delay > cong->max_ack_delay * 2)
> > +             return;
>
> [Severity: Medium]
> Should this early return be here? When it fires, quic_cong_rtt_update()
> skips every update. latest_rtt, min_rtt/min_rtt_valid, smoothed_rtt,
> rttvar and first_rtt_time stay as they are, and quic_cong_pto_update()
> is never called.
>
> RFC 9002 section 5.1 generates an RTT sample whenever the largest
> acknowledged packet is newly acked and at least one newly acked packet
> was ack-eliciting. It has no rule for rejecting a sample because of its
> ack_delay.
>
> RFC 9002 section 5.3 also says the endpoint SHOULD ignore the peer's
> max_ack_delay until the handshake is confirmed. During the handshake,
> peers can legitimately report delays larger than max_ack_delay (RFC 9000
> sections 13.2.1 and 13.2.5). One example is a peer that buffers
> undecryptable packets until keys arrive.
>
> The changelog says callers will cap ack_delay to max_ack_delay after
> handshake confirmation. If so, this check can only fire before
> confirmation, which is the phase where the RFC says to ignore
> max_ack_delay.
>
> With the default from quic_cong_init():
>
>         cong->max_ack_delay =3D QUIC_DEF_ACK_DELAY;
>
> any handshake-phase sample with ack_delay above 50ms would be dropped. A
> peer that advertises max_ack_delay of 0, which is a legal value, would
> cause every pre-confirmation sample with a non-zero ack_delay to be
> dropped.
>
> In that case smoothed_rtt and rttvar would stay at the QUIC_RTT_INIT
> values set by quic_cong_set_srtt(), so pto and loss_delay would not match
> the real path. first_rtt_time would also stay 0. That keeps
> quic_cong_on_packet_lost() from ever setting pc_start_time.
>
> The RFC already handles a large ack_delay safely further down in this
> function:
>
> > +     adjusted_rtt =3D cong->latest_rtt;
> > +     if (cong->latest_rtt >=3D cong->min_rtt + ack_delay)
> > +             adjusted_rtt =3D cong->latest_rtt - ack_delay;
>
> Is the drop-the-sample heuristic needed on top of this?
>
> The commit message describes quic_cong_rtt_update() as "Performs RTT
> measurement" and does not mention this deviation from RFC 9002.
>
> This patch has no caller of quic_cong_rtt_update(), so whether this
> triggers depends on the ACK processing code in the later patchset.
>
False.

This is a defense-in-depth sanity check for pre-handshake RTT samples.
Post-handshake it's unreachable because the caller already clamps
ack_delay. During the handshake, samples with large ack_delay reflect
peer-side key-derivation buffering, not network RTT =E2=80=94 using them wo=
uld
inflate SRTT and delay loss detection. The max_ack_delay =3D 0 concern
doesn't apply in practice: the default QUIC_DEF_ACK_DELAY is active during
the handshake, before the peer's transport parameter is applied. The 2x
threshold is intentionally generous to pass normal samples while catching
outliers.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
