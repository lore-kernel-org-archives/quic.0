Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB26314A90
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762250109; cv=none; b=O9r1fyI+Z/mqL5lS1nJBjWhxF9AuMUUbo6WDqJLZMlLYAKR9HNjHdsZYbsm7+QgXVR58P9hnSwsqzQlbcjCAZZ5MRORN9cGWeXT3kfDK5kLZN3akAQWzhhUl5jgXYg3FW8+RlFBiCS4TmTanIV/VxbionrHM7zWI7NZNnVbrHYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762250109; c=relaxed/simple;
	bh=QfSQ5cpqVePGEDeF20Ht8A/SzrjwwOLDakiJXtv47U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dij49+He0QowV5qti8Of03rdKR0oMcJjQ/IvmiMS3HWfRJ2e1STT/NQDZ/iORT44RNUaHjCTwP61Ba0lECkomkLB82IvJ8sExDQVOMFwZwxjMppK8EsEOTiH+65bZKBC/GCV7qmGsrd8j0G90FlWISYzJC6PGHf5jnCKm+TL2Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CgP2fW5a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CgP2fW5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762250106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VP7vTJNouoan64MmsnztfHu0gZfK42bIBxJmyPWNcv8=;
	b=CgP2fW5aQanHOmOJorMRlgjDVOk41F/EBzlUXC5bMiJMW/HfJ48acEFk/vI9GleH30n6+n
	Hc8Q27R++0eWycK5NWNfpBHlC5uYW2ftZK04/dKQLGz4LPClChniojU6hH4j9dMMldO5fB
	ErS4NehyvSjAItznBvueERwZyjeOnYk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-yYNGpC14MO6RGpl1wbgI0w-1; Tue, 04 Nov 2025 04:55:05 -0500
X-MC-Unique: yYNGpC14MO6RGpl1wbgI0w-1
X-Mimecast-MFC-AGG-ID: yYNGpC14MO6RGpl1wbgI0w_1762250104
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4770c37331fso38207115e9.3
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 01:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762250104; x=1762854904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VP7vTJNouoan64MmsnztfHu0gZfK42bIBxJmyPWNcv8=;
        b=gRogwP+/EHvl9bAjPNy0J++AaSJloI7g+g9S4rZez56mY2ViQCZg9qqybIY54wJnIv
         JM/LGk+eGGknptVSulsYeVRXymhx+xJnjlEl6//7rerndYBfx3jY0u/Y+uej9iUAb8Lk
         CBzMiWti6wXUtRO5OByBIfRybYO2WL23OmxI8tM0p0JvdJ3UMvPt68xx1y9CODALuUHC
         OIlUcO65GwhZ81h6bvuA/PfPUQlhWaFHboGloaLDniiRHasgZMEHYLQea/wwT4J5HbeF
         6DlFC2w5e6eHwNT3JfUIx7i8dCv595YuElvaQ3UZnuee/pke8jG9g8Xps1nohuLMBDN0
         BPMA==
X-Forwarded-Encrypted: i=1; AJvYcCXs2YyVJdJZDDvkntI7YGcUhbAG7RYxVc0aH2+988Q7TsqM20o+kjHpDj9POg3hDTNr5m9h@lists.linux.dev
X-Gm-Message-State: AOJu0YwJMOtCXbHKq3PgePGZBJZJB/Fj+vUkxrHhXweMAItpJmkQV5mq
	95m1ADPvAPgpMI0LNyfKnEIhHm2O51TYHzJrqkIosBhGSW4U1Ah9iySUcOWEURh+4cr13JkEju7
	r9l8nyL53Jy4kkIvituBRkUYiF5pVbr7d/J0V6Kn8fFcfi51JAAeSWXc=
X-Gm-Gg: ASbGncvXlmwPK+dDwtRGTl0Gd+oanBtbyRd7/lqxESCzZ5VA7TQgULXP9uHgLnvKI2y
	vh3L5pbRpUpRO8U+VkhRK+SnwIXUOuNNz624ypGKAnFqFNLpzmUlvspdmbgUjdGyG+z0NkLZN/g
	yOz2VPY33jKsi4q9qqg/M6eY0YJ7bYkw58G4GvZyStJMspYFpOTvTeCXTvmyZ71lc859G6B4yPi
	1bm9V+Vm2alOUk+fqWOVRdIYEaLXi6OKBIYSQtMStSTpbolVuAoNAAROuaY74whZ7SRPsXC5BT7
	p6YyEnQ6h1616590P9+sR5/3he4lZ3hqEL6Mk+iCFO0MIh/GMqdlCOVJ1O1RJWdpuG9bq1dMlo8
	e2rKTgI3/zJqxaUvVsBnrfvHeRuPie9xzDsiS8j82RTFi
X-Received: by 2002:a05:600d:8394:b0:475:d944:2053 with SMTP id 5b1f17b1804b1-47730ef502bmr102634545e9.2.1762250104372;
        Tue, 04 Nov 2025 01:55:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6j3suXJsdE1W3rADP1TPpeXGC+84lF7jrCGSmoPCopSvWPQsrXeTI2soLtfPTzeuZHI21IQ==
X-Received: by 2002:a05:600d:8394:b0:475:d944:2053 with SMTP id 5b1f17b1804b1-47730ef502bmr102634195e9.2.1762250103915;
        Tue, 04 Nov 2025 01:55:03 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775598c2c9sm28545315e9.8.2025.11.04.01.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:55:03 -0800 (PST)
Message-ID: <1fcf4639-4c3e-4c07-9d01-0537cadcff42@redhat.com>
Date: Tue, 4 Nov 2025 10:55:01 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 03/15] quic: provide common utilities and data
 structures
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
 <66e48fe865ea67beb2a7f5cf084ea86d93592dff.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <66e48fe865ea67beb2a7f5cf084ea86d93592dff.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BBxWqniR_E8SGh9A-I5kQfNJgD9Ccjh0P7PHmBuOroY_1762250104
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> This patch provides foundational data structures and utilities used
> throughout the QUIC stack.
> 
> It introduces packet header types, connection ID support, and address
> handling. Hash tables are added to manage socket lookup and connection
> ID mapping.
> 
> A flexible binary data type is provided, along with helpers for parsing,
> matching, and memory management. Helpers for encoding and decoding
> transport parameters and frames are also included.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

