Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FA2C0261
	for <quic@lists.linux.dev>; Wed, 29 Oct 2025 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748771; cv=none; b=pgDICwgeRXIcVv+E1EIg7itpiML2doX1hsxuTlsihofsyqE2XzzgGnkva2pliOBUWbxDwbN3xUNGQ9TL3kIv6OaSj5kfb9IB6QSA8aoocBNDFkAUQ5r4o7WPG52w8vG4ZN3t2SxMqnnh1V007nWq++AuF4yDgQty+poiupjEs0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748771; c=relaxed/simple;
	bh=AXo1SVGHBK9qT4qVLa9ToApVKadhJSI2IuUi88Evw0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5mS+RIK/caL7Ba5nqjt+TFx1G85BNogzSxTN0P6gJi5in5M2/KU3xuP94oQoEXTgI0eAr5wR8NNLBnc8pAOp/BEG7ZXsEW+O66oiRJQGESXMW7fWUCkZ+ndWiFz68L5vInoR1tdGQ8a6k6iF/X/qUQ+iboK5XSZ4VLkzZO3Ov0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J64rqYPV; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J64rqYPV"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-78e4056623fso71642286d6.2
        for <quic@lists.linux.dev>; Wed, 29 Oct 2025 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761748768; x=1762353568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=J64rqYPV76bLN5XKA5k9AazxNjn4+54eUWXCvvrIKqz69XAGyyB8W4JT/WtqLOe1Hb
         9w59SZe8NjoMHcmA/DiZm7fNPdwV6mXUjwIFAg/Nxuz+wl2GbNKZe2vuxSwNahWOVTIh
         cVGWQPJ0TVajlEi+KdOYCJeOkmFW0UaGgdwLHPa2sliwMa1c9jTIwdsqp8nlkLV1Jikj
         thjERxTz3VnpKHg7JPAvz3cLvDGKJovWovNd5ywgCBN3UxpigYAwgd2buY76krZ0J0Kk
         8pNTO/3LwKEx2k+UovMES+8IkTTGOrrwpf6wvf11js3c0ZbDh4Pz+yit2jzKUKCThu1/
         8ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748768; x=1762353568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JTNUO8XZtm3BiSnNgj+nAIXLdP3RxRAv6TMRPMgtSY=;
        b=hORpSkIaG0fUzuTmdWdzdC7mUr0/uolX5Yhpe3Xdhl1qCkIBlofdGx0yldo7jJuhKM
         e2JPp7JMCqAa5aS0E4/KNtvnpxFn4mYa28Io2zkLUVmlnHOJvde56yki398sSS+Gh5lh
         2PRkALpivBgI46HT5n3WnioFbEut/Drd9TVMI2chK7CP/4sAFe0puK3ud+nAX+9NBTXn
         PoApEgtEl1o8j8ULs6hticGCDnSMRCYgUqB9LcAWGx7CXqAG4ulwnWwxinX1PWXYzovA
         XYxI8v553dfZ+uGSav7y4H2uPQFP/lzMRaEqWAK7OXl/hMnz/ccPgICKCCfY0R05XEYD
         d9pA==
X-Forwarded-Encrypted: i=1; AJvYcCU8kUcWeKzhymmo/bPhLQa70+QHSFC5lRL9LPSmIDk0T/Gs8rb2ZqwY/yX89neqF/sf4KA1@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ4Hrl99HE7VyJwQQLjdIIyQn6+j5j+E5JfR6T5y0EhYnc0Fcw
	/bs9IxNBSVkDRiCt8WCp8uu7w5TFxfKpqbT2NXkXhraykul2Y+1hHnqs
X-Gm-Gg: ASbGncs1v2lQO8CdBbbhAnc1xG2gLkB1Z3hPvRybDN0OGzmrW8q1WFPr/1NTpUZKFJS
	QqyCGkCND79qJePlT/FOuhWWrVpJTDZWNiM+QSuM/uztPCR0BAEIlN0Fd/FOksQPvof+d9u407i
	+S50mQNGN04msZbWoAv+aZVJR1FWr5HWebXkCfwPxP0Kz428imbx8YDeoLRRiMh6A2yfNTwP2+9
	7H1GdOsHYJCuIAmvumgPGWigkayI5/gGred2ulRWKScIvdP46hG0yn3gEO1pf52e79CERzcDkhS
	rbmPdi78bBWRqOL9K9/l0rDk6JgICXnJ9Abwh19+TewRWpuS1eCBtiYHcL0jGPA//tpmWYI3sd5
	hKFJarCPWLLunl71+x+ypsEx0OeQs2+yJuwfAiBD71TDJ+Vo9lxerY6GkwnSQXiBLqQ4ROTFfVf
	FBs8gbrIDcJj+P4im0Vv6EjjN9jJY+uwCWqavVdHbm
X-Google-Smtp-Source: AGHT+IGyzU3okljrfBCf/3gBF/UjoS6yWE5KKQezp4IEEcQDSObh9/ucSBvOo47HR55wvw5r0njlKQ==
X-Received: by 2002:a05:6214:242a:b0:856:d1d4:d127 with SMTP id 6a1803df08f44-88009ad5454mr40989826d6.4.1761748767895;
        Wed, 29 Oct 2025 07:39:27 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48a8bc4sm99556176d6.7.2025.10.29.07.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:39:27 -0700 (PDT)
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
	Benjamin Coddington <bcodding@redhat.com>,
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
Subject: [PATCH net-next v4 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Wed, 29 Oct 2025 10:35:43 -0400
Message-ID: <c02ccb3edc527cbb1aa64145a679994dd149d0da.1761748557.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1761748557.git.lucien.xin@gmail.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
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
---
 include/linux/socket.h  | 1 +
 include/uapi/linux/in.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 3b262487ec06..a7c05b064583 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -386,6 +386,7 @@ struct ucred {
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

