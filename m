Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF44E2877F4
	for <quic@lists.linux.dev>; Thu,  8 Jan 2026 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767910803; cv=none; b=BFaMCm2qK36CDALrkwPeOAaXRendGLIuEEgHfg73bmIylviROSmP/XHmHevrmGOR1eAw5d+CuvL5z+YWhpxQ+ywbI99SZE4XtdfiP1cTczYrtXnQ5EH5Pz9MKdFUL71e0bswmNdQlAcbicM2p1CNzPeYkZjH0VaymIRhYm/wqU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767910803; c=relaxed/simple;
	bh=+wSVc2IT5bsrbZWZdITGeeRuH5v05cIZtgKBrisJhGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7y3kdti0OyhMFW0G/Zn4EKAgRpTwnQmGtMeZJUcZa73AXQZ+75crcjV3lKWtHTo8RvKo8/AxTfI3kqg7SodQ12T8r+DHZqD+JKa69ta/7CmPc8BBtcGACnrsCZO2TrCHx80Cc3K0SvEPrtrGO0sLgg71P4pb/ID1mZ3bUeYOlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtcbS9O8; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtcbS9O8"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso1739294a12.3
        for <quic@lists.linux.dev>; Thu, 08 Jan 2026 14:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767910801; x=1768515601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eSpvqBcCMdUnYFu5r+IbcRJ+Ycs9RPex6ZaryNeYwM=;
        b=JtcbS9O8wt0lyz4gxvgdZBNooP6Wodf3Jz+kHFQfHqugvh6Kqs4a8e+Uw3BKhgDnNR
         9vtAwKYVTt8fZtqf6al3lsYTxyiocJ4qnqcCdOw1HzTsZQSzUkgsRvQgE/HKMQJhtrDM
         ksEg5ITpKMC8v8+w1JfbaeHnUUTUiHk7KF/uODnI2lcQgIxjgspmgAXMG8fEVqLVq5eQ
         S8YIB6X4kDc4c3ujFBo4Vwkz/4EQNiJbGvlOfE/9ef7ed8WORDxX1R4xlWzP2dB4admw
         QP7UolT2iBe/Dky0tXwKBl0+kyQHf+P7TfilBJib7DdATzL1QXMPVtGu21vR+jN2np/Z
         Tmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767910801; x=1768515601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3eSpvqBcCMdUnYFu5r+IbcRJ+Ycs9RPex6ZaryNeYwM=;
        b=H182tQ87n68xmX899JJT9Lsd++68/zOc25AIo1hpmzCIaO7EvwjR1G7LJIbc/G796T
         WjoMdjC7A94MVyEdPGv+n7VPtLwau4NJpqPu7qpKAXHqFhYKjoKKJJ5fjiTz8N8MATmf
         +Eox9muByLK/MjcSlfe/lJRwlsNON6c/7Oi8AvWwukcO9fwgicA+WR3eBZMZMW+jFs9j
         VfBf0UyVpQJ52JT2d0q4nFPwujTGUyPfwpX3W/s58W6faDql+t+OE9zVlnzGISVlQhL/
         R6Wi+rr3Koijby5ns/gp1o+J+ML2gZ0f+YmkIV1Wi5m6lhZdLumUa4q0Ud+LOyWhLJVG
         mdXg==
X-Forwarded-Encrypted: i=1; AJvYcCXujeckHxEkwZLOPqW46Da2ynLFiqpa+Gc5lH/Y+Gv5UKg4prORbYwA2LlECgDgqtWN36yF@lists.linux.dev
X-Gm-Message-State: AOJu0YxIq8rrCMBoso8e6eK3oTBXIcZWlFzr+E5UxCYn1NvA31JOTQ10
	LfXUMVPEbxPa/y60oNLYLo2yN9RemwgFdtZe/mdwl+sVqh6DZDrgVeZQawHgfzJUmxWqqka/qJ1
	TDDDI5yzN7pMskKigzIl+9PYY0zKhuEo=
X-Gm-Gg: AY/fxX6sdfohk21iAozmUUQCXv1iYQL80Xlr2hBzI99PDGN1y0OvhTK44s0TaR7RjZL
	o+pkc+6DnaYrCejyWrbVIr+p0wSoLY3Jrlzkcudzef5hQCYISewB30o4ZsLhArsWeiQ1TyNuZJb
	FY8TKIRoLcGM2Zx6nPCANbdrgIQ/sgl+IJhreqQU8SrzZJ3/rNMm90OlrKWqeZKFumkHiyMcOI2
	F230LK8hAkDeQACUVMESpqDm5rGT5ejAxyZhw7tN02yXUQ02XQmmKskCtWL/pq/RhMdmHk=
X-Google-Smtp-Source: AGHT+IE6kkegFDt+9XCzD+S56azqAPTIJarvZtVAkqkfUkoYB3glBC/TJm42hBLD2pQUlnWfdjMc3cigjDPJ1b82sgo=
X-Received: by 2002:a17:902:fc43:b0:2a0:ccdb:218d with SMTP id
 d9443c01a7336-2a3ee442824mr75598785ad.17.1767910801242; Thu, 08 Jan 2026
 14:20:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767621882.git.lucien.xin@gmail.com> <d5e0dce5e52d72ed2e1847fe15060aa62e423510.1767621882.git.lucien.xin@gmail.com>
 <0df97c1d-aa75-4472-aad6-33eaa919ce28@redhat.com>
In-Reply-To: <0df97c1d-aa75-4472-aad6-33eaa919ce28@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Jan 2026 17:19:49 -0500
X-Gm-Features: AQt7F2oQeSaDlFSlRPZRuDsHDmuOmu--yt6QSCtiFGQnIoBOFFX8SGhuo0gGWpA
Message-ID: <CADvbK_eVM5T3u7hiXR=S3ydHCAneCP_wLM7Q4Tc=D6eJ9tv4sA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 02/16] net: build socket infrastructure for
 QUIC protocol
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

On Thu, Jan 8, 2026 at 9:40=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 1/5/26 3:04 PM, Xin Long wrote:
> > +static int quic_net_proc_init(struct net *net)
> > +{
> > +     quic_net(net)->proc_net =3D proc_net_mkdir(net, "quic", net->proc=
_net);
> > +     if (!quic_net(net)->proc_net)
> > +             return -ENOMEM;
> > +
> > +     if (!proc_create_net_single("snmp", 0444, quic_net(net)->proc_net=
,
> > +                                 quic_snmp_seq_show, NULL))
> > +             goto free;
> > +     return 0;
> > +free:
>
> Minor nits: I think an empty line before the label makes the code more
> readable, and I would prefer #if IS_ENABLED() over #ifdef.
>
Will replace all #ifdefs with #if IS_ENABLED().

Thanks.
> Other than that:
>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>
