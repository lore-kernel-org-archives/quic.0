Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560C349D5AB
	for <quic@lists.linux.dev>; Thu, 17 Sep 2026 19:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672017; cv=pass; b=D3ycsJvP4IwYfDK+JEGH/Zyqim0RZovdJ/BLPqNeqnMzegWOTpEmdLnDTdCKJdvq9RiqwmabjzQPEspqfTF9h9DP1dqP9JO+Hn0UWiCLIwEoneJaiEYGODPWZvBcqABKnC7Y28Fw9/D6/g704ftllRdmyYb81GWyXe6IRfAje/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672017; c=relaxed/simple;
	bh=qqBrqtVZFn6NsXxcXXIMtlSWkhWESw0qIbjgWLUJZHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGoJUSBq8DSvOovtaXwznk56snJYDUcYpgzsw902ucYLajiv4hn3FCXLF7R/0okn/EifP3IswKXmB6tJ+RjiJ/KLwcNtrFSNMXuyRcV27HAdGSEW7jzw23f45WMi4f0c2qCQB316FXbWSwmaQ7tcF0zwdMIRmsrUtXyfHgJgb70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=poCrWqCM; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="poCrWqCM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso7523a91.2
        for <quic@lists.linux.dev>; Thu, 17 Sep 2026 12:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789672014; cv=none;
        d=google.com; s=arc-20260327;
        b=eoTU1WvOZ9wuHvah+FvtlUNWWl2OFbSpmuuLkeK/EMlJUmXKxpbWK29CYIAJ8gllCB
         tb0OR/vt4bWuTatlX+4BKfho64sZ1VcVhJT1CahBhB7TaMUdFRTVfx/0YuyzH37fdJmS
         m/GUu7Aj1GAKRVBGjAt0+NtYC8v4SamjbioO7T7qLhkYbZzCSMEmVjFqta7KWTf8vagI
         7IKN+qAjt73+rN5nuwbgn2a2PS49whogstglGmJ2G6KGNfRi6eWXKSIngT3dVUCdYPq1
         eaGlNcemhFu+X+3giCi/NRV/tl/s+cHaZCHus80ZK6CZ3PQyqkaIV3okWcxL8iYDjVBe
         dflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AJdmTMqYmE/7xu/8ItFmggn+Kr8BDXFZhgiN1tzQfFI=;
        fh=ssEereSpcPj4UEA8SY8ZiRlseNqDmj/EZiTwxrXtteE=;
        b=i7z39FQMy+0c9gOX1lT7/VkdpsInRCvYLqNdkMYslbqPRnqWaz9bTNeAPS6lk2GNaq
         ZARHqAdGPSGGtgfl5J75xJk+IvbPy2pwGpZy91+lKvFqvqZlaJg27+Lx40xHg5E94mn+
         RrppSk2W+KDc49ijtzeXAUOmehe1fW5zcZzScls88daJ7axaEruVPcUPtkhSUa/DHWyY
         Td4IN9zIMTdh0FDWdwHoRL8AqVsnN5qX2QfCX1t9YzORY7z/o5baPqs+iHLJ+63B5t0Z
         gvaJKaWDmTeFz/7/KuL/zLJ9R2fa3Cl6sZtNGf0gNRRbc01hiSnQtePaVrjUWYA10NLg
         BOBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789672014; x=1790276814; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJdmTMqYmE/7xu/8ItFmggn+Kr8BDXFZhgiN1tzQfFI=;
        b=poCrWqCMvr2EbIQWEfR+NqVa4zGtElq/sl4situ0SiPK+8hH1MUSqSKn0NeEy6lV7f
         fFeXbsw0bP9TIxdTSxhM2aGbyH9m4wEVeP2N0MZfUFrIDTJTrTH4ynpUONkspxVa+1zF
         CXJ1g/k2AUNSh153+Sz08Ds9yi541Gp4xO4yJwaWzlJ5HuPdtQ6AofSN9V2w/9vA7z1O
         yCb4TxgnVf06uFUhARzZsbQvAJy3p6Fphiz3WTEr2Hzt0ldZjxwYRqhyQKU0JM2oT04X
         +jONybztfACq29mGr674VHvxkI2TfgjaGlPm+gVZSmWGaGGMVFdfIHdETQepMEVBjxJ4
         tiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672014; x=1790276814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJdmTMqYmE/7xu/8ItFmggn+Kr8BDXFZhgiN1tzQfFI=;
        b=w0PF2noVwxv1QNo3jI5hM0s+9nSot1xKTvNBozyDu53QGHjpVsMBOiC1eUxPZEb3PR
         1DIUUB9eIu3lLdpP8l8VCvUxEYV+lXsQtxy9YSmDKns8Mwfbu78gsUhv43D1s0a/ULw+
         Y1fXUH4Tccbnil1hBorU4NRg7bFoi3WX9aL4jLR+YdvIxKaLyaxi6jBAWBdn+T6qzwvN
         smgWMV4VseaFxHp7n+R7u5ockShOPkW0cAWrpJfW1uCgtuQr3weSxl847YuwWvUoKlqD
         Mscb0qPxPoydEF579YUEu+4/TVJvBPUqYnMlHsqmJCBMpc3srn0zhPouwS47EfAOL5/T
         orLw==
X-Forwarded-Encrypted: i=1; AKwUvBzIPAR6xiJjPgECEwY90BRy6Zfx35yFyWw0UhCidqmwANYPJ8iNkseWXUP6bF40ffieuGW0@lists.linux.dev
X-Gm-Message-State: AFuF++mNxuNoU5YImXpE21slXJFyaGYTHO2W4oGm2Ki2P2jLpChGZ9jV
	lHawX3iOvUwDrAqqY0AoxlTmyvm5QNij59Ir3HO94tQykxC1fC0Tw0fiBL/WwvpcpQ6V1NkWADz
	DzinOuO/UHw2E972Kfed5LwUuaZB4kYYVO8i59F9G
X-Gm-Gg: AYBFou3a/AFSBC5fTIAgJIglNxfcpSZZ3VP0uKXCOv72mQZRQUQ99cAQSTLJ5YgLlYE
	6bDGPRMn5NZZiYRwe2uSCcV67jhX8LRyXdV+4bjmqtGBCU3HZbK+tX7wojEJ034Zjgf1O3Mfax/
	whp+SVd83caqa+mqsnp0wZ6HhM5AsFw5njzBTCzEfw2gQv5yb4iYnQ1BOnMtmPMfNYXnjF+h/r2
	CG1iv5zjF9SnldsWZ3XwxRGkMZCA7gz26cnWw7mYO/GgLe/9nsLQgTZmky7DnK355IiVNfS9prJ
	zn9APktAQWkIt9g1/F2zN/O5GuAxKgOHELPOinrC+nrl6xa6Fr2+vnYK39zjVQAfU4JBwdlKRxW
	vAJJUrMB/Fzmzs32LRTBVf9SKnK9pGs2gkZjStKmsR9D1oQmltwT+RbzaAFWqWuF+a+dtH4vu1K
	jMA8QYFDC6mJPpLWUkcXGbAi44Tg==
X-Received: by 2002:a17:90b:54c4:b0:39e:4c7f:7308 with SMTP id
 98e67ed59e1d1-39e55071981mr225580a91.31.1789672013089; Thu, 17 Sep 2026
 12:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
 <20260916234654.420056-1-kuniyu@google.com> <CADvbK_df5X=Szsd-d8=0gndhoBSHJhnEqSh826iYUW6=Ce_xEw@mail.gmail.com>
In-Reply-To: <CADvbK_df5X=Szsd-d8=0gndhoBSHJhnEqSh826iYUW6=Ce_xEw@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 17 Sep 2026 12:06:41 -0700
X-Gm-Features: AcwNN1Vf1Dgl1Yuz1331KMxjXrgwRsS9uLrWePJOZIUaTVSoZLWo_yT69Va3HQo
Message-ID: <CAAVpQUCRcBQOS4H5zJBOoYeCgsQBiGyu8gjhXaocDXDw9jqTOg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
To: Xin Long <lucien.xin@gmail.com>
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

On Thu, Sep 17, 2026 at 6:38=E2=80=AFAM Xin Long <lucien.xin@gmail.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 7:46=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.=
com> wrote:
> >
> > From: Xin Long <lucien.xin@gmail.com>
> > Date: Wed, 16 Sep 2026 14:08:22 -0400
> > > > > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union =
quic_addr *sa,
> > > > > +                                  union quic_addr *da, struct so=
ck *usk,
> > > > > +                                  struct quic_data *alpns)
> > > > > +{
> > > >
> > > > [ ... ]
> > > >
> > > > > +out:
> > > > > +     if (sk && sk->sk_reuseport)
> > > > > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(net=
, da), skb, 1);
> > > >
> > > > [Severity: Medium]
> > > > Should the hdr_len argument be 0 rather than 1 here?
> > > >
> > > > quic_udp_rcv() already did skb_pull(skb, sizeof(struct udphdr)) bef=
ore
> > > > quic_packet_rcv() is reached, so skb->data points at the QUIC paylo=
ad, and
> > > > reuseport_select_sock() documents hdr_len as how far the pointer mu=
st advance
> > > > to reach the payload.
> > > >
> > > > With a classic SO_ATTACH_REUSEPORT_CBPF program, run_bpf_filter() d=
oes:
> > > >
> > > > net/core/sock_reuseport.c:
> > > >         if (unlikely(!pskb_may_pull(skb, hdr_len)))
> > > >                 return -EINVAL;
> > > >         ...
> > > >         pskb_pull(skb, hdr_len);
> > > >         ...
> > > >         __skb_push(skb, hdr_len);
> > > >
> > > > so the filter would see the datagram starting one byte into the QUI=
C header:
> > > > all its offsets are shifted and the first byte (form/fixed/type bit=
s) is
> > > > invisible, which can select the wrong socket in the reuseport group=
.
> > > >
> > > > [ ... ]
> > > >
> > > True:
> > >
> > > BPF programs may need to access the QUIC header, so I will pass 0 to
> > > reuseport_select_sock() to ensure the full QUIC packet is visible.
> >
> > Why do you use reuseport_select_sock() here ?
>
> Because QUIC socket supports SO_REUSEPORT and allows multiple sockets
> listening on the same addr/port/ALPNs:
>
> https://github.com/lxin/quic/blob/main/modules/net/quic/socket.c#L724

Okay, I was wondering how it was supposed to work without
reuseport_add_sock() etc.

reuseport_select_sock() should be moved to a later patch.


>
> The client Initial packet can select the listening socket based on the
> packet's source address and port, or by a BPF program that can inspect
> the QUIC packet.
>
> Thanks.
