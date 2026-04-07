Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1AD370D73
	for <quic@lists.linux.dev>; Tue,  7 Apr 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596738; cv=pass; b=HhQCbFrRWyfOJuDorYxKPVb/LpoSeD+VanEls5CiUe2bA3CIK/Yp8npmFt0EuMTxRotv4uwf5X43NZjpL0uf+WFan4nKnBZduKMG9t7N9v39f7wXTUwWMx4RULmeV+rm6R1/3TU5vtv4pMwRiEnD3xoK3Cmj0QDB9ye0Wdo3z3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596738; c=relaxed/simple;
	bh=S6tbRAzFg3MeQeTC/AMFAR2X1AQ6Sye+eMi6WllNgqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BN+x5tf9F8mc5rj+4WWLd1AkQi/1r7j+12Q8D6aL2LWTO1UjKy/fzoRunJ6ZLWza7Dc6TN13UWoAlhj9pjkMI/Ie20fjdz16FqCu+IIVfhq3A46b9yOXIsj/qbNxXc8MIvRzFupbCiK6hFCrJPUY9nM/GCKLe2R6JdCE0GEiPxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLkWm4ru; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLkWm4ru"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a049a767c3so3296836d6.1
        for <quic@lists.linux.dev>; Tue, 07 Apr 2026 14:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775596735; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/y9un3KQ7r3/zQwrmYqa8Nq14q9S0TYrAggVtYlGVerXSlJzE2ulW7HoRiX7qCOY4
         vsjlsR434b55eHtgRIdfd3KU/fQX9tEHsEn0sTeIc1PSxCS9qFnxc1tcxKontd8aCeMC
         QTgjBZE3xiVC6nqYs72t+wcLkbgPmlCOsUfjvhOjLReLfSdEd56tIrTISAEMY09zGeox
         yaJVPfdTXYvaOw5YTmgBCIRCr1SSfTj7PL7Te24NTvxVTiKyh3mC260XD6lkwe07QciU
         noe8k+esjdNnTJqxcYjQUdgXAxPxzM4UKFLoJQO+dVmulsd+kvjVlWvxOGdy9Qw7G4LB
         e5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AtDfCZKTY+IaeLMBmY9EmFTthg85aBiWG8xwPx5A83A=;
        fh=Kq9fahnliS8Taq4Cc6JB05E1aUU5fQxjgz45I1VjYDI=;
        b=CwqpgilpThoH7f2PU5TQQM9YhwdbmZSayargLQneKi3xkYga9HO3DdizxXubfRHoFq
         O93WTuflr+oap6bTgsfOb/6+c/eIfPktfc3jSElJJwmCa4XGEVkZWYrJgMiOz8+hYES2
         w6d728L7d5eIxH/YB6FAsCsJa0QbMD/RCAKo3LU3j4YVhiO0C/6b+s9H5eW1a/cjm8k3
         6UIyIgWyhVh+HQBY0Inn4rKuzv3yIZMHaqKQqVe5Q///Wxez7Gl9DqjFxi7YQqIId7Wo
         cvOSzhntXFnVJJWrWuuojB02ob/KnqHTGvkE1QvE7fcZYOJEC5ZM7UqZkJVT/hpjO3dw
         Wp1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775596735; x=1776201535; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtDfCZKTY+IaeLMBmY9EmFTthg85aBiWG8xwPx5A83A=;
        b=SLkWm4ru3e05OrNp5ygZmSG+ZiXy9qdB2mSqqf0uyyQgPrmfkSbgElv9p7MHRMP/1m
         RmjlJeRhI3bRx++AnU6d/rx/8nHzbVaQjsxTMLNzP4lBKT2HTQsxm8FdHkqJRzwQ1xpo
         Hw/5Egk3qwNx3eKVPqI68sqSZeN2YJwfkEKzbSOGopleQbBmYyDf1joOS6kITM6Cjd88
         TC9bTMAcylngFAvl+JwIVMGLXwYPUQ2AGLA+g12q0JJLnLYsQVVv3oRkMKueRGv9ezkk
         hn+I847h5weUBrcDjkv5AGRffqn/kbw/f8P61Ut2C2yBWsZA0Uh2bmFgwzJLszlaQoKu
         0eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775596735; x=1776201535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AtDfCZKTY+IaeLMBmY9EmFTthg85aBiWG8xwPx5A83A=;
        b=OuVDZZpFrgdUkyHHHI1gWhHaMeOdecuZnYzmhct2JWBRvtoM/PJ2o7TIhDZUzjG76I
         v5ZYAzOx+byUm/DKalt2GGmeExIA6PbH1l2y791smB61njjTrfiHoCOX6B3QZ5vIUmvA
         sWh65BQVpv597VRwK+/QRp358INBzMKoXGqx+4sNbLp+TcCZSMz4GyXFbsalRVa/zPj8
         FNhJcmLtO79sXRFXmRiX7goSM0Hztrc/lT6XnSe9nB8ahYpKXLffU98gGR7wC46d6JK4
         599Z5of3IXjVAZLm1uhtjptZx91XJHQ/bYB8eqcwnujS3MkbcQ3c8sepfuYKK5kp5Dii
         cfdw==
X-Forwarded-Encrypted: i=1; AJvYcCUFL5eZ25ObUPL7JCVNAy7O6g7Gf8AWARYKUvIskt1mNn6E85Zd3rW98LafBKEU8PGo33Ab@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd6sywCkAnlh0zT9rsThei3SEiWqrpLgpM2ts0+XkT2mcDPI4y
	2z2LPUlF/nygtKGSD2zvVD8XRfwqqqc31ygY5VPf72EQSLnhQ1QxDOo9geE6DAb2a9DiuhAZLDE
	RDL7rk89m8NoHnzPsaDhRbhqQZMqgIGE=
X-Gm-Gg: AeBDieu/Ret1OygTgpZXOI+pngVuqYJUh1hRrjP5kGk1MfBgUKsAo7czlTE7yNdvNJh
	UAG8WknZBrzKgY0pynipOF9lo/xo01ZRXAJbFnVdnz1+S20f4EKhyOMuswidIEphAcYFLn6/43r
	B+BC/DdyAHyd5VMW0uoKgTlDwMavVg2UIcAXF/jz2nEZftil4txak/zoN+oMp+McKMnMIcMskTL
	l/TJANGWb7GMARvqmNXAN3wXbi2q5abu6PE8MY7AVuUbN2jeQG3QVdU+8YnKzQ5XqqJ3NvmGw+z
	K39YuwDVvApGQ1H4xmbj19a8FKX/OT82iFr//e2h1pzA1qvk6KAZngj9KYG2/5qmHM7la68wrpJ
	16Ya6fKPv7ZYCP+izv3/MAsn759O2deXIs30E4W20cj9yZLtgiJh4TClFq5uckdQ=
X-Received: by 2002:ad4:5ce8:0:b0:89c:4bba:1a93 with SMTP id
 6a1803df08f44-8a703365784mr253792856d6.5.1775596735345; Tue, 07 Apr 2026
 14:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1775571957.git.metze@samba.org>
In-Reply-To: <cover.1775571957.git.metze@samba.org>
From: Steve French <smfrench@gmail.com>
Date: Tue, 7 Apr 2026 16:18:44 -0500
X-Gm-Features: AQROBzB6Yld8UuN4npSuWr9ACQ2pYlmn8Fwib8wPVlNW8GVvQnEYxNySzkbOOyc
Message-ID: <CAH2r5mvR_ZVaNKVC+5Y-g-UZkH3FAbV39U28Pz2MjUUSVUNnMQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] smb: add kernel internal IPPROTO_SMBDIRECT
To: Stefan Metzmacher <metze@samba.org>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Tom Talpey <tom@talpey.com>, Long Li <longli@microsoft.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, David Howells <dhowells@redhat.com>, 
	Henrique Carvalho <henrique.carvalho@suse.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	Xin Long <lucien.xin@gmail.com>, quic@lists.linux.dev, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged the first 4 into smb3-kernel ksmbd-for-next

On Tue, Apr 7, 2026 at 9:47=E2=80=AFAM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Hi,
>
> as the work to unify the smbdirect code
> between cifs.ko and ksmbd.ko into an smbdirect.ko
> is in linux-next for a while this is the next
> step to also share the code with userspace
> e.g. Samba as client and server.
>
> The SMBDIRECT protocol, defined in [MS-SMBD] by Microsoft.
> It is used as wrapper around RDMA in order to provide a transport for SMB=
3,
> but Microsoft also uses it as transport for other protocols.
>
> SMBDIRECT works over Infiniband, RoCE and iWarp.  RoCEv2 is based on IP/U=
DP
> and iWarp is based on IP/TCP, so these use IP addresses natively.
> Infiniband and RoCEv1 require IPOIB in order to be used for SMBDIRECT.
>
> So instead of adding a PF_SMBDIRECT, which would only use AF_INET[6],
> we use IPPROTO_SMBDIRECT instead, this uses a number not
> allocated from IANA, as it would not appear in an IP header.
>
> This is similar to IPPROTO_SMC, IPPROTO_MPTCP and IPPROTO_QUIC,
> which are linux specific values for the socket() syscall.
>
>   socket(AF_INET, SOCK_STREAM, IPPROTO_SMBDIRECT);
>   socket(AF_INET6, SOCK_STREAM, IPPROTO_SMBDIRECT);
>
> This will allow the existing smbdirect code used by
> cifs.ko and ksmbd.ko to be moved behind the socket layer [1],
> so that there's less special handling. Only sock_sendmsg()
> sock_recvmsg() are used, so that the main stream handling
> is done all the same for tcp, smbdirect and later also quic.
>
> The special RDMA read/write handling will be via direct
> function calls as they are currently done for the in kernel
> consumers.
>
> As a start __sock_create(kern=3D0)/sk->sk_kern_sock =3D=3D 0 will
> still cause a -EPROTONOSUPPORT. So only in kernel consumers
> will be supported for now.
>
> For now the core smbdirect code still supports both
> modes, direct calls in indirect via the socket layer.
> The core code uses if (sc->sk.sk_family) as indication
> for the new socket mode. Once cifs.ko and ksmbd.ko
> are converted we can remove the old mode slowly,
> but I'll deferr that to a future patchset.
>
> There's still a way to go in order to make this
> as generic as tcp and quic e.g. adding MSG_SPLICE_PAGES support or
> splice_read/read_sock/read_skb.
>
> But it's a good start, which will make changes much easier.
>
> This patchset is based on top of the smbdirect.ko patches
> in ksmbd-for-next and it's also based on netdev-next
> because it needs this commit from there:
> 8341c989ac77d712c7d6e2bce29e8a4bcb2eeae4
> "net: remove addr_len argument of recvmsg() handlers"
>
> Patches 1-4 are some preparation fixes for the
> existing smbdirect.ko patchset. We may
> squash them into the existing patches before
> sending them to Linus. But for now I kept
> them separately. I also don't cc the network and rdma
> people on these...
>
> Patch 5 defines IPPROTO_SMBDIRECT and SOL_SMBDIRECT
> constants (and also reserve the number 288 for SOL_QUIC
> as applications are already using that and we don't
> want to conflict)
>
> Patch 6 adds basic IPPROTO_SMBDIRECT layering
> on top of the existing smbdirect code.
> This is just enough in order to let cifs.ko
> and ksmbd.ko use it in the following commits,
> so userspace still sees -EPROTONOSUPPORT.
>
> Patch 7 converts cifs.ko to use IPPROTO_SMBDIRECT
> as much as currently possible.
> Using sock_sendmsg is not yet possible, because of the
> tcp_sock_set_cork usage, but that will change in future.
>
> Patch 8 converts ksmbd.ko to use IPPROTO_SMBDIRECT.
>
> Because of the need for netdev-next commit
> 8341c989ac77d712c7d6e2bce29e8a4bcb2eeae4
> "net: remove addr_len argument of recvmsg() handlers"
> it's a bit tricky to prepare something that would not
> cause problems in linux-next.
>
> We could merge in netdev-next completely,
> but I saw commit 00f03539e3d97af925abf42992d8c46167d54243
> in next-20260406, indicates some resolved conflicts
> with (at least) the rdma tree, which comes
> just before netdev-next, while ksmbd-for-next is merged
> before all of them. So merging netdev-next into
> ksmbd-for-next changes the order of netdev-next vs. rdma.
>
> Or we add a new branch smbdirect-for-next that's
> merged into linux-next after netdev-next.
>
> Or a bit hacky but likely easier, ksmbd-for-next
> just cherry-picks 8341c989ac77d712c7d6e2bce29e8a4bcb2eeae4
> "net: remove addr_len argument of recvmsg() handlers"
> and that cherry picked commit is reverted as
> last commit in ksmbd-for-next, or only in linux-next
> right before netdev-next is merged.
>
> For now I have the patches in a branch with a
> cherry picked version of the needed commit only, see
> for-7.1/ipproto-smbdirect-20260407-v1 at commit:
> e1972e6f1fda9842c5724b7daf4a2aa7779901a5
> git fetch https://git.samba.org/metze/linux/wip.git for-7.1/ipproto-smbdi=
rect-20260407-v1
> https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dshortlog;h=3Drefs/head=
s/for-7.1/ipproto-smbdirect-20260407-v1
>
> It would be great to get this somehow into linux-next soon :-)
>
> Stefan Metzmacher (8):
>   smb: smbdirect: change
>     smbdirect_socket_parameters.{initiator_depth,responder_resources} to
>     __u16
>   smb: smbdirect: fix copyright header of smbdirect.h
>   smb: smbdirect: fix the logic in smbdirect_socket_destroy_sync()
>     without an error
>   smb: smbdirect: let smbdirect_connection_deregister_mr_io unlock while
>     waiting
>   net: define IPPROTO_SMBDIRECT and SOL_SMBDIRECT constants
>   smb: smbdirect: add in kernel only support for IPPROTO_SMBDIRECT
>   smb: client: make use of IPPROTO_SMBDIRECT sockets
>   smb: server: make use of IPPROTO_SMBDIRECT sockets
>
>  fs/smb/client/cifs_debug.c                    |    2 +-
>  fs/smb/client/cifsfs.c                        |    2 +-
>  fs/smb/client/cifsglob.h                      |    7 +-
>  fs/smb/client/connect.c                       |  123 +-
>  fs/smb/client/file.c                          |    8 +-
>  fs/smb/client/sess.c                          |    4 +-
>  fs/smb/client/smb2ops.c                       |    8 +-
>  fs/smb/client/smb2pdu.c                       |   10 +-
>  fs/smb/client/smbdirect.c                     |  275 +--
>  fs/smb/client/smbdirect.h                     |   27 +-
>  fs/smb/client/transport.c                     |    2 +-
>  fs/smb/common/smbdirect/Makefile              |    1 +
>  fs/smb/common/smbdirect/smbdirect.h           |   69 +-
>  fs/smb/common/smbdirect/smbdirect_accept.c    |   14 +-
>  .../common/smbdirect/smbdirect_connection.c   |   58 +
>  fs/smb/common/smbdirect/smbdirect_devices.c   |    2 +-
>  fs/smb/common/smbdirect/smbdirect_internal.h  |   59 +-
>  fs/smb/common/smbdirect/smbdirect_listen.c    |   49 +-
>  fs/smb/common/smbdirect/smbdirect_main.c      |   45 +
>  fs/smb/common/smbdirect/smbdirect_mr.c        |   18 +
>  fs/smb/common/smbdirect/smbdirect_proto.c     | 1549 +++++++++++++++++
>  fs/smb/common/smbdirect/smbdirect_public.h    |    3 +
>  fs/smb/common/smbdirect/smbdirect_rw.c        |   29 +-
>  fs/smb/common/smbdirect/smbdirect_socket.c    |  180 +-
>  fs/smb/common/smbdirect/smbdirect_socket.h    |   26 +-
>  fs/smb/server/transport_rdma.c                |  119 +-
>  include/linux/socket.h                        |    2 +
>  include/uapi/linux/in.h                       |    2 +
>  28 files changed, 2320 insertions(+), 373 deletions(-)
>  create mode 100644 fs/smb/common/smbdirect/smbdirect_proto.c
>
> --
> 2.43.0
>


--=20
Thanks,

Steve
