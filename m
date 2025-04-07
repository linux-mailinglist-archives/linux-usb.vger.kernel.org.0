Return-Path: <linux-usb+bounces-22636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7EA7DE63
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 15:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA7C17A274E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 12:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FB0253B62;
	Mon,  7 Apr 2025 13:00:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB343253B45
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030808; cv=none; b=sCUTm6+QGw90KjVB/UgR7XT29nN/77bhhDO/ks/DvfPaqEaO1XRfJ1CXHZk+rluJ0UGjUclwbF0X1pLZ3KRzYH9YNugAzzUz/beGmY21KBZVU1hDeC4QpbRfv+L1x0VbJUe0vm1X5Mcvo/1RrQR43LpjpT8sHJqa+jsoRznYDTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030808; c=relaxed/simple;
	bh=qxjFp0An00bjO2E5AEYaVXSrH+pzwIMGKPbeM1ipYlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhKM8YL23gi8YipzcytVxLTWD5iUk7DnDYf53ODB+84+9bhbi6lKSkp8me1Xh9mfK75RGAoHyXkq6QGmmNEQpMiu0+V8tsmZwCPvuTjbuq3JpIc/BpOG7eDC1Dr+2+oykphz7rG79GPBt+oPnAzYHDVgrByJReiI3p9EXAVGPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id E5E42233A2;
	Mon,  7 Apr 2025 16:00:01 +0300 (MSK)
Date: Mon, 7 Apr 2025 16:00:00 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Matthieu CASTET <castet.matthieu@free.fr>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@osdl.org>, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org, gremlin@altlinux.org
Subject: [PATCH] ueagle-atm: enforce boundary check for sync_wait[]
Message-ID: <20250407130000.GD20970@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

After several increments of modem_index (e.g. after plugging and
removing the device several times) modem_index may reach NB_MODEM
value causing the out-of-boundary sync_wait[] array access.

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org).

Fixes: b72458a80c75 ("[PATCH] USB: Eagle and ADI 930 usb adsl modem driver")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/atm/ueagle-atm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index cd0f7b4bd82ab132..436412b62c910e2f 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2500,7 +2500,9 @@ static int uea_bind(struct usbatm_data *usbatm, struct usb_interface *intf,
 	if (ifnum != UEA_INTR_IFACE_NO)
 		return -ENODEV;
 
-	usbatm->flags = (sync_wait[modem_index] ? 0 : UDSL_SKIP_HEAVY_INIT);
+	usbatm->flags =
+		modem_index < NB_MODEM && sync_wait[modem_index] ?
+		0 : UDSL_SKIP_HEAVY_INIT;
 
 	/* interface 1 is for outbound traffic */
 	ret = claim_interface(usb, usbatm, UEA_US_IFACE_NO);

-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

