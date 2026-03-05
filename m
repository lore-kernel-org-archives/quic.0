Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC04288D6
	for <quic@lists.linux.dev>; Thu,  5 Mar 2026 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772669698; cv=pass; b=HLDLsJDxKMfTtDRcjCAP8fi3YEfrj3qQVkyp1PQ1piWGuMzNbob83s0yfiF9YLbFPP0UFGFW/0xvQxYDtmkZ3X1+WU1njJiamWbggF2cG8bddUgbPuy34kcYqsJ21j6wssd0Ai2tIt5RHU/5EsaLrZA87IoQw1OplHzCEQY2rP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772669698; c=relaxed/simple;
	bh=SNH6I/hhPmgSL35V+oZOn5ErlBAd3yoW65QFOWZVpMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zi9/cIgUNYiNoes76xGfavPqKgzFWbUQvHqLm7kmDJTbxk7Hi7vdw0evLoVrKWVOEtUqoGrNJ3UpscmQVGMRq+6HqzpT0nnDEx67XTX+Dc5UcJKAedFiK35CkkfA8gZ+rXR2MIT/Pu8rQC4S2SbDsI4twJFDukVJeesifZSExX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFJr8a9S; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFJr8a9S"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94de6081c1cso4560780241.1
        for <quic@lists.linux.dev>; Wed, 04 Mar 2026 16:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772669695; cv=none;
        d=google.com; s=arc-20240605;
        b=ANO2rfKLK4wuL6LCU0iRvxU7XK2hBru2kvk85pikyALFtGazgPXybBcdOIr3LH+vT2
         yvsYjh9FDU3du8+Zv5v6NNLqKFsF0jk+sqLMiIyuh029ZgC+JSsMPeheDBr/f1VMp85U
         bJMpTWURMU0g4XsXtIq/HXE/fBfV8pSJCPn1buVPnGnb7xkFILLpAheMVr7IGNIw0j14
         dJwZok1xG7sJXFJfQlTFQMyWAWGlH7ozIYEk/JJX7NR4xFlrwHidH6t5unxZMQnQ+ifb
         ruLFAXA+Y0IUOJnnA1RMzvMyAhqUckU0DM2lBnqPQ8XvLInsizamAK07fil5g3+OhT1Y
         NI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HSyN+e/bXp99YEHDDoss7T3ytoS/JigyhF1102UzIKE=;
        fh=oh82J6QY1eOMsBUcJazYt4yeS2dSZWnRPn3pOPKmpxw=;
        b=injeKKVYlXiKGgyqNoXAa4z+goAcnu60L4Ge/UWvMBdklYP+W3BrgENKeCUUi1AgDU
         6iM2zBC0mUZgXqhwkfrlise0CCTfQjnjHScZSBR0vKsNzTZH2wOgZYKlxFTcy0uLapl7
         dbU9R1BXtK405f+DOWUBpkPhLbR2vCMlRAF3KBUVSKep+l8E8S9qkNMRTiPB7byPXLo6
         7hEn+eRuR/onB/VhvvvtWUaOoLpVdYjw3XUOqgppX9CGb8YUyC7aycxqKbA7etZDVSp0
         6aNGmNpzmHDEP8CAw8mkvcLPVS2XsW/7GsLE0tCmH1Lq3t8sad3fEOsbUiaNOpOPScY1
         5g8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772669695; x=1773274495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSyN+e/bXp99YEHDDoss7T3ytoS/JigyhF1102UzIKE=;
        b=DFJr8a9SloLlhPPQ2j/MTVi4RIgEGAYD6NAUqVC4PBe8+Egn0wd6Kps7rM3YP32WFt
         9n+eKU6nniQ0AJBCsXdgKWmEpR3iuGBKwyhnUSWR616Umr2ExhNtaWEymGBNrJznEmRB
         q/SzRVSfjSDSbNrYvKD/goHmEsB/4zlGSRexzx67IbjM6Ra0op/8uVbTVitYiaAeyc9I
         gZbu7PDUNOqCNsQHNqWALuoX5Kk/S1Mn3D9HnPj4RuafjV6cytBuiG5RvPuO3LEtopnn
         OED0jFPP+tkyJtjWw2z6EWKv8hwYl9gS29cfXTSnyGjtHKzxfK42ZSsE5ITkeNCbvERL
         Obqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772669695; x=1773274495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HSyN+e/bXp99YEHDDoss7T3ytoS/JigyhF1102UzIKE=;
        b=BaeniiFODChC2BFHcgKk5teZ3B0AAsVmdKyQO9tSLfhQRUz3O2xsEAbYtOjw1H0zeC
         aFygIp4nDjOfiwhAdcKYc6VYpR0AY44x/7exxSYa7D9K4nuIUHj1fMCAzS09b0XWjWcL
         yiR7IExXe6Vvoobk7h0w2lhpDazWZC765MRSCJ/V4JvbWDUt+4FQotz4gEKr8hpb8Q6w
         BuGbS9IIOxVqP74//h7/KS2oy8VMDt8cudo/y8f8i4sT8nStCmgik6LYNlblqNemOhzm
         kXfHN1G8ee/QJZlTGR0LAkU42Ud6nwUjHwZDh7AnjE0izPYqje064fNENhNn6vO3URXw
         NYCg==
X-Forwarded-Encrypted: i=1; AJvYcCUyGbFOGq37UN71+WHzdLmXkVVJmjL06be6K9kD2zyQLeoqdTCp7Lupa/Z16WMlWPhCPrkz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1dlhorHC7qTDCqAfguv3BF37q91cplPFMNR8JAuKOSnUt60lX
	dsNahQGR14RkCLrgTMGy8j/bS5AsZxq4wc9STbSoHBYJ4xQmO2UHR/Wz+Z+RehEEJ1nxESBYH1p
	CiXwdQyGPbqqoNaDNIDQLcncQpXitPZk=
X-Gm-Gg: ATEYQzzSM54p4eRahP/P/6i6YXurkQnywMIb5YUX36R0KaFimx7gXkjXJiEkfHCiVwf
	44SxMzJW1JgOGUVLvchSjWO03i+KoCVUi71CI7esbF72LI6py7qzF5jJj6h3xtZPp31wtrJ1Iv/
	6VP+IGEhEzwUCLBwyAI11FqpWdMZUhv8rLP69HC0QmafKgcBEiO/dh2kgkUzs8oGSIpQ8ICbuNf
	UuOumudVE6F3o0AaanIoUkv4stgQb5gNtSQPaSUVQ11k3qbjgxFfQmgHXVsTszoC7Qw4FhWqZO2
	XF9O0ERx5TuzAPFTqMF2GQWNmuTP2LwIVqIkdPEZ0g1dh9+V8GE2ANSg1SGBSA7fBhgEXZu8V3T
	7WbZwyQ==
X-Received: by 2002:a05:6102:2ace:b0:5ff:8b8:9f8c with SMTP id
 ada2fe7eead31-5ffaaf4b3bemr1900512137.26.1772669695494; Wed, 04 Mar 2026
 16:14:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
 <CAF6piCKOiwMz9Le2vBV4_W3R0NR3TW_je+ow4SCm5eX867awyg@mail.gmail.com>
In-Reply-To: <CAF6piCKOiwMz9Le2vBV4_W3R0NR3TW_je+ow4SCm5eX867awyg@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 19:14:43 -0500
X-Gm-Features: AaiRm50hxZ3LZQ8rWfNDJR5FazO0dRJs8u8F_F7HjgEpz5HRVEpNVToAMcIZlRk
Message-ID: <CADvbK_dhG7LZaRnz9JihHtboQmTLmudptGF1P+w5gyi=6Ls_2g@mail.gmail.com>
Subject: Re: [PATCH net-next v10 15/15] quic: add packet parser base
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:16=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/25/26 3:34 AM, Xin Long wrote:
> > +/* Find the listening QUIC socket for an incoming packet.
> > + *
> > + * This function searches the QUIC socket table for a listening socket=
 that matches the dest
> > + * address and port, and the ALPN(s) if presented in the ClientHello. =
 If multiple listening
> > + * sockets are bound to the same address, port, and ALPN(s) (e.g., via=
 SO_REUSEPORT), this
> > + * function selects a socket from the reuseport group.
> > + *
> > + * Return: A pointer to the matching listening socket, or NULL if no m=
atch is found.
> > + */
> > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union quic_a=
ddr *sa, union quic_addr *da,
> > +                                  struct quic_data *alpns)
> > +{
> > +     struct net *net =3D sock_net(skb->sk);
> > +     struct hlist_nulls_node *node;
> > +     struct sock *sk =3D NULL, *tmp;
> > +     struct quic_shash_head *head;
> > +     struct quic_data alpn;
> > +     union quic_addr *a;
> > +     u32 hash, len;
> > +     u64 length;
> > +     u8 *p;
> > +
> > +     hash =3D quic_listen_sock_hash(net, ntohs(sa->v4.sin_port));
> > +     head =3D quic_listen_sock_head(hash);
> > +
> > +     rcu_read_lock();
> > +begin:
> > +     if (!alpns->len) { /* No ALPN entries present or failed to parse =
the ALPNs. */
> > +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
> > +                     /* If alpns->data !=3D NULL, TLS parsing succeede=
d but no ALPN was found.
> > +                      * In this case, only match sockets that have no =
ALPN set.
> > +                      */
> > +                     a =3D quic_path_saddr(quic_paths(tmp), 0);
> > +                     if (net =3D=3D sock_net(tmp) && quic_cmp_sk_addr(=
tmp, a, sa) &&
> > +                         quic_path_usock(quic_paths(tmp), 0) =3D=3D sk=
b->sk &&
> > +                         (!alpns->data || !quic_alpn(tmp)->len)) {
> > +                             sk =3D tmp;
> > +                             if (!quic_is_any_addr(a)) /* Prefer speci=
fic address match. */
> > +                                     break;
> > +                     }
> > +             }
> > +             goto out;
> > +     }
> > +
> > +     /* ALPN present: loop through each ALPN entry. */
> > +     for (p =3D alpns->data, len =3D alpns->len; len; len -=3D length,=
 p +=3D length) {
> > +             quic_get_int(&p, &len, &length, 1);
> > +             quic_data(&alpn, p, length);
> > +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
> > +                     a =3D quic_path_saddr(quic_paths(tmp), 0);
> > +                     if (net =3D=3D sock_net(tmp) && quic_cmp_sk_addr(=
tmp, a, sa) &&
> > +                         quic_path_usock(quic_paths(tmp), 0) =3D=3D sk=
b->sk &&
> > +                         quic_data_has(quic_alpn(tmp), &alpn)) {
> > +                             sk =3D tmp;
> > +                             if (!quic_is_any_addr(a))
> > +                                     break;
> > +                     }
> > +             }
> > +             if (sk)
> > +                     break;
> > +     }
> > +out:
> > +     /* If the nulls value we got at the end of the iteration is diffe=
rent from the expected
> > +      * one, we must restart the lookup as the list was modified concu=
rrently.
> > +      */
> > +     if (!sk && get_nulls_value(node) !=3D hash)
> > +             goto begin;
> > +
> > +     if (sk && sk->sk_reuseport)
> > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(net, da),=
 skb, 1);
> > +
> > +     if (sk && unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
> > +             sk =3D NULL;
>
> Note that you could avoid the refcount if you keep using the sk in an
> RCU critical section. i.e. plain UDP does that. Same consideration for
> established lookup.
>
Doesn't seem easy to adjust the code for this, I will leave it as it is for=
 now.

Thanks.
