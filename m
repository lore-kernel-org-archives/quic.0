Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D066B3859DD
	for <quic@lists.linux.dev>; Tue,  3 Mar 2026 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529545; cv=none; b=U8kciSmyNPgspbRNBMylRNLwM7NfTQbnFup/wIWGjW+N4zXKE+vY3nRwxVspXQDg+wLoCBcID2XagpUNKfrOZ5ZPEo7tZ+JHhHTfcRFnFwTg3HlqRBGzWud8PwFzu80WHMlCmeB9F/dSLEIh/td7TueOyQy7Yl7R31B26f9urVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529545; c=relaxed/simple;
	bh=Sl9s33PI2gXIErv/itE1S5taIbog6hFU7zftnmcZCok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkxRyDR+GbRN7RAr8HYoNy3B0UiX7TsVItPa1iVbUC67i8WZ0yMssyMlrRofThpTHYxJ/02ejyqngPNGoDh1RPowjke9DsKtNl6YUpmtu082xVaKDrBS1LMcB3vXFntDcKxk/koYDA6kKdIODV7dD8JZP0Dj0E5b/glRqDstKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pjel4fTi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pjel4fTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772529542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S88HPomaSqnbxnsyYWFXX9R+c+6772O9y0Gq71iEev0=;
	b=Pjel4fTi4O9ij1KZwh3ha2rSWqn6CsUTs3tZUGzLDvT0YoJHu7/nVo06nTXticXLHr6wMw
	+LxBKgagqfECZHoZ9aAY7d9HllEzhKp+YJ+X1OPM22XTgi2AjX8e4Yr346qPwRXNsrMPNG
	nvDFPaWmgabc31X+C4Ms8dUExIB6AVM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-qc8BYwroN42lmAQapQ0EpQ-1; Tue, 03 Mar 2026 04:19:01 -0500
X-MC-Unique: qc8BYwroN42lmAQapQ0EpQ-1
X-Mimecast-MFC-AGG-ID: qc8BYwroN42lmAQapQ0EpQ_1772529541
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-798531a0f58so81239057b3.0
        for <quic@lists.linux.dev>; Tue, 03 Mar 2026 01:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529541; x=1773134341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S88HPomaSqnbxnsyYWFXX9R+c+6772O9y0Gq71iEev0=;
        b=WLNELMPWbThpfK6o8Cr0N88/rIa5b7z5hDh4ziqjC1Gqq7zlKrv8RBZ1Eb9LiCoyaS
         42Jtdq9htmZ8QtL+ej1N/ed7jjcXJlWOP/FBzfQ+3+ON/VLvgk4MMBQd5haBOCYSoXm+
         qljWfcPashJ30R44fwnGbDmwDu+djFyJ8UvePv2EQqxdTYC8LqlSLXVwoSNVFREL9Tbx
         Wss4u96ySab+bk7E6QjNBcQxwjxiCZGgf2b5dE8F2vE0kL9ZNCDec+3rJ38zrJgRFCTW
         yiV2Xt1zj4QG7Gu8BRc1VGYDlNArw0cUpZlArzAN6qAVBBveWxCoxn2iBoiSjF3tBOqE
         evpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiTc6FVWp+fQvLqNrmi+m/kQWKoFdoukTR7u5Xxk8MV2LX7EeoDkVjS0DGKk7/rL/U3W8f@lists.linux.dev
X-Gm-Message-State: AOJu0YzzeEvn3bI/GrST5wn/ampTuh/CQE1Z/MTiiEhOPnY1MJL7tjW+
	XuNBLY8QRhKDVrWK3gSJsI9s8wQ6NJq9ei26gG4jG8sIEZ2wjFCKYGXhVqJPcRgAqox5/p2x+dH
	HUzGMFpK/J/lElahtN/WrdzLcooBFiRpRl7T/4Ej6W2y+R/T3QrSnA+JioggSaBd9JBDcHs8I2I
	zExEU0SQ0VS+Ip8Z+8aPxwejIvoQWFRw==
X-Gm-Gg: ATEYQzxq8wwql69wtA7HX99FDui5RzsvH88BbDwiV3rPdB2w8WqPsBwERr4h9g973Ln
	Ew9VXu7adBw/0IXbxq8IUz43MafSFD+XY0eKm7NUP2IThqwVLgsaSCluXJusHykonvNAq8ED0rY
	phiZJ34odLnw6ShHb3CGzO9LOzgVqHNbWuijdk9doyPmw9/e7c/SbQIVcjzZvBJqu67cW7PXREG
	ugItxM=
X-Received: by 2002:a05:690c:89:b0:798:67be:f8fa with SMTP id 00721157ae682-798854ef3aamr139425767b3.17.1772529541165;
        Tue, 03 Mar 2026 01:19:01 -0800 (PST)
X-Received: by 2002:a05:690c:89:b0:798:67be:f8fa with SMTP id
 00721157ae682-798854ef3aamr139425527b3.17.1772529540751; Tue, 03 Mar 2026
 01:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <e49a24b97a25a9c25bd33411b8212978dd566bd3.1771986861.git.lucien.xin@gmail.com>
In-Reply-To: <e49a24b97a25a9c25bd33411b8212978dd566bd3.1771986861.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Date: Tue, 3 Mar 2026 10:18:49 +0100
X-Gm-Features: AaiRm53rJ3wV-QBG6V--xu4Px23a7wXyR_Jsp_m9nNP5uOat2VsXjJ9xQsdj7Tk
Message-ID: <CAF6piCJDWjOmgkspuk28qAF8+9xj_o-zTXkUdB+3_waZqaMXBA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 14/15] quic: add packet builder base
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, 
	Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gg-Yg6epoq6IYPA6eFyf5ojYFxmbLx4JmSW8FnF0YBc_1772529541
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On 2/25/26 3:34 AM, Xin Long wrote:
> +/* Transmit a QUIC packet, possibly encrypting and bundling it. */
> +int quic_packet_xmit(struct sock *sk, struct sk_buff *skb)
> +{
> +     struct quic_packet *packet = quic_packet(sk);
> +     struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> +     struct net *net = sock_net(sk);
> +     int err;
> +
> +     /* Skip encryption if taglen == 0 (e.g., disable_1rtt_encryption). */
> +     if (!packet->taglen[quic_hdr(skb)->form])
> +             goto xmit;
> +
> +     cb->crypto_done = quic_packet_encrypt_done;
> +     /* Associate skb with sk to ensure sk is valid during async encryption completion. */
> +     WARN_ON(!skb_set_owner_sk_safe(skb, sk));

This is the TX path, how can sk refcout be 0 here? Possibly use
skb_set_owner_r() directly? At least use the WARN_ON_ONCE() variant and
add a comment documenting why is needed.

> +     err = quic_crypto_encrypt(quic_crypto(sk, packet->level), skb);
> +     if (err) {
> +             if (err != -EINPROGRESS) {
> +                     QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCDROP);
> +                     kfree_skb(skb);
> +                     return err;
> +             }
> +             QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCBACKLOGS);
> +             return err;
> +     }
> +     if (!cb->resume) /* Encryption completes synchronously. */
> +             QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCFASTPATHS);
> +
> +xmit:
> +     if (quic_packet_bundle(sk, skb))
> +             quic_packet_flush(sk);
> +     return 0;
> +}
> +
> +/* Create and transmit a new QUIC packet. */
> +int quic_packet_create_and_xmit(struct sock *sk)
> +{
> +     struct quic_packet *packet = quic_packet(sk);
> +     struct sk_buff *skb;
> +     int err;
> +
> +     err = quic_packet_number_check(sk);
> +     if (err)
> +             goto err;
> +
> +     if (packet->level)
> +             skb = quic_packet_handshake_create(sk);
> +     else
> +             skb = quic_packet_app_create(sk);
> +     if (!skb) {
> +             err = -ENOMEM;
> +             goto err;
> +     }
> +
> +     err = quic_packet_xmit(sk, skb);
> +     if (err && err != -EINPROGRESS)
> +             goto err;
> +
> +     /* Return 1 if at least one ACK-eliciting (non-PING) frame was sent. */
> +     return !!packet->frames;
> +err:
> +     pr_debug("%s: err: %d\n", __func__, err);
> +     return 0;
> +}
> +
> +/* Flush any coalesced/bundled QUIC packets. */
> +void quic_packet_flush(struct sock *sk)
> +{
> +     struct quic_path_group *paths = quic_paths(sk);
> +     struct quic_packet *packet = quic_packet(sk);
> +
> +     if (packet->head) {
> +             quic_lower_xmit(sk, packet->head,
> +                             quic_path_daddr(paths, packet->path), &paths->fl);
> +             packet->head = NULL;
> +     }
> +}
> +
> +void quic_packet_init(struct sock *sk)
> +{
> +     struct quic_packet *packet = quic_packet(sk);
> +
> +     INIT_LIST_HEAD(&packet->frame_list);
> +     packet->taglen[0] = QUIC_TAG_LEN;
> +     packet->taglen[1] = QUIC_TAG_LEN;
> +     packet->mss[0] = QUIC_MIN_UDP_PAYLOAD;
> +     packet->mss[1] = QUIC_MIN_UDP_PAYLOAD;

The magic number above looks quite obscure, and AFAICS looking at struct
quick_packet comments have different meaning. Please use some macro instead.


/P

