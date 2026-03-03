Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5529383C9E
	for <quic@lists.linux.dev>; Tue,  3 Mar 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526190; cv=none; b=isa0gKs3pLefKsPjD88cOVzePBwlmIZV7CbeJbmouPzQ76ME5DWZ/21H0X2dzsy5TIrhesc+A6wbJhBVC3QQNpXP8Pmlq5JxVTg6aQLHpwlniO7UjuYgbtRZjIIRDwQjGETcgtgodDietQ3/7MwiYC6gtB9qkMPuq2ELiUdWBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526190; c=relaxed/simple;
	bh=FIcra+QdGWbVK7dEeENktNZZV+zMM40tLcIz85kVF4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Prhl2gPUryuJ93tTOHBu+g6SygocKTcLybKXmLO6+2ZRqgTmSHPNcmGvNx+MCd8TEr+NTgZPsbFa/f/oGgvXwT+S4PoqDD5jBf1SaXE/DAQEI3s+al+U+gxRwCQeRSLzvO7H5HHB3wBxnkyGCdTfBai7n4QvnN4ziOKqxyLx2Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0tvKrBs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0tvKrBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772526186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bNVvSG62xl9Jk3X2cnvC9Xwc7/DlqVbGbtIj6kzPkCk=;
	b=X0tvKrBso6l3yTBz8ynidhn9/1LAllAolU7cXdnpZWZhDQmHxOJ2inQCyFNu+Y6ABFN3vs
	QGlU/cIJJrLRq0Wx02jYQxBpk6u1ZGyQA8QR3lRRz58rJnMH+Pw8eSqT50qV60ERgkiKW1
	IWAGWRasmpL9AxaK0/hv30st3uswKrY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-naWbzIqtNdSzy83DHOZfwg-1; Tue, 03 Mar 2026 03:23:05 -0500
X-MC-Unique: naWbzIqtNdSzy83DHOZfwg-1
X-Mimecast-MFC-AGG-ID: naWbzIqtNdSzy83DHOZfwg_1772526185
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-798656130b0so65427387b3.1
        for <quic@lists.linux.dev>; Tue, 03 Mar 2026 00:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772526185; x=1773130985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNVvSG62xl9Jk3X2cnvC9Xwc7/DlqVbGbtIj6kzPkCk=;
        b=QNrqfU0+NOiQCW9Ay79IdtCS9o9rbzENvARgzz3+rzHgKZgECjTACqit1m7/hOLezT
         OBVli9dKei7KqOm+qQ/KSawDF0MFX4kjJxgLa9kwiFu42/FQUnDiiIfLuk0U4jHlwhVx
         Yf1AnQmll2kWAcKxgp0BkgPR7wxKyF/KrAaJFjya7sg2yJGD85OAh5PdN8o+lRt5lgWt
         LLvsMVzGWscwWfp/GJyvhmv5zcftIO5muRP7/EYit6inypSNlt3K3cIwB8kRc+TtGtTc
         9hn5EE8ZIc+a5+/uWGjx3Rypq/EQt+JHQ+2SXTXjvhVuC+eJaIDqcWnvcBlkswRaOdaw
         XzEA==
X-Forwarded-Encrypted: i=1; AJvYcCUg0SSHRAoORnhlJVsqsr5y5zfXf9nWGYm7l6I1i7jBZn44N9lBkAgHEE+YQ7Y90YlVT93l@lists.linux.dev
X-Gm-Message-State: AOJu0YwNlv8aoy8h/amZi9cyT4mRlfcPeNYKDeNlfCEE6fLqcmno0VB4
	UHwhMFeh9RZXszDBoScFSuQHFKzudiu/gRazCXFMXLi8pteZgP+t2tJ161mMPnyQZOb7KG+IWCl
	Se3JpjzGbjcnBth5kyJT9xkY5hpb3OHze96d70t5fMsIaMvXFwR5JciWjWQvCX3Nm6twYnIFurD
	zPyNNsiZ2YLAtVCYvDgFuQjRz4AV0cjg==
X-Gm-Gg: ATEYQzygKAq1g4muV/tPPuBFQPkDCMHbcndq3rcbJlGWCU3X0BKxWtqst2hpl6bkfiT
	l6PCmkHgAcPFF3dR5bTaow78OvsaVO+gQ0Boxvrce3nv9AbDmSwl95awbRQweE3LkGsvJPYecYl
	3McFbGZWVHvaBwAmxkQOu8+y/b742plGOB9ni8Kg+8fjppfbHU3WPvfPyJvxjxvvHNKlAgUr02e
	Bl/yeM=
X-Received: by 2002:a05:690c:4b01:b0:797:a162:f7c1 with SMTP id 00721157ae682-7988547cfe9mr125761067b3.16.1772526185028;
        Tue, 03 Mar 2026 00:23:05 -0800 (PST)
X-Received: by 2002:a05:690c:4b01:b0:797:a162:f7c1 with SMTP id
 00721157ae682-7988547cfe9mr125760857b3.16.1772526184694; Tue, 03 Mar 2026
 00:23:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <4e03deebdc944d9c963b0732abe8ba631893d82e.1771986861.git.lucien.xin@gmail.com>
In-Reply-To: <4e03deebdc944d9c963b0732abe8ba631893d82e.1771986861.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Date: Tue, 3 Mar 2026 09:22:53 +0100
X-Gm-Features: AaiRm53wLfsp6dwR6Y3kD8_sIr5QwiEb9N3a51XBSB8vMJnsYCaEYRcNMDa3ON8
Message-ID: <CAF6piC+W=QKU53vix1f8JxxFhRKCcMvXaX1NKBT3kcZLfCydEA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 08/15] quic: add path management
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, 
	Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cosLD_I6LM7oX210Z9p9K48XHwrHqgxtEYPVMctnu7U_1772526185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On 2/25/26 3:34 AM, Xin Long wrote:
> +/* Binds a QUIC path to a local port and sets up a UDP socket. */
> +int quic_path_bind(struct sock *sk, struct quic_path_group *paths, u8 path)
> +{
> +     union quic_addr *a = quic_path_saddr(paths, path);
> +     int rover, low, high, remaining;
> +     struct net *net = sock_net(sk);
> +     struct quic_uhash_head *head;
> +     struct quic_udp_sock *us;
> +     u16 port;
> +
> +     port = ntohs(a->v4.sin_port);
> +     if (port) {
> +             head = quic_udp_sock_head(net, port);
> +             mutex_lock(&head->lock);
> +             us = quic_udp_sock_lookup(sk, a, port);
> +             if (us) {

When the quick socket is already bound to a local port, reusing an
existing udp tunnel sock is allowed, but when the quick socket is not
bound, UDP tunnel sock reused is prevented. This looks confusing and not
documented, please clarify the behavior and/or make it consistent.


> +                     if (!quic_udp_sock_get(us)) { /* Releasing in workqueue; retry later. */
> +                             mutex_unlock(&head->lock);
> +                             return -EAGAIN;

Why not -EADDRINUSE here?

> +                     }
> +             } else {
> +                     us = quic_udp_sock_create(sk, a);
> +                     if (!us) {
> +                             mutex_unlock(&head->lock);
> +                             return -EINVAL;

It's probably better to propagate an error code (PTR_ERR) from
quic_udp_sock_create(), or use -ENOMEM

[...]
> @@ -332,6 +333,12 @@ static __init int quic_init(void)
>       if (err)
>               goto err_hash;
>
> +     quic_wq = create_workqueue("quic_workqueue");
> +     if (!quic_wq) {
> +             err = -ENOMEM;
> +             goto err_wq;
> +     }

AI review noted that:

This isn't a bug, but create_workqueue() is a legacy API marked with
__WQ_LEGACY in include/linux/workqueue.h. Should new subsystem code use
alloc_workqueue() with explicit flags instead?

Looking at include/linux/workqueue.h, create_workqueue() implicitly sets
WQ_PERCPU, creating per-CPU worker threads. Since quic_wq only handles
infrequent UDP socket cleanup via quic_udp_sock_put_work() in path.c, is
per-CPU allocation necessary here? Would alloc_workqueue("quic_workqueue",
WQ_MEM_RECLAIM, 0) be more appropriate, or could this simply use system_wq
if memory reclaim safety is not required?


/P

