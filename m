Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538E718A956
	for <quic@lists.linux.dev>; Thu,  8 Jan 2026 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887559; cv=none; b=Ak0dYN3IgtVZFcRiU9kuDdF9p5bTzOxzNYXsq1L+Jl1yc1PqAWnyL2g5MfFWVIES5Ozft4sVjibY/gQdDa+DnlBgMDVQbH8g89JyQBqKkp0LZVUuFbjbCi3hOnSKHA3a2sJl0RuJ+P90eoJthuBc0MJi8F6RiwqhbMyXWsaVtF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887559; c=relaxed/simple;
	bh=Ecl1PbKVRyx23lmWYgMZH9CBPlfIEVtqzYUAkJfKTuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dESKQXoCEZ7YJ57pp0uoHmChkMsWifSGkjtWidGTYXgd9CRhQqM4nL/Hnqf7hpOOyBsSJXpu097o+KNWvIhc3SvkfCq8mUVA+S7EhL4JYzJlYYAqypODT4kUbNZ0x5pqYKn2VfUydAFeou2agpmHC5y6wAKVSfHqWqJm3ebiwmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XM5657gX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XM5657gX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767887557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74FrBsYB82BggKYVQEFS4TeWY2PiI4VLCk/K0yOsgeU=;
	b=XM5657gXhOGCL/7HLJDHYOqaImCt5a5a6RfhUpxOoqrh89qvFfmSmFwtBqqu3e/KaJ498j
	SL9P5BDpmiETP6TGpi61LnY3AwvrNe5nAvmozU5mFPb5hskH1kWob5KAuAv3wE/IieDi0Q
	/ifaLkZPgOAS0b6qquQMDYZjBVFZcCE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-_AlbjeG6O1a-QkSJjXuy3A-1; Thu, 08 Jan 2026 10:52:36 -0500
X-MC-Unique: _AlbjeG6O1a-QkSJjXuy3A-1
X-Mimecast-MFC-AGG-ID: _AlbjeG6O1a-QkSJjXuy3A_1767887555
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-431054c09e3so2089391f8f.0
        for <quic@lists.linux.dev>; Thu, 08 Jan 2026 07:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887555; x=1768492355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74FrBsYB82BggKYVQEFS4TeWY2PiI4VLCk/K0yOsgeU=;
        b=wG57OXsdItDM4/OmyYj/frf8F0pI2ZGhnq13Xwc/3kOWKaszU29nEMQfwwPGtDGdb+
         OP4bWDvms6dUGn7QYsyoWJeX54AGnbXW4/tk6QaUHJd3DsiZQ4WY5iUiTpIncOatIVJ0
         BeLeKGnu/+uiFVSa6F0Ji+XimCoquvtdmlTQ6PiLZ4xK0ZXXzVXNKS8xAAqCKH5sgllI
         ELOlofxffwmGEAQfjmos9zhTomnJxyxdzlXa9HCy2Z76U5ZQBJMBAF05r38ioSpyaC+r
         2/bAN8T4fnTRg1J256NDq/QGlzBXg19n3rauQ0SNy8ABdJgGpwWBcqAOfdYeKlcjaYBT
         NvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKgGUkGGJNc3n87UxaakBUBEWRt9PVmkHdFyqQz17txxZ3PzZCtcBS9g0EhuVMnFLP4AtR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy245IDxLTIl3SNL0uEt5W8E95dBySZpKaRhwmI62gvmxNEsQ35
	PIEwfkmv9pFIRjEgXZq4GGUCL+6vIpMcFVA0qvw2tuMpsIY+THJ/O0AASzGCtOA0thHlBeMfvHo
	U6Vq58Mk5gJ9IHylx6NjhhoSohdZGYaC4f7hBoZfgVI1N6kP6oRGXcIM=
X-Gm-Gg: AY/fxX6RKGcEOAiaV+aYh/Znyjh56GOp/U674OqFqtwxjAMvz7/4IdYJqOxXUpAPj3q
	w+cEKUXOxqcm9oKit09pUeN9Rduj3gJWzHYZYp3lhxFhfbXn0Z5FKopoGr//F7sRpYUScLmokv3
	SqhuDJLwsOd5ti+REvND+hXmkxRmoZx108E4kk6gav1WLVdbAm3boFI3Zjy89GyzRKg70/UdE9M
	1yOMaS4FSspUorHjIavbLOrKhtZCLeqRMIaFJIT/Q6ok7K7aXgId8096OoCNtqShvpca9F+B1Sb
	JTjcdLG0j50djwMjrHoyO0tOe8vhHgzR1QWgOWW4ptskNoRJIJ93kDBZErXbqfQu7eHOoECXTuj
	x8oSkJ7AQmy3iJQ==
X-Received: by 2002:a05:6000:4284:b0:432:bc90:2cfa with SMTP id ffacd0b85a97d-432c374f5b2mr9200044f8f.33.1767887554971;
        Thu, 08 Jan 2026 07:52:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSKdamN7KlUBs3N2vJJPlmjw5J/9h4DJzDryl8KQLv679zn5HwyVK1QASMGXWGmNWePQJKlQ==
X-Received: by 2002:a05:6000:4284:b0:432:bc90:2cfa with SMTP id ffacd0b85a97d-432c374f5b2mr9200014f8f.33.1767887554566;
        Thu, 08 Jan 2026 07:52:34 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm17169574f8f.43.2026.01.08.07.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:52:34 -0800 (PST)
Message-ID: <ec28c852-e80a-41c9-94ce-a0fce8ee07e7@redhat.com>
Date: Thu, 8 Jan 2026 16:52:31 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 07/16] quic: add connection id management
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
References: <cover.1767621882.git.lucien.xin@gmail.com>
 <79bf90a6e105c6e6ac692de21a90ec621af47cc5.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <79bf90a6e105c6e6ac692de21a90ec621af47cc5.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m94yAH1uhluDjHcm0Dj1Qo6VatPRgycHROiIZE8E4ls_1767887555
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> +/* Remove connection IDs from the set with sequence numbers less than or equal to a number. */
> +void quic_conn_id_remove(struct quic_conn_id_set *id_set, u32 number)
> +{
> +	struct quic_common_conn_id *common, *tmp;
> +	struct list_head *list;
> +
> +	list = &id_set->head;
> +	list_for_each_entry_safe(common, tmp, list, list) {
> +		if (common->number <= number) {
> +			if (id_set->active == common)
> +				id_set->active = tmp;
> +			quic_conn_id_del(common);
> +			id_set->count--;
> +		}

Since the list is sorted by number you could break the loop as soon as
common->number > number.
		
> +	}
> +}
> +
> +struct quic_conn_id *quic_conn_id_find(struct quic_conn_id_set *id_set, u32 number)
> +{
> +	struct quic_common_conn_id *common;
> +
> +	list_for_each_entry(common, &id_set->head, list)
> +		if (common->number == number)
> +			return &common->id;

Same here, you can break the loop when common->number > number


> +static inline u32 quic_conn_id_first_number(struct quic_conn_id_set *id_set)
> +{
> +	struct quic_common_conn_id *common;
> +
> +	common = list_first_entry(&id_set->head, struct quic_common_conn_id, list);

id_set can be empty at creation time. The above assumes it contains at
least an element. Does the caller need to check for such condition?
Possibly moving the check here would simplify the code?

/P

