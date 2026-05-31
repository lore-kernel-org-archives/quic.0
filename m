Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4E38C2A0
	for <quic@lists.linux.dev>; Sun, 31 May 2026 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233081; cv=none; b=avAU+dbRJNwoyfrWalA1Gh1PxapegpVvjFjoB74DegJCgg1sUj98Yj0a/HHjSwAATFrubGbrq/UWWEIqaU5IM4O9Av+xIZ2Cx12k3ckbWTErJCq19crBunsIQ7rI0V/sG1ay3s4lH7ztp1w/cEAyiPJ83Fat4A7S9SLaiv6whME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233081; c=relaxed/simple;
	bh=+r3tYa1O4nzHNXgUenOGoOEDKkt9r6oEsRxV2HklKR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxBUfnHTelAXqv1w6vifsyoC0PsT0N01jXORDocs0nqb7Ae0hYaxMql4VWKG6walHx0nTPQJgVxk99RUr0V9uK4Or9EFNhw/T1DSbzY/wQhwj0ncu476J7KIkGbIFXgihI0Ki+hPL1NZdK9z5ipHEvs6rWsoc3Em8Ehsc/3ghDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHRxvhLN; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHRxvhLN"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccdf8d4ac5so29497466d6.1
        for <quic@lists.linux.dev>; Sun, 31 May 2026 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780233079; x=1780837879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfoS9zHnWtS92mtRPUnEWGWkqfJ2EjLVIhUjEgbm2M4=;
        b=pHRxvhLNAGDF3dR0lixukLJuUwJDvbCwW5bn2+xWoqXiIQganCfDTO7tBorgShCuo7
         3E3AXWV/G+wMl6ykvcD43XVuv0Wkjf4Cm5AxseDmdmR/ytNb/g754Hlv1tlKQTHBdWFo
         Po/wm45AaIE8GHXmvVEyCkVZDT4sAc3Sf7FYtz3sY0Iekw8ZpOke5PYfxIsMAInG+Lmp
         71WXnU/75BMGoVU8Y4N7oLogcso1zCfV9jP2EGQbObF6Eu3g3GK6FAmtW+x+0TgYmcYg
         uvzrauGGWzqS1TMw8rOFJDhj3x1vKgZ5VLbPPY57xBZd1thrIRT7dzqUyz+2JtqVzJhf
         J3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780233079; x=1780837879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CfoS9zHnWtS92mtRPUnEWGWkqfJ2EjLVIhUjEgbm2M4=;
        b=YviYkBGp9DJlBS7A9qdB6Czl1Z5ncKwPkgVcI7TAcJtjXk5EHTFdvooUE2XTxeuM4z
         4J4LOGQAk8XWgne9Hxf8mC4Wpd+/dMPQer0+x2tsz4uPsG8RitjXRcm/D0aidH4fCnLa
         fvUfz+NHMRTIJTlk+WGP9bQhhZORsXRePhAvr4rAe/3ATFmxV41ycPuPOay1HYatjO09
         WvLgnv705NoeEmomVIib6rgrmZWanAUQY9o9oWK2dFd5jngPGEzq75NSB6xcXXlPdUop
         0uNeC6h1GCwDGO4N4JXJukUeD8+Q93l/0oEHsSPXyQv/OKKiUgSTkKmxaA3QljdrvFTd
         86+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/BZ7JcUPNJkJLs1XwjM/O6cz/bb3biWQBvKNg0wjtPoYNEoEMje6EFpFYASSk8EE1FL5pR@lists.linux.dev
X-Gm-Message-State: AOJu0YwhmxoxdmgRm/GvkzDun7jUnO36JsTBQP5XodMvZVR0fEn3l3ou
	rHEby5c2vTIeDlTJFQReRMDvLPUHhx2gOcC5GyWiXD0EEWdBpWaanwe7
X-Gm-Gg: Acq92OGWLeSFrm7nXNd9TMB9SV0MOQ4NowXIHt+dukhNiBZPGDXiVP5IwxVsvCbudZ1
	cjs/Ts+YKo8nPC4sI64ohxE+qXE2nwtH9ksjOiIsoS9xoGreWTq0S9a2kaYi+uBH+326rnFRjiA
	9RAFx51Nswt37hnPpdWJbu1gemGHTvs9idWAnLWTQxB0nPP/VECaWGMl71Vn8Yyqs7o0kdT0teH
	ztyZ8aRg3jjwZP2q8E3EW8RFxZ8BZbBEFKmCOC3J7e/mmGbH0xwph7iwMCIsZaoSyuQ2ZIr9fnZ
	zzd6BqowvlR5+E0yL0Czktr8CPTDNRWzxpNv3WOTQiNmTkrkCKGghomvCwDPoAJuLsxFKW4U86F
	ZESXpZoE0BaQnVX9Rm+8baC+psMHOURmCpxuQrkBWNxBFsX8vx9IkK0voUT7oK17E71fu4m16zf
	smcGjOTTwv1z7jeeRoqSYd92itkXDLqArxDYJqI76jffhMK2HQPXdQvF06leAhMicdIWDw/E97M
	tnDkwLX6tOkfsAyma1Tepm1YC/5TtOqO/9/QgIs3X7qpw5PPLZRfWeWn19Or5Kl40Gh3GEbCGXE
X-Received: by 2002:a05:6214:2a45:b0:8cc:e102:b491 with SMTP id 6a1803df08f44-8ccefd3d97fmr123451416d6.4.1780233078757;
        Sun, 31 May 2026 06:11:18 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea2163b0sm69609746d6.38.2026.05.31.06.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 06:11:16 -0700 (PDT)
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
Subject: [PATCH net-next v12 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Sun, 31 May 2026 09:08:37 -0400
Message-ID: <36cb9b831d8f83dd9a2ae38a8b8d81e502df388d.1780232930.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1780232930.git.lucien.xin@gmail.com>
References: <cover.1780232930.git.lucien.xin@gmail.com>
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

