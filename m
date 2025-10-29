Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D3A35A153
	for <quic@lists.linux.dev>; Wed, 29 Oct 2025 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767859; cv=none; b=HD9bpuQn07/t3Io22HOG6yVffI3XvcHbz3nb9df1qc9KWXYHDD5tnygw3Xm8cOnrtuu39I++Y4Q/K/3OaPPcJx83Kst3j7SYVw5g7DnKeVVyfYblQNeIuSWHEjxND6l8F6/dGslvfglujxdVw0k28s/FwfRRE5Z6BxZaD5xST1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767859; c=relaxed/simple;
	bh=+rNIfhn612wSnJwTsWfa3rI2oXBKL1DitnLLKvmVa24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyLH6B6S/vh+w70FQKLzIc/iIfjLuEYtIlZP/Z4l0d7+mCpKwyn4l32qKGNpAQvC8y73iV0XXRTEkCaTJwugzmXetnFR9k3UrEQzjxHk3xM2PTHjCbg61aSquGptRXah58mAlvUnY65QH1hMO72QbePGU3If/HgPte4Kxy8dGA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDeo8YiJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDeo8YiJ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so304232b3a.1
        for <quic@lists.linux.dev>; Wed, 29 Oct 2025 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761767856; x=1762372656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5AE88Ciiu4y1L+Whuiba6HLMWI7gvS/KpyPblrUqXI=;
        b=VDeo8YiJJX4kr3Vc26c9SlsRWMoGLKPcYtUbHX6XKOvhAOafODHDL5vOqmjavY4DX9
         tWVMjLhim3Lhw85jHlyB19MKBH9fVHUXl0jQIHaL/SAFyc94QO3/vqRciz+gUXV4/T/d
         NrRmtOlZeNUjdk8YZa9ds2BXby+5KuTOXrNr1fEu1Jwm+veN3/crRzjFS3ZKXfp+Kbyi
         RFUabWgwwdqrQeHm05rBF0Hg/7yggCrROqZSOJMLrcIDQoHN255F4B85olxFffBSIkyM
         xeB/zD4Fuk6E6Ctfjz1xlmB0kTV9cTtCXuNEaSFRgsIgkwxQWM+fZAdmHhZFLthUGhL1
         prmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761767856; x=1762372656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5AE88Ciiu4y1L+Whuiba6HLMWI7gvS/KpyPblrUqXI=;
        b=lUItgGRwv0bz6GpCKqopdoEVqPpyTEq6r//vy4A2/GeovzROGu6QBv8k1YeuOES0Rv
         Pl7V4K5wdL4HnjzjejHKr4jHlG8Zuoe1ROOC/EkKa2Sk+rcwScXpWzxXHspy45N18vYB
         9MxFsxkA0L+LoImDKPUfGCOZxLsAsx7bOBy04YB/7avnIa+Xhe5lzChc3k8O9U93rmZK
         C3mEEJPtDpb+gJxic++Qwa9jx9gS3cmO0860ySF5A96jZY7H4ZBU2KnmQ2HyPudIGr9R
         fcq/uNNBT/DK5fqERHWIN4y61yZLjoz5UacCZspWz43zsP+jolT1X04yJ/wmYaJ6iGOS
         JCoA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Ih7b64oLkfJWqCND8ma+5De2un2PgJQbhr+lDQJvMhh3DxPkD0gwUVPjDI4fGYXzhm3z@lists.linux.dev
X-Gm-Message-State: AOJu0YzBhUY8golc+YhniP2o4Ls4Edp2utPgxfKPYE9/pMuPCFrWLeYv
	u5q3TxNrLhmedn0lQMDsfzkPE0CaTrkPhchNsxUQ5CO2xvK59XIVvtwwAu8doaJaOxBoNbUp3ug
	tqoucVZv0bPM43Qo4kJsJWoCX8oYL2zg=
X-Gm-Gg: ASbGnctDNUOV9Ri5TQVoXSnK/6cTwCwoEwfijP6doX06Oy9xPw5bVPZ37eafvj2t9N7
	cTfZDOPQHdes3aCipytW4jpUodu7hNOUSNa3GjDgClA8ovwB53roVrn4L+eyb9gZvEHGx1N/ZdN
	4V9Z9EUr1MCRmmX/14xa7BojwNbeKXHjNz5nDd1dMoRsiR3quWZ6WDpovnsbqr02eYVBJUt8U1F
	++fn5Mh+sRgt0PnD0gm5Y+LgYhKNYV7B0c0ndcQ3xhA8qPPXMey0wP/I5JWodL7TC7V5alRjg==
X-Google-Smtp-Source: AGHT+IFNCX0ckOsChso5kJGqid4SLOaalcmgzvE+F5pb8cfkVkc0r3f/yGGJSksDBL4n2c6XJFS70z/v5MFaLPK0zXQ=
X-Received: by 2002:a05:6a00:3a27:b0:781:1110:f175 with SMTP id
 d2e1a72fcca58-7a61506a504mr866733b3a.14.1761767856388; Wed, 29 Oct 2025
 12:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
 <67b38b36-b6fa-4cab-b14f-8ba271f02065@samba.org>
In-Reply-To: <67b38b36-b6fa-4cab-b14f-8ba271f02065@samba.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 29 Oct 2025 15:57:25 -0400
X-Gm-Features: AWmQ_bnwX6EuAJChCufrlpzg_AX6H7XB1Uf5xbfwoMjEpTiQtpfFTcbK0dDvD94
Message-ID: <CADvbK_f4rN-7bvvwWDVm-B+h6QiSwQbK7EKsWh5kTuHJjuGjTA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 02/15] net: build socket infrastructure for
 QUIC protocol
To: Stefan Metzmacher <metze@samba.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, 
	Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:22=E2=80=AFPM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Hi Xin,
>
> > This patch lays the groundwork for QUIC socket support in the kernel.
> > It defines the core structures and protocol hooks needed to create
> > QUIC sockets, without implementing any protocol behavior at this stage.
> >
> > Basic integration is included to allow building the module via
> > CONFIG_IP_QUIC=3Dm.
> >
> > This provides the scaffolding necessary for adding actual QUIC socket
> > behavior in follow-up patches.
> >
> > Signed-off-by: Pengtao He <hepengtao@xiaomi.com>
> > Signed-off-by: Xin Long <lucien.xin@gmail.com>
>
> ...
>
> > +module_init(quic_init);
> > +module_exit(quic_exit);
> > +
> > +MODULE_ALIAS("net-pf-" __stringify(PF_INET) "-proto-261");
> > +MODULE_ALIAS("net-pf-" __stringify(PF_INET6) "-proto-261");
>
> Shouldn't this use MODULE_ALIAS_NET_PF_PROTO(PF_INET, IPPROTO_QUIC)
> instead?
>
Hi, Stefan,

If we switch to using MODULE_ALIAS_NET_PF_PROTO(), we still need to
keep using the numeric value 261:

  MODULE_ALIAS_NET_PF_PROTO(PF_INET, 261);
  MODULE_ALIAS_NET_PF_PROTO(PF_INET6, 261);

IPPROTO_QUIC is defined as an enum, not a macro. Since
MODULE_ALIAS_NET_PF_PROTO() relies on __stringify(proto), it can=E2=80=99t
stringify enum values correctly, and it would generate:

  alias:          net-pf-10-proto-IPPROTO_QUIC
  alias:          net-pf-2-proto-IPPROTO_QUIC

instead of:

  alias:          net-pf-10-proto-261
  alias:          net-pf-2-proto-261

Thanks.
