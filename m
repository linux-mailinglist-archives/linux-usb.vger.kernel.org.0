Return-Path: <linux-usb+bounces-36546-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD3eK62D72klCAEAu9opvQ
	(envelope-from <linux-usb+bounces-36546-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 17:41:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B74755FE
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 17:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61C6A3061708
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 15:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D90B3DE43D;
	Mon, 27 Apr 2026 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZl7rvb8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC83DCD81
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303822; cv=pass; b=C6s5sfxX6rse7anOX2pPjqbsPTXa/e5KOccdvZHDD9vpXvdMxPuFbPh+caYkbGI/Lko6TxUIwsoYRHzjx9R3p1pYNjyQmHhn7Y18pzwog0XTI1SwzXUx99Xh1+mqpfSmfJvdZZhfZ9pXmcYWr6MxVyPvKr5qqIsRAYiKfMBPAJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303822; c=relaxed/simple;
	bh=GCwKatNNar+3ytGo3nZKd7tNZGkjdIGeJgU5RLwcvj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+hkiMbx4tyxVmQ8wKf/dcLyB6nIK3/ewLOWwRAOipUX/5HR/EiQE7W/7I1cluRvTublXGq8+6i1Yumeql535TlXe5JGCkOUQNoEILQvhwAgXn/RBDmE8evZgrN7D1KbI/HzAKAYwVHk+KL/W4q45v+g1WRCeN814cuHtuNYF2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZl7rvb8; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6501c9903edso10453774d50.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777303819; cv=none;
        d=google.com; s=arc-20240605;
        b=P1NnR1kiUg8qBw0AFZXFuX9kTJJ609mcEZH5SWiTN48lK+d77DSYdF0phQ04FKIQ3S
         g01gEACTrSZmcMqbCGMRhn4ZlB5CIBQDzBkLJqPypiH3naqhMA0IU00nL5CqheLeHh3Q
         OFwe7R/G5cD9zW0kgIQ5BxDM85SbfUqVpZHTfHB21hhZ+2flv2LK3Qz+CiqrBbKbIyvQ
         h6qWw+110ot71a005xL/kRqoryYe/0kasUT+NBQ4mfy58Gmu+KiDSgenN9fiZEHB61Hj
         ZKBryEJVu4Uls5ucTF8mhEmVcFI2t8siwux/PyPx0bWLZ2MgTvHffDIEV61Ab0IIKpgO
         GV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wopAs40F+RJFZTUGjaEGMPUBPuNhbGRlaz39GhporOM=;
        fh=eOuc8maQ4jFxi5WKKceJF3lrLNwql5A639QtwdfHMtk=;
        b=OdLMGua3jvWROSurwkzBKOO8w79dUGfDDizKisW+Y7pKImAR5xU8mobGeI58enJ9dw
         vrCSPKZWGl39myZ1OdGr8DTpP7hGt/okldyYcmYDzJ0EaTPD1LWPOHk+Kk105752j83i
         e0akojIeMse2ONf1fy6Stp/Mj+9/b7h9mQcPALaVZKc89fOWYvYwk7omTAL8hW5+rELg
         A7WSQHhFgHyxLLFeMT6A0K9VRBRQ2biVoatWyWfw6Oyw7WuuMVjEM1sLlboZog6ued0d
         P2s8svc1TWWZt1ni7BJm2RuxAK0fnNRBZKJN+DeVyhrM+vKEtxThbtTZBP4TlvKPorTS
         jMTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777303819; x=1777908619; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wopAs40F+RJFZTUGjaEGMPUBPuNhbGRlaz39GhporOM=;
        b=KZl7rvb8lf+sBbOnk4jHtaoH1vNRh94P/hVDm7+cs2/FKBCPa46GXQ2tp/jWtyeVI2
         FA8mxlmk7eKobRckE8qSOokqGx+oGCFY3ZQAvSxaAI1wxA5fvf2mVUexoG/icCVk1TMy
         KyYUVyzKUXyvrZQF1bs8WZEcGS2g9fDj1tyTPUyPXKHlQRE5Hdp24jNdA2//pZWA96Sb
         OsIc7ZX4RD/5GAwqiECwwcVmMtsZn2WbENhakwf0Qni0yZvNVabQcI5468V+4ToznKfl
         QmJW5/DvIuWgVSOcCb0Zib9yKLvE+tsjWJcbrb2yFhHOnjWR/gfSztjZx5lQ7cItr91c
         eUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303819; x=1777908619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wopAs40F+RJFZTUGjaEGMPUBPuNhbGRlaz39GhporOM=;
        b=ohJgxGxXA1B3rfeAUwSF/fyPfAuk2r1wLw0v8jeEXGUGPuG8TS7r9h2z8A2MGvr+RI
         j5tzeGzHg5CzrCNPIiCFrNXeO8SVAwIC+vjzjd3C3TxqC+j4i1Sb4c4XY39t/tcUHTF7
         6Hvnr56N4oKxjqod28zpgUjO5DJngwddiNKeW4VbOV0lLziXC8p0AtcoefYyDCb+twIo
         cqlJT3T1lqnMQGA1y+QwQlDvv9KiJXGm7tx4Nh5QRaBAmVpIdN+AS3Tu83bdO6QM8lpJ
         nPf8ptA0n7QfB0V/kpOkkAWCANfT1DC4uJgqmLS/4vzc4UjRClAsmlkkrpV/eZikMylp
         UbLw==
X-Forwarded-Encrypted: i=1; AFNElJ9cnDsTzt/gdGeBOkumFqU61MjkKGNVjypRxAi+eyIB33IrqY4kYw4jHEmIWwBmTLMc17Mgk5evdh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuTAH/Mdph/6zp513oJtb0JuCRYkVjlZltOWcsjVt1+1iT888E
	FatlxR5fov4esdu37nCuTJoWv17pJgmzbc9qEext/491LdudRRhoRTCX3PL5qYlBd/bdd8fGjNW
	DJgTeLFxjhVkY6ASc0lgiPSNYIFtox1UobHimT5cFSg==
X-Gm-Gg: AeBDiet1tI3adpFkSEAKynBD0fNI/UyZdJ4EtVXxTm0zEnAxxaajQ4JOFVIBXH8CrJp
	z3x2hifWtngLF73R7VI5FmW43EesV98UGAATUCKsgfZgCiIzBOaJRgSqdDzJE4Lcaril6yrSNTo
	B9XwD7oCWkSuLfIyj5b5Fu0z7ALbkUFHWRWGQKhBeB2lWqr7+o11Q7rsYG/T2vhgJXJII1TxspM
	Zmk+JnIK7pBXwU51StvpidI3Ja0MBpSjSmID5pQ88/sKo5yxsvXFrkIQgjJp/t6XwumxoDP+aWt
	S9wInTMhFrNOV2eUqhum
X-Received: by 2002:a05:690e:1918:b0:654:9654:f91 with SMTP id
 956f58d0204a3-65496541a13mr15482214d50.46.1777303819396; Mon, 27 Apr 2026
 08:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427133107.334429-1-lgs201920130244@gmail.com> <982f5452-36be-4401-acac-c9f8ba8ff83a@rowland.harvard.edu>
In-Reply-To: <982f5452-36be-4401-acac-c9f8ba8ff83a@rowland.harvard.edu>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 27 Apr 2026 23:30:12 +0800
X-Gm-Features: AVHnY4IGM9jn954jisHrVPvAVF-ro04mTTaDdyMTsp7VWKWZEgW3x5qekBjo2Yc
Message-ID: <CANUHTR9uTfR3CQF3RLxYVWFSoGZ8B7yV=vowOqx4BBWGHk9Srg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: net2280: Fix double free in probe error path
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Chen Ni <nichen@iscas.ac.cn>, Evgeny Novikov <novikov@ispras.ru>, Felipe Balbi <balbi@kernel.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 1A0B74755FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36546-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Alan,

Thank you for the review and correction.

On Mon, 27 Apr 2026 at 22:36, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> You should remove the braces in the "if" statement as they are now
> unnecessary.  Also, the Fixes: tag is wrong; it should say:
>
> Fixes: f770fbec4165 ("USB: UDC: net2280: Fix memory leaks")
>
> The code before that commit was okay.
>
> Alan Stern

I will remove the now-unnecessary braces and update the Fixes tag to:

Fixes: f770fbec4165 ("USB: UDC: net2280: Fix memory leaks")

I will send a v2 shortly.

Best regards,
Guangshuo

