Return-Path: <linux-usb+bounces-36465-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AWaF7j26mlOGgAAu9opvQ
	(envelope-from <linux-usb+bounces-36465-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 06:51:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F57459D89
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 06:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CADF03010EF5
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 04:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6243F33F582;
	Fri, 24 Apr 2026 04:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxM62EbM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552AD531
	for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 04:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777006257; cv=pass; b=ODOiXrIZY6gvwwUfjuaDKTpFf1pF3eIVV7KKKLd7ujPVgf02TKq8uvgcN2erCBF0rdRD1AkkbWFip87hTbhDo/L9nauHRbQt6cY3Vnic6b17shuKTmYrCgTyYcHs6PsWXBYD0FxZFwiYw+I+rhdo/fh9E3ItoKVHnCdOsLeMEqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777006257; c=relaxed/simple;
	bh=eZxPyOI7kIXASI8JSjAa19l/cFTHnSC2+WfbC+iOXq0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Rsez0lm5RHJZlNjSGI3FJv7+R0TbNVc5Qyg2ZZNerdChE/Kkm4R396cS+whr7hLHXSjaUG0ER3LxUQlPjH08ds8uVzpxaIjpLap/l8kDHc26KsxrqnQmLaTRffUSzTvoLsz9Pffxp4m9+VrXCkEz1XyKPmd0KRZ+8rQuEgx99xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxM62EbM; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79ab5fd969aso84153357b3.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 21:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777006255; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6yHPJZUlu70EPdBn2fTTsfWCr23aWPZg7D/69mEI20AXmOYuH/5NTKa20BoUrb3No
         jgysVmquuNEpVb9YYs8XUZyA1jlcKbS/o+eDGp9UyMNTG1uN5KF5i3N+wLuv1QbKaisn
         bDFAQvuBsBGD6VckbC5O6sOnpTC2UaEEq5Xi375Iszv85GNnqZMIopDjQzczhXPfgufR
         eHZqrD+QgO8w03GNBfG9py+vVMu4SLWiGGZhchb6dpb1bJFcc14OlUiYGNbJWzgnuxfW
         /ivvawYceplL1I+jSsFcUqqzFAPb2EwhYP4b0IQb9hjB5ZS5HDybAUkzHzAUr31xpiw2
         QnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=L03TIIg9c9RQuU6ORmGTUAjQjlR24b8yIirqeU/ObqA=;
        fh=E4YctH2pDyX9emMEAkV+EN6qCE1cLzZ4Y7EDscHtA+0=;
        b=cKuZd3KV4RLJjI+A9hzJJ+YTR5xkbQBdqH5B/ODPi+k2j9VFvhsla2h+mjz+81RYwZ
         LQ4wUUj3BuVVGHXL0OI5iSroiPDuDFPoGEm41UlPIcLlJ7HvLVm2SSUKgjOj1QpJ8W79
         szUlFQzitGClwqJL+jsrFf95u3WZG6E7RlRu1w/ekYFRIWGuHYL/zpyG5DzsQUS3cqOU
         vckH8Yj9yyO27FqzbHqogQf/Xsd6ZRAguK+24NW80GD82wM0/MhFmSHMOiR6oTB4ZvsX
         vJ7WxU2wvUTQaoie2C6UOED023X/kmbHX8B3zLDocKl8G9c+SLni6dSPBGtqiVmpuM/E
         N4Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777006255; x=1777611055; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L03TIIg9c9RQuU6ORmGTUAjQjlR24b8yIirqeU/ObqA=;
        b=nxM62EbMukk2iJkyKV8LKvz0zVcnZkmMzdGoH9jcdx1oTmZtlarj66oV4NLU7TCTeP
         FDu8jkIPm6flUOjQtR0c3M8wkjpciy8PnkmMUkGwtECnhJ8nHm4TciB6FZVs+90Up4lv
         0r47TY5zsvmNAYQBFshk8P561r2/YDxbNCPSTUi5jUAd07gALXISVzsk4hqtlJRWyvW1
         nWiggerOhJIMiNym4IBmt89TXA6h29bn6tLOalRQMTUW8suKSym2XObOsEZwg7yA4j51
         nbU1NGI7Ip3zOgkJ1FlNBoxJv8CbVxmyvNFqLIRFtRC3jGernD8y39jAkeHSbfsw2j3W
         wh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777006255; x=1777611055;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L03TIIg9c9RQuU6ORmGTUAjQjlR24b8yIirqeU/ObqA=;
        b=ja2cKzXH4jRg1W97ayM4UfRcuzXxQGbfY/VYIAftEqpo6RozfyaME5zjkvT5+CSEJE
         YlmjCV8OO51QlVs0T/3ExiIfZPSPM0iOZ8dGn63BRNKOJQ7LxJqZTNHQDqRf9xrzsPgl
         cjtoTCwlSgt4Xzqj10f2Z4fUwBX7Ybz8SXVqzQR2i3DmL6t+FWxm617uCjLugBDflmBM
         jVDTY9mlIC8aBqKq3ZKsdD95BHXZAJEAuUiR+PMOIqY3AApqAswASJm215F0WsxskA8C
         rtgziUag0ZcWyNkUyDZkoawhv615istjl+5tyxbpPQxQSuwP4QoR3d2A39Cp8mSCBilm
         YIDw==
X-Gm-Message-State: AOJu0YwYX50WxcX3Kr1c1NGB7AO81v+f9VoO1FuLNIHeFRBguIDg753W
	Y3Oji8w6XPBCjfwjJgrRymRu7hq0vH3whZHj9UFfG30FN3a8k5HAOHuAb65r9yP6bPf9gc1TMZn
	tFie3yLmJn4BK5NB+FEvuXwBgCkurfRE=
X-Gm-Gg: AeBDieu+F3oDLfl0i7ECsR9a9fcH5fhDlADncTvO2uGi1LLpkuOK+7WyhdlRRKGlBDj
	/tw1kyus4Llk1YHLYgxC40PAfbAGT7itHzWzlHRc5nNDwgEY7n5YuJsMylkA5o86m+UD4meSvR0
	XI+nKh2qBCTLfOBZT7/DXVEv6wJrkFPZ/edWSsYnSRzxzQ3XWK7LSPCrTLsds5YkZhPDz/m6Iuh
	0ix0tl3k0QmsnOA0kqxyc0cVXbzbPKwPSkWaHSqrQ7A4xAEWIjDwKT+6viPVYlUeYSC7WhHMQn0
	US8AeChnme0wV72lF+AE+CudY5/CcMc=
X-Received: by 2002:a05:690c:6e86:b0:7b2:64f4:a2dc with SMTP id
 00721157ae682-7b9eceb27f8mr289137087b3.9.1777006254735; Thu, 23 Apr 2026
 21:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Fri, 24 Apr 2026 12:50:43 +0800
X-Gm-Features: AQROBzDxezebAJBegfqEj7wPh0Hj2VNnuDN5mxMBXXOMIgv73Y6ZUAWcqyjGgAE
Message-ID: <CAGp+u1YAUsw=qCMky=mM__mchVEP=e=S3WgVk_A87FLXwpm9vQ@mail.gmail.com>
Subject: [bug report] Potential deadlock bug in 'drivers/usb/musb/musb_core.c',
 between 'musb_g_giveback()' and 'musb_stage0_irq()'
To: b-liu@ti.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C8F57459D89
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36465-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Dear Linux kernel maintainers,

My research-based static analyzer found a potential deadlock bug
within the 'drivers/usb/musb' subsystem, more specifically, in
'drivers/usb/musb/musb_core.c'.
This deadlock potentially occurs with the involvement of hard irq.

Kernel version: long-term kernel v6.18.9

Potential concurrent triggering executions:
T0:
musb_stage0_irq [t1]
     --> musb_handle_intr_resume
         --> musb_g_resume
             --> spin_lock(&musb->lock); [t2]

T1:
musb_g_giveback
    --> spin_lock(&musb->lock); [t0]

If T0 (i.e., the hard irq) occurs after T1 acquires the lock and both
happen within the same CPU, then T0 will not proceed because it cannot
hold the spin lock that has already been possessed by T1, yet T1
cannot proceed because the hard irq runs disables preempts.
Simply speaking, t0 -> t1 -> t2 can lead to a deadlock.

Thank you for your time and consideration.

Best regards,
Ginger

