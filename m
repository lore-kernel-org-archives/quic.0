Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E4731D39F
	for <quic@lists.linux.dev>; Thu, 29 Jan 2026 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715656; cv=pass; b=Xyr+aEcqk4WFyiMhT7uP9CaxP5rI7fQJmuqu3UNc2zXG5GlumBJGu2/4hqrcfeeHkZCLteM7XZrfEwtGqaitreXCeyXTd7dyOFU1gAX0z2Ohr6nVJuN1hP8PVSlnmIKGfAdduBX8xDdErDScfuIFQrWrlL4XkDdzS8jYzAetiNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715656; c=relaxed/simple;
	bh=OQufuj5kkmYMxx6ttww64CZWm+ndiofyh3a3rNhNfCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+sH9JN2gLZCqTkM2X/ifQjWIsrva8dn1CHwh7eDBeJnZzRa2QRJ2JJO0SE4eh3jL7Sb//Vbubncsv11ZY89aLXdTQEHquH1DU93eXxn1IXF6P+JRqLyvriF68pUBXCmcl0MGNbzblzJQeB4vAWA50pFG2rWxVFpZkys1DnIt68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiNZ8W+C; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiNZ8W+C"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93f5774571eso415257241.1
        for <quic@lists.linux.dev>; Thu, 29 Jan 2026 11:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769715654; cv=none;
        d=google.com; s=arc-20240605;
        b=kmATgrLgayxzgH8uQu+VmCDx2zLi4LLQuDlRcCF02hsWi1rkxZF0UWmbuHqpDTToRP
         VVhHmXDf4eGZILEpIzJoueGDz5i6BBuCPfAK1Gr6x0PmJPu3Kh9l2fhBTVKQZ79MDOPf
         liip8/iV3Z6W73y1yKHR9jUBlaTOLjDJAw4ojQJSknnpSr+A1FY5S42tvD4u5qlxlzoP
         z9zVopUcfBa6xfXtqm7ugg44x9V2pqCuWdjUL7G4+KhXi3beoHkIpoiWIyPzQjbekgZh
         ayiteurJTXQjU28QsTf13abbICfFN9REbzz07yikaJMNtLKdHYQEZrQ5cTEgI4VyJvVZ
         GKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vWXOUBeb3b+nw5Cfis8wSYxSsjd/F4GCHIXMwqvZur4=;
        fh=t61kVrg4ucw7HCMycPyoXP1PI/1VTnCSZQKzH+gduCo=;
        b=X9kMp663i9KHhCiX6a0j5D2MPyuZo/YTGozFrINFdW9vQbnHEGHkw0KgzMisWlDbqm
         WXd6Htds2ZR2+Uk228oR4U0mZJGE5uSTBxGudOpuQqk2dvEtSQTsZy75hVRPngDkQ4ua
         qMVxa3gUbLOC64AixXwJjzmtbzuag1IfYGtrS9SBVqv/MP3gCctWebZBYBM6d4p2+z+q
         XJxIUAyJkBLt13tWdQNTqrmF42IoHUK3csqNNbMC/vnYRqTj3LoG5wyVtlb7JlHaRryh
         P6KNwQyClHElofZVL/9V/WjS7d2uOodvGfcXtbirGfjYleQg648Yg+JN2CcLzhWVcSzt
         CE2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715654; x=1770320454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWXOUBeb3b+nw5Cfis8wSYxSsjd/F4GCHIXMwqvZur4=;
        b=hiNZ8W+CQDug/syWSMf93yZ6E2tTp/pVUJ/YXsuRpzk6czwZerIyVH1qjv+2jx/7WA
         s0DrcpRT8Bl+OljlVgSdptXvjLfewX3/jaY/+Mt5iPqO9vIanfQfIzYCu7SOv4lZpCtq
         MvZiYxBwypawULDmIIcPqmqRd/j9rIH+VW/i/lGdTzP6sj2q9d83b5ja3VESc2YKmXZ2
         o5iwVDAbMM19PRYe9cyWF75mhjJwONaxF3svSm2RfsFvTYHJr8a3xu9Jr4WYEiL4Ojbj
         N8qwVhsIaZOWIMONYcUle4JXufDFv5V5ulD5uPr7wBCtWuA5WSydoVikoatRS1A78HQp
         aXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715654; x=1770320454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vWXOUBeb3b+nw5Cfis8wSYxSsjd/F4GCHIXMwqvZur4=;
        b=GmJPSITEekIGjsc39YZ7PUkxPwLxA0dApUuzVGGcLAmcQkaraKPCeus8RhaW2WEETX
         GYEHv8QKAyFUtsQsFMif4+Cm0agw41jtdk4rZIIEt6QnYDobkQN7+t7e54d9GlN5Z9QO
         TBjDnjMPvFmBjyLQZMLG2doyA5Fq+BsGMnaKxCfurbeaqoyYQyUtQApcm5mxnKueIFkQ
         +KcDSRYxF9k42qyJNEmMZ7kQscwSxkPiKgBEASpg0QGycrwAdsO/2L9OEPcLYTVfJ3yo
         xlZvBJkwgqyiKexMnYNSYPGLkp/+XAxbvjwEkSHcamjnjKnFy0KtwW5OAjqTww8RsNMX
         ZGkA==
X-Forwarded-Encrypted: i=1; AJvYcCVU3VXMvFzfR3iJ66K8WOxru9qXbPReRKgNVhKwYXuvej+CB/44BKI4sbaUTAb/QsINKIJf@lists.linux.dev
X-Gm-Message-State: AOJu0YzevXK1KGoniFYF1NVYGfIdJc2Ze5VxHpOPnnxQTZWHyqOrP+WF
	ejYxgKW8ia+8mhE3P9aeFd6k6V3XD14hzixcb2+1LGeXUSJZc022mK2HHQwyJAFERqpl+LGbnro
	Ig2MH28JVf4fyHTon8QLP9KawF2GjISs=
X-Gm-Gg: AZuq6aI+Ci3bMYH/juevGzUyaMp3QcWXQmUfFJ7D14uusWw4qDkdNejf9aqj5iqBd3K
	Jd+na0z5rRJpDm+CaFKOmplC63+jPh3T0vd6y5vzkm7q2wNVPOG/DtMpb5lmzFQ10xcpyBOuFhs
	Jp6Q2i5oVhTErM2GQgsO7+HmY67328F4mq7GUYejlBpq6PS/zT4EgA7KOwGkVcmdAw91ygv6erP
	C0g5fB4xFrTvW/D4cbef4NUaARmYDBKJNQOtMvedkjBej36VJO/xzXotmwpx4EGRovXg7CNIhe/
	rzCl5RLfHUe04a0csLYmcLknpyzqnA==
X-Received: by 2002:a05:6102:304e:b0:5f5:2e08:bbab with SMTP id
 ada2fe7eead31-5f8e23e7d3amr226299137.6.1769715653861; Thu, 29 Jan 2026
 11:40:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769439073.git.lucien.xin@gmail.com> <1cbfbd45fda48c82f629b000fc102ee011515e12.1769439073.git.lucien.xin@gmail.com>
 <9c17e0f5-0a07-4800-9356-0ee9445e3922@redhat.com>
In-Reply-To: <9c17e0f5-0a07-4800-9356-0ee9445e3922@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 29 Jan 2026 14:40:40 -0500
X-Gm-Features: AZwV_Qjx14-1bOrrh8LVqqfM15IbyrS2KpNfixIqKIZVNgumQoCFAq17MEBRSlw
Message-ID: <CADvbK_f7++7shAGwYLcz=ph-te_d+z+bMxiaTtY2Ahze+Wagqg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 03/15] quic: provide common utilities and data structures
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

On Thu, Jan 29, 2026 at 11:26=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 1/26/26 3:51 PM, Xin Long wrote:
> > +struct quic_skb_cb {
> > +     /* Callback and temporary context when encryption/decryption comp=
letes in async mode */
> > +     void (*crypto_done)(struct sk_buff *skb, int err);
> > +     void *crypto_ctx;
> > +     union {
> > +             struct sk_buff *last;   /* Last packet in bundle on TX */
> > +             u64 time;               /* Arrival timestamp in UDP tunne=
l on RX */
> > +     };
> > +     s64 number;             /* Parsed packet number, or the largest p=
reviously seen */
> > +     u32 seqno;              /* Dest connection ID number on RX */
> > +     u16 errcode;            /* Error code if encryption/decryption fa=
ils */
> > +     u16 length;             /* Payload length + packet number length =
*/
> > +
> > +     u16 number_offset;      /* Offset of packet number field */
> > +     u8 number_len;          /* Length of the packet number field */
> > +     u8 level;               /* Encryption level: Initial, Handshake, =
App, or Early */
> > +
> > +     u8 key_update:1;        /* Key update triggered by this packet */
> > +     u8 key_phase:1;         /* Key phase used (0 or 1) */
> > +     u8 backlog:1;           /* Enqueued into backlog list */
> > +     u8 resume:1;            /* Crypto already processed (encrypted or=
 decrypted) */
> > +     u8 path:1;              /* Packet arrived from a new or migrating=
 path */
> > +     u8 ecn:2;               /* ECN marking used on TX */
> > +};
> > +
> > +#define QUIC_SKB_CB(skb)     ((struct quic_skb_cb *)&((skb)->cb[0]))
>
> Please add a build time check on quic_skb_cb size.
>
I may put this in quic_init():

BUILD_BUG_ON(sizeof(struct quic_skb_cb) > sizeof_field(struct sk_buff, cb))=
;

thanks.
