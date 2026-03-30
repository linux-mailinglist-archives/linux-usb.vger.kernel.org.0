Return-Path: <linux-usb+bounces-35700-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGJWDY4Cy2k2CgYAu9opvQ
	(envelope-from <linux-usb+bounces-35700-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 01:09:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F65362463
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 01:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FABE304AD0E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 23:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768DF3B4E9A;
	Mon, 30 Mar 2026 23:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApSQSqDC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23337C90A
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774912022; cv=none; b=tdvW6txpaLE3oowPG2m1Y6JesahUh1uq0eudsmm2C42R+awUtHrKNe6BtcMa4SwPR1n2e0POymp+KJK5aiPyNGQJVeqvCNOZw8JyVsa6WH1yrPevsmAng3mceQdBDqfd5DxLr6iSEldbzIuWr/oO6iy4fyGGOvqrHDxSI3lJd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774912022; c=relaxed/simple;
	bh=lVi9fbw+5ehLHwAy5mSHqojU6979t7AjxSx8xyHdGDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oAy9uMay5+pDjNnZzqn+Q7qXpn61ReInNF9ewGMN0nv30SKCTGpJkuRUAOTGhYfLXtFGD6lF8/vsdPArRmbWtli4fKut/8lsH1A9fkA83DA4K7oVY5vApXzRN/goZg2azRdqhzIT6cNneKaSyMeaiwEnGnmhY2AaPP85dv2TdHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApSQSqDC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so38445325e9.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 16:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774912019; x=1775516819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXlVTZh0nZUrX6/FvVb6P/QWtzXF6yzkjdxzhuy5lIU=;
        b=ApSQSqDCDjFbKBYazoRTi2isbDwDby/shYtZEPm7QFceMlp/fvAatWRzqJAGyhDW5J
         tnZjanAte1TFLpQGuNJmOCG4dr7Noz94JbCKQ3vkfrOfVdcdsCl73G63RUA7Z8vKdfMK
         iGwA55qRMxmWc+Ntv653+XDncoZu8EJDigdJRm4MHHiSJs1bkyDA1dJr1yKts4BjerqC
         iTd76JlQl/6dVmYuFymZJtgB9m/291FmUbsAZYojWk/KOYOfEmtnGvhrJqkB8Qr4dcR3
         3Gu6F52Q6naiJYtdnyFhX0XtmCg1kkmqUbbg+/v31SLX1fGrwvqOY/FSDeg/SSmIsrXg
         OaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774912019; x=1775516819;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXlVTZh0nZUrX6/FvVb6P/QWtzXF6yzkjdxzhuy5lIU=;
        b=fPTEVyl3fXegkkYJvCzoiSbpGfzBd1wW8/PaH+bfddVp80+aISsUXh0yLwdncJ0UZn
         ZV827aTQ9RZ/j7X5vd98+RrZ449sFBUFXMCWgV4/AXKylRWguGRDMIaoqF/S6WrdxqzO
         IYRoJLRgYBJgZ4nOgjHT2iqGnz6XbPNkKVH1P9MBnanTb8bk+oRycrhjhWBj+jD1aDoA
         9D0uUPkOvgToX13Dn8hKbZ846M/zorLuX6XqhngPt/BadZX50OAVSbGL+KK4N8LmcCfr
         mg7ltfNZr9r1ysI/26jXwj020vzx9tO/7BK71FCTrpgggXEcK8P6AuLmmDe02AY+iQfd
         DDlw==
X-Forwarded-Encrypted: i=1; AJvYcCXwjnM2ed4u9yCwo/1lVBa0p3PMSVKiJnQqBPVOXUOedK2tAdIcwTXuPmD87jO2ERioZXWu1QkdqNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JYwyejCAkQzsYvhvUYf2nisfrwVWE66p8woppgz68UkvIdXs
	Gan+TAVw+98L+tPNuYC+IOU3tbrBbRu5m+tSpW05efPkKxmd8wEn/Di8ljKomw==
X-Gm-Gg: ATEYQzyPyw0lqc1hWprJaepA50NmTrCxzP+YiuoYxyFKEBXcvQEz+WEKnmMNL/GIOhX
	01Fr0ewwtgaaj2XH+4HY7LVDnR5qCUtw1o5RwXN2o4NwgeqmyXMEAuaE3pUwlvNrvImL+E5UAnA
	MWlEV01R10pX1Ic+gGyNaYk+rBg7G9BMOU5R7+wjoyAI5aJtWuvsbMbVZCZ579Ej4sG0ZnkgKS1
	aNuhcItd4kuq9Lv7+bI/898QziN5OaCHqk3UdigaNp0zhizhtkt9jCBpoEMXa4oBqC1lF7sVTCq
	YtIQhfzB+SvPW3CZgUrOOVQv+Uj+t+iGhmgtmqySizk1qaLuFR2wxEWeDLXK5v8kqfevfGtqd29
	PXOpHuFiGrucPQHBcJX3d5BTVqnR0UwSFFAjeBVWK/nKT3zJwR28IjCnkWh+EZH8lRwGYOWJJ12
	jjkWzIuqleN7xjXCJj+G7DNSiR4iGkrOLT
X-Received: by 2002:a05:600c:a292:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-4873d34639fmr53269585e9.6.1774912018978;
        Mon, 30 Mar 2026 16:06:58 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9506dsm297019645e9.7.2026.03.30.16.06.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Mar 2026 16:06:58 -0700 (PDT)
Date: Tue, 31 Mar 2026 01:06:54 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Make usb_host_endpoint.hcpriv survive
 endpoint_disable()
Message-ID: <20260331010654.269ac270.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35700-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B4F65362463
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

xHCI hardware maintains its endpoint state between add_endpoint()
and drop_endpoint() calls followed by successful check_bandwidth().
So does the driver.

Core may call endpoint_disable() during xHCI endpoint life, so don't
clear host_ep->hcpriv then, because this breaks endpoint_reset().

If a driver calls usb_set_interface(), submits URBs which make host
sequence state non-zero and calls usb_clear_halt(), the device clears
its sequence state but xhci_endpoint_reset() bails out. The next URB
malfunctions: USB2 loses one packet, USB3 gets Transaction Error or
may not complete at all on some (buggy?) HCs from ASMedia and AMD.
This is triggered by uvcvideo on bulk video devices.

The code was copied from ehci_endpoint_disable() but it isn't needed
here - hcpriv should only be NULL on emulated root hub endpoints.
It might prevent resetting and inadvertently enabling a disabled and
dropped endpoint, but core shouldn't try to reset dropped endpoints.

Document xhci requirements regarding hcpriv. They are currently met.

Fixes: 18b74067ac78 ("xhci: Fix use-after-free regression in xhci clear hub TT implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci.c | 1 -
 include/linux/usb.h     | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2f7e6544e5ae..849a568d0e63 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3353,7 +3353,6 @@ static void xhci_endpoint_disable(struct usb_hcd *hcd,
 		xhci_dbg(xhci, "endpoint disable with ep_state 0x%x\n",
 			 ep->ep_state);
 done:
-	host_ep->hcpriv = NULL;
 	spin_unlock_irqrestore(&xhci->lock, flags);
 }
 
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 04277af4bb9d..27e95eade121 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -54,7 +54,8 @@ struct ep_device;
  * @eusb2_isoc_ep_comp: eUSB2 isoc companion descriptor for this endpoint
  * @urb_list: urbs queued to this endpoint; maintained by usbcore
  * @hcpriv: for use by HCD; typically holds hardware dma queue head (QH)
- *	with one or more transfer descriptors (TDs) per urb
+ *	with one or more transfer descriptors (TDs) per urb; must be preserved
+ *	by core while BW is allocated for the endpoint
  * @ep_dev: ep_device for sysfs info
  * @extra: descriptors following this endpoint in the configuration
  * @extralen: how many bytes of "extra" are valid
-- 
2.48.1

