Return-Path: <linux-usb+bounces-30513-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0241C5BE45
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 09:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 405394E79AE
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 08:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731FB2F6939;
	Fri, 14 Nov 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="38tbI3kA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87763275AE4
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107730; cv=none; b=dUgZ4g291U4PzTfVOdkFwavSVtl6vxLXirvJchAEHFnd5cLnWDNhAsxntzsgnMjZhG+jhO43V94vmALsXsFgDTr4a68TxC7WqqaJroF2enNeQL6wDIN5sGJiNDURA6PvD+YOoL11feTD6ALraAG6PyU7SgbUFEvuR70q1+Uabik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107730; c=relaxed/simple;
	bh=smboXSPnSyuQg0Jfbixci8TkTxPDq3bDlst3LL2pjfY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TAlWfjGq27gOIc/F+WLO0Eb6vlUjevuu22uSipaPYHao2i3XrVDYQXKpi1KwljIQSX2RqcJknrjKdetuXz02NPR094jS2Kf2ARboVtp2S5LrPHOAwHF+qAwenjJczUdzGi/3N/Ax1i/95u1mIwccpMNq7Ed7RS6EIXMeP2HNpck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hhhuuu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=38tbI3kA; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hhhuuu.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1440020a12.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 00:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763107727; x=1763712527; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FaZd0pLqMSksiOjb+Jw+W1+Jt+Bqll3R9KqbqD770D8=;
        b=38tbI3kA+GFn315/pcL4Da/SxJofDfmrHmv93PvIiQWAZA0vrx5+rjvAU+ckdl81GD
         kJ/qkOwChAIJBx98T3wPSNzK9lGnFM0lCK3xsU/aFOA7M6LpecTGbFInfSHNR5eFzp5i
         DZyZXxmruP8xuNlf1mFJPTCDoWUS0Eb4zUhvyLoP3IlP2iBX7nyDq3zB24ZK5gdpgHCG
         AnSU3owiGRVh/Hw+xWjMe6ZlRLHGM5XbVhld4Y+fQk8F7dgh17/g6zSI+uIgfaqGzgXO
         zjb/F6sLpuTFYXjN3JOMWGHnyVFPtlGgurB44Zi+7cVn2f2B4eLMANhfoNQzBdJ9wQdr
         Lv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107727; x=1763712527;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FaZd0pLqMSksiOjb+Jw+W1+Jt+Bqll3R9KqbqD770D8=;
        b=OyEVujF66QSmsaRrKZVtJcjnK92goIzqsWD/zfXbL/AEeMIE0I7D117rgD1l5CKtlF
         jlXRusiUfrWfFvJ1ToILAl6RGtIbLiJrb53Vd3lISsyZn/k3mDc6m5Y0F552LV69xPwP
         42BJwgmcr7JodK8yugsavgO/V2J8VBqecUYBYogvXcYmvAyv/+xlJvKSBy1SdivaXT/1
         N/ZirRJLO0Xa9qXXaXpAW9XUgj2qmFdbXh5QFIwpg9NIP7CdCkDFodtdRwK5s7liTHUk
         TPiwQSzTFLfY572M55WXjcP7qgzdSDX9vvmN2vx10KLXwazwuK4JR9F2Czxp1dvl5y8e
         8lhg==
X-Forwarded-Encrypted: i=1; AJvYcCWyKtUfKNT7X3kQJhjD3s0AVXOCsvIBxt0QAFitrMlnPI5LLa65Uuqi9bdx7Dc76aTwIvVrb9931ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yj6VZ0i3ARSgLKMYOIIneyh4rhLQpAcZUHVW8glfEAu850MS
	exs+Dv3eHptVftJ5dUnruksijn5azWxE4TOByDnspk0ZAzikOS85Gh39Fl0+h9+PXURI3fg9KLC
	OZEeUJw==
X-Google-Smtp-Source: AGHT+IFyahqRDgCTzEk2G6XerYnaF/ixiNmgFZ8qFZ/mRyHI/Z+svgCP6tH+CS9dbmYU0Ls78Ln6iVi1Ifc=
X-Received: from pgnr18.prod.google.com ([2002:a63:8f52:0:b0:bc4:233b:be04])
 (user=hhhuuu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3ca7:b0:350:55e0:5522
 with SMTP id adf61e73a8af0-35ba22a61d6mr3388572637.37.1763107726552; Fri, 14
 Nov 2025 00:08:46 -0800 (PST)
Date: Fri, 14 Nov 2025 16:08:41 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251114080841.829128-1-hhhuuu@google.com>
Subject: [PATCH] usb: gadget: udc: Fix permanent block caused by 'deactivated' flag
From: Jimmy Hu <hhhuuu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Jimmy Hu <hhhuuu@google.com>, Kuen-Han Tsai <khtsai@google.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Roy Luo <royluo@google.com>, Robert Baldyga <r.baldyga@samsung.com>, Felipe Balbi <balbi@ti.com>, 
	linux-kernel@vger.kernel.org, badhri@google.com
Content-Type: text/plain; charset="UTF-8"

When setting a new USB configuration, some functions (e.g., UVC) can
call usb_function_deactivate() to set the `gadget->deactivated` flag
to `true`, intentionally blocking enumeration until a userspace
daemon (e.g., UVC service) is ready.

This `deactivated=true` state becomes a permanent block if this flag
is not cleared by usb_function_activate() (e.g., UVC service failure
or config set while unplugged). This blocked state persists even if
the cable is plugged/unplugged, as the vbus_event_work() handler is
still blocked by the `gadget->deactivated` flag, preventing pullup()
from being called.

This patch fixes this by modifying vbus_event_work() to clear the
`gadget->deactivated` flag *before* usb_udc_connect_control_locked().
This breaks the permanent block, so pullup() can now be called.

Fixes: ccdf138fe3e2 ("usb: gadget: add usb_gadget_activate/deactivate functions")
Signed-off-by: Jimmy Hu <hhhuuu@google.com>
---
 drivers/usb/gadget/udc/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 8dbe79bdc0f9..0195540d511a 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1151,8 +1151,17 @@ static int usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc-
 static void vbus_event_work(struct work_struct *work)
 {
 	struct usb_udc *udc = container_of(work, struct usb_udc, vbus_work);
+	struct usb_gadget *gadget = udc->gadget;
 
 	mutex_lock(&udc->connect_lock);
+
+	/*
+	 * Clear the 'deactivated' flag on a VBUS event
+	 * to break the blocked state.
+	 */
+	if (gadget->deactivated)
+		gadget->deactivated = false;
+
 	usb_udc_connect_control_locked(udc);
 	mutex_unlock(&udc->connect_lock);
 }
-- 
2.52.0.rc1.455.g30608eb744-goog


