Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445C2D24AC
	for <quic@lists.linux.dev>; Tue,  4 Nov 2025 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762249094; cv=none; b=u4dHunGNkgK9jD4YTFXUV9R1VM5R2Bscd1E+UFRLUziU0636KpDRqLx3knLFUkbaAyHr0UlggUePyLMjiwF4sDByZWjimt6I8yY/VCn9FsGj4UkBHfVHXHW7UIXUVUucwTLTlreq7M6S6fpEQkIY3ewPUx4JpgvTk4NzGXi4wVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762249094; c=relaxed/simple;
	bh=ArUnwMfmIEzmSnA8EtwjQrV26Mp15GPDfG/Jc+Af2u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIAxExVSsTVdD0P1jlmcjlb72SgFiA7sKl9PRoe69c6gGt9iXxD/SROJgbMEd0YB+O938QVip51ZN5t9Zj7whMPT269ujQiBR8IWfN6gEo5jSmPONV9Se6CsKUnLh6B0mCbzy66whjZS1q4iD3H3NCx1X18EH7W1olhVqXihTOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jT2dbuxr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jT2dbuxr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762249091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pyvHBDgoa9Lgk2kT7iDSPcIKDbs+wNswe6QWBYpGLg=;
	b=jT2dbuxr3xGR14Ovgv3UiaA+pACK23TDy/0tFEHjJqOJuv6+J0MoPzwXamEPSRmJy/AoBx
	hpOHD8ZwUC3hGefScZG3a+QW5ciqBh34ieR8PDHmsNAFiBuEH0k9yPtnPoycC8i0aSRot+
	NXqwrebk39Ar+Fvs52hUhCuxitM6JcE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-6EsdJJkUO0KTzPYvovlWyg-1; Tue, 04 Nov 2025 04:38:10 -0500
X-MC-Unique: 6EsdJJkUO0KTzPYvovlWyg-1
X-Mimecast-MFC-AGG-ID: 6EsdJJkUO0KTzPYvovlWyg_1762249089
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4770eded72cso19536925e9.0
        for <quic@lists.linux.dev>; Tue, 04 Nov 2025 01:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762249089; x=1762853889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pyvHBDgoa9Lgk2kT7iDSPcIKDbs+wNswe6QWBYpGLg=;
        b=UmchK5yYFyR46TximX3JUdeP9wUSL4m3I5Np2rPwYe+K/Ve4f6FDssTTsjS5dumdpW
         kPU1Q6sCuWjmLJA4u6c8ixj1GA81nrkGenNtho3x+IH6HA+Bm0d9N7SNIuUD2mzpZSBa
         OyT2Gvu1729XP9g2uWxmHTIzQxoEhSqJHA53bHJyqb6g7FTipBW918eC7yBeFRmQm7PH
         IDZpUA5Jq6tsBH7Y+wpXlxPkoAzHpAinhayMq+7kYVHqm7rdNN3Gk7ftwnw8ni31iXEF
         +CSdw+CHWy2lhPt3CRlMpW3bjmlsAvtpjPhyILV3d+3DT/5bu8kp6H59jip97qSlC+xD
         0Pjg==
X-Forwarded-Encrypted: i=1; AJvYcCXOERwNKqXJTPcUSw+XYqgBKXTx68E/ZdEWGcniYT2GmI/aXMIVqvv8Z2NRdq3HFKiGNun8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0I/Wgpwqs4TyoSGGs0PyIu0aAyO5oMUrQIMn4dBz9V9Xuehkp
	LZUO8epQkZdxUtDjYDQF+jia918PySPbDAeE0JlJ/aCBTtsHuLNlSayqa9+rkeee5BGsV9cq+Yr
	wqpzc3uPEcY68h7ESBE5dOqO32j/HD/Wu/a0bUFSwCmjU4hRKGGLLMxnXL7zXRnQ=
X-Gm-Gg: ASbGnctejxlOrg8qNXAJiQTIkwgMBpE4j2Pm4BHJfaUlX04uEYgIzbgfS/2m76VuWTe
	FABcJ8GHUlMO+LK5b4Yf20cOLIZyZl6UOzN2cB14I7zd6H7Tc3dlc5nXb4HT+YQjAKjpJkmOi8Y
	13jXvhT0prufCrWaie0IXAcX9+1jEJdz3oVbbC2i8zMijCMeaR8Z+0h7XDsXcz5Br+gLh3sRfQm
	X83nxR60JT3W2kZ1As645RBi+kBVDgq1gCUy2rN1cQcW58efBE4DeLsJNIWmXw1nC/KgzTxu5O7
	Tnaz+4ss1fKRHimK5ym+35TfVOEp1fB3c5Q3AWWudQqzPSPXMfyIhR5/OGyAyeA5Hwnw9u/VFJL
	rc5/sD3BZLVJtVyojfLpiJdePoelhyubmEllP0ZiwxXPB
X-Received: by 2002:a05:600c:a4f:b0:46f:b42e:e38f with SMTP id 5b1f17b1804b1-47754c451bcmr27965375e9.19.1762249088952;
        Tue, 04 Nov 2025 01:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG80tPo4mrfA3siN/+q+3zHsJR+5U2uhmtdOUUiclztFGU6pmZw6TuGG8AfTCenVCWwmNLdzA==
X-Received: by 2002:a05:600c:a4f:b0:46f:b42e:e38f with SMTP id 5b1f17b1804b1-47754c451bcmr27964725e9.19.1762249088492;
        Tue, 04 Nov 2025 01:38:08 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c383b75sm248333615e9.11.2025.11.04.01.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:38:07 -0800 (PST)
Message-ID: <ffe0715b-7a60-49a4-802a-a2bd75c7dac4@redhat.com>
Date: Tue, 4 Nov 2025 10:38:05 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 02/15] net: build socket infrastructure for
 QUIC protocol
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
 <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <91ff36185099cd97626a7a8782d756cf3e963c82.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ETI8IKPhbMGnt7hxfQwfnpVyKNw4RaYfpyFY4h4H8oc_1762249089
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
[...]
> +static struct ctl_table quic_table[] = {
> +	{
> +		.procname	= "quic_mem",
> +		.data		= &sysctl_quic_mem,
> +		.maxlen		= sizeof(sysctl_quic_mem),
> +		.mode		= 0644,
> +		.proc_handler	= proc_doulongvec_minmax
> +	},
> +	{
> +		.procname	= "quic_rmem",
> +		.data		= &sysctl_quic_rmem,
> +		.maxlen		= sizeof(sysctl_quic_rmem),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec,
> +	},
> +	{
> +		.procname	= "quic_wmem",
> +		.data		= &sysctl_quic_wmem,
> +		.maxlen		= sizeof(sysctl_quic_wmem),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec,
> +	},
> +	{
> +		.procname	= "alpn_demux",
> +		.data		= &sysctl_quic_alpn_demux,
> +		.maxlen		= sizeof(sysctl_quic_alpn_demux),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ZERO,
> +		.extra2		= SYSCTL_ONE,
> +	},

I'm sorry for not nothing this before, but please add a Documentation
entry for the above sysctl.

/P

