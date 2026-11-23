Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393802;
	b=r8s/D+/jDKXH2FKrsdnE22R1gVFgfcl9ZOMzrhChvLAMkNVSTuKIY3oKdPaX+MDSnNgc
	 WQenazqw1Le4vY0+dD6QvCtydtX4jCmW4BK8RtGNEOMaJCJ4KZlvZjZ80d4zcNcsNy4qw
	 ZeFn6ANHL/ePAh5sGMWknIpeTa+dK8tmtujL2J5OSrXpYID+jsCHTkrTlKA2aVW0oKt6T
	 pOhKlFqZdHBOj5/8AGMyaw/15fEkC4LNeisa4t4WiEPj0yCUbyOwCcTX/Njg+gi0VK2fK
	 pTh3F4CuiH+iTcvN4wsvvfflm0v8lwRUqakEXOEkSutVFM8zYCy14Vf4bqe9xiezy5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
	b=SLLdrDiin2B8KBcX3IiGzw/xUWzbaQDFC6P9lLKaS8lUepVOiD8hamsJ5WHI7tXlMTYo
	 w2vtvpoW/4PCNBNWAEB32RIc5IQyRDtYfbO5Xgu8amfslNtvaA2uBfFRgN3hz93l2QJjZ
	 bazxDgMK+ljXoGpmPKpgKHkhQuUQUVVbn+uRhQwCsAZHAYc3oCmijtfnp9jHBYUBUNigx
	 DEdzi3DsjMiwoGCSF5LFWR2wZUbJUMTcvFJEy1hP+DDGjZLtWGKsbWwNDaNe0Q9/UjvZz
	 OrVODqi5aKR62Dwu7TaL+w+ghv2ZNRL1r0P8xCXW5Gu9q/Sv+2prlAeYcTNBlUSLp8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8b2j6Ie;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB54606A338
	for <quic@lists.linux.dev>; Mon, 23 Nov 2026 00:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB54606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8b2j6Ie
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-949657a20d7so303479885a.1
        for <quic@lists.linux.dev>; Sun, 22 Nov 2026 16:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795393801; x=1795998601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
        b=Y8b2j6Ie8giKwnPNQ6MNzmWtECkWISwQEZ9XSVs8tphck7l/2phk+YLd5NMEd5G3np
         QhJ0bBoTIbNxysipCwvtMV4s5g42Q773mg9Ttv276fJ+cqsNZTbEITp3DdYpA/ElyBsI
         Mty4mga/YQMs9La7iKVJYYiHm3a3A6i0yifFjB4uNuVl5ZI0NdvMwpszOi3AktA8298z
         zRHwU/W+b/6UVODQO7Lh+FH2rGJYN719sXH9n0P9v4LRI/qFZMxJXglK9cLtPg7AfT3R
         2wEANxPdLvWJ9AS4kpJ2/ie2MlqKu9wMUzm2v1wU3Xvl81VMVrMNu4EJLb8czcOqchCz
         ePIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795393801; x=1795998601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
        b=Thy+vTRBAGoRzGDT/WD4eqhe91AtI5380C1dXKg4m69Fxpxl0XAU8QiDZKZviyeCIN
         jMvr4thxdu5Fe/ieMlyg1+t7qZhU+aGSfqtciqRqiB+EgSJQvkfFU+watgkNCCFo2IPO
         BMHOgOyXCAMdhpxB7nRUMSoBzpeLmjKs7qtRomoSsUSG5Gtf2NW5P8k8axGb4yrlBZXR
         nYkGsFtW7rFimU8a2Rig4K6RNANsjEcCKgXXINlbhhmEvNETzhfbLjuSw9RUnUMJPQsu
         P9FnYmFmsHBngvC3538tUv8j6CzNEnnMGn07Ine9wiAmRXTEUuusqfoQOwXzb9IGgQ0e
         vdsQ==
X-Forwarded-Encrypted: i=1; AL+hErHTS+ya3SG273FyLr+OWyHx4fVHW8MX0vaxFgwzOziDsOmzIdneqYhUUFQ9QMTgZMMC0Mg9@lists.linux.dev
X-Gm-Message-State: APuU4Z8FB8JP2LDrcJqh9egF1XWFMTPl2B4kv0yqUExjpf1xftjGDIKA
	55a5uwxSyMLJYKEKy46RKKD3tq7sC6N5F2fY4ngZOlyNamvX0imPq8fz
X-Gm-Gg: AZFdTZdpJsCPiHbJJCXXcQhGH6zZjfxDBQ89wyEV3G9QjIJxZaWhFM4dVX5dvZyR8PN
	2GoY6KJRF/04WhniKZxcS3l5xnwnvrMXb/JW1CQmJL9uHxf5vWRRIv0YHiUbd9u5Apzlz2ut6Lx
	Rm0RPYDXlbych4JC+BIpvnn1EK8PNhHPOoEktFvjwtfeHp4cUYUkaFMWFzRr7ZTxWsNs+H8Xlj9
	3CskHTaujx3Q9Pe43noXdR/qK37ByrnGS18bbArQG1oliwVlPsmUNSbfYkY6+B11h4vU0W015bq
	XcRdEdLKHARkWjcE1cUwYIUkBUIkBUhTwv+0mIQYQtspfOP3tYVRgLz+SwrnJOKNLp3JDCI4ZZL
	Re4ZZV2mGfzJnNwhwgvtzExvwrEKSzObIJb4PFjit7lwZPZHTrtbKVl25DLPbo1vWIJlbnWVI0+
	Ivow0AsRFUaDnhQX0DaiVCGq5cBo8UdygChK47uTbFI0yzvHKl7Aa6yXK6qzHoO4uiDyVywlDbt
	hGvi/eVToEvBG/jNa6o4a77PAvJyG90VIhMQ/vG85Ll8JdbXUKu87gf8d8GNj2Krm7MLOnO6vZS
	LKUCDW0pcJ5obl8YNf2BA0NyYRFHEkXiuEQFHnXht/XYREV2bL2qbWu5OiZA/os7lJAQNP5tRL2
	1eEa4wrp4G3MPBfORCWjZ62+Po7EOgi0wuvxl9U2jNaCH+Ids4geovPpBX0tVvsUmY3am+Vc=
X-Received: by 2002:ac8:59c3:0:b0:55d:3201:308f with SMTP id d75a77b69052e-55d768a4864mr185506171cf.9.1795393801238;
        Sun, 22 Nov 2026 16:30:01 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0f6bsm91433716d6.21.2026.11.22.16.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:30:00 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	quic@lists.linux.dev
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	Thomas Dreibholz <dreibh@simula.no>,
	Jamie Bainbridge <jamie.bainbridge@gmail.com>,
	linux-cifs@vger.kernel.org,
	Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	David Howells <dhowells@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	John Ericson <mail@johnericson.me>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	mef@scarletmail.rutgers.edu,
	paul@jakma.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net-next v19 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Sun, 22 Nov 2026 19:27:57 -0500
Message-ID: <ba1d4f03926411d4e61a7587e41a12b0b423d841.1795393691.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1795393690.git.lucien.xin@gmail.com>
References: <cover.1795393690.git.lucien.xin@gmail.com>
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Post: <mailto:quic@lists.linux.dev>
List-Help: <mailto:quic+help@lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
List-Owner: <mailto:quic+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds IPPROTO_QUIC and SOL_QUIC constants to the networking
subsystem. These definitions are essential for applications to set
socket options and protocol identifiers related to the QUIC protocol.

QUIC does not possess a protocol number allocated from IANA, and like
IPPROTO_MPTCP, IPPROTO_QUIC is merely a value used when opening a QUIC
socket with:

  socket(AF_INET, SOCK_STREAM, IPPROTO_QUIC);

Note we did not opt for UDP ULP for QUIC implementation due to several
considerations:

- QUIC's connection Migration requires at least 2 UDP sockets for one
  QUIC connection at the same time, not to mention the multipath
  feature in one of its draft RFCs.

- In-Kernel QUIC, as a Transport Protocol, wants to provide users with
  the TCP or SCTP like Socket APIs, like connect()/listen()/accept()...
  Note that a single UDP socket might even be used for multiple QUIC
  connections.

The use of IPPROTO_QUIC type sockets over UDP tunnel will effectively
address these challenges and provides a more flexible and scalable
solution.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Acked-by: Paolo Abeni <pabeni@redhat.com>
---
Sashiko, do not report any of the following concerns:
  - Ignore the concern about prematurely exposing the UAPI protocol
    numbers.  Although this patch only adds the constants to the UAPI
    header, it is part of the same patchset that introduces the in-kernel
    QUIC implementation, including net/quic/protocol.c. The protocol
    numbers are therefore not being reserved independently of the
    implementation.

  - Ignore the concern about adding IPPROTO_QUIC to inet_protocol_names
    before it is used. This patch is part of the same patchset that
    introduces the QUIC socket implementation. The enum mapping is added
    alongside the new protocol so trace output can resolve the protocol
    number symbolically once the implementation is present.

  - Ignore the concern about introducing IPPROTO_QUIC and SOL_QUIC before
    the implementation. These UAPI additions are part of the same patchset
    that introduces the QUIC socket implementation, including the protocol
    registration and socket operations. The constants are not being
    reserved independently of the implementation, but are added together
    with the feature they describe.

  - Ignore the concern about the gap between IPPROTO_SMC and IPPROTO_QUIC.
    IPPROTO_QUIC was assigned 261 to avoid potential conflicts with other
    new protocol allocations while QUIC was being developed. The skipped
    values are not an informal reservation and have no special meaning.

  - Ignore the SELinux protocol truncation concern for QUIC. Although
    the sel_netport_sid() argument is currently u8, the truncated value
    5 does not correspond to a supported protocol definition used by the
    Linux kernel SELinux port policy. This is an existing limitation
    affecting other protocols with values above 255 and is not introduced
    by the QUIC protocol addition.

v11:
  - Set maximum line length to 80 characters.
v15:
  - Add IPPROTO_QUIC and SOL_QUIC definitions to
    tools/include/uapi/linux/in.h and
    tools/perf/trace/beauty/include/linux/socket.h.
  - Add IPPROTO_QUIC to inet_protocol_names in include/trace/events/sock.h.
---
 include/linux/socket.h                         | 1 +
 include/trace/events/sock.h                    | 3 ++-
 include/uapi/linux/in.h                        | 2 ++
 tools/include/uapi/linux/in.h                  | 2 ++
 tools/perf/trace/beauty/include/linux/socket.h | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 37ddcdfc0377..b8569b5bc060 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -402,6 +402,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
diff --git a/include/trace/events/sock.h b/include/trace/events/sock.h
index b5310439536e..ed43fe6d2705 100644
--- a/include/trace/events/sock.h
+++ b/include/trace/events/sock.h
@@ -20,7 +20,8 @@
 #define inet_protocol_names		\
 		EM(IPPROTO_TCP)			\
 		EM(IPPROTO_SCTP)		\
-		EMe(IPPROTO_MPTCP)
+		EM(IPPROTO_MPTCP)		\
+		EMe(IPPROTO_QUIC)
 
 #define tcp_state_names			\
 		EM(TCP_ESTABLISHED)		\
diff --git a/include/uapi/linux/in.h b/include/uapi/linux/in.h
index ced0fc3c3aa5..e4072152f2e6 100644
--- a/include/uapi/linux/in.h
+++ b/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed Secure Transport */
+#define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
 #define IPPROTO_MPTCP		IPPROTO_MPTCP
   IPPROTO_MAX
diff --git a/tools/include/uapi/linux/in.h b/tools/include/uapi/linux/in.h
index ced0fc3c3aa5..e4072152f2e6 100644
--- a/tools/include/uapi/linux/in.h
+++ b/tools/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed Secure Transport */
+#define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
 #define IPPROTO_MPTCP		IPPROTO_MPTCP
   IPPROTO_MAX
diff --git a/tools/perf/trace/beauty/include/linux/socket.h b/tools/perf/trace/beauty/include/linux/socket.h
index b17fdb7d38a7..7677133953ec 100644
--- a/tools/perf/trace/beauty/include/linux/socket.h
+++ b/tools/perf/trace/beauty/include/linux/socket.h
@@ -401,6 +401,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
-- 
2.47.1

