Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5783976AF
	for <quic@lists.linux.dev>; Wed,  4 Mar 2026 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660537; cv=pass; b=Yax4ULGfFCJJeAn1gW3EWF0eHAEIVWvQYgpzPKkI+il32pr2EZBfsploIvmt+w/dRHPeqWyzAdGK/PJ8Z2/a8/gpZEnWtJWJ3pbxARpIis0ptvfCpVVhrKCStPb20o224JZPMlSm0FL15gvC11iRtidxjDNAm9bC6tkyNhg6y5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660537; c=relaxed/simple;
	bh=CZu//w8nfUqxfRbIfFweHrXIoGfZbN61WXULKZ59AeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBTLo14oToXz/doF4EzZFLz11h9+9NDpxOt0A/Re2Lx15VxBt4SFtJkdZysOYvbLBvy1Bu0oiBUDNhz5/+3nBuD87AXNfcQ0hx5LWNKgk8RJ2PaVjxfAd9kfzx8dyFBtAvBU5ww545M7FMMQR3lH2SIGsHrmzet9BW7bjXOPHkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jInS4VAZ; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jInS4VAZ"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a84f2bf7bso6681733e0c.2
        for <quic@lists.linux.dev>; Wed, 04 Mar 2026 13:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772660532; cv=none;
        d=google.com; s=arc-20240605;
        b=Ip+/m7lun47+LYntmcXla8ONBc/FTIQdoe0Kq9BCNGYvWCYz5Xp/MJ88q6IEX3XZ9n
         F8XJnDgwgSoR05ai86rQTzslNI572lHtzU1BM+4w9GdgloHA+9I6Ls5k1umtzI3JRSFe
         Ri/9xewP8cOsGk7KnIheYXMG5P8+Hv40i10gVLC4u5mMl/OYZ6tDy7Cy80NF94s/zJom
         UOL2Arsyi1UYFg4SaGvO/NhJf52sstAqt7zZ3kG148GvH8mIwfZ4tJ8z2ofhECBHrMMI
         hMC88q5hP95yV1KC28es91nQo1lheacGwp9fvk7aXwyGb7DMScl1MZtIedDmaVMnonkg
         Ls+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k3W5ct/v2iGUTvV1EtPmndYMgCvTbcZYMCleQX41UhM=;
        fh=VzW6AZN7sKX9MABmm5mgUgJjHGXLCxQvuS0pLLhd56I=;
        b=grUKaLVLLY7dnZwVWL0nD+rXfP99SJLf3iBu7YySCa0eVSGvdH5LaNv3LFW9us7pqC
         gRqvvIn8lvAQFeVUAUqnAfRjz5sWek552oxPoUKDsC1xw482/9EBX90Eqq5IN3dgcWDx
         nz3W3pzV21zPWiyRNKqd1tCssjumTrjZFsxcjcRdgYTBwEXcZ8epsmWHcpR0pqOZI2Om
         fZAbglSmTwj4F2RtUQj1NPP07PtROom9ad0EZUUOtriT6nLlA/sKlwVT1vSuwhgWVSe7
         6Vnqe2qjivtWMibXQd838gvXhxmVoTELz24+95Vimph7GMnlz9YooIvDdRnHWlJcESAL
         23Ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772660532; x=1773265332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3W5ct/v2iGUTvV1EtPmndYMgCvTbcZYMCleQX41UhM=;
        b=jInS4VAZLkL9pVZJAcLStf067rgcFU9TxbpBxNi0XjklN2bxozADXamOKUO4/e/+Ux
         bG+OKrHtuDx9WFueEIClcqndVOGTUgw2PVqogfAXFttt2hssFpUNUWwtGxRi/hZ6jcmS
         1NyGBFeQf0BGn62tgDKt+OM9kd370yok/vztQBVc0RMZOlb6iUkEG8Mox5xwFYwtK3Yx
         pXxUG36uMUFD0x3wNXKroU3THZT+pZUOcLckhXbyUPbcD3m/lazwp+OZ8v+Wf1/15iHu
         2rWsq2dDz5wJJD7+v1N+1tmadZNx5D7ZH8HlK39g+9/7Df6OY4EOOvmjLbPjIHxsfKOx
         4O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772660532; x=1773265332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3W5ct/v2iGUTvV1EtPmndYMgCvTbcZYMCleQX41UhM=;
        b=wQgrQGQlOuXOGyOKU0bPiC8mu/MIKTDn067ZW30MYnr9NrMyYIMppx+fpsE0aPaa2m
         /yyoFT7bl3xRrGh00UDwjEfGESgJMv8Usg4sApHfa6vow6b1dOgA2cTZ/NY1cB7YYf9j
         3diRIBJ/bnvSUhLyBPkITllbhcmu00Rskhk6aV29Bv7MeAuM2s/xSR3oUFZir3YQ0kDh
         MrLtIXSSB2f8GJuHG1DvqctonBrVj7ZszhssKLyjeAZPHpdtItPR9ACwNDAut87ZbJap
         INg5I6BRIwZRiOggklDnwlLhD+6ZpDzS6Gu75++nrGjwrWNk4Tv/JuJXh8FTFfClsWzj
         C5lg==
X-Forwarded-Encrypted: i=1; AJvYcCWi1+fw0iAfTAZqugYy7Zqv7/PfUBI9Ug73pSsuAbW6GCZnS7ATP0f8oCuwo5JINiZS4mMB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Y+5VJvn1hOAUj8BEpMF13N16KWVRR9kfusP4PpdxXeLbvvCQ
	5udQMehaZ0F+mVUqBtG+D4Nv5EXF7d1JYXQC/KjfcUBST5Nbgkad11Wp1UfIJsSckrYUBjFG/4r
	G6i+erVQdfYp4F/l14EixL06UHe10qZY=
X-Gm-Gg: ATEYQzwERgG5qXT5/tSolh908q+CflqTXry1i7/oxjfixamAF3++tSofw57EDYCYWre
	zmmqUAFVJlyXfTQJVs79w6r3vFcGAjJf7uTgR6Pqn7uE0UIsr6+2CoO4+d1Z0BOWyD/qlmglyaB
	zZsSDu6JI0Ehq/9luc884ajAvk03K+BcftnEL+1CdgkhaX3IplqCLNZ7Y73E5wixO//5uzyxfB/
	/E4ZPjP/v/kOriuOz2Mw5X8JxL2ZPTev9ZvlJThnfFFiZzuL0TYX7btm6NSQSOCmX4m7krIEOgB
	YTLecvWv9AbRL0VaPYDdPUCj6/lM+soKt9aWqlhGxxBjDHEyBITdSCgDMDmcPypAFIu9gRr8cvt
	SdyCDuU9K3kgNzN+w0sja6LE915Sg/Z5TTLDQpgfkYmAMy1rGyZU=
X-Received: by 2002:a05:6102:26c6:b0:5ef:b0d3:295f with SMTP id
 ada2fe7eead31-5ffaac4951bmr1696488137.8.1772660532453; Wed, 04 Mar 2026
 13:42:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <91c5313a4c6675fc9f98efbafc92ca162a6e7d66.1771986861.git.lucien.xin@gmail.com>
 <20260303083207.34631-1-pabeni@redhat.com>
In-Reply-To: <20260303083207.34631-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 16:41:59 -0500
X-Gm-Features: AaiRm50iQw95v8k3Y7-EQTJAv0UA-MtI9QwoadQFdZTYPxQjeDw-BRrDhXRxJ78
Message-ID: <CADvbK_cKefZpb=yCi_yxVWX4ear96LpCb+9W7pXs_thRWCWB2g@mail.gmail.com>
Subject: Re: [net-next,v10,09/15] quic: add congestion control
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

On Tue, Mar 3, 2026 at 3:32=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
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
> This patch introduces quic_cong for RTT measurement and congestion
> control, implementing a state machine with slow start, congestion
> avoidance, and recovery phases using the New Reno algorithm.
>
> Signed-off-by: Xin Long <lucien.xin@gmail.com>
>
> > diff --git a/net/quic/Makefile b/net/quic/Makefile
> > index 1565fb5cef9d..4d4a42c6d565 100644
> > --- a/net/quic/Makefile
> > +++ b/net/quic/Makefile
> > @@ -5,4 +5,5 @@
> >
> >  obj-$(CONFIG_IP_QUIC) +=3D quic.o
> >
> > -quic-y :=3D common.o family.o protocol.o socket.o stream.o connid.o pa=
th.o
> > +quic-y :=3D common.o family.o protocol.o socket.o stream.o connid.o pa=
th.o \
> > +       cong.o
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 000000000000..e0f78ecb00e4
> > --- /dev/null
> > +++ b/net/quic/cong.c
>
> [ ... ]
>
> > +static void quic_reno_on_packet_lost(struct quic_cong *cong, u64 time,=
 u32 bytes, s64 number)
> > +{
> > +     if (quic_cong_check_persistent_congestion(cong, time))
> > +             return;
> > +
> > +     switch (cong->state) {
> > +     case QUIC_CONG_SLOW_START:
> > +             pr_debug("%s: slow_start -> recovery, cwnd: %u, ssthresh:=
 %u\n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     case QUIC_CONG_RECOVERY_PERIOD:
> > +             return;
> > +     case QUIC_CONG_CONGESTION_AVOIDANCE:
> > +             pr_debug("%s: cong_avoid -> recovery, cwnd: %u, ssthresh:=
 %u\n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     default:
> > +             pr_debug("%s: wrong congestion state: %d\n", __func__, co=
ng->state);
> > +             return;
> > +     }
> > +
> > +     cong->recovery_time =3D cong->time;
> > +     cong->state =3D QUIC_CONG_RECOVERY_PERIOD;
> > +     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
> > +     cong->window =3D cong->ssthresh;
> > +}
>
> [ ... ]
>
> > +static void quic_reno_on_process_ecn(struct quic_cong *cong)
> > +{
> > +     switch (cong->state) {
> > +     case QUIC_CONG_SLOW_START:
> > +             pr_debug("%s: slow_start -> recovery, cwnd: %u, ssthresh:=
 %u\n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     case QUIC_CONG_RECOVERY_PERIOD:
> > +             return;
> > +     case QUIC_CONG_CONGESTION_AVOIDANCE:
> > +             pr_debug("%s: cong_avoid -> recovery, cwnd: %u, ssthresh:=
 %u\n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     default:
> > +             pr_debug("%s: wrong congestion state: %d\n", __func__, co=
ng->state);
> > +             return;
> > +     }
> > +
> > +     cong->recovery_time =3D cong->time;
> > +     cong->state =3D QUIC_CONG_RECOVERY_PERIOD;
> > +     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
> > +     cong->window =3D cong->ssthresh;
> > +}
>
> This isn't a bug, but these two functions share almost identical logic
> for entering the recovery state. The switch statement has the same three
> cases with identical handling in both functions, and the four-line
> recovery-entry block at the end is exactly the same:
>
>     cong->recovery_time =3D cong->time;
>     cong->state =3D QUIC_CONG_RECOVERY_PERIOD;
>     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
>     cong->window =3D cong->ssthresh;
>
> The only difference is quic_reno_on_packet_lost() checks for persistent
> congestion first. Would factoring this shared logic into a helper
> function make future maintenance easier and ensure the recovery path
> stays consistent across both ECN and loss events?
>
I will add a helper quic_reno_handle_packet_lost() for this.

> [ ... ]
>
> > +void quic_cong_set_algo(struct quic_cong *cong, u8 algo)
> > +{
> > +     /* The caller must ensure algo < QUIC_CONG_ALG_MAX. */
> > +     cong->algo =3D algo;
> > +     cong->state =3D QUIC_CONG_SLOW_START;
> > +     cong->ssthresh =3D U32_MAX;
> > +     cong->ops =3D &quic_congs[algo];
> > +     cong->ops->on_init(cong);
> > +}
>
> Should this function validate the algo parameter? The comment says the
> caller must ensure algo is less than QUIC_CONG_ALG_MAX, but there's no
> runtime check. Since QUIC_CONG_ALG_MAX is defined in the UAPI and this
> function is exported in cong.h, could a future caller (for example, a
> setsockopt path accepting user-supplied algorithm choices) pass an
> out-of-range value and cause an out-of-bounds array access into
> quic_congs[]?
>
The callers will do the validation as the comment said, hopefully AI will n=
ot
flag this again.

Thanks.
