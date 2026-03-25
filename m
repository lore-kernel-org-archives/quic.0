Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C042DF134
	for <quic@lists.linux.dev>; Wed, 25 Mar 2026 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410566; cv=none; b=bO9MA8ZoUApxIfjTbBPlSpBvalqI2Bf+XPAEhjgezXkqOGbCgPfyrDa4UU2rBTyjdcOWaX2JG74ovulY+NjBjT33yUNqfLmQGKVvg8WohxXInr8thuX3jnVEAumTTvLPr00CYMe/FYWly/AWDBWOZ6S4GQRQAZAa3tdFa/m+T1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410566; c=relaxed/simple;
	bh=+r3tYa1O4nzHNXgUenOGoOEDKkt9r6oEsRxV2HklKR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIIhQ/u7x2T9mjKflKWLQcH/kOikMMU8X48f0RDMxyO5wa9DLT8IaLABphNcvE50trPWjjyItwo+3JDJ+JdWN7Kw6z3R5FJ0eh2JDEQ7FrCqJOC2ZhOO/KaVsCkqQiVhzn3sI9LC4GhOg3D/R/MMUPzznNF5bSjh+YhSPo7E8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVtjhIxJ; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVtjhIxJ"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50b68a86ca5so27766001cf.3
        for <quic@lists.linux.dev>; Tue, 24 Mar 2026 20:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774410564; x=1775015364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfoS9zHnWtS92mtRPUnEWGWkqfJ2EjLVIhUjEgbm2M4=;
        b=fVtjhIxJubnRLgUZWKqP1lhIigpsKXcVkmbuBJyWnpmDd+jYYDBiJcpgReCI8M27ev
         i0hB4EIdZqM74R+GkZXqk5VP60312z73HgBQcffLO38ctcFExybGjoTiAgTX9FkcDBnl
         13JocrpeF0LHD0aVvZ7FB99UjIWhavM2zOu0HHUihsTKUTDt1uzqQ44gMUPFi2JF+/J/
         ivZDdf1VMsyOjq00XGf3v9W8ij614/hyv5v8DWB/2hPnbvN7CcJLxyrUV/3ScCCcY00l
         q7HMunPo8WTGyyXpo2214yNtZJ0POE90pnOXgmM/jrNVwoQ8L5sh6tBRTOWe8GlG2E50
         zODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410564; x=1775015364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CfoS9zHnWtS92mtRPUnEWGWkqfJ2EjLVIhUjEgbm2M4=;
        b=jq2XRTxudHfgmxYmfJOoESMfFbT+b2A4Uu6AG6Kp1UJlUJ75unwKGFBv7LEnPszfaP
         bEzG5h8zTjQqgd+1Whc7ai81CFzEo7k2cIHQoAiraoYUYtTQiDJ6rUztUOUMfwFAkvjB
         /M5RfhI8BlXjNkZxx7reMpMj43MMxfKYpODj6mpkBHd1qtQXmE7nOg3/hmhFvXuuhjLi
         bpo20ucb9AMQtup3E8SirLhrOJNb0F32wuAIA0UFpM9ex1aonmJp7OIwarvuQhjqRylA
         IToGzkS5bXKBdHxv60JQ+CD1NU00mYHV7bIpur/ylYi8odhnUD96hoFrzVef4zeGpAY2
         QXrg==
X-Forwarded-Encrypted: i=1; AJvYcCVw2xyYr+CUrxMTQCDmpROGV9PztJXbFRDAzhkCAXXMNbvPRHGiNaxMC3M71UsHQgd8trWU@lists.linux.dev
X-Gm-Message-State: AOJu0YxJecBchplV50V3lIRvz/l/U0fnQ9xfrjVBxqkuArksu5AxC40P
	fPVboIaZlR3xO8UqvU0goeqFgA7lZnGWgId+oYBkLHZ3KOsy6SEnTpXK
X-Gm-Gg: ATEYQzxEgK5xfykZ75Q7WYeQ6fz0KkcGhOQUZQgvQBzAZABGrNeIl6Duy18J2AuswiX
	1uKRAl9ZIlBYhoEJCv38LASsLcwVXc79Gh8R+klcQdvIDJFGcBoASusnEU+hMK1H2yZ2YAmCnHq
	e5C0Hjtnf0x9mliyoWR/9y8Tv1FYZTXWbn5TmbZeVABcBfumJv+QJbCqXFITa/SXDVewXrPTUoW
	C56S5VWdDox+NvUcD1+deqrfsksjECaqzTP+S1RqiG4nSB9IYs43rjs1CmSynMbHL9PvGJ35l/K
	T8GLSIuLZnpfhVyOKBf9dgPIoyyMBWncBiBgEY1VJe7xqIv0qXit7ZTPVSwJQg3OfG0apYJgrix
	cMQ04Pfj6+2b3uS+P0z0y+kVeaWkqnzuHP/ajkg2pYilorTXKHx1AxUn+2VdrJWNrm3KHxW1BjC
	bmsdwQv6+zjRx1ayk8UZcIrB/r1LVzLDCEG4gcCAaKC6RSpIpbn1xNJwqKdMNvNpk0NO2+JQA/n
	QxHi2Gaz33xw96cquSTd+hBuRdOrGEz2EUOSTUKpVOei1qtnDuQTNXZ211CirHkyg==
X-Received: by 2002:a05:622a:5c95:b0:50b:483d:3669 with SMTP id d75a77b69052e-50b80e82d15mr29039691cf.62.1774410563747;
        Tue, 24 Mar 2026 20:49:23 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36cb2e29sm150093001cf.1.2026.03.24.20.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:49:23 -0700 (PDT)
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
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
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
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Subject: [PATCH net-next v11 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Tue, 24 Mar 2026 23:47:06 -0400
Message-ID: <e5cb44e7a6ba57b63a3b13f853947ac88ec97335.1774410440.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1774410440.git.lucien.xin@gmail.com>
References: <cover.1774410440.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
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
v11:
  - Set maximum line length to 80 characters.
---
 include/linux/socket.h  | 1 +
 include/uapi/linux/in.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index ec4a0a025793..9b6c3cd766ca 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -401,6 +401,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
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
-- 
2.47.1

