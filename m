Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047034EEF4
	for <quic@lists.linux.dev>; Thu,  6 Nov 2025 17:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449736; cv=none; b=rMAesElemnckI21vdrk69PTUjbpMqfXoDwZARW/bkUXQOjI0LzBKYwTuJGhfVqc7cbfaUZ0SaXHEXeaFWu8HkRYRFEB8SA1PWO+SISP4+P01iS7BnPf3r6jBq0kEMypkuIZAvzlqMgeYrfTlsWcLhIdrgdAFfWN51bxKNdwx19o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449736; c=relaxed/simple;
	bh=NH2hfHppCjrZFVx6eqpdpt03wHQYT9rQOCs3FER3WSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSckT8EAk0kxBYAz/8WvO1lkLJA+AYtKY6wwPpZ/6Pxs5aM3DL3s4GFJ54BDs6lUKUtnprR/oA0eh6IoNuZI7SPVJRz5fpZWE/Octp9/b53/dpYhO3sE1y4rsylNkhCxM29f7Rg00GEAh7z15qMdSJA/A+aShM6a5n28w0vMwZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sr9jL3ZB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sr9jL3ZB"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34188ba567eso950525a91.1
        for <quic@lists.linux.dev>; Thu, 06 Nov 2025 09:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762449734; x=1763054534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROsaoNagz4I7/dBZaDxwLj1TocAA02sCxxRugnpAtAU=;
        b=Sr9jL3ZBu8K/21SvT+Z91HMp0k/rjQIIyqbAIsC++SsToDWljgQ2iqPlL10oPCXv9M
         sHq8kHxFZe8WC2zSS0jPIcorB6e3G328R3e3vCyRWewHkXWBPp8ZyH4Da2fNiGgiVV+T
         Vu/OAzWDBDvpPKMJ4CQXwGkPFIc8GQNOjiIwSRaB1cjtXGDqBsETDbjnAcJ51l+PrMjK
         5VXqolit2Zyvt7wsZ1b27k2j80DxS7xE6IxRvHOQNVainSh6YfEomNrrgCTCdcfGHqDF
         k3IA90XlKF0IL3M7IiGTAfrpOM1GDeohBki/Mvx7NFy6i0TuwhoFtxk/NIBnj5JLI2qm
         rIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762449734; x=1763054534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROsaoNagz4I7/dBZaDxwLj1TocAA02sCxxRugnpAtAU=;
        b=kht0WvUMJnouEZIEY9/akg8VbtR+0exsgZ5tCAkCvSa7ey/4dDO5aYGKXMV/vW3nVk
         LAUy8+5GBlyvqeM27ToRKcjDWkGDHUfa5/OhQMMtklq6uY5xJYCHg9mbJUVtFNqiAhj4
         53NWnyq9fDGpOAEriBvvUmDdE82LSEA9GdDFapyp3WxMStdqvK+yShXQc9jvEq8MEw+T
         utr6stRvt8Sp3yE1HY53llrtIjdknCLiRlI3JoGJMNjFGyMou/jeT7dinQ8vjWtuo7Tv
         exev4QI7ypaSipiOEItGefVIGJ/LoRhcOhOUmZDvRDrej2hl56d+mHuN4+aQj+tI1JbN
         DG4g==
X-Forwarded-Encrypted: i=1; AJvYcCUA+sK/p9GmcCL6OYTq8lVjbRPyGS1sAzu8eEIxYjdpRfcGskJWg3zdkM1EQmfWCmnxXG+M@lists.linux.dev
X-Gm-Message-State: AOJu0YwQuHlVGvWZW053Q92huRwoilmDQ8r8Rf4Ihiy30kv+Ag9u4qZO
	olbxsLz2xkySdN3XRgfxesfkPWLTFmeOtBhnuBU114ofYEpHNdwIF35fwW6WWmtJRZZ1s8CcHPQ
	MIbOb30g6G53Q04MEJs9tPtIKGSv/xEw=
X-Gm-Gg: ASbGncsG9rPD97VYh53ccNVz6/oHrFsH95VFGWnB2nZVKnzs5OFqL8qooDZ1AxyfwOH
	g6eglJvjISe9WOxJL1mmUUkhmCa+u5TbH+jUbYd4BBHzO7NQZamwNNmG767HXG49YsNhmYQc8GE
	gAMuysWVkepKrAY2VxibnmqRNRXE2cCDILW8W/Jtefgj3C1O9QUr3gaRxbtewArpf3RbmJuJbN/
	T8eD/8CILtUPpK2isfTW9KKwXfhwxENMpcP6eaVCw5vFjPP+cey+BtHZov/ehUjsBQx1gdPqLjA
	0lU5hPA1SG49SPVtBn0=
X-Google-Smtp-Source: AGHT+IGhY0NYTXXkTu0P4tB4nC9X5IQVYEkg7KbXM/lxcc2ajgsNtrlqaMsuOSOOG/NPcl8ekPlhnRj1iJwQaZFqVyY=
X-Received: by 2002:a17:90b:2b44:b0:340:6f9c:b25b with SMTP id
 98e67ed59e1d1-341a6c4d3f4mr11082353a91.11.1762449734034; Thu, 06 Nov 2025
 09:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <56e8d1efe9c7d5db33b0c425bc4c1276a251923d.1761748557.git.lucien.xin@gmail.com>
 <989d3df8-52cf-41db-bb4c-44950a34ce89@redhat.com>
In-Reply-To: <989d3df8-52cf-41db-bb4c-44950a34ce89@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 12:22:02 -0500
X-Gm-Features: AWmQ_blXBOK6Lm7J_4Le7zJYv7Rj5XNuyVIMzzqJ7AFvKAnEANk67rWLYRhV00Y
Message-ID: <CADvbK_eGPuueR7XL80eagkrAeJraKBMiTVrhiFb_wnTD+N7qVw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 14/15] quic: add frame encoder and decoder base
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 7:47=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > +static void quic_frame_free(struct quic_frame *frame)
> > +{
> > +     struct quic_frame_frag *frag, *next;
> > +
> > +     if (!frame->type && frame->skb) { /* RX path frame with skb. */
>
> Are RX path frame with !skb expected/possible? such frames will be
> 'misinterpreted' as TX ones, specifically will do `kfree(frame->data)`
> which in turn could be a bad thing.
>
Yes, when generating and delivering an event to userspace, it
keeps the frame content into frame->data, instead of frame->skb.

There's no need check !frame->type for RX path,  and I will change it to:

        if (frame->skb) { /* For stream/crypto/dgram frames on RX. */
                kfree_skb(frame->skb);
                goto out;
        }

if skb is set, it will go kfree_skb(frame->skb), instead of kfree(frame->da=
ta).
Because if frame->skb is set, it only needs to do kfree_skb(frame->skb).

Thanks.
> Possibly add a WARN on such scenario?
>
> /P
>
