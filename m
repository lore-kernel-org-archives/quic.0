Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EEF3E556A
	for <quic@lists.linux.dev>; Thu, 26 Mar 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537839; cv=pass; b=beUoaiK/LGY2SE10FwX4hfthMhncT9J1OBejMyGWZk6bJn7EVHVxloii6LNDsuUxz46C9BsxoOrMTAGF5PJL13B1r2EXmxwJHqM2s6QsDm7TOZkGj4yI0SoRNPcn4fF6Uy8UjGSOLq6eIOQb80Jus2gcp0u9azFH/RQdafKDYk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537839; c=relaxed/simple;
	bh=qKz7GeQxZ8sggDV0R8PRl9sGjFfikJ4/Tqa/hBGF7AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BH6+utTmu6biemk56+NpBfn4YwGS87bFMfgm6sAAAmFww5Y/fTEufj/toUnRzROyn0Cyb3+hrb1E5jSTZWT1Ys/Ulq6p3lP4Iuhy2gUpX5bSYIEhCIcfNrcjbEFuobW2sY4doA2UOUPHT/qWML/R0EyRXfMrnqSFETxk0krdb/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuKIsWmY; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuKIsWmY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso806270b3a.3
        for <quic@lists.linux.dev>; Thu, 26 Mar 2026 08:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774537836; cv=none;
        d=google.com; s=arc-20240605;
        b=SXdakEjlS73DWEqbg0KysuTfVlBfShr5h/j1jwtp5KOWo2vXzqxH8bCBvZm6zUJlCz
         Dkeq8+VXa8H4BJAJcdeDkZiyDMxStHHlAiFLD6cADUNnxTAlBOjtIWc4pKIauvNhU6r4
         qZIkZFfr0E+wwHCgtbBWOTEe7MsG0C2D87TIJ1v0cA9PmXx6IjB3AVZ1tnhagixEjhFQ
         KjXrg/V+3UDzCL6nqBY8J2VTi/q6DSH1Yz3HuzJg+ol5RJ0e9qghHn+n36rzqlySoSHS
         evikO7GmFIjqeFKj7IwoYnIrZMssooVfIddtIOiO0G04t7xsfQau4n8q5Jb5OVYSjAn7
         Kctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSefNftQWki8QitGf1y0R01W7kHkanHSPeWJVPTl48E=;
        fh=m04MhPMEP2iPOiwupC+zZp4ey2rzFRxJBzF06xCRYYI=;
        b=VJM7pgD6MQcx0N3asG+lgo267eIoF3Uv4DWNjc/9It71+ZpW1Ys6bVKYRnCZpbI3Ps
         Lhjl2jI++P7d1yDQdTXE1hVouAbJqR1tDzG02zDsBb69aqmBauHradi0GraXCs5Nl+A8
         t89TJUoJAQ8eVyRUg2kW+5by8qizaD056U+r3NpxPWkSq3x9G5kMQUxzxfScObM1SYoG
         kcGnXAq4t6Le7yWTcbvVt5azMmp5YofKWvUuCK5m3RWlmImxKZR5n8Z81QmpOnQ4jFCT
         3xTfjUSn8W2Q5h/KYvjtDpcSXpBYhfm+864zRM/xtLkNpZx9Yd4FYYqPR8QZoDTwPQ6B
         tn9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774537836; x=1775142636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSefNftQWki8QitGf1y0R01W7kHkanHSPeWJVPTl48E=;
        b=DuKIsWmYhuq91KQh0qKFwDnXsqQAW5noO5xGSWpKReCPHK7N0KlC99BMCniIbtkM6L
         VwG34C658T4DWqTwMwXGwiCRyDtVwDnIxjMdPlWXtzQpLvAdEyCDwUV/9wpXXZQai5aV
         zwwA2gSdaGCBbOoLfphcWSYUTD+nUZhls3SzgsIHenkrlj+7lPlRECe5F39XGoyDom4O
         fDcKVxJeedID68FXVZArn8upVudRIPXa9a2u047oxmI1c2qmEhIrsDcjFF+oXPfcdkPM
         relYoSx4QB5kimC2Ok+ve1JkTgbEvXT5KGt53vQ9OkOb7YU0SPl8ayOMQu8PkhRas19r
         EE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537836; x=1775142636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSefNftQWki8QitGf1y0R01W7kHkanHSPeWJVPTl48E=;
        b=T+n4vqezRQ5fJNgkH5LqJyM6LSwA7hRBMo0Z1Zdl1x7GcEqTxBF+P8cWAsFdSMXgPu
         E/pkklAMAaRTsjMu8DUOaPL+7t+/SvcTE9np9anWXMFyI8+8ClLEUAj5LtIavCCKNzp8
         RK6wE5QL12Cc3SRKdH7gabP+UU2s11OOqHkPrdSJj7mVzgk74dXiSCiKkXrf33dB5YX2
         h2q3cSjR93e2b3J2V42XptT3Er7v4Y7yMDq8q7D4Qy38aGWamXUu6E9xGHjlN28Dkxaf
         8Sl8X6O5dCKygYEheHpbKsklFDwWFfhCRxxSMHgPVMUm1IfnapDj9NLFwfEKzbNg+7yN
         6BeA==
X-Forwarded-Encrypted: i=1; AJvYcCVtp2qyerzyEkuqyVizjCAWUNzx3gZUqWSz1J1oStWnyTfMMJpQGHoeS+Imw3DNZgPa7fHZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Qmw/Dq+jegA7i7WGWVrQ8+1kIEk+1gWJwn6ByTp5+fVJg+IE
	Gd06hZXoZm0LZYgqu6WdK68opFnM44PBlyMZKB0ia/wLcN4M+Gqfw1MPPswsL8kSh5ucg6Jnpwv
	5c1iXNIAa4kaCCzo5n15O0ToCYMhE5VE=
X-Gm-Gg: ATEYQzwqm4IuDAGb3dodbYX/9nj6n4ajCNCh38oQefQsT8YQqco49xixUaHNqXZ+Ypy
	tPJdMXYMSNbece21BBXwhUYarZtvU8mr4WsmUHuMf+HRLB7JMnnk36U+8C2LY9bNCljbRM60USm
	dYMYpNCgif8VcY8by6Ey9T25mMG0oYdxkbSilDFTaUAfU2QdkHrftA14oe5pPOeZQMcgTZKrjtK
	besSnFYfaPEhPedVc94WUyB76Sb73VL7NWVy3V7T0TOo8MoULl5phAKZ4idO5Vm8o7c8DmvNnXP
	mjOUv49zXY2mMAoMFX6fDkqpxyCRt8gCXS9igksCr5vttAFYSV40cwM7qbkgv0ohLZPr/EqpCPz
	rhfoW8j50QQKK8jkdWp2Uo5nM0sg01reSZjqUc6Ut
X-Received: by 2002:a05:6a00:2da7:b0:824:374a:13f7 with SMTP id
 d2e1a72fcca58-82c6e15f706mr8408159b3a.55.1774537836342; Thu, 26 Mar 2026
 08:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1774410440.git.lucien.xin@gmail.com> <d86910330339da257534ad93db71949176961522.1774410440.git.lucien.xin@gmail.com>
In-Reply-To: <d86910330339da257534ad93db71949176961522.1774410440.git.lucien.xin@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 26 Mar 2026 11:10:25 -0400
X-Gm-Features: AQROBzCHlIqDJYnoa1tW3FE7PgOFSLHI1Wh5jc_7MECEmTiUBtm70S0dHNsViq8
Message-ID: <CADvbK_d+oVgMNWQ3fT_Rz9WGkU6i6m+Z=3J34_-QiCjEABoCpg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 12/15] quic: add crypto packet encryption and decryption
To: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 11:49=E2=80=AFPM Xin Long <lucien.xin@gmail.com> wr=
ote:
>
> This patch adds core support for packet-level encryption and decryption
> using AEAD, including both payload protection and QUIC header protection.
> It introduces helpers to encrypt packets before transmission and to
> remove header protection and decrypt payloads upon reception, in line
> with QUIC's cryptographic requirements.
>
> - quic_crypto_encrypt(): Perform header protection and payload
>   encryption (TX).
>
> - quic_crypto_decrypt(): Perform header protection removal and
>   payload decryption (RX).
>
> The patch also includes support for Retry token handling. It provides
> helpers to compute the Retry integrity tag, generate tokens for address
> validation, and verify tokens received from clients during the
> handshake phase.
>
> - quic_crypto_get_retry_tag(): Compute tag for Retry packets.
>
> - quic_crypto_generate_token(): Generate retry token.
>
> - quic_crypto_verify_token(): Verify retry token.
>
> These additions establish the cryptographic primitives necessary for
> secure QUIC packet exchange and address validation.
>
> Signed-off-by: Xin Long <lucien.xin@gmail.com>
> ---
> v3:
>   - quic_crypto_decrypt(): return -EKEYREVOKED to defer key updates to
>     the workqueue when the packet is not marked backlog, since
>     quic_crypto_key_update()/crypto_aead_setkey() must run in process
>     context.
>   - Only perform header decryption if !cb->number_len to avoid double
>     decryption when a key-update packet (with flipped key_phase)
>     re-enters quic_crypto_decrypt() from the workqueue.
> v4:
>   - skb_dst_force() is already called in in quic_udp_rcv() on recv path,
>     so remove its call from quic_crypto_payload_decrypt(), which may be
>     called without RCU protection.
>   - Remove the incorrect (void *) cast to quic_crypto_done.
> v5:
>   - Use skb_cb->crypto_ctx for async crypto context freeing, which is
>     safer than using skb_shinfo(skb)->destructor_arg.
>   - skb_cb->number_max is removed and number is reused as the largest
>     previously seen and update quic_crypto_get_header() accordingly.
>   - Change timestamp variables from u32 to u64 and use quic_ktime_get_us(=
)
>     for current timestamps, as jiffies_to_usecs() is not accurate enough.
> v6:
>   - Rename quic_crypto_get_header() to quic_crypto_get_number(), move
>     key_phase parsing out of it, check cb->length when parsing packet
>     number, and update all callers.
>   - Use hdr->pnl + 1 instead of (*p & QUIC_PN_LEN_BITS_MASK) + 1 to get
>     packet number length, and remove the unnecessary the len variable
>     and QUIC_PN_LEN_BITS_MASK macro from quic_crypto_header_decrypt().
> v8:
>   - Move skb_cow_data() from quic_crypto_payload_decrypt() to
>     quic_crypto_header_decrypt(), as header decryption also writes to
>     the skb and is invoked earlier than payload decryption on RX path.
> v10:
>   - Fix double period at end of the comment for quic_crypto_encrypt().
> v11:
>   - Note for AI review: call quic_crypto_aead_mem_alloc() after
>     skb_cow_data() as it uses the return value for nsg. If the allocation
>     fails, skb is dropped, so no rollback of prior skb modifications is
>     needed.
The AI report on

  https://netdev-ai.bots.linux.dev/ai-review.html?id=3D1624d906-c0b6-4e12-a=
63f-5cbfc51b660e#patch-11

is already explained by this "Note for AI review", not an issue.
