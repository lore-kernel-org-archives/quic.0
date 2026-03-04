Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7435FF6E
	for <quic@lists.linux.dev>; Wed,  4 Mar 2026 23:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665409; cv=pass; b=qykdA8gfyp20Vdze4tzOsRnr1eJXhzWDDHj0BQDMJ2KhdQChn1OfqpZ9qhxoD8jdT8dokSQ03+57J4/0xPCOLRmLv1M6RW/okjsiiTMNYhXTB8U0oLfUO4IxWRfP6wJePxmRx5LGhD4KXNgreZ7ZoitpDAUVzr9PDO2JsIniZHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665409; c=relaxed/simple;
	bh=2i+IHSwXdo2vJdP59dU99G2iRMYrlyhf0Di7pAHPdxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PV+1tUXT3sC4KYhEIBzQB5K0m5Wnv1wOCR36L+5DHIzhFTj9L6qT+VIyjTrwwR7UYGv3jdKczY4TO8Vu3MgIy/Y+0A6b/fiPVxFmT++qaTBIca6QrbB9Ck8kar4BPErZtrAMsssBUnjfjQYl53T0agbh13MccE0Oxli8VQc3uDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4wNfgmD; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4wNfgmD"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94de63dea9aso4673921241.3
        for <quic@lists.linux.dev>; Wed, 04 Mar 2026 15:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772665406; cv=none;
        d=google.com; s=arc-20240605;
        b=WcmvUcZQpPw9KE+QrapOTiQSbriGK9n9ttQfS94i77X0c3PyowbNhkftDKKuO9xqAp
         RuTCTzaRyaFlELE/MJPe/Z02q/dMp9G2g79t2/9Mrxggf2O0Oe4Fw9BghItiK6EgMwYG
         FPsqtWgMpl8nVLCFKfLZA1ipqU0UpqgUPnNCroDkcpVRbYx3S/5A81jXphOtHg97li7t
         w2JAWCsJ+rwunWwZyADNl04cNpCg+Jz4fL98C4Ndq4qyBKVAFjtvui7G0LJxJXFyQrPC
         Wvwp5NOcB7GUEsOlQcioj8/3tei9Fk5teMHUOkGgdO2fJOxJjng8Vhxz57I1XVkYIj+5
         Iy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ivkx6puhgdlm/jw1xcgfFyqPx3PkaCKD+eg0EyAqi2E=;
        fh=L/KvS9Db+GN6hBXwNARBcZrVwSgAgbz+oYIQvqQx+lE=;
        b=QYuXhr2ZyNRHf5I7+vPyxhmZz1Mhwj8vDIARYbb6mSHd0obk+HE+/WquyxgX0fhSGf
         pY527mvvQKPeJUZ8KXtW4coGURGYolKvoE197CvOYd9HC4MZrUZneUVeB7Ec73gm7OMK
         rj8Nm/GdGw5rlK/Femgi0CzqP5YjsiqJsvtQCY2iD3m53H/E2bncV1q77CcZ16DpFR1U
         FAVVwNVTc/0i1Mix/pzQQnXHOpgyQHP201UlARXB4lkeGxBwPzTWvJ1khQMBQbBZqPVI
         SJJK1+3FywMincaLLMfpD02FBJjostJYHg3ICA/JT8zHEvlPC4vNI2M088SEuhi54MEd
         IjJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772665406; x=1773270206; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ivkx6puhgdlm/jw1xcgfFyqPx3PkaCKD+eg0EyAqi2E=;
        b=a4wNfgmDzP5TxlVgFQEGL45sG2E965xrgAtcQeOORibYvut7TEtHnnJ5F4xjPt175o
         pqO9dUxJeCX72YMTj5r7HGzei/gSNhgdftJ42fUakslP+rt7dso19Q15Ds0P/prYnLyU
         X0CBbgwzrqK1hU0LNYHKltSiQoE5tZrIQp9Y28YqHVAPx7FNHcYxRocEUvb18kPLIyjO
         pK28TCPppkdeK1RyzQxFm9ag+W67062xj9z7usPJ/GyFGDkhAtSRgGjtkSX1ONm/As/j
         qLu9ERKmQSRkztm4SoIq7yCCA3++OCXQohbDiUohd942yVW3tHJlbDIQoEyvyOVedMpN
         6ZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665406; x=1773270206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ivkx6puhgdlm/jw1xcgfFyqPx3PkaCKD+eg0EyAqi2E=;
        b=ikLyw9dib72qpLV12GAS8jHZEOdgEhMzTEVqDXMB7AU8wqv5UqlGCvJxksNi04bmO4
         ih/EUqOWJbV4n73TqE2j2d0sNKMHo0p7/oqWx6uLp9zvfBgHO5xx19yUfLJYf1zMAyZ8
         4jeLLAtWICNxCUm7muzcpCGvq1eOZKm9X2HNxEa073FQhRJUXdI5xzYA5trzmnm5XgLd
         VXGFtMqvCXJ2HZ0yT5nLm+UD1J5dsGlUE7gQ8uXVpDKpsIhDztVZNUtHB6Gz0cqHxqOi
         gG9HWbvxbBDVotYuxTTe5AlZpsrpIzt2dLqlKPGNDTv7Vtp7toRd4Jwh66e3mSqhOi71
         sGtw==
X-Forwarded-Encrypted: i=1; AJvYcCXw+zQoiEDImTTrDQKwdif7Lv5vVqYNc6yv5OyVNMOqsMuK9F2R6OOUXdrdL2c+9wttaxsw@lists.linux.dev
X-Gm-Message-State: AOJu0YxkSY517MFmgeFreh2E8PIrDvf+5HFq2hAc3TGTWLjIn8ws/dBH
	fESxpZuT+p5R383MzoJYQ+OIlLNygbGQDyHb6yYCopZjnXyyXUtXthXlRG+K6pOIoGjrAV7YHvY
	RS/92/n1/21ptqJbjud6oBMFeGEv7y1Q=
X-Gm-Gg: ATEYQzxBnvpbhKC0PsMuOVI0fuhnkCdIAm1vFi2V2qpA1ebswNcOHYZuhg5cUFZB/iJ
	033Fzw2v9sd/d6TVADC5buCSe1X1n8+ju1xGbtRHbLbiZ8lKvOoy6JpJrUFT5KEGwkVyClyVGnE
	BuDCRjpP/zp8zkz/maIBFpyfBNdR8FF6vl4Mfrirzvu+M4wDFSH2hC2YqAL5l7GW3em1ixx8t9Q
	n38Pa922C2ELUY7dA3uEKw5NVR90oPsgALm6udhRL6QLNzHvGb6n8GVyKp+sl1ITR6+hH/uw/Fs
	NfJVXxLBR/rkxiUG7NipC7kZpLTOKjEx1zODcgtT4tZSSSpC55+Tbs5yq9U09m51k08NxKX5KmS
	M99MXEQ==
X-Received: by 2002:a05:6102:26d1:b0:5ee:a8c4:18d4 with SMTP id
 ada2fe7eead31-5ffab04169amr1874568137.35.1772665406379; Wed, 04 Mar 2026
 15:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bffaab8d4727991c8dd46c8b57a08507545a25a4.1771986861.git.lucien.xin@gmail.com>
 <20260303083324.35531-1-pabeni@redhat.com>
In-Reply-To: <20260303083324.35531-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 18:03:14 -0500
X-Gm-Features: AaiRm53WpBr8gTUmyaCTW1p2ySTbZ_Gi0kG47wju22GuqYXLQHQ7psn2_WgPq2w
Message-ID: <CADvbK_f96OxCWnP9UdKxYtJ9=3xY69_ScTrU=9AQF1iUrBp_Cg@mail.gmail.com>
Subject: Re: [net-next,v10,13/15] quic: add timer management
To: Paolo Abeni <pabeni@redhat.com>
Cc: hepengtao@xiaomi.com, kuba@kernel.org, jlayton@kernel.org, metze@samba.org, 
	davem@davemloft.net, kernel-tls-handshake@lists.linux.dev, horms@kernel.org, 
	hare@suse.de, aahringo@redhat.com, tfanelli@redhat.com, mail@johnericson.me, 
	andrew.gospodarek@broadcom.com, linkinjeon@kernel.org, dhowells@redhat.com, 
	matttbe@kernel.org, xiyou.wangcong@gmail.com, dreibh@simula.no, 
	jbaron@akamai.com, quic@lists.linux.dev, pc@manguebit.com, 
	marc@fiuczynski.com, edumazet@google.com, alibuda@linux.alibaba.com, 
	steved@redhat.com, illiliti@protonmail.com, tom@talpey.com, 
	marcelo.leitner@gmail.com, sd@queasysnail.net, linux-cifs@vger.kernel.org, 
	netdev@vger.kernel.org, mbuhl@openbsd.org, smfrench@gmail.com, 
	chuck.lever@oracle.com, daniel@haxx.se
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: add timer management
>
> This patch introduces 'quic_timer' to unify and manage the five main
> timers used in QUIC: loss detection, delayed ACK, path validation,
> PMTU probing, and pacing. These timers are critical for driving
> retransmissions, connection liveness, and flow control.
>
> > diff --git a/net/quic/Makefile b/net/quic/Makefile
> > index 58bb18f7926d..2ccf01ad9e22 100644
> > --- a/net/quic/Makefile
> > +++ b/net/quic/Makefile
>
> [ ... ]
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 74e3e3939c61..93a7abefc226 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
>
> [ ... ]
>
> > diff --git a/net/quic/socket.h b/net/quic/socket.h
> > index d7811391cc8b..c5654fdc06b5 100644
> > --- a/net/quic/socket.h
> > +++ b/net/quic/socket.h
>
> [ ... ]
>
> > diff --git a/net/quic/timer.c b/net/quic/timer.c
> > new file mode 100644
> > index 000000000000..6f957385a341
> > --- /dev/null
> > +++ b/net/quic/timer.c
> > @@ -0,0 +1,196 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/* QUIC kernel implementation
> > + * (C) Copyright Red Hat Corp. 2023
> > + *
> > + * This file is part of the QUIC kernel implementation
> > + *
> > + * Initialization/cleanup for QUIC protocol support.
> > + *
> > + * Written or modified by:
> > + *    Xin Long <lucien.xin@gmail.com>
> > + */
> > +
> > +#include "socket.h"
>
> [ ... ]
>
> > +static void quic_timer_sack_timeout(struct timer_list *t)
> > +{
> > +     struct quic_sock *qs =3D container_of(t, struct quic_sock, timers=
[QUIC_TIMER_SACK].t);
> > +     struct sock *sk =3D &qs->inet.sk;
> > +
> > +     bh_lock_sock(sk);
> > +     if (sock_owned_by_user(sk)) {
> > +             if (!test_and_set_bit(QUIC_SACK_DEFERRED, &sk->sk_tsq_fla=
gs))
> > +                     sock_hold(sk);
> > +             goto out;
> > +     }
> > +
> > +     quic_timer_sack_handler(sk);
> > +out:
> > +     bh_unlock_sock(sk);
> > +     sock_put(sk);
> > +}
>
> [ ... ]
>
> > +static void quic_timer_loss_timeout(struct timer_list *t)
> > +{
> > +     struct quic_sock *qs =3D container_of(t, struct quic_sock, timers=
[QUIC_TIMER_LOSS].t);
> > +     struct sock *sk =3D &qs->inet.sk;
> > +
> > +     bh_lock_sock(sk);
> > +     if (sock_owned_by_user(sk)) {
> > +             if (!test_and_set_bit(QUIC_LOSS_DEFERRED, &sk->sk_tsq_fla=
gs))
> > +                     sock_hold(sk);
> > +             goto out;
> > +     }
> > +
> > +     quic_timer_loss_handler(sk);
> > +out:
> > +     bh_unlock_sock(sk);
> > +     sock_put(sk);
> > +}
>
> [ ... ]
>
> > +static void quic_timer_path_timeout(struct timer_list *t)
> > +{
> > +     struct quic_sock *qs =3D container_of(t, struct quic_sock, timers=
[QUIC_TIMER_PATH].t);
> > +     struct sock *sk =3D &qs->inet.sk;
> > +
> > +     bh_lock_sock(sk);
> > +     if (sock_owned_by_user(sk)) {
> > +             if (!test_and_set_bit(QUIC_PATH_DEFERRED, &sk->sk_tsq_fla=
gs))
> > +                     sock_hold(sk);
> > +             goto out;
> > +     }
> > +
> > +     quic_timer_path_handler(sk);
> > +out:
> > +     bh_unlock_sock(sk);
> > +     sock_put(sk);
> > +}
>
> [ ... ]
>
> > +static void quic_timer_pmtu_timeout(struct timer_list *t)
> > +{
> > +     struct quic_sock *qs =3D container_of(t, struct quic_sock, timers=
[QUIC_TIMER_PMTU].t);
> > +     struct sock *sk =3D &qs->inet.sk;
> > +
> > +     bh_lock_sock(sk);
> > +     if (sock_owned_by_user(sk)) {
> > +             if (!test_and_set_bit(QUIC_PMTU_DEFERRED, &sk->sk_tsq_fla=
gs))
> > +                     sock_hold(sk);
> > +             goto out;
> > +     }
> > +
> > +     quic_timer_pmtu_handler(sk);
> > +out:
> > +     bh_unlock_sock(sk);
> > +     sock_put(sk);
> > +}
>
> This isn't a bug, but the four timer_list-based timeout callbacks
> (quic_timer_sack_timeout, quic_timer_loss_timeout, quic_timer_path_timeou=
t,
> quic_timer_pmtu_timeout) are structurally identical.
>
> Each extracts the sock via container_of, takes bh_lock_sock, checks
> sock_owned_by_user to conditionally defer via test_and_set_bit/sock_hold,
> otherwise calls the handler directly, then bh_unlock_sock/sock_put. They
> differ only in the timer index constant, the deferred bit name, and the
> handler function.
>
> This pattern could be consolidated into a single parameterized timeout
> callback using a data table that maps timer type to deferred bit and hand=
ler
> function pointer, reducing around 60 lines of near-duplicate code to
> roughly 15 lines. The TCP subsystem uses a similar approach for some of i=
ts
> timer infrastructure.
>
> That said, this follows the existing per-timer-callback pattern used
> elsewhere in the kernel networking stack (for example, tcp_write_timer,
> tcp_delack_timer are also separate functions), so this is a minor style
> observation rather than a defect.
>
This is a good one. May not add a data table, but a simple helper like this=
:

static void quic_timer_timeout(struct timer_list *t, int type, int defer,
                               void (*handler)(struct sock *sk))
{
        struct quic_sock *qs =3D container_of(t, struct quic_sock,
timers[type].t);
        struct sock *sk =3D &qs->inet.sk;

        bh_lock_sock(sk);
        if (sock_owned_by_user(sk)) {
                if (!test_and_set_bit(defer, &sk->sk_tsq_flags))
                        sock_hold(sk);
                goto out;
        }

        handler(sk);
out:
        bh_unlock_sock(sk);
        sock_put(sk);
}

will reduce quite some dup code.

> > +void quic_timer_reset(struct sock *sk, u8 type, u64 timeout)
> > +{
> > +     struct timer_list *t =3D quic_timer(sk, type);
> > +
> > +     if (timeout && !mod_timer(t, jiffies + usecs_to_jiffies(timeout))=
)
> > +             sock_hold(sk);
> > +}
>
> Can this function handle QUIC_TIMER_PACE safely? It unconditionally casts
> the result of quic_timer() to 'struct timer_list *' and calls mod_timer()=
.
>
> Looking at the timer API in this patch:
>
> Both quic_timer_start() and quic_timer_stop() have explicit QUIC_TIMER_PA=
CE
> guards that dispatch to hrtimer APIs:
>
> quic_timer_start():
>         if (type =3D=3D QUIC_TIMER_PACE) {
>                 hr =3D quic_timer(sk, type);
>                 if (!hrtimer_is_queued(hr)) {
>                         hrtimer_start(hr, ns_to_ktime(timeout), ...);
>                         sock_hold(sk);
>                 }
>                 return;
>         }
>
> quic_timer_stop():
>         if (type =3D=3D QUIC_TIMER_PACE) {
>                 if (hrtimer_try_to_cancel(quic_timer(sk, type)) =3D=3D 1)
>                         sock_put(sk);
>                 return;
>         }
>
> However, quic_timer_reset() does not have a similar guard. If a future
> caller invokes quic_timer_reset(sk, QUIC_TIMER_PACE, timeout), mod_timer(=
)
> will operate on memory that is actually a 'struct hrtimer', potentially
> causing memory corruption.
>
> Should quic_timer_reset() either add a QUIC_TIMER_PACE guard consistent w=
ith
> quic_timer_start()/quic_timer_stop(), or document that this function must
> only be used with timer_list-based timers?
>
There will be no callers to quic_timer_reset(QUIC_TIMER_PACE), so no need
to add a check for QUIC_TIMER_PACE, I will leave a comment there for this.

Thanks.

> > +void quic_timer_start(struct sock *sk, u8 type, u64 timeout)
> > +{
> > +     struct timer_list *t;
> > +     struct hrtimer *hr;
> > +
> > +     if (type =3D=3D QUIC_TIMER_PACE) {
> > +             hr =3D quic_timer(sk, type);
> > +
> > +             if (!hrtimer_is_queued(hr)) {
> > +                     hrtimer_start(hr, ns_to_ktime(timeout), HRTIMER_M=
ODE_ABS_PINNED_SOFT);
> > +                     sock_hold(sk);
> > +             }
> > +             return;
> > +     }
> > +
> > +     t =3D quic_timer(sk, type);
> > +     if (timeout && !timer_pending(t)) {
> > +             if (!mod_timer(t, jiffies + usecs_to_jiffies(timeout)))
> > +                     sock_hold(sk);
> > +     }
> > +}
> > +
> > +void quic_timer_stop(struct sock *sk, u8 type)
> > +{
> > +     if (type =3D=3D QUIC_TIMER_PACE) {
> > +             if (hrtimer_try_to_cancel(quic_timer(sk, type)) =3D=3D 1)
> > +                     sock_put(sk);
> > +             return;
> > +     }
> > +     if (timer_delete(quic_timer(sk, type)))
> > +             sock_put(sk);
> > +}
>
> [ ... ]
>
> > diff --git a/net/quic/timer.h b/net/quic/timer.h
> > new file mode 100644
> > index 000000000000..61b094325334
> > --- /dev/null
> > +++ b/net/quic/timer.h
>
> [ ... ]
>
