Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F4B1400C
	for <quic@lists.linux.dev>; Tue,  3 Mar 2026 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529413; cv=none; b=ChQHOnMRTRr6YTGpNbCOgTyIvW68qgxSWMFR+1XoctztdOz1JP/trR5G/suh4nz396QPmZUMn6wVzcdMIUiwCjixiaZ3Af8iv/PFpcv8x3/f7kFYyoxDldBv/XX6gDt5BHUdjHlZvHUO072wdOenR4Hnyb787mHHPc/q67qsjac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529413; c=relaxed/simple;
	bh=N9T9tK8lrPlBnjE46aPR6EPWJfEat41vQnH/NRbnpNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6T4jitmZm6SCH7AmlQ5W3EZrXDourvYWkAR1eCj0xU27sVAgZTc3uOS5Mp+go98nMlSyymN8SDTmos2RduJNQNsxC+J8lJfJaYBQgX/zDSeffAQem8g3RcEpPcO1zNwGZHpQ8nfb37fj6pC87IKCDeWHMSjhIbntQKGnLPrOY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bE3Eeh7c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bE3Eeh7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772529410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=477xItCgA+po7bLgye1fu2Qz+J42vgm/OW+kOSIs1X8=;
	b=bE3Eeh7c8FiM13Y6hRTE7KuCuOQ3YschGlalWwtiAtdQtPmXBgwCk0OOWSIJFZBz1gaygA
	K/357UT/hdQZWCGuibKO/+75KzW5HrDmKNNIOBIdH4GmqQrJuApLzNNHMHJSM/uPEryUDZ
	A1WjhIG0r3gUaVZ4Ku7zJiHgLxGgXdo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-8VCFJUzfMYG9KVY8jwMHkw-1; Tue, 03 Mar 2026 04:16:49 -0500
X-MC-Unique: 8VCFJUzfMYG9KVY8jwMHkw-1
X-Mimecast-MFC-AGG-ID: 8VCFJUzfMYG9KVY8jwMHkw_1772529409
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7987861595eso90059037b3.1
        for <quic@lists.linux.dev>; Tue, 03 Mar 2026 01:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529409; x=1773134209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=477xItCgA+po7bLgye1fu2Qz+J42vgm/OW+kOSIs1X8=;
        b=C5tlfYiXmjdq+CSK8iAvY+y/GjH8ZxRaKvzNJuKKHy7McWf+3FMVY9ycnjzRoGo0qk
         xclG+Ec510YZshm8P5vyxcXjE89OvrMhBWzw2As/szO7uYL0RAGfWbVMc9lktOIOJcVo
         /PKor7cVvu2aOUCD/uQLyVcHBM/pvTWqL4BUNfmDnHf3ETMm/zvP5QU93mWO+riJhqKU
         8sJcsiqqUukteImvGtNYyavETUIVnwN/MCLhil4TxK7OmN+gTPpwlCdRJYAzm5UFAGWS
         zmONSOytGkPErMJ7/XxmfqvFIYWFGvvIB3dPDM9m7NOvvWM6xAlqOHL/i7APBrn/WXQy
         l1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4BX13FFJV9OqBYn6O/0XeAduBCfoXCIW0Cgu2PrtRy305TVF4XYtl6dOxQpDEpxOLUG+w@lists.linux.dev
X-Gm-Message-State: AOJu0YyQTH1TMIgMMn7JT1b1ZCbsghWofdlaLWuxCNgZohJO55IWRVKf
	ixHCgrBqZxGZuN/SutEwakCGdRNm4y+prhW9n+F+Dazfr549GF2KDdYFT++tHOrERXAPENWSa+S
	+EfvcbqjXyRRbOo19+3L8Nj0UnxyGVIAY+6ypSWWNYy88YkHRbjIHpAbhpUVaHHNErKAAVbF4bK
	/v57c3DUPUNRO0L5T9nzDapsCOmFwA5g==
X-Gm-Gg: ATEYQzyyd1WduJFoWQwm5mNvR5ewV1dxdz1jY0QNZB6FKhDIRSzpeMRyCGj0wghjDh3
	edTiaZE4J3UD53o1Xc0XZ0IxOJOhz7LrJQ5gfBx+FUwz2CjrlrOlFlIHq25Qk4Z/IWJaWmtFMYj
	KASRuI1LvjdGV3B3YKVvyp4lE7PSyM43R7TglZjFF7jL7M0ftTg/0APItkxh4w9qoIYnV6k3sLO
	IMJQSs=
X-Received: by 2002:a05:690c:e373:b0:797:cd05:bcfa with SMTP id 00721157ae682-79885631b64mr135971507b3.56.1772529409180;
        Tue, 03 Mar 2026 01:16:49 -0800 (PST)
X-Received: by 2002:a05:690c:e373:b0:797:cd05:bcfa with SMTP id
 00721157ae682-79885631b64mr135971217b3.56.1772529408805; Tue, 03 Mar 2026
 01:16:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
In-Reply-To: <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Date: Tue, 3 Mar 2026 10:16:37 +0100
X-Gm-Features: AaiRm51KQx9VYE8xMRhcvcGF5sOeXsvvCe5N0-c4bJqQWqxzxGk3Zy5J02q8C_U
Message-ID: <CAF6piCKOiwMz9Le2vBV4_W3R0NR3TW_je+ow4SCm5eX867awyg@mail.gmail.com>
Subject: Re: [PATCH net-next v10 15/15] quic: add packet parser base
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
X-Mimecast-MFC-PROC-ID: oyuy0cRID6dYBdK5xRKrdycCsyppRqCKv0_VdzDeEJg_1772529409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On 2/25/26 3:34 AM, Xin Long wrote:
> +/* Find the listening QUIC socket for an incoming packet.
> + *
> + * This function searches the QUIC socket table for a listening socket that matches the dest
> + * address and port, and the ALPN(s) if presented in the ClientHello.  If multiple listening
> + * sockets are bound to the same address, port, and ALPN(s) (e.g., via SO_REUSEPORT), this
> + * function selects a socket from the reuseport group.
> + *
> + * Return: A pointer to the matching listening socket, or NULL if no match is found.
> + */
> +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union quic_addr *sa, union quic_addr *da,
> +                                  struct quic_data *alpns)
> +{
> +     struct net *net = sock_net(skb->sk);
> +     struct hlist_nulls_node *node;
> +     struct sock *sk = NULL, *tmp;
> +     struct quic_shash_head *head;
> +     struct quic_data alpn;
> +     union quic_addr *a;
> +     u32 hash, len;
> +     u64 length;
> +     u8 *p;
> +
> +     hash = quic_listen_sock_hash(net, ntohs(sa->v4.sin_port));
> +     head = quic_listen_sock_head(hash);
> +
> +     rcu_read_lock();
> +begin:
> +     if (!alpns->len) { /* No ALPN entries present or failed to parse the ALPNs. */
> +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
> +                     /* If alpns->data != NULL, TLS parsing succeeded but no ALPN was found.
> +                      * In this case, only match sockets that have no ALPN set.
> +                      */
> +                     a = quic_path_saddr(quic_paths(tmp), 0);
> +                     if (net == sock_net(tmp) && quic_cmp_sk_addr(tmp, a, sa) &&
> +                         quic_path_usock(quic_paths(tmp), 0) == skb->sk &&
> +                         (!alpns->data || !quic_alpn(tmp)->len)) {
> +                             sk = tmp;
> +                             if (!quic_is_any_addr(a)) /* Prefer specific address match. */
> +                                     break;
> +                     }
> +             }
> +             goto out;
> +     }
> +
> +     /* ALPN present: loop through each ALPN entry. */
> +     for (p = alpns->data, len = alpns->len; len; len -= length, p += length) {
> +             quic_get_int(&p, &len, &length, 1);
> +             quic_data(&alpn, p, length);
> +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
> +                     a = quic_path_saddr(quic_paths(tmp), 0);
> +                     if (net == sock_net(tmp) && quic_cmp_sk_addr(tmp, a, sa) &&
> +                         quic_path_usock(quic_paths(tmp), 0) == skb->sk &&
> +                         quic_data_has(quic_alpn(tmp), &alpn)) {
> +                             sk = tmp;
> +                             if (!quic_is_any_addr(a))
> +                                     break;
> +                     }
> +             }
> +             if (sk)
> +                     break;
> +     }
> +out:
> +     /* If the nulls value we got at the end of the iteration is different from the expected
> +      * one, we must restart the lookup as the list was modified concurrently.
> +      */
> +     if (!sk && get_nulls_value(node) != hash)
> +             goto begin;
> +
> +     if (sk && sk->sk_reuseport)
> +             sk = reuseport_select_sock(sk, quic_addr_hash(net, da), skb, 1);
> +
> +     if (sk && unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
> +             sk = NULL;

Note that you could avoid the refcount if you keep using the sk in an
RCU critical section. i.e. plain UDP does that. Same consideration for
established lookup.


/P

