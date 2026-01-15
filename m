Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9C3AE6E4
	for <quic@lists.linux.dev>; Thu, 15 Jan 2026 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490096; cv=none; b=U8VKuu+Mc/SnAmOiHvg6czCf1NqBPmcTGxlz56uPQSqbp5ZCrILuTYBFnc1T9qa+IDY15CLOm50FCBVNsJLdMpuTnLGqIl6ZdMB1BxslZ1LLHtmi8FOUJvvjy5RBLGWvLaz5eTqpEalb38hUQZoMwPKoHXWgjD8ouo0seTWy3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490096; c=relaxed/simple;
	bh=EmdrmrQatIkWYrWc3Tso6zV2W4IPfCbeSJjTG87cs5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9x4BF3z6W9FkN3V+ChVpVQ2EHfn92H5lN+ixyBfhbzEMYkxLuTjDWHvMzOq63y+mXMX9TroaknJAzptQtCE2hRxp8G0gn4KswCoeWu2It+RqMuKdfYL7B8de78HfgtGfiRWHsIEd+a/GnP4ss/tYxBBf/lWiq53qA+do2ZLg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYp2+lWq; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYp2+lWq"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88a379ca088so7340126d6.0
        for <quic@lists.linux.dev>; Thu, 15 Jan 2026 07:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768490082; x=1769094882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=aYp2+lWqwWBQ5pww5+6BiKJ9U1KviEfwSeXfBcTctYG4MGrnrJJG/RkbtSXjf1iSDk
         nix2eL8vr9xPd2N5cK9I/zTDbQdYkdJeWJOzRgDb1LpcLZhgyjqGFiVUh5wGZf9D5ni3
         0+Ocmrn9BJXlnMub4MtvmzxxnMK37dAHZ1E8HcstsTxEf4TiGwmKBD78+4/FFdszsyEz
         nE21WXg716j8tmKnJ9pOOGJBsxoFqX0/BWEQ3GhdtNWZlrnxidPtSIJ4rZyKhwvwUqZ4
         FmglbQy7AiNSbSkUduIdVTTr3OZy9/34guER+kLPiqWg3DwEFPWK2GlJnDi+xP3UtO3Z
         twkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768490082; x=1769094882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XFWhnozczQdBY9wOF6c5V46t5MOgQ+lGzwQjjTNU9A=;
        b=Z0qX1FVvta4afJCQlkiJtzpzUSoZtBqZF5OtWtsuiD98pSaKA6m5UsbAWdgWRdCQVj
         8YfWD+8V+A4NgrJOoJaaisGSC6AIWxySjGBoJunx4Vfgv/0bwIxu5oBkjw185APEr2+b
         U+wjs8s/ABaxzCVoniBFoFXM1rO0sB41nXdHdgCFFgZXTaPFUQe6b9XWkSYJcWfblSCO
         CPfZOJI4c8DvHzkwSMU+R/vlvQfrUFbFud9/fp4P7UupeYj9dz9A7vLJ1A/L6LjjdHev
         Q0FDAa2581I9NLTVLTVqaEtaCMtV6ymmz9vx3clsWMdFRJ903aR8UhnHquZ6XlYYRiJa
         WcHw==
X-Forwarded-Encrypted: i=1; AJvYcCWiztEW9zSXS+MpxUC7HqcqYBXOM5h1/mVlvaiGMJO74e0558TqcrAg9nOcZGe6NrTUdcfS@lists.linux.dev
X-Gm-Message-State: AOJu0YzYGADbOnux/1YF2z+8/9Qg0eoxpDEkfNLmt/UlLoMiTFKKB7s2
	D8KwwudPAZrNM1JvMaeWdrz/2SF7PJ0iwEO8XmcHskZ1oMRlWrJm34gp
X-Gm-Gg: AY/fxX6kfxqBG95zro6wbGv7JTNiuWsASn75W6hzIzHMeAiCdAL49/Vn5FOX8NDoq/I
	LTW+XVqi3S3Zy/+MJVmJ7kEHXM8EWI11OAPp8va63CE8Nydrnh6HifkaEblLPAS6hp4JTCzVxbG
	e/UxPjVN3sDJVeUMfBvEtndRJ702Q6nC2MgnXCoAkdN9/AX6gW65Me1lmDscwipLFAO8C5o19Co
	1kzyLyznxEvk4EsQNzjzqqbpXjt5j+E2g1Fi8LWdr2ErjtAmUHV1LRiMW6Y2OtUQb8k+7e+J4sM
	zwNBG6P4ylb+qEjf+5RtTW2SVfJPgshf5aAHZntp0euCylN4VnYNcpbwgkREqeOdZQrP6YeLizq
	seFiGi0NbbpmRZI694qvg/JIVjf3MHVdfarfQKm/ia8gqSjki5xyaj2kY5VswogUpwbqnnwcFpD
	kU2HAD5Lfo8gRgQeyLMdSmutykSJ3EMg0YIv0smzM07UReTK8jhGU=
X-Received: by 2002:a05:6214:4003:b0:890:58b4:3e7c with SMTP id 6a1803df08f44-892743ded60mr90739606d6.33.1768490081454;
        Thu, 15 Jan 2026 07:14:41 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc6edsm201030056d6.4.2026.01.15.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 07:14:40 -0800 (PST)
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
Subject: [PATCH net-next v7 01/16] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Thu, 15 Jan 2026 10:11:01 -0500
Message-ID: <87ccdbc3b8abe4fb1df5a97c0baf39d2b943eeef.1768489876.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1768489876.git.lucien.xin@gmail.com>
References: <cover.1768489876.git.lucien.xin@gmail.com>
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
index ec715ad4bf25..dc80de8d8c50 100644
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

