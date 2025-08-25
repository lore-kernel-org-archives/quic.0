Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBF8305E3E
	for <quic@lists.linux.dev>; Mon, 25 Aug 2025 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756143758; cv=none; b=jdEuHEzn8GcJfOpqES9OgE5Ssj7ddlUdFNUayf5MoTvqgBgLvNuLEZKagdPvFNTQ0HivHpRoeYUe0rf/gyoc+btXM1WJChQ3HfLMAswmDUX5ERpwnTYfDcFDXjRZmuTap0pijgsl3m5n8T97LqmTTE94mZaazjrS/3er4Q2lAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756143758; c=relaxed/simple;
	bh=+RBQYV6eM3JRVfE96AICraJ2bI9W/wj8PUgbVulMp0I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Vc1NvD9FjiAXz16TbiQkY+cMU0lQHGwdztX/qHbYucuiqKjakJNtnH+fHpEME5atJK/bps0Z0v3KeqagWzJdAWAlZUlvWuGZspdzhUrui89Jel6aTDgcS+/sS3GBDjkNmN4Rqoyr28eFkSynE1twMY3xtOlLTCDwOeL5mK8Uc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=W19gFqKE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="W19gFqKE"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f48d62057so911271e87.1
        for <quic@lists.linux.dev>; Mon, 25 Aug 2025 10:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1756143753; x=1756748553; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P+enN6EdoVTb8pAtjBuDrmQSJ4Ta27+MaPSsesOZU5Y=;
        b=W19gFqKEOq9mL8jS1JzE1Ir/kvsyqianNcmmGcWjGOxVoKDFYTrH4v+4EZxYZnesxC
         KepMf0lHvoOxhPAeYise4VzIjSQBGV+MxkyUOGKA3dQLSbg0NdStjeff++DwMxfvSzP3
         sxqRn10hc1GHk87+CmVaReUbpZzl8GmToEPzmY0ZI2iCx76fYz0cnsrWhtzWaY3/Nvsq
         V6nciLXrXmXmd1hkl/YP9qDAllY16ypD3K12D2KrWcR+CQo3UPTykFALeEIw12rzZZ+2
         BnnPYngmzKeY0/jD0dBdw8tEJf1Ze5ndHcxPH+24MUjaqrYkOvAmGL5L4wZOfeABv6EK
         Lf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756143753; x=1756748553;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+enN6EdoVTb8pAtjBuDrmQSJ4Ta27+MaPSsesOZU5Y=;
        b=rnLxGReVPWJ96XIptpYwsSzHl1dBOjCpjMCDNh72CniGqtRZkiY0qXyBkEr6SIJldO
         ARgYpolmHFgt0wgcIH5joUxmT9lPE9af7T+lBnBRpT/EsRwZI4KN6O+v6jop3MsVnUc8
         e29dFAT6jo+5mh09SD6woQXBvj21fKdd5RpJ9qORuH1aImZe1mDgQZNBl17cDfURkmtQ
         MFd0Cx7RFwUbZq1PMvAgCc9JAntENqaU+48XjwYHhFEOrIdyWieQpRk51XjXEImgUUCN
         azq8uIx3dNvbKj1LHKRNEgeLDVjm+Iyf5nDK5nOtiwuKPpOcSx3dQzoLweFjSD1uqEW0
         UMXg==
X-Gm-Message-State: AOJu0YyfWw1CCY+dx8YMJYzt40NW3VBg8elIUAzJVXiAEUOBWk1ajV12
	vHG4xCQgBRIItE5qCtathZ5Nn3XJGKQwy8+4Ki4+sQDoFND4pG1bcK146FZLCEj0+WpituqAzNV
	TjbF/O45SVYvd/bmEF/MEMLuKao/zm7thU2EYYATRL76lMz5oNf+PUR8=
X-Gm-Gg: ASbGncv/OX2IfBRy1NTSHvXl6dP2aOCRWjdabMg27rZVhlmOg+VleTNzhvAoIz0WXK4
	f8G18viuO24VRP2bG0gxNmKzUMTb8lY4uN+NLb2pJyerKj0zjVORdkSe26Tt+DnMglf41C2sNlp
	Nl78wGDn8T6RJG/964Ab8Kq+5fg9kTCS2XBxTvqWbC6dQ+Rj4wZGyxToQddBp6q0mWqNj8ISnSX
	03FtR/yr1C+c3GFToAonrmrmhUyJ9LvqIdOL3zBAjcAH/wfLw04
X-Google-Smtp-Source: AGHT+IE6Fgcvcsvz9e81CtTHPUO04r0Ee7qZ94LihK28XZ2EPX/7O+c/Xwy55JNji42QpyOo7iA1ryte5+0IJ53pcNA=
X-Received: by 2002:a05:6512:b0d:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-55f46330e22mr971297e87.46.1756143752824; Mon, 25 Aug 2025
 10:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: quic@lists.linux.dev
List-Id: <quic.lists.linux.dev>
List-Subscribe: <mailto:quic+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:quic+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Mon, 25 Aug 2025 12:42:22 -0500
X-Gm-Features: Ac12FXx8wVIzLVC1u-UFypRPutveNW68wHQfJhQqtzfk9KnIQlsneEyNWOSnDwA
Message-ID: <CAH=dH9-i10xE1iXofR5vNo9pEO-1NfOeUkNds6A_Fsd4whK6Sg@mail.gmail.com>
Subject: Test Mail
To: quic@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:


 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.


-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
