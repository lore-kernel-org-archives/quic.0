Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77641DED5C
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762248030; cv=none; b=DNMe9sgL895Z7IxWcjmQi2tXkFjdBDZJT/EijFYcq6ljEUXsASxvCvBeNwg7ICQDMWVoVFxGV/8VWseEpORSip/nrussjAk5EcLjzV5ImaoT+zDW/EmiXYDIfTXg7KiCLqfvyt+c9jNEXjKIm25W8/d9jRCWdS6Ue1OAyOWG+Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762248030; c=relaxed/simple;
	bh=pUKJPrLx0M2WMbh/ePs7QzJ4DazqZizbc++rbelECWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJTTZe/EhTKFB9YgcoGE6ccDoytN03Bp50k22122gBhkzgtSgX7ODjyvdnzhTTqn/aOYmm10woFsMOympXKXDuopWuDjJCCR9WjdUI3DveWV0bGaalts5L1hzQ/qeTzJpfs8XP/dGlXOaif2BmNw7t13d6vyNKxnVw0r7aUCcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NrFdYL4H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NrFdYL4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762248027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltNFnYEQmixQZpMP12HbSmJnNGHT1YgJ5lkpfeO1BNA=;
	b=NrFdYL4HQA9VzMLmDuGYEvuRy0rgfm4LuQ7d2SusvjmvjRWicRSnIHSbI0ga2Q9uqC/OMl
	KP4rzz5EcLuGXmpD5Y6zEaOgq8kWR/kvQ+2iOws2kM7OgD8jezN7ah64Bom3xAwjCrQ3iU
	z8hQOFkm5hryWVFJiwuxjN3T7xxzPVg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-GO-EcY4bPbuvRVGC3YzyzQ-1; Tue, 04 Nov 2025 04:20:24 -0500
X-MC-Unique: GO-EcY4bPbuvRVGC3YzyzQ-1
X-Mimecast-MFC-AGG-ID: GO-EcY4bPbuvRVGC3YzyzQ_1762248023
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-475de1afec6so18402595e9.1
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 01:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762248023; x=1762852823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltNFnYEQmixQZpMP12HbSmJnNGHT1YgJ5lkpfeO1BNA=;
        b=vcW02wILpbJytiCOjMuYB5c8hQe9tPT+x/PEppzSM7t5J/pNN1NfSPLndFezaSr02U
         aZHjYsSiQE4ugPaTAoxY7xpgyZgl0eQLz7sUBp/Som4MzO69WTZxk2rznjsBI2VO8H5w
         mZCQsGcfsO+fMFLq+HzcgfyLXsN3CTYA2+OvyhBjTEs/pH7t1jlzvJikdCWwBRYLVxMM
         X+j6JielrAmPfKaaQBezsS+mfjz5DwWU0yFSDOsp5qvixWibzf2KxqHKz5plH87f0PBJ
         UVzdlOhYQbUH0CU0Uy+ZE9sPMOQA2eDk3cDDQPNCAlQdHbaci0TtIPDiIeQ87pxNQ2pk
         EuHA==
X-Forwarded-Encrypted: i=1; AJvYcCWkGaAbGoeuL7gkk7gDMrSSmywz3Vozgslo4FWyJRkxalsIKoDu8q/ACsfVbO+OlbzzeJGP@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjovjegv16Dt3++P9zBdnxcFHHG+Eh4GxnElMQtbWRFgvY/zn3
	DrDM6KldBhK1NkLi37mYf0lg03zU1hyXSu8qDeP5l90+jpwvt2vP/KUnYqlGpKNhrZPqYTzRXNb
	Q6rs/OjPo+jGylpSGQu2fNLbZuCW6hP4C1XZU5pNy3gtSsc9Nrs0ASzA=
X-Gm-Gg: ASbGncvSVD9M4ZEX/HOeQ+BijrphKb24/FV7fKeMhulG1siOWF9W3D7whnkLRGMKR6x
	9Xoyp7dEUX9YriGJM0/I8WrkLYqPvFckd5pKMJyBcSTsa/68lvIiMf04WDLsF2QPtznmbXHwHhj
	1PK5xoUoYcR8MpTBYbh6EHRWyXU9jptbUvEbDCl3K/q0Ay+07gK3uNwHJCVU03pdOyjHdpe/a07
	DV/dgVEzj5xPL2iKxPHmUHApglDD3ncNjYNc6iVUrkSlG/ZjWINDhoVkFCnlr71/BNocOFhdFUu
	dkaW6CVYV65l7uKXXAW94zDWWJuJ+uXH3t/xxt32M8JBDb5+9J2dMH+vQS4rfa16qMVN8uwiwrG
	Yl94BX/A/Cssidd2c+I2l5R1DJiPfRo/PxCBIm5NIvJbu
X-Received: by 2002:a05:600c:488a:b0:477:5639:ff66 with SMTP id 5b1f17b1804b1-477563a0172mr7272295e9.13.1762248023181;
        Tue, 04 Nov 2025 01:20:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/p/JinMYxs2wrDLzSGvdns88BAErQtC1F7WbaqV2NdVF5IW/VkWgEi7rHVWoViH0BqwGtQA==
X-Received: by 2002:a05:600c:488a:b0:477:5639:ff66 with SMTP id 5b1f17b1804b1-477563a0172mr7271755e9.13.1762248022677;
        Tue, 04 Nov 2025 01:20:22 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fdef7sm3539621f8f.43.2025.11.04.01.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:20:22 -0800 (PST)
Message-ID: <a0fee8ef-329d-4286-aa8f-b569b9e4ab03@redhat.com>
Date: Tue, 4 Nov 2025 10:20:19 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 01/15] net: define IPPROTO_QUIC and SOL_QUIC
 constants
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
 quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>,
 linux-cifs@vger.kernel.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Paulo Alcantara <pc@manguebit.com>,
 Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Benjamin Coddington <bcodding@redhat.com>, Steve Dickson
 <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
 <c02ccb3edc527cbb1aa64145a679994dd149d0da.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c02ccb3edc527cbb1aa64145a679994dd149d0da.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SL2OKsC4CqISeUNkDxgdsZl1U7UTOVf_he1EMJlsNGE_1762248023
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> This patch adds IPPROTO_QUIC and SOL_QUIC constants to the networking
> subsystem. These definitions are essential for applications to set
> socket options and protocol identifiers related to the QUIC protocol.
> 
> QUIC does not possess a protocol number allocated from IANA, and like
> IPPROTO_MPTCP, IPPROTO_QUIC is merely a value used when opening a QUIC
> socket with:
> 
>   socket(AF_INET, SOCK_STREAM, IPPROTO_QUIC);
> 
> Note we did not opt for UDP ULP for QUIC implementation due to several
> considerations:
> 
> - QUIC's connection Migration requires at least 2 UDP sockets for one
>   QUIC connection at the same time, not to mention the multipath
>   feature in one of its draft RFCs.
> 
> - In-Kernel QUIC, as a Transport Protocol, wants to provide users with
>   the TCP or SCTP like Socket APIs, like connect()/listen()/accept()...
>   Note that a single UDP socket might even be used for multiple QUIC
>   connections.
> 
> The use of IPPROTO_QUIC type sockets over UDP tunnel will effectively
> address these challenges and provides a more flexible and scalable
> solution.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

