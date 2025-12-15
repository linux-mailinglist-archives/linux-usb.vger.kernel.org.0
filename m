Return-Path: <linux-usb+bounces-31445-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B0CBDF64
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 14:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5A2C303B2C4
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 13:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44E22D0C97;
	Mon, 15 Dec 2025 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="SAcjA3jY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m32105.qiye.163.com (mail-m32105.qiye.163.com [220.197.32.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662E1A9B58;
	Mon, 15 Dec 2025 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804151; cv=none; b=cXdsxmTG6WkK+oqaf/V6rKtR2gpHqWsxJHSGS+k2QB3MayJ+xPI+dtbcngTgV4l3qDWqHvE4kSD2anbPUg+vtIiSriyKB3umz/SzgA6PIaSye5teThM21VgQUFkI4hIi1RSPI1jxvW1768zvT+LOQaywuCotGBKosT6T/VV9s2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804151; c=relaxed/simple;
	bh=7UmfIZICh+DAOr6TYFz4yVnxzGwnFtplItLlUz8hHVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LlqsZH5HPARPJBBaHtdEIUFk9/c/r3gOcdr159Y0mwa2qqeCu5SEOEC1EEP6FgQfmM1RDAEauVAswRtC4BUwZbmyNLXorYb4bpu49xPWaLHdvfTutxs7uPiVPxxeR4d263k3akAt8FwFosmtnFXJRH+YwL784WlhWqeLcrWINkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=SAcjA3jY; arc=none smtp.client-ip=220.197.32.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Received: from localhost.localdomain (unknown [113.98.62.227])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d47a7286;
	Mon, 15 Dec 2025 20:53:37 +0800 (GMT+08:00)
From: sunqian <sunqian@senarytech.com>
To: hminas@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunqian@senarytech.com
Subject: [PATCH 1/1] dwc2: Delay resume until device connection is stable
Date: Mon, 15 Dec 2025 20:53:17 +0800
Message-Id: <20251215125317.85624-1-sunqian@senarytech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2212d3e609d6kunm8cf60a2149c273
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTR5CVkkaTxpJTxlCTxoaTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkhVQkNVTUlVSUlMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=SAcjA3jYlzih9R8hZrQFFY9RTPqhMPgWwcyS9UucaWfgoCb6RyMxYP9byHwf2KW0tYXrVGqHt+iPtxJ3j1PFynPslXEnf3KcBqszK6+q2SrmUFEG+aT0e78M3kl1jA3rQyoRhpbiIU/7bppuYtKfOHrEWaWdUNqzSExRVRh5KcQ=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=hiwqFpUUv3/gTycd1mYNHbIOXRC2K6R8CjhiTZOxRHs=;
	h=date:mime-version:subject:message-id:from;

When DWC2 is used as a host with a dynamically controlled VBUS supply,
VBUS may be turned off during system suspend and enabled again during
resume. Some USB devices (e.g. USB mass storage) require additional time
after VBUS is restored to power up and for the D+/D- line state to settle.

The resume sequence may proceed too early, observe HPRT0.CONNSTS as 0,
and treat an already-connected device as disconnected. This can lead to
a spurious USB disconnect followed by re-enumeration, making an
already-mounted filesystem unusable after resume. Even if the device
reconnects later, the resume does not behave like a true restoration of
the pre-suspend device state.

Poll HPRT0.CONNSTS for a short, bounded period after enabling the
external VBUS supply, allowing the controller to report a stable
connection state and prevent spurious disconnects during resume.

Without this change, resume often results in a disconnect and a new
device enumeration:

    dwc2_enable_host_interrupts()
    ClearPortFeature USB_PORT_FEAT_C_SUSPEND
    ClearPortFeature USB_PORT_FEAT_ENABLE
    usb 1-1: USB disconnect, device number 3
    ...
    usb 1-1: new high-speed USB device number 4 using dwc2

With this change applied, the controller reliably detects the device
after resume and restores the link without triggering a full disconnect
and re-enumeration cycle:

    dwc2_enable_host_interrupts()
    gintsts=05000021  gintmsk=f3000806
    Device connected after 9 retries
    ClearPortFeature USB_PORT_FEAT_C_CONNECTION
    ClearPortFeature USB_PORT_FEAT_C_SUSPEND
    ...
    usb 1-1: reset high-speed USB device number 4 using dwc2

As a side effect, when an OTG host adapter is connected but no USB
device is present, HPRT0.CONNSTS remains deasserted and the polling
reaches the timeout. In this case, system resume latency may increase
by the duration of the bounded wait, which is considered an acceptable
tradeoff to avoid spurious disconnects and filesystem corruption.

Tested on:
  - Kernel: v5.15.140
  - Suspend mode: suspend-to-RAM (STR)
  - dr_mode: OTG (dual-role), host mode via OTG adapter
  - Devices:
      * USB mass storage (Aigo, Kingston, SanDisk)
      * USB HID (mouse, keyboard)

Signed-off-by: sunqian <sunqian@senarytech.com>
---
 drivers/usb/dwc2/hcd.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 60ef8092259a..96345eeb9e2f 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4404,11 +4404,15 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 	return ret;
 }
 
+#define CONNSTS_POLL_RETRIES       80
+#define CONNSTS_POLL_DELAY_US_MIN  3000
+#define CONNSTS_POLL_DELAY_US_MAX  5000
 static int _dwc2_hcd_resume(struct usb_hcd *hcd)
 {
 	struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
 	unsigned long flags;
 	u32 hprt0;
+	int retry;
 	int ret = 0;
 
 	spin_lock_irqsave(&hsotg->lock, flags);
@@ -4501,8 +4505,26 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 	dwc2_vbus_supply_init(hsotg);
 
-	/* Wait for controller to correctly update D+/D- level */
-	usleep_range(3000, 5000);
+	/*
+	 * Wait for device connection to stabilize after VBUS is restored.
+	 * Some externally powered devices may need time for D+/D- lines to settle.
+	 * This runs in the resume path where sleeping is allowed.
+	 */
+	for (retry = 0; retry < CONNSTS_POLL_RETRIES; retry++) {
+		spin_lock_irqsave(&hsotg->lock, flags);
+		hprt0 = dwc2_read_hprt0(hsotg);
+		spin_unlock_irqrestore(&hsotg->lock, flags);
+
+		if (hprt0 & HPRT0_CONNSTS) {
+			dev_dbg(hsotg->dev,
+				"Device connected after %d retries\n", retry);
+			break;
+		}
+
+		usleep_range(CONNSTS_POLL_DELAY_US_MIN,
+			     CONNSTS_POLL_DELAY_US_MAX);
+	}
+
 	spin_lock_irqsave(&hsotg->lock, flags);
 
 	/*
-- 
2.25.1


