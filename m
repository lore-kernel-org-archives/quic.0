Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FBA30DD2A
	for <quic@lists.linux.dev>; Thu,  5 Feb 2026 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318245; cv=pass; b=HZRsIrnXi/9UHZmNp708fJs3whTFGz6g5QbX6/RcOZa5G03MflpQNoxwhrjSp5/SJBIE1cfdFl3NFbwpfAEsZrvryFhLf7ut50AKXBYCIK8s3f2gZpoJDR1jKySBouLbcx4jkzaW51ADkqQuGP9aAYrYq/HNoZ1kN2kN7HCRJl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318245; c=relaxed/simple;
	bh=mMoJ2tLJEBg9sKf8yUPINOdmAZsdGLwl34VanWm6tos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ql4G2PVXK5rBV4Hp9z4nW8bvP+OxJ+n3Go1AQ8rnORLIw9PWozLXfo7zDzkqbiuA5Uh+UHuboZ36gj6JGotmobHgOqw73AV+qCcl2Wpm6QMEpniVFdwh2o3/qd4ny4qnkCVi40xfO5B9BoFffx9xb2boMW6YOmZXiYUX4RhS6/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncaJz614; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncaJz614"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a79ded11a2so9359685ad.3
        for <quic@lists.linux.dev>; Thu, 05 Feb 2026 11:04:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770318244; cv=none;
        d=google.com; s=arc-20240605;
        b=Mpx270kMhrDmucZpFh5nk/ov3vTnzmb0hljR7k9ZhUxTgIRjMeGe9srN/f9Vzaf/m4
         vNMTRm7RL+Whq7pHjHQkB8nb6yc3iFm1vcEqhEmL0YcWzJotdGRmHSyqw6j0svGzerGf
         N8yLBgeDF1G53bBwej9crsyfLLNNIk/YSQH3eAI5Jdm9C7lmLkW/O8eMHcOavVl0kqNq
         kvHb7EpmsbVZtNtI6o/HQS5r2rhKW4OYzY4Lbg63OOeFv9NtPk/Y2CcJiSp1H4AvByIs
         QdmWJmTJDvF2UhlJBYsxOBiX7E2Jwf/LFGmLTNMvlYoyRuaUeiF7q7PQZIUol7ksJB+6
         XAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UTcUAmNhDbXfJ1YkCH2MncVbNEMdAOiqZyjVuJUmYMI=;
        fh=jjyN5r/sD1sniiLgX04NFpzmMwPcplLp+H376bXygM4=;
        b=GK+APIND94LcMY3jlJgeUB1dg2tVqFQs5FNSXzS+//Li2OmU0AikYExGe5zvHvLGmZ
         j4MKRNrayZ0TztCTUrDSQo18u9/qVIrvbp/20kRvhsColPfLQC7TPlCBxJA6OsN1OM77
         3nzmCA7NGoZGgzxmE8M2oxuVRtVE1Z8fP5eOBPmlVewxT0hIDiwkzZh7RsJox+OByivz
         Mcoi2VtYtG9NoS1zcVN7V7KeXGVJsVmowWkMsh5XTg0+j0GcUdhwZs7e/fL3Vk5JSnWN
         PyFrILoGjmByHEBokHaQjtCKDU0LXLnJnU91lka6Aun4Uhs2OdjQok5mSbDe6eDhK0zU
         aaqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770318244; x=1770923044; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTcUAmNhDbXfJ1YkCH2MncVbNEMdAOiqZyjVuJUmYMI=;
        b=ncaJz614peRQQ433pMn2Qre+GDTrHBNU2iNrhoEANNwgGGVqtXdmmIm9nrrIjPQ0Ma
         HK4rscQzfuz+lbBnLt35jZZG507r+jgL6+RWjF6SEf3bMko8DgcBExFdhex9hmh1oY8Y
         J13af8O8fhOtvqIvXOIM9cZF9Ubu2XpJagsgzYfio69nPpGgbmk1i7aoxk3Zhml3d38r
         lJ05MAB1txPItUCHe6QbWmaYsVwUd4Xp2Ub//o3k2V5JaTc0uWnJt4kULd8rmRCSFGeQ
         +fw4EElg4d0FmKkYviCbL9qXmc9ottymNxRUo6JEp3aWvnfPsMtitOuPI35g2mu3mqEQ
         ayzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770318244; x=1770923044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UTcUAmNhDbXfJ1YkCH2MncVbNEMdAOiqZyjVuJUmYMI=;
        b=tfE/Vr/dI4T2XnlH4L7QcJi0zcfUCRUOGvnkVG4hZeMReT7s3BM+ae6ihV5x0PSgQT
         mt925026lSB2RLOQ3D5qr75HCqmvZ74MT/4XKsy1RLNtvvdX3D2COEOSpdRdAw3+sP15
         kUKeWG7F8+EHDhNFntjoWNDLKDKPHn6oD5SZ6utPjoTnqZsz8wtL9nse0XcwClhrvODw
         tkp1uDEWUW7CW1a/eARzMMBCRn5F1zayn7nwytYh76QMIhup2vQbVy/7l4TR/ymGg5C7
         CSJCCbjdmxmThKY9XGBCrQwLgexFCnQLBlWQgzInnpxB3L+ldq9XgumgJ0chLkUvhFAJ
         YdBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSrognpl7Lqf+b3NqKo0L1P4RPcJj5lg7Z5/pK09gyXck6HhBsz5T+i/MflaLMyEbiIIcU@lists.linux.dev
X-Gm-Message-State: AOJu0YwihG91zLRAgebwklXfR2wDYMxcdFTG8D/z/TiJik57bakdW+th
	6whJY+7Sor1MBnRZa/iE0GipRVWcHEf6B6UOsUYI8FzhWzVszcOusNLQKg6QQJw4Feb6GSmZTmx
	UJJilDfl0b0nHwz1VxKUS2XDcakPq/DU=
X-Gm-Gg: AZuq6aLTsm2s+oU4+IeaFyI9m5fVtaJenB3fqfTDmP8MDsEbu97qZZGxLuNOVdh0ZNs
	WY+ihTaWzsg10H+cuCT2WQc4VprhPVwJIXKK84HcVNnJreS/qlj1F/wgPqiRMl5FX611rYdGWfq
	N61L9HU1gvKyv4zH/MVZyeVArx7r+zqY94vFVTxclGX2m0LWO1GptF8iQsIAnU6bbKZkPg9S32e
	TOV/M1oTa1XABdPkVICI1WNNDG39W+mIOMtMBl4kmjhLgAUoioRJUFa2gxb+cYemCSm4cbGRYNp
	XBvQNwi6eR2z32G8DKyuhaQvblAR
X-Received: by 2002:a17:903:32c2:b0:2a8:fc90:c8b7 with SMTP id
 d9443c01a7336-2a9516299a0mr3095915ad.19.1770318244425; Thu, 05 Feb 2026
 11:04:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <28a1e36188b1a84193ef2d78f12ecbc0e43ae7f1.1770042461.git.lucien.xin@gmail.com>
 <20260205115423.2195277-1-horms@kernel.org> <e9b073b0-60b7-4a45-9b6d-85c15b51fb4f@redhat.com>
In-Reply-To: <e9b073b0-60b7-4a45-9b6d-85c15b51fb4f@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:03:52 -0500
X-Gm-Features: AZwV_Qjjs7kCqix60p3yMSgDkQ3vg6ybhk9GbXkeFBD_k4Da4kanmC-HbStnhiw
Message-ID: <CADvbK_eFXJB-JqL7w-50Jb=GNzzmSFD_cRGSmRscZ2Hq0o=6ZQ@mail.gmail.com>
Subject: Re: [net-next,v9,02/15] net: build socket infrastructure for QUIC protocol
To: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, steved@redhat.com, marcelo.leitner@gmail.com, 
	aahringo@redhat.com, alibuda@linux.alibaba.com, jbaron@akamai.com, 
	hare@suse.de, kuba@kernel.org, tom@talpey.com, linux-cifs@vger.kernel.org, 
	daniel@haxx.se, quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com, 
	dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com, 
	pc@manguebit.com, kernel-tls-handshake@lists.linux.dev, 
	illiliti@protonmail.com, xiyou.wangcong@gmail.com, 
	andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com, 
	matttbe@kernel.org, netdev@vger.kernel.org, smfrench@gmail.com, 
	metze@samba.org, mbuhl@openbsd.org, chuck.lever@oracle.com, dreibh@simula.no, 
	davem@davemloft.net, sd@queasysnail.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 7:48=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/5/26 12:54 PM, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> >
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-lo=
cal.html
> > ---
> > net: build socket infrastructure for QUIC protocol
> >
> > This patch lays the groundwork for QUIC socket support in the kernel.
> > It defines the core structures and protocol hooks needed to create
> > QUIC sockets, without implementing any protocol behavior at this stage.
> > Basic integration is included to allow building the module via
> > CONFIG_IP_QUIC=3Dm. This provides the scaffolding necessary for adding
> > actual QUIC socket behavior in follow-up patches.
> >
> >> diff --git a/net/quic/protocol.c b/net/quic/protocol.c
> >> new file mode 100644
> >> index 000000000000..6ab81f1c50cc
> >> --- /dev/null
> >> +++ b/net/quic/protocol.c
> >
> > [ ... ]
> >
> >> @@ -0,0 +1,369 @@
> >
> > [ ... ]
> >
> >> +static int quic_protosw_init(void)
> >> +{
> >> +    int err;
> >> +
> >> +    err =3D proto_register(&quic_prot, 1);
> >> +    if (err)
> >> +            return err;
> >> +
> >> +    err =3D proto_register(&quicv6_prot, 1);
> >> +    if (err) {
> >> +            proto_unregister(&quic_prot);
> >> +            return err;
> >> +    }
> >> +
> >> +    inet_register_protosw(&quic_stream_protosw);
> >> +    inet_register_protosw(&quic_dgram_protosw);
> >> +    inet6_register_protosw(&quicv6_stream_protosw);
> >> +    inet6_register_protosw(&quicv6_dgram_protosw);
> >> +
> >> +    return 0;
> >> +}
> >
> > Can the return values from inet6_register_protosw() be checked?
> >
> > Looking at the implementation, inet6_register_protosw() returns int and
> > can fail with -EINVAL (if p->type >=3D SOCK_MAX) or -EPERM (if trying t=
o
> > override a permanent protocol). The calls at lines 234-235 don't check
> > these return values, so if registration fails, quic_protosw_init() stil=
l
> > returns 0 (success).
> >
> > More critically, quic_protosw_exit() unconditionally calls
> > inet6_unregister_protosw() on both structures:
> >
> > static void quic_protosw_exit(void)
> > {
> >       inet_unregister_protosw(&quic_dgram_protosw);
> >       inet_unregister_protosw(&quic_stream_protosw);
> >       proto_unregister(&quic_prot);
> >
> >       inet6_unregister_protosw(&quicv6_dgram_protosw);
> >       inet6_unregister_protosw(&quicv6_stream_protosw);
> >       proto_unregister(&quicv6_prot);
> > }
> >
> > If a protosw was never successfully registered, its list field remains
> > zero-initialized (NULL pointers). inet6_unregister_protosw() calls
> > list_del_rcu(&p->list), which with NULL pointers will dereference NULL
> > in __list_del_entry() -> __list_del(NULL, NULL), causing a kernel crash=
.
> >
> > Note that inet_register_protosw() returns void (cannot fail from caller=
's
> > perspective), but inet6_register_protosw() returns int (can fail). The
> > code correctly checks errors from proto_register() but not from
> > inet6_register_protosw().
> >
> > Should the return values from inet6_register_protosw() be checked, and
> > should the cleanup path track which registrations succeeded so only tho=
se
> > are unregistered?
>
> I think it's easy to infer that that such failures are impossible, but
> since a repost is needed please drop some sentence in the commit message
> to help AI see the point.
>
Will do, thanks.
