Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722FB36A367
	for <quic@lists.linux.dev>; Fri, 12 Jun 2026 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293066; cv=pass; b=kTo7Cd099EdTCem+lkG8KQ/OeeEHF0H7eS9i8YVuy9TanAWyzK61retfnf45d/qoNUOzTf75WK5IucUZz139JVRxx8pLkvoizSdebeOPHOWCxB2Vau7BQoo+BP+kuPS7qIabZkdeKrNCuHk3pPqw9GiymQ88PjWr4rzZ6UUIN00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293066; c=relaxed/simple;
	bh=QEUU0s90pEvT4hfT4qXSU5rJ24bOjblDhPsz3FQQoIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edLyCHGhXhztmVYf+tRLilQiq5ZfU9N7gLgDwP3Qs4/BjbPYUCYpog9Pca9PFxokWSr9of+xI1rpIZs8Abvhiyjeu5frx+uFqyq0rK2CBOdyo3H934SjKwg7RdrB9OSWghd2umqposT8mqAnWZxKD8OatSRwANeYFB/QN/OM2fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC4uXtCJ; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC4uXtCJ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-842d37438d8so615555b3a.0
        for <quic@lists.linux.dev>; Fri, 12 Jun 2026 12:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781293065; cv=none;
        d=google.com; s=arc-20240605;
        b=FpAMooyQ0Md7e4c812hvvnIYCkX1fzqmTA6mnlMiOf5W6UtithmIesVTNe3sQgP6o+
         V5O4pn/VQgewxjVUPt7mUikJnJLpidPpMvluQcKT3e14BSmJeD8QvCKnrMQVBVNCz+br
         9dvNSQesTLZwfpV1dh9/iP3eKh95+wGGEHuX9tt9kKflc6CU85VYccEdgcjwTiLjXtBo
         LNI10b0q43aQ2r6pJTJUN2EdMB1mjrwtrkbsdAs7H7Vo1e62sPkjYkGDL3YCuElN3aUp
         xivvEKdV1Q0liWrIkKRl3DedChhu1a3S2lQJh3zrsgrg5VrIdpzTZxb+ADsAh6kR2sM+
         gOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QEUU0s90pEvT4hfT4qXSU5rJ24bOjblDhPsz3FQQoIs=;
        fh=ePgIOuDeSHzLVnh6+x38VWqXfnMPioYdE+C7NsYkyP8=;
        b=g1X0B6Tja9O/uTXGiSRkGrYBaXv61pR82ruX4qnaTAWhoF8OUTdSE+z+hKe4SkqNwI
         BYZDu3qZFpSkLx8NFkTSfeC2L0ToJ2iNTrcHhTgODIUF4irCeOUB6x9XzdqdvhD0YceJ
         Vx7EvQxLY8LpoLih0p9+YZlPhnGrdX901bUKemaVsLyFdB3ayuRn63Q8TN3FEtFDMInN
         i65lTj0EuXHuQMbevnuJbqd79HTEx1Tl0Ae8EieINHq6hxmjZjDMk3bFZV/NZlLy3dS4
         a9g/WmuixBx+sSyMGjTsl03kbFTykIix7g1IjZcEg0c2OyAblR8KL6PJzyKrzrAexsl7
         g27Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781293065; x=1781897865; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QEUU0s90pEvT4hfT4qXSU5rJ24bOjblDhPsz3FQQoIs=;
        b=LC4uXtCJ/2D4jQFLjSe54KgoD7+36JDQTMrah3DneYITVLLb27PWYEy8ZThkPoI7Wb
         T1nx0Y/XnF8+BDOa77RlVdiW2dlY6q3SDYAztz/mxVnYNKH+/n4dbXIfkG7AKikpUKT9
         NocmGXnRCOiCCCgKU4UpGqCcwHeizIY3JuOKUleamQLrK94vd8782kYM6E0PYdOYDKHe
         nsvYXX0md8+eZl2NJDqbJkZJoIW64cqGssbZmHSWi/DZS5GLQGISpGnqihhuvO1PEk96
         4GrtWcrtJbMW5YiA6tAcLiHbOAsef9fB4MAD5cojQDfrB6s42uG99YVXsTOqg3kYJSCF
         Seyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293065; x=1781897865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEUU0s90pEvT4hfT4qXSU5rJ24bOjblDhPsz3FQQoIs=;
        b=Dj4gTDUuafX0bdqmcUOmeWHSJPYSOz8WG1EkxRdh+TsPGDPjxfi0JYvAhhZA17dIUG
         UfGqKKAsyEXenuIQPFBYoN3PEpCrgIBIIFnz2rjAFGA3cF7PPpbI7ptrJNn5Z+xuEqxw
         2BYY+vv2GOpoSJ5P3JUc3+canCV8LbmaRzMadgh11C4lxQBqyw+mH1PDIXHfqX2YQkVu
         WWs49bR0CDr04hGB3YszbQm7+8yyeDo4gPbg9fOUUtH+TzjZNdAXaypNsJM6otydHGAY
         FNZRAY5ezhC3KLP4Y+kECYb6aTwH0vX4Z80l0wB/eIrmrlREecFMmgoKq0qjuHEGK+0H
         ky0w==
X-Forwarded-Encrypted: i=1; AFNElJ+CbWKaiP93JfBqKECqIudhYFiKzLv+AwBc6krbELhl8RbbLoIpwKRsNwwmny4WYy9JsHSW@lists.linux.dev
X-Gm-Message-State: AOJu0YxVKenO+kPaBlezjkid6khaN4XSa3exJUWv6hAkt6kad/s/j/6L
	T8VC81vYA48zlmfHxsbdapGQIqQyw/reSS+wQwD+x72ttvwgHMxKMcMma9jPgJPPcmTP49JC4gw
	+1mRJMv15nQ/j/zc1vNgUvIRtM5VMP7c=
X-Gm-Gg: Acq92OFkkcI3WklQiSYJyYxXMfH4kPCVtLT5lQ3rXx0cmVfB7kgnzfbrKuhFa8kSzpM
	d3xzFyUEg5QFSdlSd3RUH5E/6fD79tz8VBRCL5J/JWuqHTqo73cuT1O80gXhkmIIbZZbkj+rMZm
	08wz0K+RwcqpxaConfAUlhax4I6omqpD0FG1evur9+2QAUijxC52B4K2bqpXJhjKb9L5N5hi7jE
	KU92oH8bEOalrk73+nlFZxZ6fmsILSYtz9q8wDIBlOh4P0SrDGqlRwcxZZR77P7LOtME7SetyMR
	uMmWt58XBgQ1aLuJCrnwjQnL2T7ildYftpQgoR4vVfkdYrte2Dvuq1v3ydUnSA8ptu9Az1X/b7D
	CMAfzVw==
X-Received: by 2002:a05:6a00:1391:b0:82a:5d55:5807 with SMTP id
 d2e1a72fcca58-8434cb01ac7mr4736200b3a.6.1781293064808; Fri, 12 Jun 2026
 12:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780855296.git.lucien.xin@gmail.com> <465489e5fafa9326b4a21c4851e420d344bbfdfe.1780855297.git.lucien.xin@gmail.com>
In-Reply-To: <465489e5fafa9326b4a21c4851e420d344bbfdfe.1780855297.git.lucien.xin@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 15:37:33 -0400
X-Gm-Features: AVVi8CcBYZ4beNIIRotqS0HdShlGTPsplHhO3h8wRDUTXq00moRwOci60wjQJnA
Message-ID: <CADvbK_c_qBNuad6HkYTZe0MpgMSbMdYSsSAz62DhEYaEapaCTg@mail.gmail.com>
Subject: Re: [PATCH net-next v13 09/15] quic: add congestion control
To: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"

[sashiko-gemini]

> + case QUIC_CONG_CONGESTION_AVOIDANCE:
> + /* cong->window is never zero; it is initialized by
> + * quic_packet_route() during connect/accept.
> + */
> + cong->window += cong->mss * bytes / cong->window;
Can this arithmetic permanently stall congestion window growth or cause an
overflow? Since all variables are 32-bit integers, the division could
truncate to 0 as the window grows larger than cong->mss * bytes. Also,
if bytes is large due to coalesced ACKs, could the multiplication wrap
around U32_MAX?

This looks a legit one, will confirm and fix it.

Thanks.
