Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96BF42317A
	for <quic@lists.linux.dev>; Tue, 20 Jan 2026 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911822; cv=none; b=GITGqcsrYtRJx/mnb6TMWDAFGTatiuFiYvreLVUu9h0z7dAiiYYGMDqrjoHjFgup7fj5Lu0K1/Ru4e7vnDxrR6ZC78d5x2EkSGgLgIjD9BqZupGJk2pDQsbBHHrm7yGoHcKik1pK0/SZHwIVi6tv+OU7UW2hSQs4lUVqlVeraus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911822; c=relaxed/simple;
	bh=1XPv3uNkmWHVj9nBvtujA7kYi4ti9RusPKYh5MYQv+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuxWXx0cHpuJia+FoxsTtwEmrccNs0jeac3ETQftyYJLytblBxAom6QM3alKdfvfOp25OouNt75Sppf5q13aaMAAR5NBLIpwKbSEnPw82kpOrsq5PHYn4a3S0PxxkIRox+CJgNzGudgDLZKvQptKyTwc8v8OYzhIqwnh0jojSrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Drdyl/Vp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Drdyl/Vp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768911819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEG9JILWJtDxSikxSaJuovdTLx8v+TifArul6/N/tD0=;
	b=Drdyl/VpUYttoby8mcxl7CUbA4qM6usq2UTT3YFy9ghCdUCQfXpUDUzfH0eqVQZtctBTsY
	R+wmAy8tws6uMR8u9Re9Wjcgegnr9ZnBksIVoHpZMBchkRM7Rjc+gZ9daN44bvL+IEabkh
	4QsAY1sI5m6f1sIK1ZvqFer6vO7/tuo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-By6ZnBCrOeiiJBDy9KvIKw-1; Tue, 20 Jan 2026 07:23:38 -0500
X-MC-Unique: By6ZnBCrOeiiJBDy9KvIKw-1
X-Mimecast-MFC-AGG-ID: By6ZnBCrOeiiJBDy9KvIKw_1768911817
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48025e12b5bso27811055e9.2
        for <quic@lists.linux.dev>; Tue, 20 Jan 2026 04:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911817; x=1769516617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEG9JILWJtDxSikxSaJuovdTLx8v+TifArul6/N/tD0=;
        b=QmYSq8z57pRW8x2bcPngeKrGJpx45uAVVzrpS5Q14jT0d+vuGQ1ETinNPkqHHOGVvs
         spFbO8BT3afJkRbMerxyUJTWeEvptUi41+dGRIK3imSqIO1xRddro18lkZAAxaoo1lf1
         CXr3sedZZlz6S1PsVyYOPIQW7S2dF+ia95rCABLdgGX5pNPQiWdwUPtFlWMUlH+N0I8f
         V9+ORJZW5Kuz4ZahMVZ7TfOJA/wt9joJvI85oKKYEGxsD3CgOTEN859uTllAOd123BFe
         T5whwnHJdIHIHAUvow2Q7yEwhBoGj/BJupzO9I0TgG5Ch6OSzb9AIb2Oo/771GfHu+uK
         ekXw==
X-Forwarded-Encrypted: i=1; AJvYcCXTHwKSA3vuJMKe00evx8PrZiBmDT8Kn9L68n5K46zIKYlc4DjieAGsZ6R40W3YEI28CP0K@lists.linux.dev
X-Gm-Message-State: AOJu0Yya/iZca7obVRQjDJkQgXNkF3JJTfNpQLfJALlxCJEaydIf1Bqq
	jS4uWussmrqa3IoXOdc3LJCcZdIEEyY2mXtCo3qXjCKhUrVSU56N+tJa+jLi1BBWXZHORDNI8P9
	i1T5FqHY1ok9zSYOELCWzueqOAK6XGU3BZXbD202dXexNxQJNOflChNbwsmyJYUw=
X-Gm-Gg: AY/fxX66ZXti1RPj5H+/nxH/W+WS6ZD3Z8bLc2gK/7IQNKvbjvbgKS7wk0NRot9GbbT
	Xl8fNVnn+vBUeFxV6NMyV39SpxSSXzV72Bxwfociv6/mu74fgPxVEQOsChGb+TQkq/rCGs4YR5D
	fW8/kRHLas0zkC3FC+GT01HWyestGhjkIabmMANuDGuSV/NYapLeMy6svlCnDq1045Ug5oBmpCH
	xVTeeBdDCOIjGoxyzgfazqiUtLJV8FG7Tjz+1Wy4J+IWBSbox3e8BLWpdmbQyHjknceBTzhetqv
	MLBXuRPjK+5GkcOiIPcbvEfTQZtHvf2/MEZeRr/D83QaUo7Ng3o8hbacO0MIDADTlNn4y9oNsdX
	R4VBbbd640JPK
X-Received: by 2002:a05:600c:3b1b:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-48041472847mr5520205e9.7.1768911817108;
        Tue, 20 Jan 2026 04:23:37 -0800 (PST)
X-Received: by 2002:a05:600c:3b1b:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-48041472847mr5519745e9.7.1768911816688;
        Tue, 20 Jan 2026 04:23:36 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e86c197sm247488175e9.1.2026.01.20.04.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:23:36 -0800 (PST)
Message-ID: <a9c9f16b-f695-4009-945c-ac3b03631596@redhat.com>
Date: Tue, 20 Jan 2026 13:23:30 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 05/16] quic: provide quic.h header files for
 kernel and userspace
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
References: <cover.1768489876.git.lucien.xin@gmail.com>
 <32a34bfa4fcd69de5c738db95dbd71ac8e361d24.1768489876.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <32a34bfa4fcd69de5c738db95dbd71ac8e361d24.1768489876.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BU5MaC7pxDTdiDplMTKf25i_bXjHJabNznq2Ql8SYu8_1768911817
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/15/26 4:11 PM, Xin Long wrote:
> This commit adds quic.h to include/uapi/linux, providing the necessary
> definitions for the QUIC socket API. Exporting this header allows both
> user space applications and kernel subsystems to access QUIC-related
> control messages, socket options, and event/notification interfaces.
> 
> Since kernel_get/setsockopt() is no longer available to kernel consumers,
> a corresponding internal header, include/linux/quic.h, is added. This
> exposes quic_do_get/setsockopt() to handle QUIC socket options directly
> for kernel subsystems.
> 
> Detailed descriptions of these structures are available in [1], and will
> be also provided when adding corresponding socket interfaces in the
> later patches.
> 
> [1] https://datatracker.ietf.org/doc/html/draft-lxin-quic-socket-apis
> 
> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> Signed-off-by: Thomas Dreibholz <dreibh@simula.no>
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

