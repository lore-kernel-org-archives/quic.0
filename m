Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8125250095B
	for <quic@lists.linux.dev>; Thu,  8 Jan 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883211; cv=none; b=YvK3BkzE0iZlA1usM3Uw81u22+iUHqCIsRevAxWkflmmHSZs+0nOfxcDn8E2F7Aj4z7GYmWomJai4WNdtOFIUlrVPSWEfWjMuevq2sIAM2SndCyRp+EhrRs/HiJIJcidnjuepkCj4s9gNVjR6ec6sDl6JK8ePrHR+11yenIPdwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883211; c=relaxed/simple;
	bh=dPmlogqSF3x91CEJq+G86ZMwTBqFlXyFWdTsnVs3Vl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7rybhIZRAJBDFj/FItQ4vakKxV4N7FRZWCUCVMxwlXwmDD5zxh9CZC1N7PJnbx8pJaTzGIe6vxoLcor0WTmKYPji7ihZZWn2yzzzcgag/CprVvrBse9cDPwWWxQBEiabwH484l3bPKLuaDt/43+PXTAlFGwsnutozxKUBY1+MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fKDTlqGK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKDTlqGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767883208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njA+hTMBn/k9kWyQkaykZqwF8RGh2m3Qf7ruOi453Qc=;
	b=fKDTlqGKyEXH+ULtznxe/xo21CzSIv2X19EO32B81ngHVr1WedtkAXbiYa4SgrZ5+oXn2K
	P/SMvKRSU64UnNS9x18DAlwpfC5AxIxL4vTAYqztdqJMyyOvJRQu5XHnSl95a0vqCmYTHm
	qG3lWR+WmpxTPQyNIa1o/E/gBS2qyW4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-eZW01BkHNKapYsoWS60fKQ-1; Thu, 08 Jan 2026 09:40:06 -0500
X-MC-Unique: eZW01BkHNKapYsoWS60fKQ-1
X-Mimecast-MFC-AGG-ID: eZW01BkHNKapYsoWS60fKQ_1767883206
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-430fcb6b2ebso2124504f8f.2
        for <quic@lists.linux.dev>; Thu, 08 Jan 2026 06:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883205; x=1768488005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njA+hTMBn/k9kWyQkaykZqwF8RGh2m3Qf7ruOi453Qc=;
        b=W4NWa60AB23pqVIrU9uqccwG9SxIm+0nb+rU2eUUSRbuSn33wy6pAfUoigtwq3ki4T
         oASA57Cs6Y2bGNO2H67N5e8vajlTcKnpO+1P7kvEQ8UcWx3tlWZvZAww0djbwRXyG76o
         ysjqOp96m+behRzwyMVoHuCt9xM+e4+S9NUpYNIl+B6OIfoG39+CqC8MlkuKCk1PFqvX
         djv+M4SlHpqB8Y0X4r5R60CY96SH3CJrLWiV+sVVHP7iAmxlNYfkJdnk7QjG64wxMSxx
         fWwHI6oEY+fGyVmUaFU6AaaqlNEaRcqLkLpLDwky/t1wma97nsYv5OHsuStJyzZ3/5Cr
         li7A==
X-Forwarded-Encrypted: i=1; AJvYcCU+amaahnHZa6XUlY5VTf/lWZ/iL2H+Cn+SzJGZ2hSpu0xjCxEwKOS9A1Nm3h0AP9XvmRxJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzJcvF3eHV5pj2IrNcQnVTK1ioXnxGzru3kFBWQ7GtuSSygW9S0
	ttCJzneDzV2Zc8W0jD1y2+j55rPgszeh538MbKQVGw7vJd40riAwDS841Nmkd8H3okUt/vnSqVx
	1bXVwGvgl9z6+4f2qYwGGR3CKer2/3wc2qO4dQZv/aMIScOWQy3HtwvA=
X-Gm-Gg: AY/fxX5pAII2AwQuLKPYB7Tt43pGcJaK68ShPvaIbttaGwsVhucF1EDPf7P54rbNnf/
	Dbp7Ap06vtcZmAXCzBPiCC0vwzYFDQcroSi9dmuRUEpAxaPC61w/DMlGgSogwOHYFTFAo7OtLIu
	SNgbqGLO+F2KGvkMHTgPnwg3POMU5/HzjdpJrjiSgze0A2wt5WrqqYzDb1aXCJH7NcSNhwEyX8n
	dN5rUxxSk6Db2mFp9Yn/pV2VNrkQ3jTb2M+6tN1nAw5nV2UmzY5MN5GV2fw/a/gQ3Hvls2MmtYR
	yyuZuyOIrdwP4qpAx5CD2k0MDMaHUa43EOUiFGst+SGDayu0TYoJiiBbBXxqjUboTgwaQMvJaOr
	rztLsTPV4KYb/jg==
X-Received: by 2002:a05:6000:290c:b0:431:864:d48d with SMTP id ffacd0b85a97d-432c36282b8mr9097901f8f.5.1767883205613;
        Thu, 08 Jan 2026 06:40:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhrvE0E96qmKMPJwgFr/KgrUshlj3gNC/1jVjlfOFsD1VsRwzSKI/T+U4gkSRnW2fyKqjotw==
X-Received: by 2002:a05:6000:290c:b0:431:864:d48d with SMTP id ffacd0b85a97d-432c36282b8mr9097863f8f.5.1767883205167;
        Thu, 08 Jan 2026 06:40:05 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff1e9sm17531056f8f.41.2026.01.08.06.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:40:04 -0800 (PST)
Message-ID: <0df97c1d-aa75-4472-aad6-33eaa919ce28@redhat.com>
Date: Thu, 8 Jan 2026 15:40:02 +0100
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 02/16] net: build socket infrastructure for
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
 <d5e0dce5e52d72ed2e1847fe15060aa62e423510.1767621882.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <d5e0dce5e52d72ed2e1847fe15060aa62e423510.1767621882.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KBT_mJBUfq5AgXFmdjMI0AOpHyZssxJO3eFAiQs83fU_1767883206
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/5/26 3:04 PM, Xin Long wrote:
> +static int quic_net_proc_init(struct net *net)
> +{
> +	quic_net(net)->proc_net = proc_net_mkdir(net, "quic", net->proc_net);
> +	if (!quic_net(net)->proc_net)
> +		return -ENOMEM;
> +
> +	if (!proc_create_net_single("snmp", 0444, quic_net(net)->proc_net,
> +				    quic_snmp_seq_show, NULL))
> +		goto free;
> +	return 0;
> +free:

Minor nits: I think an empty line before the label makes the code more
readable, and I would prefer #if IS_ENABLED() over #ifdef.

Other than that:

Acked-by: Paolo Abeni <pabeni@redhat.com>

