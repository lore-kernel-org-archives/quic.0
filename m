Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23194500976
	for <quic@lists.linux.dev>; Thu,  8 Jan 2026 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891514; cv=none; b=hNc3rp4EIjTBGXt6Vvc/LQ68fl7GVHVgv950WSaG8KheJV2d2SIKStO0LWSOVpeWeqK21Gy2dd2KXkY+CUUoqeKoz+T8Myt0xYRNaMcqWZhRDgmVDuGFd897UDOj2BtEx0i/s25eGgHNOifhM3D4vabeup8j5P5KhRI7/NvYeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891514; c=relaxed/simple;
	bh=MVTzGXbScex35TzesGDsimq24WTvc4nqhQnvv4OBy3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxT0SmRRLCUxxSQiJwEvCY2zqvgfaOyOIb2cfEIayzjAndf5Va7H0pVKxA+RkzJTa6Hb48h2qwFKU/SJA/1RWQnysKO6pSm61uu31mOQxtttS6DN0NiaBrxquIy5olFwi+T8sxZN++NB/vGc9l4o8FAXz46xOKCh7pxq6K7TggU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJzOMW0z; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJzOMW0z"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0bb2f093aso25938445ad.3
        for <quic@lists.linux.dev>; Thu, 08 Jan 2026 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767891511; x=1768496311; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIpmw3TbxuFac2rr3Ral/5NrCqmxWN0HTMSbOEZp4Sw=;
        b=GJzOMW0z8IRwk0RPf8EbQu6dwi4DW79EqjpL3PLoOANZxkjtBGxIUSbHEsrwMAToIL
         iNjDNoC0tA7Xz1SUw005K5yLtzrs+yN50tTG0PRS61hcvs4OIjV0fEqB9v8cwY7+YU2q
         13iMhNH4BhyYRmAfS1JYePcmdRRD3nTwd4FGAX7pi3kfgmZw5kkbw2qTU5kKwPEzSRVo
         jP+AOQjn4sXFX+IMDPvwi9nIqEPzpMsS4zoBtTdka2G4FR8YOrxv//PJkPLbEIGoShB6
         9xo57hEnk+PBUCD/xDIb1bodlFVw5nZNtWGK+79enbjBEbixEKIYDUL+wbK7vvY/TMhb
         16+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891511; x=1768496311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fIpmw3TbxuFac2rr3Ral/5NrCqmxWN0HTMSbOEZp4Sw=;
        b=wLgQ288eZZYbc2WhjImAaswWxvDojJyMW/Ctb0P1B5grYCqyL040YrVaZIXdapxr5P
         al4z4a+085cjT3E8hb3x0YFyLhv4RjHFJTl4ikhZDMYelzZUUOxzCxO+nU99gFCjojCa
         aklZbm5syQK0jzuCfGrOT5c/q9DoxZ7YqVXWHxTL4FusNK88ggqVXGdFn20VNpOrzZAX
         dbx0Y1AmjnW9Pl8xesZ3yu6Wxt35hCcCKTXwlfpV6kHL70XXaKFuoZ4CwDggTE9QjS59
         L5GehEWhIrCNrNdvvLdofc3eWYTIfdRUDxdpRXN5Byvd6yvZTIunbqS91eJ99L7dngyc
         jFjw==
X-Forwarded-Encrypted: i=1; AJvYcCUVZk8Rlab5+vRFlIGXucqrLdZdMGNCNw/nkiu6xM2ZrSDeCJ+j7T/q4KBLg9n6M8kYsSzh@lists.linux.dev
X-Gm-Message-State: AOJu0YzPuw1ugrYlPoU+0lepejy/gIyFPivxfIL94k9/LDxqrnwc7DdC
	+ez+FhK2AOgwTj+YihKKERI22PBL5Ci+FlADPhn9vRn8WWsXO4eONuDRi10IuRJ+AIrs7WMChQ5
	38ezk3KHm0ccT4gVhKs0IO/ume8141rQ=
X-Gm-Gg: AY/fxX7dCn5EKBuZH3dfOaSaGhyHL3CwhKg3vRrNfOrxUokX3nt4USWZjYYw08naX+K
	oq8Ik/Gv1WlZfmiJhqCyVmi1dUJ7BqD+yo2cbbzUx2cdnvGk0xH6PoziuJetJTz7Eb6CV6pS8CM
	L+P25ePVVeK3aKy6+m8Rdzqfqdyt1SY9sOStauC/yj5ahO5EzyXMlKMb/osoT5OqcWFrbyQOo5e
	Z0eL/CMUdmCqFs/TrEJTp53SVzkyT5ejOHMQUlGxXmDoWLPig4tfTOfd+6LcAc35ezRm+h9w4Mx
	H5zHA4MopwQTw0gCU9qlUWOLZNiZ
X-Google-Smtp-Source: AGHT+IHULotT7XFOA4hDBTUJBhfsHPefC4PlHzU1kuHvxYpkrgCp4pB0H1Sx2VpJWUGOCosSRzEF1Th10/Eb/PAqOAk=
X-Received: by 2002:a17:903:1a6f:b0:2a3:ee53:d201 with SMTP id
 d9443c01a7336-2a3ee53d218mr72769795ad.12.1767891510843; Thu, 08 Jan 2026
 08:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767621882.git.lucien.xin@gmail.com> <f891d87f585b028c2994b4f57712504e6c39b1b5.1767621882.git.lucien.xin@gmail.com>
 <6c8a1f56-16ed-482f-a9a8-ac840a7aebd3@redhat.com>
In-Reply-To: <6c8a1f56-16ed-482f-a9a8-ac840a7aebd3@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Jan 2026 11:58:18 -0500
X-Gm-Features: AQt7F2r2eahRmpC-isaCgnTPZ3EtB5uQT5Ead8hHYSoe5kUDYAgbUFOe0Uminug
Message-ID: <CADvbK_d_3cF63zM6cJv0Oc5XB7ntaZozzbu4K+xmM2jaS7Jshg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 03/16] quic: provide common utilities and data structures
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

On Thu, Jan 8, 2026 at 9:45=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 1/5/26 3:04 PM, Xin Long wrote:
> > +/* Check whether 'd2' is equal to any element inside the list 'd1'.
> > + *
> > + * 'd1' is assumed to be a sequence of length-prefixed elements. Each =
element
> > + * is compared to 'd2' using 'quic_data_cmp()'.
> > + *
> > + * Returns 1 if a match is found, 0 otherwise.
> > + */
> > +int quic_data_has(struct quic_data *d1, struct quic_data *d2)
> > +{
> > +     struct quic_data d;
> > +     u64 length;
> > +     u32 len;
> > +     u8 *p;
> > +
> > +     for (p =3D d1->data, len =3D d1->len; len; len -=3D length, p +=
=3D length) {
> > +             quic_get_int(&p, &len, &length, 1);
> > +             quic_data(&d, p, length);
> > +             if (!quic_data_cmp(&d, d2))
> > +                     return 1;
>
> AI review found something likely relevant here:
>
> """
> Can this cause an integer underflow?  When 'length' (read from the data)
> is greater than the remaining 'len', the subtraction 'len -=3D length' wi=
ll
> wrap the u32 to a very large value, causing out-of-bounds memory access.
>
> Compare with quic_data_to_string() which validates: 'len < length'.
>
> The same issue exists in quic_data_match() below.
> """
AI seems right. I will change it to:

                if (!quic_get_int(&p, &len, &length, 1) || len < length)
                        return 0;

Thanks.
