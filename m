Return-Path: <linux-usb+bounces-35535-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD+yHakoxmnQGwUAu9opvQ
	(envelope-from <linux-usb+bounces-35535-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:50:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3179D340080
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5EA130A757C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 06:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63AB3B893F;
	Fri, 27 Mar 2026 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPjP9uAk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52393C062C
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774593915; cv=none; b=SDJdctlARy4fUs4wOPU2sJhsL5eIayGj2f6MQq+dWuEJJa2KxqweRA26g0IRGxQKDr2vnophcfC4/BreIAIJbLIM9aKdsGbGjZ3vqOJfd/HGma08bnFG+7L/X4TqZ4lNna7i9MBnYh8USAUneftBn/40dm8Ef4AAfeqWCh0Gdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774593915; c=relaxed/simple;
	bh=i9wiMfsMy9Mf4aeuKAwnYO3RKNzbzS39shLmUR25TVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rs8gMSYEiVmDgZlrc7/bI907YykUWk8oAftJgKNxKU864YdlWqeR/scqbkbrmVs/jPAJwIXeduW4PQHYpHgOwFkAuaXnTzg7z8fQ1XPbzrtUZuL52up1mwohauc7tyhD32ajQKiZyd11VJYuF1qV+W6wOATqhiSEEN4bbu+DoIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPjP9uAk; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6028bb29cc9so1091333137.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774593904; x=1775198704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5steKgFbVCdTXCRbQ/WRIMoGkwD2ComHRnreYDYbjI=;
        b=WPjP9uAkhaSho3azgC4X2mkgmded/cf6VGAIHcDZbI5dXpT41JfbIIvrQaGAmVfqf1
         jsLqcXIAk2jsTe/HviWQAEgk9H5fz7NzuKBmA/Tx4Y5HCw9VsKn2WGOAEgENI9BS/cNV
         LgzVfjjrYFntZYyLyjTOKZEb4Rqc+UBY8iywS6LShP1WFXHSZI+u3MLywBmIxpTxDDIV
         PsFisrtHzK0tJirfR1TUgWChlANStUxHp3R/hXUS0kYILnFnRSqz67gYQKfiOUuDfsiI
         8quc4C3HRHOGo43dOoaB7+SIJLTcpKru4fJShYD43r9Mt8+TWh42E94N3UXJ4BxDjF+/
         s2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774593904; x=1775198704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5steKgFbVCdTXCRbQ/WRIMoGkwD2ComHRnreYDYbjI=;
        b=cP3DS46XJ/zWd4zxg7icKRzQWk1FEJmt5fH3yYgzV7D3O0kJRx+WCbJ6FPOhMrtqr2
         3SmKctmWB3OkEjWyxhhmA9VLtRfkGZw7UqYVCHxLJmW3JpG+ZPUh2E4RkJ6MP5YPSngD
         fpREf9JIDsQj7o8v8/JYOP7oDxAVyu+XSelNGYgq3qhFye7n0O/1tRYMnHxElvCFRkez
         Z4iBX4MMaL2tI7RcF+7vEMfezYFQygydIPpUFlHhsNnUUumScSLArN/+oX3VQbXzxbk1
         cidZyjVQunKaIAb31k0WRlQHLp1I7V35s6WkBL0m+k4anG7P5UV1VRikuz9GCHbPItRe
         iy6w==
X-Gm-Message-State: AOJu0YzJzBpTUtwEmHsgtVVQaTatvon0GHrlAbM2nKqPj6eYQr4vl3n6
	Pa03iPXHuMwh3IwmCWd8TqpUDYbWhtHUxeaoguZ7Vh5D5ZPjrF/5TyqmnrXDRQCAyC1cKw==
X-Gm-Gg: ATEYQzwpYt1s9uCmCNsF4wOl8MMa9SzAAkIvIJV1HSSCRPvnuAGY2qFSFUNaVye4CLq
	zMIcMth6k1oZ82xkvgbuk8rU/laNWyRCUBI6juy2k9HTPt3bz8ZLGuZOoRuW3S0vDApmwIg9675
	oBbhfREF5DGUoTzi5EJLTfIaQ32zb/ydv96XSbmCE7UYRvXtQV23fMjIFZ0cSvy4LEblZIhm26i
	/ldqWwKa2T8XF+OtmiNn52WKaVpXz9+5EU8kuSxEeoFc0mY/m/qxzjxZalrQsa2fFIZByuMtQvm
	FBLoxDAZss5HEtWtdpVPIhNt11UAjZ9L26Dt4ax8EoCYRrUJUJJ5ACQJRahSJpwLr/eTV9+lZO+
	SayIDutTLb1pMIFSiVc5FVSM6nRfOU31wjLF09I9y5H/k1mXmMl8Wr6w5PKzkzjYQfqu87KIZN2
	z+rLYOgwPgEPQfXFcKuYHSDMRkaVjX+nt+nK6p6LGzpjhox51d4sWYM78tKfRs2kB/e3/lqc8fp
	IzlEVoTJnuclP9ppa/TAhIq9Gy79AjOeJpoIKJNLa5On0xDHEFYR3hIcNrcp1Mu1SuCfwoFBNZr
	6lM=
X-Received: by 2002:a05:6102:c4d:b0:5ff:c6b2:efde with SMTP id ada2fe7eead31-604f909816fmr552934137.6.1774593903894;
        Thu, 26 Mar 2026 23:45:03 -0700 (PDT)
Received: from localhost.localdomain (2603-900b-5c40-0017-3433-631f-7c6a-3c94.inf6.spectrum.com. [2603:900b:5c40:17:3433:631f:7c6a:3c94])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d5313adbsm5641316137.8.2026.03.26.23.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 23:45:03 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	addcontent08@gmail.com,
	skhan@linuxfoundation.org,
	kyungtae.kim@dartmouth.edu,
	stable@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH] usbip: vhci: reject RET_SUBMIT with inflated number_of_packets
Date: Fri, 27 Mar 2026 02:44:49 -0400
Message-ID: <20260327064449.735-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,dartmouth.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35535-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3179D340080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a USB/IP client receives a RET_SUBMIT response,
usbip_pack_ret_submit() unconditionally overwrites
urb->number_of_packets from the network PDU. This value is
subsequently used as the loop bound in usbip_recv_iso() and
usbip_pad_iso() to iterate over urb->iso_frame_desc[], a flexible
array whose size was fixed at URB allocation time based on the
*original* number_of_packets from the CMD_SUBMIT.

A malicious USB/IP server can set number_of_packets in the response
to a value larger than what was originally submitted, causing a heap
out-of-bounds write when usbip_recv_iso() writes to
urb->iso_frame_desc[i] beyond the allocated region.

KASAN confirmed this with kernel 7.0.0-rc5:

  BUG: KASAN: slab-out-of-bounds in usbip_recv_iso+0x46a/0x640
  Write of size 4 at addr ffff888106351d40 by task vhci_rx/69

  The buggy address is located 0 bytes to the right of
   allocated 320-byte region [ffff888106351c00, ffff888106351d40)

The server side (stub_rx.c) and gadget side (vudc_rx.c) already
validate number_of_packets in the CMD_SUBMIT path since commits
c6688ef9f297 ("usbip: fix stub_rx: harden CMD_SUBMIT path to handle
malicious input") and b78d830f0049 ("usbip: fix vudc_rx: harden
CMD_SUBMIT path to handle malicious input"). The server side validates
against USBIP_MAX_ISO_PACKETS because no URB exists yet at that point.
On the client side we have the original URB, so we can use the tighter
bound: the response must not exceed the original number_of_packets.

This mirrors the existing validation of actual_length against
transfer_buffer_length in usbip_recv_xbuff(), which checks the
response value against the original allocation size.

Kelvin Mbogo's series ("usb: usbip: fix integer overflow in
usbip_recv_iso()", v2) hardens the receive-side functions themselves;
this patch complements that work by catching the bad value at its
source -- in usbip_pack_ret_submit() before the overwrite -- and
using the tighter per-URB allocation bound rather than the global
USBIP_MAX_ISO_PACKETS limit.

Fix this by checking rpdu->number_of_packets against
urb->number_of_packets in usbip_pack_ret_submit() before the
overwrite. On violation, clamp to zero so that usbip_recv_iso() and
usbip_pad_iso() safely return early.

Fixes: 0775a9cbc798 ("staging: usbip: vhci extension: modifications to the client side")
Cc: stable@vger.kernel.org
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
 drivers/usb/usbip/usbip_common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -470,7 +470,18 @@ static void usbip_pack_ret_submit(struct usbip_header *pdu, struct urb *urb,
 		urb->status		= rpdu->status;
 		urb->actual_length	= rpdu->actual_length;
 		urb->start_frame	= rpdu->start_frame;
-		urb->number_of_packets = rpdu->number_of_packets;
+		/*
+		 * The number_of_packets field determines the length of
+		 * iso_frame_desc[], which is a flexible array allocated
+		 * at URB creation time. A response must never claim more
+		 * packets than originally submitted; doing so would cause
+		 * an out-of-bounds write in usbip_recv_iso() and
+		 * usbip_pad_iso(). Clamp to zero on violation so both
+		 * functions safely return early.
+		 */
+		if (rpdu->number_of_packets < 0 ||
+		    rpdu->number_of_packets > urb->number_of_packets)
+			rpdu->number_of_packets = 0;
+		urb->number_of_packets = rpdu->number_of_packets;
 		urb->error_count	= rpdu->error_count;
 	}
 }

