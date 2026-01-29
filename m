Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D420637F0EE
	for <quic@lists.linux.dev>; Thu, 29 Jan 2026 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690000; cv=none; b=nXEB/T8zgjkyfxqIufUdb1tOrT4PQ+tKzK3ukYKrRbvF8U66GqoOXxKWBpj6f2SdN4LSAR85tIa6AvKvlPgsx1wAwYyvcryLXDHPq5Za2oxsJjud6cEjm7FO7QMtqxrEWk3Yh4xbzrBRAVQv5qFZ+f39lrX9CId0iXuaSHHqPqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690000; c=relaxed/simple;
	bh=40wMWG7SyPMSzabUx/Wcz8EBhiLCqDenQlqMLv7YPuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lErPA/ws5blXYaLhgPoHsq5hbObeJCQAJkrjEF3kCVcAjf2SQhsLQ/CjEloEM2tLkp0wH/UXDuqMeXrPvdtfV4VzGHNaVt9IHW+SCqARb+YnIJ68f7U+gd8ogxeMTqAGEQf8PSZN0NCoyIafZtZaCRML+gBcmChYzxKcp2dZq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhXetB/1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhXetB/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769689998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRy+y1wqapOxzHZCLfyA/JeLGF66Z2ABQ1elBTYnVS4=;
	b=bhXetB/126VofCRQ6j7PcZ/KFVLLHJcukA0b8bHeM42g/gctSn2gt1igFhXDUbqDYAxqro
	h+rnYOQuoYBiF0cOXotraSrqu+EvnHhiDrOXvpIvl15vPrqK9wUIVKGZ4aHr3/sMuxv0nR
	+IZIwOtr+4vUcq2GkQjBbCstKEmcPy0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-9tLfxeN2OhWVZK3QxWoqNA-1; Thu, 29 Jan 2026 07:33:16 -0500
X-MC-Unique: 9tLfxeN2OhWVZK3QxWoqNA-1
X-Mimecast-MFC-AGG-ID: 9tLfxeN2OhWVZK3QxWoqNA_1769689995
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-435db9425ebso1020709f8f.1
        for <quic@lists.linux.dev>; Thu, 29 Jan 2026 04:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769689995; x=1770294795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRy+y1wqapOxzHZCLfyA/JeLGF66Z2ABQ1elBTYnVS4=;
        b=BU48DiolzOeSPgiSEFQf5hrLFYjuK7AKQuLYwlRMqFKMCwN8xopKBt91ijyhUNQDST
         Mernh5F39/LoihpWf1eBvwiynlq28kqg80BmJOczlLziuqJ+/Adgvc6Q7/lH3Y8vInN4
         6cGsZMJtsbcdJm2I/tp8QmRqfymOVwl0LbklE+K3J7QiH9GQUk5bTAWhhLay2k54TArX
         CgZgYJyNnYP37i2L9fzPYFKybgwo7M4f9vnfkPwB9KiXcZ9V04SzDDrzrAXL3a+i87k7
         PQQsUSNrcX+WMeQUI5i5zr6rR+YNDdkygzmZZ8Vc2xOghqdcyvQwMwNXfrljNsFGFHWo
         Dzxg==
X-Forwarded-Encrypted: i=1; AJvYcCWv0Kv2yxtdezcKCrd/h/qJQWhwUrAF5inlZqgrD5VMDDMuK0/oNZ1X2G8NxVldr9cOGv+/@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1E70HUiGhqmcUja2dW09lPSZaV4D1LUsNHyjBP3VKzbRIZBjM
	gSO0KZHShE5CAoslKRfQCVg279WU0mO/o9oL6PPfBJs+j49DGUOmPc8lGaVLHi4iYnIwyLZr4Vt
	Glso/4UHBL2Od2+DBJY1YpP9oYWxKerJgnZmfWhMQQCHyyNqUBMnOegk=
X-Gm-Gg: AZuq6aKQrC6yc0/0sV/mK6z7UeKwWa9UuTDCo6Q2MJhR7vlmsJoF6fokeH7UQqBLzFs
	oDKyEju7GoGxO8jlGcP1XNzGxBasKuP9SKpGySQyAkkEkN/DfsDzVApY4Te8BHJdxskjYtTFahg
	Yjrw9BL5GDys7P3pKZU6qUBo+gQKPDkARAllMMJmyrUP1uFn89jDbDqlBjlvRnIWDWRPpLhvX1H
	6BG3OM955q82iwzkgQgu0FmwYMD9Qg52nJyBMl9JWIuNh2ezhXyifEuOK2YA3q9KTjaTrY7KajO
	6HmcTo+HsLLojlPaqm7x+6BFikyewea2ydi/HxromVdtRpUgHCwMlIPiSBO+a2oJAWOVZuhtvR4
	gLaJ7qpvpTSKT
X-Received: by 2002:a05:6000:22c9:b0:435:9882:234e with SMTP id ffacd0b85a97d-435dd1d8e62mr10552716f8f.59.1769689994899;
        Thu, 29 Jan 2026 04:33:14 -0800 (PST)
X-Received: by 2002:a05:6000:22c9:b0:435:9882:234e with SMTP id ffacd0b85a97d-435dd1d8e62mr10552677f8f.59.1769689994350;
        Thu, 29 Jan 2026 04:33:14 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm15075716f8f.33.2026.01.29.04.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:33:13 -0800 (PST)
Message-ID: <9621f01f-5c89-4d13-9997-b4066b7e9d16@redhat.com>
Date: Thu, 29 Jan 2026 13:33:11 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 07/15] quic: add connection id management
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
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1769439073.git.lucien.xin@gmail.com>
 <ad730679ce27da0886104546a3d327b5fb653340.1769439073.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <ad730679ce27da0886104546a3d327b5fb653340.1769439073.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 734M-U9VxRoyG4qrudW5Cr6juwCXgG2jiDjCjgCJ1bo_1769689995
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/26 3:51 PM, Xin Long wrote:
> This patch introduces 'struct quic_conn_id_set' for managing Connection
> IDs (CIDs), which are represented by 'struct quic_source_conn_id'
> and 'struct quic_dest_conn_id'.
> 
> It provides helpers to add and remove CIDs from the set, and handles
> insertion of source CIDs into the global connection ID hash table
> when necessary.
> 
> - quic_conn_id_add(): Add a new Connection ID to the set, and inserts
>   it to conn_id hash table if it is a source conn_id.
> 
> - quic_conn_id_remove(): Remove connection IDs the set with sequence
>   numbers less than or equal to a number.
> 
> It also adds utilities to look up CIDs by value or sequence number,
> search the global hash table for incoming packets, and check for
> stateless reset tokens among destination CIDs. These functions are
> essential for RX path connection lookup and stateless reset processing.
> 
> - quic_conn_id_find(): Find a Connection ID in the set by seq number.
> 
> - quic_conn_id_lookup(): Lookup a Connection ID from global hash table
>   using the ID value, typically used for socket lookup on the RX path.
> 
> - quic_conn_id_token_exists(): Check if a stateless reset token exists
>   in any dest Connection ID (used during stateless reset processing).
> 
> Note source/dest conn_id set is per socket, the operations on it are
> always pretected by the sock lock.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

