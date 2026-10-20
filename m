Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792532114;
	b=SVYNYLXighZVmf0MOPllpKCeHcBkFOHGnZ6B4UDRndyzciKmveMnVj0fcDOK3mdH2wN2
	 RqjjdAnclCHxhL38iqhVKECN4eJ09+PHn66neqqYchsDiobPJ2CFasNTeSMMwzzMfJy5J
	 mKIjaI3oT7ZdKY+beB0s4ZZWRvEgnZLkkgaN6ZJSzT6djaT6wv8fAI2qoceiW6ACyY9Y0
	 xJ9s5phwjDvIxXgGhcwsb5Txurn+mtlXisIc4hJ/3ePNMNpSzvIjZRIU/JXFBjBwMzKK0
	 l0STOtEA8eTNGBih13jN+N5pQxKzuu8LUpmHKShjP3KytfygY5BjZ9Fb9d4TYwvPO7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kxbmWpHG63bcj8caJCx8dB80g5mvO4e9eYY/N+k9SP8=;
	b=EUo1Ea0Ecum/d2R8C0rxY5BeMQtg68nqBpAv8g01fSsGCSYn2bf97vYry0MpVj/uqnee
	 c1WV/cYC4Nd3I+VLMjAK+32JKTJkZ5XIQTy2w7BbX92Sev1KzisW9mqUMa3YSVGBnyhQr
	 s3fMH1dhbSpml60QMECMrJi7jwGoUwgJFh+BBqN4eF0klIJeD51p86E3bZ9F30viU2914
	 tIH7wouOpQ+VdjAQrOi7cqOl5rizG1Ncf2o6CWfRj5KinaZRR+Ubi5QsIRukc8JkvigjX
	 XHomQ414gZf+xz/JuiiF2rJ5e0MNGP9UjOLooT1ZGYU2KWCPSO/uHJUI4sWo8cg3n0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ksrXS4MK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA91F606A320
	for <quic@lists.linux.dev>; Tue, 20 Oct 2026 21:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA91F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ksrXS4MK
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ea97b74acaso1817e0c.1
        for <quic@lists.linux.dev>; Tue, 20 Oct 2026 14:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792532112; cv=none;
        d=google.com; s=arc-20260327;
        b=abMoBUCPp9J35mXavyau+kPfQJ00aNOSl3lvBxDAdKyM3uQThE5WxITBh69kqGpxmo
         P9XUzJ0VIwS2niYdrIt7AEC8pxWKW8Sbqe+PiCFfBAzR8xkCwtsOG3sBCfhIeILeKByz
         e27q195qINQIq0If053qgF5F05OxbGiiJJ6+UTcZIw+G/A/BGkqu2hP32pgefjngFC3l
         4h3W6bFs4M4uB3os4xhLJAkJSLYwr4KlrR4ZVaOIaaUxlGxmkd9cijqk0sUifyn4hGSs
         E+ZPpv84aJg6plh3Yqq0kWbzEgFt+jpeR93x50dSMI4fq21GPZdkq38r+1UvK5ItOo2b
         c0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxbmWpHG63bcj8caJCx8dB80g5mvO4e9eYY/N+k9SP8=;
        fh=RBpFNZxJdPTE4jnS7cYj14Jgca51MBnsjVfFA1dGN1c=;
        b=YPt3VKYuwaxJUYJwuLd4SvZUaGHRryZ3hwxIogU4AywaRDNM8dtKWq290M/Nl15qqC
         jXpgbbSLI77w4FoU6h51JnRygaxYl8MWzU2mjYYBSEs9BQTFQu35UX6G/NSRSaAL0NuW
         WljBjRs0ioscCuDMLlVD2CFUeIwwBmagougY8/ua0KHTOIu4DqKNFZZ4cDMCSI4nBP3G
         MOsoKQhsy6j5h6SJsX5kvheJ3qLkldO5/CkVzuI8jprfHMcSHctlGkl0umC6GBEl0P59
         UKKKFxc+JzC/i4halhtR58PGNhLgJwMCrAurlaHwUo+3rBN0hLW5Ep5Ylogpeoxd8xGI
         YDNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792532112; x=1793136912; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxbmWpHG63bcj8caJCx8dB80g5mvO4e9eYY/N+k9SP8=;
        b=ksrXS4MKf2FXDlwP4QJknd7mq/OKje7ulmV3jIfrjtVpbYnRHMTa6vcbkpTHu8WE3n
         1HEG4PgA2M028Bq80vi/j5zwGFoUwIn4BPjfyipoBWdUzbG5gkTMwIbh5UFW6Ye3HL3E
         qOX/hRvjMr5e/LaHR+2uift3dCMeH1gMLvywwc+tUA/UbUjV/IvVcYDxwYbXjq6YFNWb
         19DOpzV9GfJaIrGBFxQaF9PHsiuYwnfRMKZoByk8J/h1Ro+wtHLMn+z7iSoRKMJnWCId
         ZvJjPgayglxyQ2Ok6d3wPxh6qxAMNWOrqvNweH1Ss9i1hybvWMiuKoRN4VDvXuV749UR
         wyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532112; x=1793136912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxbmWpHG63bcj8caJCx8dB80g5mvO4e9eYY/N+k9SP8=;
        b=pTYi6eksRYdwu8ifL1suicifksm4QWpqNMqP4SOpIyOItix+4S8FHGzlPrrfC9ewmk
         KFAfinNurFGI+d/S5iHqv7dfNPHxEjKSuyMSv4rX2Agx4JMpP+b1/E25yO149WDbimZR
         VY9RTkI+3o4uAW+eyb/4yy8JWgGuqjKeSIuR8CytfDN968s/ueYBagcpbyQyyRPdbUgO
         6k0bm+m9vQPuM8j7s/Ar371ADzuoj/ikxSgJ5tZL+O1jjoZvtmKhHDb7cMlFEPt3Hg8j
         Fsr3+zdY2UodFH+K0V/7yI2dZlO498SkUKj4w2h1XhKOlyDrKzk+YeyFNOV+FTqDfh5b
         BE/w==
X-Forwarded-Encrypted: i=1; AKwUvBw2Y0ux2+InOT0O4Zxyv5JrW84mBT+kqYuQfj/02KxFrupnWH3MYrmDvZfZYNGg7Jb9kMU6@lists.linux.dev
X-Gm-Message-State: AFq9FYIFA81oyx4WlE0ln/f43BjtAaVyffXewZhP5P0qWs0mAcnIXiKd
	qAHczvy3eDLhCd0TItp2x+Gz14IPhoH2E2/msMKn8/LVgIoGS0MpbM9pfM+SedRFkSFH4C5Iieg
	yOxaGbUfC2zAiBCd2WpF/zTfgECbUO1I=
X-Gm-Gg: AYBFou2dF1uxZIb7AMxGBoGncPBmeHnEmy7fF7EGeNK+kz6sWLlSC1v5UvWKfHOkbKY
	LLwFF89fV8FmnOuaBzTJroXJCIUvnML6GqJOdoC8Tv0iLBF5kOAUZSZREymsJEc+hKbXXGr+asc
	HjxFNjtUIarYsl2o6ltpez72YoqT/Z1rJ5pIVhm4hiX4q7QJSA3LAN6HR8VxVqBNxyhwMo4niWy
	JZzY4/5wA60nwDROdngUef1a/D1Gasfyps5K5ax6N3fo+fWIzXv4yc5+VlBAKVMKpmGtssPJG9h
	2D8w9zZ2I0QtPbCupCPlqH+HdQd2EN5Y9cXYCOdYNTBuHkRyfU/CsHt8vgt0j/AQv13uiYq1cwK
	GwsehfSzhfeJBeCu+vxQ4hjKL3CyfQbuC1bJLAIUDFNytlF6EiIdJOPG4nY6sVVlCsRAlhuAyMm
	P9Fz/O8xu6Px94
X-Received: by 2002:a05:6102:448f:b0:7cc:2cd0:e73c with SMTP id
 ada2fe7eead31-7cc926c4d1cmr146631137.25.1792532112476; Tue, 20 Oct 2026
 14:35:12 -0700 (PDT)
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <9e1c586f76943aa9fcd96cecedec805c66fc6e07.1792164438.git.lucien.xin@gmail.com>
 <179244540161.3135.791644548439735124@kernel.org>
In-Reply-To: <179244540161.3135.791644548439735124@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 17:34:59 -0400
X-Gm-Features: AclHuK-cqHur22QaAJB_O1MpvembykENtwhk63DMyFXPnpV5d6Oxh4y7OPcqRQU
Message-ID: <CADvbK_cWtvHg2Mbgwe1+2TZgGDwF9DY5NO8vjim5RLwufW3e5Q@mail.gmail.com>
Subject: Re: [PATCH net-next v17 09/15] quic: add congestion control
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
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] When quic_cong_on_packet_lost() (net/quic/cong.c:94-99)
>   declares persistent congestion, it sets cong->window =3D=E2=80=A6
> - [Low] The commit message says the implementation "adjusts the
>   congestion window accordingly during packet transmission and=E2=80=A6
> - [Low] quic_cong_rtt_update() (net/quic/cong.c:207-209) throws away the
>   whole RTT sample when the raw send-to-ACK interval (cong->time - time)=
=E2=80=A6
>
> --
>
> quic: add congestion control
>
> This patch adds struct quic_cong and struct quic_cong_ops to the QUIC
> stack. They cover RTT measurement, loss and ECN handling, and pacing.
> New Reno is the only algorithm so far, and quic_init_sock() sets it up
> through quic_cong_init().
>
> > The implementation updates RTT estimates when packets are acknowledged,
> > reacts to loss and ECN signals, and adjusts the congestion window
> > accordingly during packet transmission and acknowledgment processing.
>
> [Severity: Low]
> Is this accurate for the transmit path? quic_cong_on_packet_sent() never
> touches cong->window:
>
>     if (cong->ops->on_packet_sent)
>         cong->ops->on_packet_sent(cong, time, bytes, number);
>     quic_cong_update_pacing_time(cong, bytes);
>
> The New Reno entry in quic_congs[] has no .on_packet_sent, so on transmit
> only cong->pacing_time changes.
>
> The commit message body also doesn't mention pacing. That covers the
> pacing_rate and pacing_time fields, the 2 * window / smoothed_rtt rate in
> quic_cong_pace_update(), and quic_cong_update_pacing_time(). Pacing only
> shows up in the version changelog notes.
>
> Could the commit message describe pacing, and drop the part about
> adjusting the window during transmission?
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 0000000000000..765f50660f0e4
> > --- /dev/null
> > +++ b/net/quic/cong.c
> > @@ -0,0 +1,287 @@
>
> [ ... ]
>
> > +/* NEW RENO APIs */
> > +static void reno_recovery(struct quic_cong *cong)
> > +{
> > +     cong->recovery_time =3D cong->time;
> > +     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
> > +     cong->window =3D cong->ssthresh;
> > +}
>
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
> > +             return;
> > +     }
>
> [Severity: Medium]
> Should this branch also reset cong->recovery_time?
>
> The recovery state comes only from quic_cong_in_recovery():
>
>     return time <=3D cong->recovery_time;
>
> The only place that writes recovery_time is reno_recovery(), which sets
> it to cong->time (now).
>
> Take a single loss-detection pass after a link outage:
>
>   P1 lost (pc_start_time is 0, first_rtt_time is set, not in recovery)
>     quic_cong_on_packet_lost()
>       cong->pc_start_time =3D time of P1
>       quic_reno_on_packet_lost()
>         reno_recovery()
>           cong->recovery_time =3D cong->time;    /* now */
>
>   P2 lost, sent more than the persistent congestion duration after P1
>     quic_cong_on_packet_lost()
>       quic_cong_check_persistent_congestion() returns true
>       cong->window =3D cong->min_window;
>
> Every packet still in flight was sent before now, so the ACK for each of
> them returns early here:
>
>     quic_cong_on_packet_acked()
>         if (quic_cong_in_recovery(cong, time))
>             return;
>
> In that case ops->on_packet_acked() is never called. Would the window
> then stay at min_window for at least one more RTT, until a packet sent
> after recovery_time is acked?
>
> RFC 9002 Appendix B.8 sets congestion_recovery_start_time to 0 on
> persistent congestion, so these ACKs grow the window in slow start. The
> state diagram in cong.h shows the same transition:
>
>  *             persistent congestion |   Slow     |
>  *         (O)---------------------->|   Start    |
>
> Here, though, the derived state ends up as Recovery Period, not Slow
> Start.
>
> Nothing in this patch calls the quic_cong_on_packet_* hooks yet. This
> would show up once the outqueue changes start calling them.
>
True.

Good catch.
I will reset congestion_recovery_start_time to 0 on  persistent congestion.

Thanks.
> [ ... ]
>
> > +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u64 time, u32 ack_de=
lay)
> > +{
> > +     u32 adjusted_rtt, rttvar_sample;
> > +
> > +     /* Ignore RTT sample if ACK delay is suspiciously large. */
> > +     if (ack_delay > cong->max_ack_delay * 2 ||
> > +         cong->time - time > QUIC_RTT_MAX)
> > +             return;
>
> [Severity: Low]
> Is the 6 second QUIC_RTT_MAX cutoff too tight here?
>
> cong->time - time is the raw interval from send to ACK, so it includes
> the peer's ACK delay. RFC 9000 allows max_ack_delay up to 2^14 ms, which
> matches common.h:
>
>     #define QUIC_MAX_ACK_DELAY  (16384 * 1000)
>
> For example, take a peer max_ack_delay of 8s, an ack_delay of 7s and a
> measured interval of 7.1s. The sample passes the ack_delay check but is
> still thrown away. The same happens on any path whose RTT stays above
> 6s.
>
> The early return comes before anything is updated. smoothed_rtt and
> rttvar stay at their initial 333ms and 166ms, and those feed into pto,
> loss_delay and the pacing rate.
>
> first_rtt_time also stays 0, so this condition in
> quic_cong_on_packet_lost() is never true:
>
>     if (!cong->pc_start_time && cong->first_rtt_time &&
>         time > cong->first_rtt_time)
>         cong->pc_start_time =3D time;
>
> As a result, persistent congestion tracking never starts.
>
> The v14 changelog says the cap prevents latest_rtt overflow. latest_rtt
> is a u32 in microseconds, though, so it doesn't overflow until about
> 4295 seconds.
>
> Could the limit be raised, or could ack_delay be subtracted before the
> check? Nothing in this patch calls quic_cong_rtt_update() yet, so this
> only matters once later patches call it.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1792164438.git.lucien.xin%40gmail.com
