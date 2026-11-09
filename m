Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241745;
	b=mXOe8+40lYJckDeq5+jMqAtvmieRb2U9d0LRIRaicYxwL42kMLQTge6YJjhtm290E2R4
	 2MNBOkCi02h279DCwWL4gTz1TJ4ZrqraWz6zGJrBlNZVLDI3c/ls8YJzBkNelmER3KPlW
	 kzgnYuCvoItfCrliVwKCPt8KJtqbt/aBlAYzJJwyYEK9tA3BrnMWpWZ8/HpuORZ94lFkm
	 5I+dDFu2jX2LoHuqZmBbB75t1aE4gyKsQMTTZJVuKMEc/3KR6O6OmwJKcMdi6sbZMh1lR
	 lXTuvYyLeRfTx9petrBvmGJbE4omc+/ET21oYC+ThkRg9QB3MDtwf7py4iH78ZW7ynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/O0FGH5CqQtLOMdXA3tsJ0Y4Pi9rOFAIORHYN0Xkwds=;
	b=2covANiVQUrNCyAFrK5p1WLfSPwqYZURUcHpYjGuzV+3/i08v6K8XUh6dQLr8pjkVGPl
	 O+th+vIx+FWTQXXHc0XVWDXvtzhLxOt2s9f5+Z14ymAjOjRSnsVc+VQ61LgHvZHbqppEl
	 +I69317mufrpF7TjBKd45bvtps66N6amYSSMzzoyiW8pLQ0/bnLvdfbPQpx/pkvThy3S4
	 9zFyuPJrQJYNLAH5T1OrLUP1dB7G0+1bOwFuZKFArRhO3MF/THwyDDuAB+XxkBbH9IYeK
	 uEb3hYFZbCJg2kPJgP1CPaFx+zj+lfttbhzVSVNoV8ve5d5n/xQGDGmH0RpvweKG8lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObLvm93E;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71875606A330
	for <quic@lists.linux.dev>; Mon,  9 Nov 2026 16:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71875606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObLvm93E
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ebdf1c2d1so11716036d6.0
        for <quic@lists.linux.dev>; Mon, 09 Nov 2026 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794241744; x=1794846544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/O0FGH5CqQtLOMdXA3tsJ0Y4Pi9rOFAIORHYN0Xkwds=;
        b=ObLvm93EMFc/iizLLrvMiAGyBfOwFT79X70QTqXs6sUGfLBN9xVdDuNiBFLCcJxOO1
         TUbWU8r4ml5LxRTu3hb/AcqHbDyZAhh4ARo54bZHKm1lg6O1tTTApXpQCwYHelvUM3lS
         SjNkVHOZpGt7rb3t8SpUwUnjAbWD59sdw3soJa+zrQX4zj2oXNCH+Hzl8biY0xKJroLo
         V8cfeL9wR+iH4YwJ5PHOTpD9NntmW3zZ4g/940JvzHb4SdPEIgxjFBbFQQUMKmgw4Cj0
         NYopL2ayK6rKDu/cknXGzZGMxOkxsae4JgAY/DE9z4F44eIHukC0CuNvANGAcqIzeH/o
         OZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241744; x=1794846544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/O0FGH5CqQtLOMdXA3tsJ0Y4Pi9rOFAIORHYN0Xkwds=;
        b=HkzozMbvbM2BeadRlIiDi4htm/4twyeXB3BompObPQeyl3SgZcByzM36fXBK1wVGjz
         hP6DRQZGSaldy7th90KFr/0a7JDLjNoyxhubgL5XeJPXUOUw3kbONpYxr62z6zQfAUgq
         im6skTSA+uFz2wNuPiAYt722O73CKtJONw+XAe4fTOrIqx46wESx1QDdbITDgx7OaDi4
         jv6gShuK7P+PvuDAbeqOcqj8IK6X9CfQAqsptsqY3ElNx0Rc24PM6EWrQIhjvA+tw5fM
         ejknknjdTmgr9FfnomtlB4YNUmLZ7uKx87UNDh0km7o7XnhuhztiDp0qKluTLdWnPjIs
         3/dQ==
X-Forwarded-Encrypted: i=1; AL+hErEd+VXUkV8dowlhM83Nt5PlIPPnrEmc6RsL3rhAfRfF5v1J54Y9FF50/qMAgGSPo1sqGdXH@lists.linux.dev
X-Gm-Message-State: APuU4Z8w/9DP5u81JXVyW2q1chNoVYX11pbJ9hDyjGlu0bNYzMOrSKus
	HoLfsH052z2yIVLlGQx0y7vaiBdBpXbrDSJmvaujMYFTfMM2U6E7MioM
X-Gm-Gg: AYBFou1+LN2LYvhWarL2k3/7pdZtNvN7MDuSL2j7vj96FMQ2NgNE3tmSCIqAAin0buH
	KUh4I9Djl04JygKYmUX1WDFbs81H+ODgxhpWDh+ij/Wp1oimzVNxZJLpvMMRYIIX+rufAXAgR8u
	36q7t+3XFjmw+r8dPCRhKv6+WrbI1YqYPLVN40CPp+qZSZd4Bw3I8DYcKxErFQBiC8CUqENwuhh
	4XT6U+ZC46P0RZ6dDaKeeOaO3WLY5qdVT6No2bd+uQ6Jvv92SvkQxKys9bzds4eFhp0VM6rhlTv
	QjYAsPHzWVzdZTRPb3k/J/I8Fz3X85e4J2zBo8kq5/neuL35/jG2TIyW/fXOwwG00wNgPB9VfJb
	3bACP+NDVemX/x+YULSGZs+uJ380hKW/+IA5L2IfXvYyv+09x+IeU7R1sXydKs0Y5wUh6BnBtj1
	rRIb+0zbtxag78Od4z512QV2Ya41u7lhhVmOORtBGsVcqC6UVDxWa/Y6EVFB2asvNLWuxz/OupX
	eyNMaxEszTYZu89yNmTHKYYE6G2J6ZTih8fzF/bY3N9JgTWbu3bdCYg8tcBV65+b7U+TJf5KMSv
	VWVvrX92sDShd05F8ucLkcZLATrq5YEo5d9T5YBVvzhmU3/0sxfL6rG9syOXC1vtHaR8arW5AZO
	/gyFKJd4fno14j0Ic/cA2BabYXvet0LX3kpCF3fSRlTT+b4ccCi9aTyIx5irEN8v2aomgxDU=
X-Received: by 2002:a05:620a:684a:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-9478429fbabmr674455985a.65.1794241744286;
        Mon, 09 Nov 2026 08:29:04 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7915e2sm9102985a.23.2026.11.09.08.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:29:03 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	quic@lists.linux.dev
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	Thomas Dreibholz <dreibh@simula.no>,
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
Subject: [PATCH net-next v18 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Mon,  9 Nov 2026 11:27:22 -0500
Message-ID: <aa09dd7fd9057b0951b7ace985d3feb269a71d7d.1794241655.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794241654.git.lucien.xin@gmail.com>
References: <cover.1794241654.git.lucien.xin@gmail.com>
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
index b17fdb7d38a7..7677133953ec 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -401,6 +401,7 @@ struct ucred {
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

