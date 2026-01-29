Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342CE28C009
	for <quic@lists.linux.dev>; Thu, 29 Jan 2026 20:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769719590; cv=pass; b=Trf13XJQeVNknLF/odnJW7oY+kribZ7J7IOWHd3OCPgc9U0alEe8k+yY5P4f6JT7xN7k6B4I0zKf28VkfHwKCHOOTxgukoAHfsx8cVknySCPfYlroXHNyCkdPQpgBLwxYxSmPxAPP7LaFR26FZRUGZkF399xGU0x4ol/vQuI2d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769719590; c=relaxed/simple;
	bh=zjHuPkHntjyTBGXYffHqPoUIemI1XaG2Oi8mFrXilLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vD5PYvxug6fef7G/sOnwo4EKF9jZ3uJsmDJTzehQFx2VP1wnmXUeQ2tPo1Mw80T40PWMjYjrcksBvBzMobJH0YbXHkqgYAsmsqg/c2ZNJDkV6gjzXL1ZZdVQnLXQyk09CyehaiR1EtPGJUSkSon+1vPAWAuI78eh/P6KV5xPndg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtlqUqkK; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtlqUqkK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35338b3dd31so639258a91.2
        for <quic@lists.linux.dev>; Thu, 29 Jan 2026 12:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769719588; cv=none;
        d=google.com; s=arc-20240605;
        b=I2ptWMNvlNgUNYKLREBbK6QjUu48dMLWsWaF7fy6NVoD5vovR+qyEAzzTKmXvu1nZk
         852rpNMwsSHmjyM/qSmcbaZspnw48d+XhtP0SO8koAVleLpu5i1R4MGjXrqODY/dOBRi
         oInf92bsd+3WWFch7zilihySKrvQdeTZohh7+LbeiL+ctlt2lEjLyZnkVO5RsLgzK3ar
         KQNdi5yg3DyrBXNddkapLvBVYY2kTSWefygO+rXPWilOUJy/Es0UVRe8ObbYNjLXYpd9
         Qqv+jMZp2Ci/6iXpwIfAj0uhwFubd8ow39hhv2ooaBWRvE2Vv6e34PsGjVvpWsOLaOUA
         pW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0rjX5Jj8ZcoFZqsTgog/aLHedGrxKuSlvfvYk7WheXw=;
        fh=+UryvEgiWQ9SE7YODba8s7Bwn0BLuslaCInOiJ3NaB8=;
        b=i9fgRPy+8hS1++jfnvkb8lZcEawziUXlsyV/eDutT623EX1m/vHoPmIEZWcHi3r26W
         Aud9iIeQaaKuQkbZF6IE9Q54htUUXIi1YcjOnSADVPiHsvJT+6iEI+EVch/euV0A2dXK
         0YzWHq7/BbbXJSPsIEjw+u2RiYHcEnFdqbFFZC43Xyq6DB/wyz43DeBub3RuWTLRPSdb
         ufv92qzX3r2ab+sU1e0HYXE5+lZlP1tlVpi0seKtUHSWS+DfGnzZwlx8K/RbKxX9kGR1
         9VEwH7a/oganTqGj5d5ZJZfPL3WLaVY3frq5G5+6uN4ijI2caZBREXFKMgCq/pevbRIx
         i1rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769719588; x=1770324388; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rjX5Jj8ZcoFZqsTgog/aLHedGrxKuSlvfvYk7WheXw=;
        b=jtlqUqkKjMcI2/9lPZSPFvH/UvIFtfW+C1Nv2/cl7WplWbSC8yzJxtILt10kbXYfil
         y0JifeBULj3uLjTKvXY/TgmDKEq5tUoyPLRzuzl5rsBkajJOb+aoNVFrIkQSjvfage0D
         0ugu8DO/jJTWuVxxY3Wt2OT6GCybWpZ8MSOdeRVvSLbTUn27YcqAGmXXxPHpUFKtGVFG
         Ej4uyxsEbb+DDxo9/r8Htz6MxPM9rTaadLGce++XYJG1mR08rCRM8yHRx9tH+WDeyd4d
         bEXh3lFgRoNRBOP/3tv96l/Tr8ybkR30EotNyPDduiCkh+k6xR3PeAHZkKYmMa8TtgPX
         jghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769719588; x=1770324388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0rjX5Jj8ZcoFZqsTgog/aLHedGrxKuSlvfvYk7WheXw=;
        b=EJlMeoa14VXbBhi87Y0LPm/oi7OOWA2PBDWXOTMzvyYS+8lxrEfW3L2MnQ9KpHLHqQ
         B1693z2gHZgrlasFZqDcuguSiC1JwGEmMdYcxZfkxioZuA9V1eMg6pA467WMTE8T1q66
         FjDQOeSvtSI8LjLU6ApwpDGzZuIF3i2ogvJNFZo7sAx8hPhJJy2YpC9HpIdjZXepvKvK
         O4ZecqcaUzY9bETxIiDU6wNLxGeKc5Y06Irg92853a0+h9PWE2StVSDAAMtjKxXfHe28
         sIN8sDVZ73beR6eKOCLkmKpTjehPggYWqWDdKgaS7PcoHqXdGbA3gCeasS2pIS5E0EgK
         hJtA==
X-Forwarded-Encrypted: i=1; AJvYcCWqezvrXarpbm4ALCsaYXPawQytXL0uRj0LrmBzZxxtlkHzK/PIYAgAUcbX5NX/NnZ3/JdV@lists.linux.dev
X-Gm-Message-State: AOJu0YxaLll/bnqkrVvVKnwCh8au+nCpjK/N1+T+CFhmpGQHI8hLwO/X
	YzguPSaUqNcQeixI8fgg87l6U6c40fVeNcy77zItrDll1VdMKWyGXesd7/c25iRCNx017D96nEg
	fANT3NORvv6L3AdIBbqTdaZUbIyYQ1qo=
X-Gm-Gg: AZuq6aKS3qE2j+IMkFj18nOM1FEiYqekSVXMbyeewymzOQYsk0J6M0NvcSI3+FHTfjj
	U9ramfro7IFNr6hfYrWWYoWAd4dS4NX69fguJhm7uzd7v/wsOvvYY/3jdOWX9RvGum1/UAKDXxI
	GuWfmLwwSTT/DrN+stVbnLbJbQzjk4K8YqWQriZD5AX203EFpST8TrRNRLXCqcw6XHV/n6mxzb2
	ISmZykb2ljEhWkx+r7zCkVza366uQ/gfZC6eNjGOr7JCKLbxowjnsRROi5EoQVpw46gss2OVUYt
	H4x1U400N6b5cUGIdJ/ZYNiBohFy/g==
X-Received: by 2002:a17:90a:e708:b0:341:6164:c27d with SMTP id
 98e67ed59e1d1-3543b2e008emr555530a91.3.1769719588438; Thu, 29 Jan 2026
 12:46:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769439073.git.lucien.xin@gmail.com> <2367f77787fa0a29913f48c91087397dcc82c35f.1769439073.git.lucien.xin@gmail.com>
 <a7b64f16-5ca9-4344-b7e8-c0d4508e43cc@redhat.com>
In-Reply-To: <a7b64f16-5ca9-4344-b7e8-c0d4508e43cc@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 29 Jan 2026 15:46:17 -0500
X-Gm-Features: AZwV_QilFyKAwMZw3eJvCjDZfe87Lm1Eud11Dux0qE2Wke45cccXOPKvoyXi4XU
Message-ID: <CADvbK_f3v+0hXyBHiZeR0uFEn+rvq_wT=QDv8G-e8qvB-e-3rQ@mail.gmail.com>
Subject: Re: [PATCH net-next v8 08/15] quic: add path management
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

On Thu, Jan 29, 2026 at 11:20=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 1/26/26 3:51 PM, Xin Long wrote:
> > This patch introduces 'quic_path_group' for managing paths, represented
> > by 'struct quic_path'. A connection may use two paths simultaneously
> > for connection migration.
> >
> > Each path is associated with a UDP tunnel socket (sk), and a single
> > UDP tunnel socket can be related to multiple paths from different socke=
ts.
> > These UDP tunnel sockets are wrapped in 'quic_udp_sock' structures and
> > stored in a hash table.
> >
> > It includes mechanisms to bind and unbind paths, detect alternative pat=
hs
> > for migration, and swap paths to support seamless transition between
> > networks.
> >
> > - quic_path_bind(): Bind a path to a port and associate it with a UDP s=
k.
> >
> > - quic_path_unbind(): Unbind a path from a port and disassociate it fro=
m a
> >   UDP sk.
> >
> > - quic_path_swap(): Swap two paths to facilitate connection migration.
> >
> > - quic_path_detect_alt(): Determine if a packet is using an alternative
> >   path, used for connection migration.
> >
> >  It also integrates basic support for Packetization Layer Path MTU
> > Discovery (PLPMTUD), using PING frames and ICMP feedback to adjust path
> > MTU and handle probe confirmation or resets during routing changes.
> >
> > - quic_path_pl_recv(): state transition and pmtu update after the probe
> >   packet is acked.
> >
> > - quic_path_pl_toobig(): state transition and pmtu update after
> >   receiving a toobig or needfrag icmp packet.
> >
> > - quic_path_pl_send(): state transition and pmtu update after sending a
> >   probe packet.
> >
> > - quic_path_pl_reset(): restart the probing when path routing changes.
> >
> > - quic_path_pl_confirm(): check if probe packet gets acked.
> >
> > Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
> > Signed-off-by: Xin Long <lucien.xin@gmail.com>
> > ---
> > v3:
> >   - Fix annotation in quic_udp_sock_lookup() (noted by Paolo).
> >   - Use inet_sk_get_local_port_range() instead of
> >     inet_get_local_port_range() (suggested by Paolo).
> >   - Adjust global UDP tunnel socket hashtable operations for the new
> >     hashtable type.
> >   - Delete quic_workqueue; use system_wq for UDP tunnel socket destroy.
> > v4:
> >   - Cache UDP tunnel socket pointer and its source address in struct
> >     quic_path for RCU-protected lookup/access.
> >   - Return -EAGAIN instead of -EINVAL in quic_path_bind() when UDP
> >     socket is being released in workqueue.
> >   - Move udp_tunnel_sock_release() out of the mutex_lock to avoid a
> >     warning of lockdep in quic_udp_sock_put_work().
> >   - Introduce quic_wq for UDP socket release work, so all pending works
> >     can be flushed before destroying the hashtable in quic_exit().
> > v5:
> >   - Rename quic_path_free() to quic_path_unbind() (suggested by Paolo).
> >   - Remove the 'serv' member from struct quic_path_group, since
> >     quic_is_serv() defined in a previous patch now uses
> >     sk->sk_max_ack_backlog for server-side detection.
> >   - Use quic_ktime_get_us() to set skb_cb->time, as RTT is measured
> >     in microseconds and jiffies_to_usecs() is not accurate enough.
> > v6:
> >   - Do not reset transport_header for QUIC in quic_udp_rcv(), allowing
> >     removal of udph_offset and enabling access to the UDP header via
> >     udp_hdr(); Pull skb->data in quic_udp_rcv() to allow access to the
> >     QUIC header via skb->data.
> > v7:
> >   - Pass udp sk to quic_path_rcv() and move the call to skb_linearize()
> >     and skb_set_owner_sk_safe() to .quic_path_rcv().
> >   - Delete the call to skb_linearize() and skb_set_owner_sk_safe() from
> >     quic_udp_err(), as it should not change skb in .encap_err_lookup()
> >     (noted by AI review).
> > v8:
> >   - Remove indirect quic_path_rcv and late call quic_packet_rcv()
> >     directly via extern (noted by Paolo).
> >   - Add a comment in quic_udp_rcv() clarifying it must return 0.
> >   - Add a comment in quic_udp_sock_put() clarifying the UDP socket
> >     may be freed in atomic RX context during connection migration.
> >   - Reorder some quic_path_group members to reduce struct size.
> > ---
> >  net/quic/Makefile   |   2 +-
> >  net/quic/path.c     | 520 ++++++++++++++++++++++++++++++++++++++++++++
> >  net/quic/path.h     | 170 +++++++++++++++
> >  net/quic/protocol.c |  11 +
> >  net/quic/socket.c   |   3 +
> >  net/quic/socket.h   |   7 +
> >  6 files changed, 712 insertions(+), 1 deletion(-)
> >  create mode 100644 net/quic/path.c
> >  create mode 100644 net/quic/path.h
> >
> > diff --git a/net/quic/Makefile b/net/quic/Makefile
> > index eee7501588d3..1565fb5cef9d 100644
> > --- a/net/quic/Makefile
> > +++ b/net/quic/Makefile
> > @@ -5,4 +5,4 @@
> >
> >  obj-$(CONFIG_IP_QUIC) +=3D quic.o
> >
> > -quic-y :=3D common.o family.o protocol.o socket.o stream.o connid.o
> > +quic-y :=3D common.o family.o protocol.o socket.o stream.o connid.o pa=
th.o
> > diff --git a/net/quic/path.c b/net/quic/path.c
> > new file mode 100644
> > index 000000000000..9556607a009e
> > --- /dev/null
> > +++ b/net/quic/path.c
> > @@ -0,0 +1,520 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/* QUIC kernel implementation
> > + * (C) Copyright Red Hat Corp. 2023
> > + *
> > + * This file is part of the QUIC kernel implementation
> > + *
> > + * Initialization/cleanup for QUIC protocol support.
> > + *
> > + * Written or modified by:
> > + *    Xin Long <lucien.xin@gmail.com>
> > + */
> > +
> > +#include <net/udp_tunnel.h>
> > +#include <linux/quic.h>
> > +
> > +#include "common.h"
> > +#include "family.h"
> > +#include "path.h"
> > +
> > +static int quic_udp_rcv(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     memset(skb->cb, 0, sizeof(skb->cb));
> > +     QUIC_SKB_CB(skb)->seqno =3D -1;
> > +     QUIC_SKB_CB(skb)->time =3D quic_ktime_get_us();
> > +
> > +     skb_pull(skb, sizeof(struct udphdr));
> > +     skb_dst_force(skb);
> > +     kfree_skb(skb);
> > +     return 0; /* .encap_rcv must return 0 if skb was either consumed =
or dropped. */
> > +}
> > +
> > +static int quic_udp_err(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void quic_udp_sock_put_work(struct work_struct *work)
> > +{
> > +     struct quic_udp_sock *us =3D container_of(work, struct quic_udp_s=
ock, work);
> > +     struct quic_uhash_head *head;
> > +     struct sock *sk =3D us->sk;
> > +
> > +     /* Hold the sock to safely access it in quic_udp_sock_lookup() ev=
en after
> > +      * udp_tunnel_sock_release(). The release must occur before __hli=
st_del()
> > +      * so a new UDP tunnel socket can be created for the same address=
 and port
> > +      * if quic_udp_sock_lookup() fails to find one.
> > +      *
> > +      * Note: udp_tunnel_sock_release() cannot be called under the mut=
ex due to
> > +      * some lockdep warnings.
> > +      */
> > +     sock_hold(sk);
> > +     udp_tunnel_sock_release(sk->sk_socket);
> > +
> > +     head =3D quic_udp_sock_head(sock_net(sk), ntohs(us->addr.v4.sin_p=
ort));
> > +     mutex_lock(&head->lock);
> > +     __hlist_del(&us->node);
> > +     mutex_unlock(&head->lock);
> > +
> > +     sock_put(sk);
> > +     kfree(us);
> > +}
> > +
> > +static struct quic_udp_sock *quic_udp_sock_create(struct sock *sk, uni=
on quic_addr *a)
> > +{
> > +     struct udp_tunnel_sock_cfg tuncfg =3D {};
> > +     struct udp_port_cfg udp_conf =3D {};
> > +     struct net *net =3D sock_net(sk);
> > +     struct quic_uhash_head *head;
> > +     struct quic_udp_sock *us;
> > +     struct socket *sock;
> > +
> > +     us =3D kzalloc(sizeof(*us), GFP_KERNEL);
> > +     if (!us)
> > +             return NULL;
> > +
> > +     quic_udp_conf_init(sk, &udp_conf, a);
> > +     if (udp_sock_create(net, &udp_conf, &sock)) {
> > +             pr_debug("%s: failed to create udp sock\n", __func__);
> > +             kfree(us);
> > +             return NULL;
> > +     }
> > +
> > +     tuncfg.encap_type =3D 1;
> > +     tuncfg.encap_rcv =3D quic_udp_rcv;
> > +     tuncfg.encap_err_lookup =3D quic_udp_err;
> > +     setup_udp_tunnel_sock(net, sock, &tuncfg);
>
> Possibly you need to adjust UDP_MAX_TUNNEL_TYPES in udp_offload.c. You
> could check running a kernel with QUIC enabled and geneve, vxlan, FOU
> and xfrm disabled.
It does not currently implement gro_receive, so there is no need to touch
UDP_MAX_TUNNEL_TYPES. Adding .gro_receive support for QUIC can be
considered as a future enhancement.

>
> > +
> > +     refcount_set(&us->refcnt, 1);
> > +     us->sk =3D sock->sk;
> > +     memcpy(&us->addr, a, sizeof(*a));
> > +     us->bind_ifindex =3D sk->sk_bound_dev_if;
> > +
> > +     head =3D quic_udp_sock_head(net, ntohs(a->v4.sin_port));
> > +     hlist_add_head(&us->node, &head->head);
> > +     INIT_WORK(&us->work, quic_udp_sock_put_work);
>
> Is unclear to me if quick udp socket lookup be done locklessy with
> future series?
>
No, quic udp socket lookup will not be done locklessy.
As this is not on the DATA path, I didn't intend to use RCU things on it.
