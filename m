Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0363328FC
	for <quic@lists.linux.dev>; Thu,  6 Nov 2025 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446162; cv=none; b=rJcyPJ7w81aF40aU2bGd0vm72FnL6TTIMvdV72SW88oGg5Fc+1xItqBRd/LoNolXnkqiHsqLiver+0nZMtuHyopNyG8yZs/eYXK5Dhr+XmLWzEnujLPEr8VK1TupS02IwnEHglFvP+cN508A2yLJ7LWhdXXtHxJGxZITSGIBVzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446162; c=relaxed/simple;
	bh=GHcYkdH+maGhSbqjgaMTYgrHBWp7Ejjef9/G9SDesw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSndpYmXhzxd74JLlQdNf1s+xOyHGno/1zb2eStOCzALEXFBq+2yOcS5UyKd8SDRKmL0Vcmbtm62bW/aCcQGbKMClRnKtfbvrRVLUN7fbVkUKfzO6q4LnSwltkeATTWctqWY2WasluLgiFdpd20EK1UBLame44BvEDa1aB7UwnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfSUAXO3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfSUAXO3"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso1206995b3a.2
        for <quic@lists.linux.dev>; Thu, 06 Nov 2025 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762446160; x=1763050960; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5kRvv90EQ+Dd8ei0fhEQuPjFn53nDjcX5P5hFZGW24=;
        b=RfSUAXO3AXQZ078GueiJfPCqDwntWnLc6n5KKQBHPMkEbh5bfckuLz1m0M3mu5HaBi
         8HwKdp4NTRIAgcm/QepblmBOBp5/DPvtOEjTEBXrd81hT94KzBnRwcRadin3/APEUVCk
         D2Niq2Lb3ncb23XJOMac7R7nynrBSDlcDpzSIfB7tuWhBCjV9VPc7HLap8YS8Q91SONE
         G4M6qZeochtXmb1whvTGWUWD+fqCw09+P8bV5JUCIuepney1aZJQYC0gcW3i/XV8yhh+
         xIlR1Vu1HLsrkzeabUMKqNO9OfWpgIc43IQhZr3771ngOd/N8/UuICPgNa4SwUAnGHBQ
         CtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446160; x=1763050960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5kRvv90EQ+Dd8ei0fhEQuPjFn53nDjcX5P5hFZGW24=;
        b=H8m5Vd8V/49HBP+YF413+QZILH16z1I5PA3GAGUFnRTWNyKPOraBj1DqnVYTNccb1s
         Zn3udx5D20ZWl5ZFdm2UjY1nkXSGhBM3PwTU7hmS7l8XDYVthB8SjRrnwA4iamAU+vEz
         WLcd414sUTxjw1FRogUn0iJ9IMnmEVyZPescKcuSjt67xIqWIBdY0tgK7MQ2ycFVcXBy
         QjF5fZM2ic1j8IEpQDXNndCiJNWcnDjS0QXzVICWJXqQxVByTlNcMXE73PUhP8hPKEqw
         oiv3dtxx53QS8m+t8dA477uo6x0CGykHNOwmE2S12tlib8AKuYMbSAwaLReI7sRdIwtM
         /PjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7/Uji/+nBebreFAogI2XE4NfdXEil7yiKUiCcpSUdtSlALD4EmqApZJ7xSfLCVdl4vWDc@lists.linux.dev
X-Gm-Message-State: AOJu0YyH2wnmMkh9b4zulFzRDjFqcPWl4tPyLBQxjuu3W64qy0ftyapd
	c2AesarRu9IprOQ7OX0oeVk7LYht6YX2UXB3L3ucUDNU5v8u8qOYr4nOMRrWa7Y/0SkhAMll5pE
	fJeUnk7C7+umJfjZCvv7QnK7oymgJUbI=
X-Gm-Gg: ASbGncvH4UjmIt06Cy/y0X3gSB+W+BYl2reqbtWeJ7K9u+d1jQF7/GDJ9VQVJeQtXvP
	JmuzsFvr5jzt6/0O1sdfoYBExT46WyR65VM9CepcbyRh3dAWw63u/+O3USMw7GYw4Vlk/nAngah
	tUpyifZyv488wkS2DVBM+04pf1RydNCTuYAf887dqmhrKRXYeO2O9fSTRd+tCYGAUBCVkALKo7v
	eVe+fqT5BdkoUZz4UFrk/VnQLtwKe1nAZikj1EILo0DKs8TkC2AwPGHCewLZjTlpsWGcfqa8Dly
	48/16vNTIuSwpfkPwPI=
X-Google-Smtp-Source: AGHT+IFoQ8kGpMaSLOf9Chd76nE7JZtndg7rd7Lyk62CBGgDgQsLB1TXYepHJiHyGg2ArQIQINT5oR2oXIcboX3kVmc=
X-Received: by 2002:a17:90b:350d:b0:32d:e07f:3236 with SMTP id
 98e67ed59e1d1-341a6dc59b0mr8442491a91.22.1762446160232; Thu, 06 Nov 2025
 08:22:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <6b527b669fe05f9743e37d9f584f7cd492a7649b.1761748557.git.lucien.xin@gmail.com>
 <ad38f56b-5c53-408e-abcc-4b061c2097a3@redhat.com> <CADvbK_c2gUNyDNYfgVrQ+Cm9rL6P_n+s0LJsrAPz0VK9FDDxyg@mail.gmail.com>
 <24cee5fb-1710-4d1e-a1af-793fb99fc9c7@redhat.com>
In-Reply-To: <24cee5fb-1710-4d1e-a1af-793fb99fc9c7@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 11:22:28 -0500
X-Gm-Features: AWmQ_bkUId-Zt8FoGRunxLcq_8eQS3aDbzvyyAAaLIOnKiFTr4a4r8IDb7hpyfw
Message-ID: <CADvbK_cJxGaam4gLCBg0EpNRWfAVyOTLZmD09LB=okWKr3prew@mail.gmail.com>
Subject: Re: [PATCH net-next v4 06/15] quic: add stream management
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 3:52=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 11/6/25 2:27 AM, Xin Long wrote:
> > On Tue, Nov 4, 2025 at 6:05=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> =
wrote:
> >>
> >> On 10/29/25 3:35 PM, Xin Long wrote:
> >> +/* Create and register new streams for sending. */
> >>> +static struct quic_stream *quic_stream_send_create(struct quic_strea=
m_table *streams,
> >>> +                                                s64 max_stream_id, u=
8 is_serv)
> >>> +{
> >>> +     struct quic_stream *stream =3D NULL;
> >>> +     s64 stream_id;
> >>> +
> >>> +     stream_id =3D streams->send.next_bidi_stream_id;
> >>> +     if (quic_stream_id_uni(max_stream_id))
> >>> +             stream_id =3D streams->send.next_uni_stream_id;
> >>> +
> >>> +     /* rfc9000#section-2.1: A stream ID that is used out of order r=
esults in all streams
> >>> +      * of that type with lower-numbered stream IDs also being opene=
d.
> >>> +      */
> >>> +     while (stream_id <=3D max_stream_id) {
> >>> +             stream =3D kzalloc(sizeof(*stream), GFP_KERNEL_ACCOUNT)=
;
> >>> +             if (!stream)
> >>> +                     return NULL;
> >>> +
> >>> +             stream->id =3D stream_id;
> >>> +             if (quic_stream_id_uni(stream_id)) {
> >>> +                     stream->send.max_bytes =3D streams->send.max_st=
ream_data_uni;
> >>> +
> >>> +                     if (streams->send.next_uni_stream_id < stream_i=
d + QUIC_STREAM_ID_STEP)
> >>> +                             streams->send.next_uni_stream_id =3D st=
ream_id + QUIC_STREAM_ID_STEP;
> >>
> >> It's unclear to me the goal the above 2 statements. Dealing with id
> >> wrap-arounds? If 'streams->send.next_uni_stream_id < stream_id +
> >> QUIC_STREAM_ID_STEP' is not true the next quic_stream_send_create() wi=
ll
> >> reuse the same stream_id.
> >>
> >> I moving the above in a separate helper with some comments would help.
> >>
> > I will add a macro for this:
> >
> > #define quic_stream_id_next_update(limits, type, id)    \
> > do {                                                    \
> >         if ((limits)->next_##type##_stream_id < (id) +
> > QUIC_STREAM_ID_STEP)     \
> >                 (limits)->next_##type##_stream_id =3D (id) +
> > QUIC_STREAM_ID_STEP; \
> >         (limits)->streams_##type++;
> >          \
> > } while (0)
> >
> > So that we can use it to update both next_uni_stream_id and next_bidi_s=
tream_id.
>
> A function would be better tacking the next_id value as an argument.
> More importantly please document the goal here which is still unclear to =
me.
>
The if check may not be needed, I will double confirm:
if (limits->next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)

If it's just one line below, maybe I just add a comment like in here?

/* Streams must be opened sequentially. Update the next stream ID so the
 * correct starting point is known if an out-of-order open is requested.
 */
limits->next_uni_stream_id =3D stream_id + QUIC_STREAM_ID_STEP;

> >> The above 2 functions has a lot of code in common. I think you could
> >> deduplicate it by:
> >> - defining a named type for quic_stream_table.{send,recv}
> >> - define a generic /() helper using an additonal
> >> argument for the relevant table.{send,recv}
> >> - replace the above 2 functions with a single invocation to such helpe=
r.
> > This is a very smart idea!
> >
> > It will dedup not only quic_stream_recv_create(), but also
> > quic_stream_get_param() and quic_stream_set_param().
> >
> > I will define a type named 'struct quic_stream_limits'.
> > Note that, since we must pass 'bool send' to quic_stream_create() for
> > setting the fields in a single 'stream' .
> >
> >         if (quic_stream_id_uni(stream_id)) {
> >                 if (send) {
> >                         stream->send.max_bytes =3D limits->max_stream_d=
ata_uni;
> >                 } else {
> >                         stream->recv.max_bytes =3D limits->max_stream_d=
ata_uni;
> >                         stream->recv.window =3D stream->recv.max_bytes;
> >                 }
> >
> > I'm planning not to pass additional argument of table.{send,recv},
> > but do this in quic_stream_create():
> >         struct quic_stream_limits *limits =3D &streams->send;
> >         gfp_t gfp =3D GFP_KERNEL_ACCOUNT;
> >
> >         if (!send) {
> >                 limits =3D &streams->recv;
> >                 gfp =3D GFP_ATOMIC | __GFP_ACCOUNT;
> >         }
> >
> >>
> >> It looks like there are more de-dup opportunity below.
> >>
> > Yes, the difference is only the variable name _uni_ and _bidi_.
> > I'm planning to de-dup them with macros like:
> >
> > #define quic_stream_id_below_next(streams, type, id, send)        \
> >     ((send) ? ((id) < (streams)->send.next_##type##_stream_id) :    \
> >           ((id) < (streams)->recv.next_##type##_stream_id))
> >
> > /* Check if a send or receive stream ID is already closed. */
> > static bool quic_stream_id_closed(struct quic_stream_table *streams,
> > s64 stream_id, bool send)
> > {
> >     if (quic_stream_id_uni(stream_id))
> >         return quic_stream_id_below_next(streams, uni, stream_id, send)=
;
> >     return quic_stream_id_below_next(streams, bidi, stream_id, send);
> > }
> >
> > #define quic_stream_id_above_max(streams, type, id)            \
> >     (((id) > (streams)->send.max_##type##_stream_id) ? true :    \
> >         (quic_stream_id_to_streams((id) -
> > (streams)->send.next_##type##_stream_id) +    \
> >             (streams)->send.streams_##type >
> > (streams)->send.max_streams_##type))
>
> Uhmm... with "more de-dup opportunity below" I intended
> quic_stream_get_param() and quic_stream_set_param(). I would refrain
> from adding macros. I think the above idea ('struct quic_stream_limits')
> would not need that?!?
>
Ah okay, that makes sense now, I don't like such macros either.
The above idea won't involve any new macros.

Thanks.
