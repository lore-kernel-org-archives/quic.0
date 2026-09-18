Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85EB51DAEF
	for <quic@lists.linux.dev>; Fri, 18 Sep 2026 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761085; cv=pass; b=AF6WgRSMvP06P2TGctlGgo6EkIIa+w0RkzeiwIH6E21MpHIsrbbSQlwFH/AaAEEfu5tibM6l9MkzCe3UldX+n9jZI/nkDWAwZef2RwORdge4Gh9ctI6ZwvCKcxJgs64g9RlQGAjllvGHucM5Jfgf2qEDTC/iyXGyO4nJ8smnhhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761085; c=relaxed/simple;
	bh=y/292QxEdUMf5pPsOfQZfieYF0PKSz2Ezz35GxIZDCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5laGJU7EKekiTALw17UeP+DnCnjnTye4MnBBOaOqQDlCemQZIrjz9uXi9fOjM0xWG31QGz/Fg8lTqXFvetB8Ziv6qs+PH/YlVw1Y6yfQx4sV2Vi90yycd8i3mykN3NfEPaRonoyExAZKjGRY4iME+TnWdqsOGFqCkWe2GKjO0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYdcX/Jp; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYdcX/Jp"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8633a38df87so810803b3a.2
        for <quic@lists.linux.dev>; Fri, 18 Sep 2026 12:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789761082; cv=none;
        d=google.com; s=arc-20260327;
        b=kqlNCwOVOp7ZTj3NVvCi3SvelqYHU2Dsx0SRnhP5/a59GcyRCn/vFs177YZOHoCIAx
         3Ah9sqOKMLAiIfMcSjTPkyUqitxbgfpvS+gnkXOTvxwk9thxRFBrbDm6ei+nCjupb+BS
         9PY38Hg1EuhaTDSquYdPYs+4QkMNGHLCNApSdQk8CE1G6xm7uju/eiCmLf6l4ooBx2tq
         deu+2UUb/qkpSw9mnMbGbPK5li6TF+ByH0sFZZSxAl7aqmPMM67H4YCBGl6rA4lUTvFW
         LHCkSo2JyZcL2w59sF2REKTLsldu7UGDMyPHiy0XxbgDCxbxh6c7qbioU8ijZPMniOMY
         mPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=87V+Fh4sb0y1GssnVq8tqPVBCLJOUuiDb7vS0kmG6PY=;
        fh=0CLMkV707R9J9If/FJ8Kxl3W/5rtPzv2LumLu1N/r+A=;
        b=GvHu2aOlz3P7Jjw9yVlXegx0QY3aTCQV4bKziSp4Zt0P9kaAiFSA7P49dw25XLEFtI
         355cNHT1J6Yk1nnST2cqp0a9YY8XEkYVR2zadm8wn0RNiNWkUnEUVNjadlfYFV2SoS2T
         3tfx7HXgA9xzprVHuUKXloGimimGrDUhP8RBFdOaCuTJJ5zRoCAOs7bUpNados/PmW2B
         beleZdaYJ44IZkDhlsx1H8xXzWqTSPLLl1f+d145mBLxFH417ZwnDMrXvAM50U+/0eq2
         eQzFLlANzDJvWfw3IzJEHATaOU7qQZb3haWB+q9P6sDAnSf08Xcx1IvCjR9E9SpBY+U5
         9Ywg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789761082; x=1790365882; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87V+Fh4sb0y1GssnVq8tqPVBCLJOUuiDb7vS0kmG6PY=;
        b=nYdcX/Jp5vErx9BGAnEb0hSygDn7f2TtrAB0yBbuKWoBVCEtBLPNecxuaw8m85Z88a
         f9nkLgZP0SVv0XZzvFz+DDF83SvAL8Qt0OJ1mqukSIFyeyVYcOzeFwLlDE3MzQmqrRhQ
         iWjYHmtnGmCaL3DIHzCuPz4udG9nJZlMBJfQ7MhJH9wps7ae0xwgmiGLu49FjeAagVNA
         AmzfiUd+5oGrPZqQgGKeLgKrg7hSV+LSQsuHE/4GGULKrcnzfMizygEqj/9XVffyQOYb
         y01ZygNjc//2xu1If7VVIH9vU1blduaolEME702wRgdsn1G3IG4s7nI9xFOj3j27Tl6f
         DL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789761082; x=1790365882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87V+Fh4sb0y1GssnVq8tqPVBCLJOUuiDb7vS0kmG6PY=;
        b=c3mPXN3/RV9HtOJm7FyL4ehq8dHXR6IyGl6XOCu/28dkHrvEldNUVuLtYg9xQBDPJP
         S8AZAoqQ1tpAo2O5n46qKxBU7DvHLnBRecIoRFLI6CBLn4+W0EW91c6i2KRbfEMffr+2
         OP8Tostvzur2AVzep3GDGTsVBGA0vyB5h7FrPyXM1dOOmpE6QwUHemM8i4abAFdLYde2
         5tVuyJkAK6ZUXrPL9zuB8RTM70z64cJjgvzdLYArysgZu3/NTofdMKBbR1AUaCloFg7h
         WCMicBBVI8Qu4nNapkCu22NDB2xQRZo8sdZ5ixfFNaKy2Tie4Qz9e0UOmIEvs2STkEC4
         jdUA==
X-Forwarded-Encrypted: i=1; AKwUvBz5lraOH6OcMTLWy8YgH6eFVyyQFmkcfL3g3uECGGLFuVYmlbdUpSrVhKCbZkqtNJCrDwNc@lists.linux.dev
X-Gm-Message-State: AFuF++kJomY6I0O7zpsvkiKVlJXt4K1AWoX26JWscQm19V6L1qRDBz0t
	kLRrE6upeyW78GXKGoFhazNcEV/XRw0uG1DEfBsbBRNpA7v1bdZ6rezhwtRgzrC76fOOkLdD3s+
	TNdcnWpdu2t2UYUk50UBI4c8I3Z8kIB8=
X-Gm-Gg: AYBFou2EBjMAJUWFv7YcV3SPCCGgiKuvHyDw2+W70HhoLjKNdTVOHU+HPG2w6zNi87H
	aUMxdROl064MRtrr6Xu1fKlPmerwlRUyDXiUbDyFDNQ0kpjN8sJsyeKb2hJwgWc+AdI4AZpAA7+
	6ose4d1C3hK8VtTOWOeJrWzCPcoy0yhGka+Gi25b8jvCJqg05hdPD+ax90i4QdsCXezfqN7W6Dv
	tf0Sqxa2i1lTjTSbVdnhCMBzTgBIpOlTsR4k/btI42wALSWqX7Abo4PSLR/MX3bvCdK60HNaUGv
	evbuO7JFygiGl8iBroNGm2udbMd8yzqh6PlycODwNsREvgQzESP6x/7OfT6MppGo88aXqNKdsiX
	P2yLO6+J8zbb3YY7xRA7TU4GTZggpwSdTSSsvBVaLvo4BxDyfZfKwHwJw
X-Received: by 2002:a05:6a00:4185:b0:86b:b308:b926 with SMTP id
 d2e1a72fcca58-874dcbed261mr7094177b3a.14.1789761082116; Fri, 18 Sep 2026
 12:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
 <20260916234654.420056-1-kuniyu@google.com> <CADvbK_df5X=Szsd-d8=0gndhoBSHJhnEqSh826iYUW6=Ce_xEw@mail.gmail.com>
 <CAAVpQUCRcBQOS4H5zJBOoYeCgsQBiGyu8gjhXaocDXDw9jqTOg@mail.gmail.com>
In-Reply-To: <CAAVpQUCRcBQOS4H5zJBOoYeCgsQBiGyu8gjhXaocDXDw9jqTOg@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 18 Sep 2026 15:51:09 -0400
X-Gm-Features: AcwNN1VIcCElFEGPge_VRMPC4oISQAbf6IB5C7NCKiJGMnhf9LEZN0g8RJucO_Q
Message-ID: <CADvbK_cweNjHtX-m=Ba5BT3g3aHhJ7se5TqaW44OXicONW6oYQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: aahringo@redhat.com, alibuda@linux.alibaba.com, 
	andrew.gospodarek@broadcom.com, chuck.lever@oracle.com, daniel@haxx.se, 
	davem@davemloft.net, dhowells@redhat.com, dreibh@simula.no, 
	edumazet@google.com, hare@suse.de, hepengtao@xiaomi.com, horms@kernel.org, 
	illiliti@protonmail.com, jbaron@akamai.com, jlayton@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, kuba@kernel.org, linkinjeon@kernel.org, 
	linux-cifs@vger.kernel.org, mail@johnericson.me, marcelo.leitner@gmail.com, 
	matttbe@kernel.org, mbuhl@openbsd.org, mef@scarletmail.rutgers.edu, 
	metze@samba.org, netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, paul@jakma.org, pc@manguebit.org, quic@lists.linux.dev, 
	sd@queasysnail.net, steved@redhat.com, tfanelli@redhat.com, tom@talpey.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 3:06=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Thu, Sep 17, 2026 at 6:38=E2=80=AFAM Xin Long <lucien.xin@gmail.com> w=
rote:
> >
> > On Wed, Sep 16, 2026 at 7:46=E2=80=AFPM Kuniyuki Iwashima <kuniyu@googl=
e.com> wrote:
> > >
> > > From: Xin Long <lucien.xin@gmail.com>
> > > Date: Wed, 16 Sep 2026 14:08:22 -0400
> > > > > > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, unio=
n quic_addr *sa,
> > > > > > +                                  union quic_addr *da, struct =
sock *usk,
> > > > > > +                                  struct quic_data *alpns)
> > > > > > +{
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > > +out:
> > > > > > +     if (sk && sk->sk_reuseport)
> > > > > > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(n=
et, da), skb, 1);
> > > > >
> > > > > [Severity: Medium]
> > > > > Should the hdr_len argument be 0 rather than 1 here?
> > > > >
> > > > > quic_udp_rcv() already did skb_pull(skb, sizeof(struct udphdr)) b=
efore
> > > > > quic_packet_rcv() is reached, so skb->data points at the QUIC pay=
load, and
> > > > > reuseport_select_sock() documents hdr_len as how far the pointer =
must advance
> > > > > to reach the payload.
> > > > >
> > > > > With a classic SO_ATTACH_REUSEPORT_CBPF program, run_bpf_filter()=
 does:
> > > > >
> > > > > net/core/sock_reuseport.c:
> > > > >         if (unlikely(!pskb_may_pull(skb, hdr_len)))
> > > > >                 return -EINVAL;
> > > > >         ...
> > > > >         pskb_pull(skb, hdr_len);
> > > > >         ...
> > > > >         __skb_push(skb, hdr_len);
> > > > >
> > > > > so the filter would see the datagram starting one byte into the Q=
UIC header:
> > > > > all its offsets are shifted and the first byte (form/fixed/type b=
its) is
> > > > > invisible, which can select the wrong socket in the reuseport gro=
up.
> > > > >
> > > > > [ ... ]
> > > > >
> > > > True:
> > > >
> > > > BPF programs may need to access the QUIC header, so I will pass 0 t=
o
> > > > reuseport_select_sock() to ensure the full QUIC packet is visible.
> > >
> > > Why do you use reuseport_select_sock() here ?
> >
> > Because QUIC socket supports SO_REUSEPORT and allows multiple sockets
> > listening on the same addr/port/ALPNs:
> >
> > https://github.com/lxin/quic/blob/main/modules/net/quic/socket.c#L724
>
> Okay, I was wondering how it was supposed to work without
> reuseport_add_sock() etc.
>
> reuseport_select_sock() should be moved to a later patch.
>
I'll try. Thanks.
