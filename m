Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956FF312827
	for <quic@lists.linux.dev>; Mon, 24 Nov 2025 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994617; cv=none; b=ALCsfbm8MOymU6SW00b5WBxzWKbD2M4thaA4a3SFsL6sVmwWGwMjUcg7Y0bGiPPW22EV96onoYo6AHridq7WxhTNZcjXwZhseDVwIwaB1Ul/Nir0SbikgGIcX7PTkXr+h/eI2l171bMS8KxtxvcyNf/LSGlpgcjy3x42hKG19OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994617; c=relaxed/simple;
	bh=zEN3doId9UKmo1rLmAoDue2BHiaeEn8l3OYvCK/ydP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXYA+O9emC0z2QiKHsPyuFwmZTWnFK3EUMTWva3qnK4N+OP8OrPIRxmCJ3fFKVc8YI6hrJPQ59v8WczH2rx4P0lWQzPeVZqAkXWQ1vUaaC9o8dAQ+JIeZ+h7OkbQJ6ksjeI3owhhR31dhb6Z/9vPw3dSy3WYjiiq3vCqWKBQkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETkFJidP; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETkFJidP"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2aa1ae006so560069185a.2
        for <quic@lists.linux.dev>; Mon, 24 Nov 2025 06:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763994614; x=1764599414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+6m+RaUAFXaTtrp8udufW/i4uBYkmLcVK6S66Yx8m8=;
        b=ETkFJidPrZEmj5zwThnqHv5ETFa6n6X/XKuk0R9mgYRdU9jEObX83ugekiV1zlA3fQ
         8oiLl25/B9id4L1zqMJ0x2rRmgixoWZIJI5w7fjKHMFa0I2BSOEq5/3BLF7QGqgLMpD7
         PVodzw2tiF9nVJUiztVYRbZknBBiowE6VY3KV4Ayp6TGl+J8YFP4ttfKAf6RhgdTUfsc
         P1vsxYyu5yYMiKm/2+Wv/iVirtcETXNsrfb8t+bq9RPwJNhrnuA8wDIrj0Ysqyd+4KMm
         28YzI5l+2eQRWMPOCsap4b7wCrKTzypkIR21/nvUjxjwDMMmRNmWSGs5GOxuhJ2ynmyC
         Pv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994614; x=1764599414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+6m+RaUAFXaTtrp8udufW/i4uBYkmLcVK6S66Yx8m8=;
        b=b5OA1kKnrMvNlajqXmSv/+vkKuYbY8VKDntZ5PkPTyk0rJ03VhFXlzyrnRyWaNYTa/
         z4WwZoOI6q+FcM4nuV1a0qiJBuiDgbz07wRHgyhyqsFHCAKU3iyLcu4XFgBfyWJp4PrQ
         zlsS6WGnpACxIebX4n5dpwBMJ4TCYoxnibq7x3p9LiEzJh+93WLTg8PR/pYn3GrU0cvD
         xWiW5VWrbe/jffN0YOd9tdu1E61FTbtjMf7yLenz1NA5cR8Uw9lLU03VYDDiu69RThAn
         uzJfISqM2CopIM9BmDCZSJqC4dyKgxDOQdSfDL5629XidvKQJ4D2gceyz91n737+kKTh
         JQKg==
X-Forwarded-Encrypted: i=1; AJvYcCVRc96VkCa1G2/RGl2fLX6nZVEw7vnjEnifaF9eSTtyQfWJ+oWNC7f41OHKjthfFh0b3PAF@lists.linux.dev
X-Gm-Message-State: AOJu0YxA9ktQCmAF5qYpkZaGuH3v3aPYaoeUUPc0Ec5p65vxJWXrp7ax
	p87js1cauiJRO7lG7C/y9lTWDwFiGPw/xBUKZ/onynqN7nMu0C2tn9Tn
X-Gm-Gg: ASbGnctND78Poe8mQt+y3omlGiy+HK0X1qYULr3LC7bxFV4IyZfHR1rS1UPZ9MKprLs
	E19kU5lVLfNFQMerqddXDn+kvshAYjWBcVh/CpERPyyeDBLs5XqaWosn2rGI1B/R/+Jtm4RjQ3X
	OsdDNLOw8zQepPZ0HPYzwAiCg6P+XV2nqhfAanBwDo6ooeO3WEZOBSQgDN1kRWnT5UYNTz4LVeQ
	B+LWJ0SVMXq0vAnwoxr510snFP8Gx2DVx55k5I/rAsmrou/O+apN2AT0SCmOQq7uO/erZtW0DkQ
	pkK58tfCIIrIWyW7kaO9rtO0+aAwUBLeKa+edZHBy7ErP5NrlTfS1fOyGvUd7/s/SPymRYrOq0F
	n/0x3jp5Vtj98+Y55GIIqvndNUrRatuf1JtbbGXL1bWuw2JMu+9ezU07txtPw+Geh2Of6vYL129
	zfNAgjim3qQ4uvxExiouUeP2T4lidQsyX0IKt8NF3ym0SvWcU8KGCYbtTIy4pScA==
X-Google-Smtp-Source: AGHT+IH2emMikOVfexZu/RJS4gdkfoIvqPQqU/1PYqEsqJ/9N0M6heG6ovXLI4KANvL5O6yungTZiA==
X-Received: by 2002:a05:620a:319c:b0:8b0:f04c:9f0f with SMTP id af79cd13be357-8b33d498deamr1470724985a.63.1763994614234;
        Mon, 24 Nov 2025 06:30:14 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3294321fdsm929713485a.12.2025.11.24.06.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:30:13 -0800 (PST)
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next v5 01/16] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Mon, 24 Nov 2025 09:28:14 -0500
Message-ID: <0cb58f6fcf35ac988660e42704dae9960744a0a7.1763994509.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1763994509.git.lucien.xin@gmail.com>
References: <cover.1763994509.git.lucien.xin@gmail.com>
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
 include/linux/socket.h  | 1 +
 include/uapi/linux/in.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 944027f9765e..b4563ffe552b 100644
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
index ced0fc3c3aa5..34becd90d3a6 100644
--- a/include/uapi/linux/in.h
+++ b/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed and Secure Transport	*/
+#define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
 #define IPPROTO_MPTCP		IPPROTO_MPTCP
   IPPROTO_MAX
-- 
2.47.1

