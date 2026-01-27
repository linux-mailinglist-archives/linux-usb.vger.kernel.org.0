Return-Path: <linux-usb+bounces-32770-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGQdKTM9eGkYpAEAu9opvQ
	(envelope-from <linux-usb+bounces-32770-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 05:21:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E328FD7E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 05:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D2C9302D94F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 04:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E361C3218D8;
	Tue, 27 Jan 2026 04:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lwao6kVA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B03043BE
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 04:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769487663; cv=pass; b=dv02ASFppOHrqBgMuQi2fqjo5H1/jf2dxbWgOrLjjayOK6uu5NDXQna1ZHDWOu0UCQvEfGoGzbOfD62oFN2jhNL2yuQZrh5ubV5t3QpOhgX0GacTyHOpJoibIGKHb6kdkqco8ilGI4WQmyi7bGjCMHAVkcVBOoNUu075uOJBF7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769487663; c=relaxed/simple;
	bh=QGuLNgKUVWwgE6vVNwL0mPDyimDYATLC4PF38VkBCZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwcGX4XCY660NGE6TWAtFwVKkp59Virk7HedmuBunwCEjJ93rB1h168cfzSfa5fwFCj0jOobsW37I+WvSgVH8rA+Wb9YaaFGpWWgSlskmJ9+qX+LGc4mN1QCv+1mH2KLo67HfPb0Yo1WHbcApwmMIZrErIFVJe5Hru/s6YtpaO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lwao6kVA; arc=pass smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c531473fdcso707404785a.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 20:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769487661; cv=none;
        d=google.com; s=arc-20240605;
        b=U/FRFvQumcy0itL8RkTPHEKdKOiJb4Rkqkjm8DfsyV5PUnneK7dis8j2CH6Aal6bBD
         vvx+RQIotcMV3Ic7MafL6pClX2Z0yvBdXwDIbmGJBhBzcJ2fQIgxMix31ZJbCDheWis+
         QRwMh9QuU6d1Obm+RpNL5q8SaN7Y5CwmRDEmVSAohQbKYQlMkwD83yftOfGi/N8XbhYp
         7plbuRUzKTjOSf9mXsN6IksjUXImUDQ+nu2DT8i2FBAvDn15YvtJs6VbuJSRU04vMSMG
         HIRTC+8lAZFadR3p0FOYh5BiQIOBlUFojjQw/t4QTMz6FDihEqJVD79x/WHZPKQ+DJih
         IjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vIhnDe1MXsaKo5y6+UQRQMKim72X07VZpodVq29siKU=;
        fh=tt98G8IHFt8n6rvYfB1di/WD4j6Ol4aJv9P46lL/29g=;
        b=hadWTEaPCuSD+te3ZFswfbZ8ya4LOC7uJwD67s7E8mDQ+DCvG8dbRJrGuDcP5dPgK6
         2+kqrSxY4GBkmfErW/JKUxN7F9UtWu+WeJyCeJiQ5tL78fvKwCKAMobsyyy3fQC95aLj
         +K1fVSf9nEkhcP8kNekPk8nN5ld0+NoqMG4K0dyem4Ul8e/KSa8Qgw/YiWlD+R46FqsA
         0fjIAr9i2ErBsSXcztQkGqPB9LEcmBCA2kxB9h3iwD74Bbwhi9pnecUGD+eaybt+ZRqN
         HuEcwWXuQvWj3/jyph8eQZ2KSHZsdPHCC7xV4iuT8zQshnNKS2wdkndmBe5l6u0SUncR
         ZWpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769487661; x=1770092461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIhnDe1MXsaKo5y6+UQRQMKim72X07VZpodVq29siKU=;
        b=Lwao6kVA5kNOcwigz5l2IBTRwv1mhLIwhvDoykQYfEErXtSQWElHx7DwXnRT1XFnEV
         CQNahqeFAhJF3i8pDpCut1E6/nmi9GEmKJjg2yus42qi029l5IgMZDPT8PbuUCMCMd4c
         LgdieR61O8l37xSY3OBvxQFBIAwMjsltn5U3LxWEABJBGn8XL5L8Ywq1JCv0bpjUm8hz
         JGSJ3yZAbyYHWbJ8ZgEUGWsA04fGJJxq96zTpEgg0JXSKT5gZcQPlMppWQFr5FOdUpgy
         t7Kvk2IV8BhTKr4+GCBVaQnG1cMmadsR8pcArt3FFtSiirqqe9P7zYAqeBDd0LRCtYIa
         7Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769487661; x=1770092461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vIhnDe1MXsaKo5y6+UQRQMKim72X07VZpodVq29siKU=;
        b=Ybe+tZms/j5mvNJ9g/h/N6zbEbrEOEFl7u7LU+XcJMlrFxPp4bkR2Q++GshGUDjYY7
         JbshE+6xiN45J57GJ8qCWxN5lJE/kAdCMZMEYImUdjVx0EA8xYfntswEPlqCYqMbTJmC
         +T+1gpETBsIHlnND2kSnZiAiLSSYa75+1FpTRGMdzcftsJMKvGuqPqe4FVOhOpsVTeJ5
         IYJbqXT3vFNgQL2rgVLMXK6ew0LxVkQV+tK5nZ1e4bLJFiR6Rx2jDNzRNs7SBVQ8hD/m
         6/T+/SR5ZhfE8HGlEL4Fka0zknRMRm0NWCbfpWIKCXf+cg0lfo78/kt+BLPhikQIKsLi
         RW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh6CW5T+rjp3HVtT0KOYp6kjB1m08VqJwdZW93zJFgoOcGjqCoLU0r1Wk4VKpPzJ0xLATd3jX9HgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrL2OY3/7oNtgEU77P1cj3yJEN4g6bUZTOdmkiY2LiLn28h3Zp
	VPuUnxOPWaBPH/SrjCO99CnIF3IOEADxb5vraMaYFkXOjVrfzE1/F60mwLCdg9PwlQRF1TvtPUp
	igi6jWXrfTPiBZGUSjeoYEEtigB36U9k=
X-Gm-Gg: AZuq6aKaWJD++rGEOu1CiGZ9taOqwx1NpzhP0AYi90RK5GUvYyfdJkZsGPKrOXISww1
	XR83i424Xa3NWEFv1LmVWuhnU2gXsHyopl5aoE6oq6818I/J5uxP2qMcVZgWiu9UK1eSnPBX7/R
	MXgNjXyIeGwiUhmeh7W5hCvVdjRK20BhDbDAfmJweAb3LYZCI7rFzfjbBw/qohyeGaWhRyzeZSE
	Q6KUZng62I1XL497xGXvUh+r+5mz8CtlhP+VbHu1Xft+wktPNh0nLpJzQ8TZcpTLtTZXZ9mN6q8
	pADJ3+mcE1Ea3SS0ATyIG61f8em3cSqCFFTu3LkGySazT4WBw9x/CS4N34ep
X-Received: by 2002:a05:620a:2585:b0:8c6:a034:9231 with SMTP id
 af79cd13be357-8c70b8776a3mr58218985a.32.1769487661122; Mon, 26 Jan 2026
 20:21:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124040226.34390-1-enelsonmoore@gmail.com> <aXdxY81-bXBF2sRR@horms.kernel.org>
In-Reply-To: <aXdxY81-bXBF2sRR@horms.kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 26 Jan 2026 20:20:50 -0800
X-Gm-Features: AZwV_Qi2Ktx2ayGcgSUWZGIj6qsUhXatp4rlJGgFB3wZBisQBK2jC6wPL6_Gm-g
Message-ID: <CADkSEUh3mOq0CJmMbKMt_qVj6552y7r0HsE=D3sW3YiH2gnErg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: usb: sr9700: clarify code using BIT and
 GENMASK macros
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32770-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21E328FD7E
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 5:51=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
> My advice is to wait for all your outstanding sr9700 to settle.  And then
> collect up those that are left into a patchset, addressing review of them=
.
> And include, in that patchset, this patch, in it's full form.

Hi, Simon,
That makes sense to me. I've adjusted this patch to be part of a new
patch series I'm working on, and to adjust all bitmasks, even ones
that are removed later in the series.
Ethan

