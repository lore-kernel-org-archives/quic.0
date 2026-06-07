Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0623395E
	for <quic@lists.linux.dev>; Sun,  7 Jun 2026 18:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780855427; cv=none; b=moRuX5w7DB1awTPbW3uYmj8LW3ob0HhsmsQLYrPCTjqhc5T6hMuq+8+kbIwXeq/Hle4PKXjKweciwf9O5xAeDS7tT4racJ7fg3kT5vLMYxnY9GyVVxg5z87DTZntdUz1qmRDTg/4CG8NxeMrD5yAFCDVrwd1jrQZ6WIgM3AUNfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780855427; c=relaxed/simple;
	bh=Oq9uMBA7F1231B6O729WkmXV78Ehl8cbE8bTwDhokAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d88qAVkPQHxxlRS3XcQfMCh/enYYQ09nWm4rnUE7Ik9hsc5thvDiyIFMm2XQ71tPAGlvSVv++RJ3OwEkKHgvkVQZfUbIZDH2ZupORTm2XVYc31/sCd0NR8JopMcDYfAxj6tKd4TTiVr+iJYdsQ4zlpMv2dZp8BfUH2vSYwkU5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCPqrdMz; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCPqrdMz"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-91587626a3eso435361185a.2
        for <quic@lists.linux.dev>; Sun, 07 Jun 2026 11:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780855425; x=1781460225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36vd5FRxf1iF0JtG6WtjCmp2BwAM71UYEOie/h60d3k=;
        b=KCPqrdMzpz9QEVgvpCam40Ispo4wonklVT+kLhk9p/F/5IDXSXbp12f+LeLcSe8aig
         UAo1eTAN78h2HoCQs0BacEE8QnE00q5TQmIUNdMPjwknVLVqzymHT1pQavIIerynsVFB
         ZUrO6bX/kP8LxJGumCDm6ZCfbz5Nwv5RGUsrm/2FCAbwnKEP48b+KVtJbtDPz0fq8nNY
         gSrAXGch28IhvLpAN0wwpHDI+36j+ir3+jVuwDubNWpf7FIm9+L89aLM8ydDjhrXWX33
         FzLa/EHZoemNjM2y35t8WugtbujLIOzSxzTRzO0T47IqQ7SqXs3xVVtzeUsHCFlkOFMV
         H9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780855425; x=1781460225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=36vd5FRxf1iF0JtG6WtjCmp2BwAM71UYEOie/h60d3k=;
        b=pv0OKou4hgUNpMXXy6DhUu7aZZrFKx1JKyEiux1UTi+efdXwBaJON0zFUTEjP4qjqp
         nG/42/bZ3xzxsl2rgFf4/2r8J/jRn7EiKCYNNi+T1+VKFmCLkRxkqp6h3Ca/ai5JhQ6T
         WfgloQ43FxIWrpLXbVd39/3aXY3G2yz5nDpvfazVNztwNxmIJaZG8i0n0fpZR49SFygo
         G4fjXK2Hj24DyeJNvaxbs4VSefRHW9CcZQRj64nwydFiZR6RgTkXFOrHbsvQ/ug94Dop
         42JjYHXD5vlwB3wG9Hi1X9LLXp6op9LaeR2CrsqsTnAgtJ2xe1LBmdDD9XSvG1kR/ESm
         scjw==
X-Forwarded-Encrypted: i=1; AFNElJ9Xq9UwrVlc2Q5CpCSvSDChGDjP8t25mSLj3EiYxUmtgavaSanNjlUsWPk9pgZdTr/uKtnK@lists.linux.dev
X-Gm-Message-State: AOJu0YyMOyaRNrJ1RzUdbgvMASHp4BEWIkXe2VdOodyUMGoI+dFauVOH
	/yjeoqLXo5lHWBSl0JC41OgrL6rniVEG6Mzc2YAatbMpBa9Y2XSg7bsT
X-Gm-Gg: Acq92OHzoi1QFIxPbZoAKTkuMeyL5+xLYYOQvpfDyZVsR+M0ZZVHKwtq24iToSsF2yO
	LeAdw4lxMKXMmQ8JuELOp/LFer5epb1W/P4PVbD5f24cwaGPa7i0W1sEy04dQtOk7w0GbHzpiNT
	ajPv2S8qvEu7YxocPTysxQH6rPKs0WIldFXgIukvfpTgxQV3qtqzskKHze5ZIt5EUMaFoSTEx26
	Crd4RXSYZjCbvENWvtCucL+zSjRn5H1Ti9ezcQOGv4niKAWc8ilZS3neDxOJyW9nQiqXGgHnBym
	bgqe2LUSs2riicgzDJ+tIB/AfgmsInOWh8b9HxT5z/ntNpCMat2kmbzpv3K4eDaf19zhi5qk5js
	SQCSKR7Q15D4TrFaeZdlzhnZvOxNZdLF/B91ro5CvVgZwx9ep9rC8BIjoEdiaNyDm88DVz87gGA
	QCiwzz9Ih+TxhP2oqfNUEPE8zh+3Upnk94ld8HWmWDMHjsFLicMYsoEwtNOi9DQiRg3CfIfvh89
	c+5xAw1szLcL3vIlYHeKKT8VkU/PqAAprVvbeSgnE/y8fbvRwuEKoilQGil5p6Smm/vqIOc1aWr
X-Received: by 2002:a05:620a:2910:b0:915:8594:68dc with SMTP id af79cd13be357-915a9e05dbbmr1997918785a.55.1780855425365;
        Sun, 07 Jun 2026 11:03:45 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a2359ecsm1489771785a.14.2026.06.07.11.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:03:44 -0700 (PDT)
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
	mef@scarletmail.rutgers.edu,
	paul@jakma.org
Subject: [PATCH net-next v13 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Sun,  7 Jun 2026 14:01:23 -0400
Message-ID: <686819eebb82be0eed7beea4f468284288c37536.1780855296.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1780855296.git.lucien.xin@gmail.com>
References: <cover.1780855296.git.lucien.xin@gmail.com>
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
index 1a4d0d128a13..77bcab269b3c 100644
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

