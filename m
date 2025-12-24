Return-Path: <linux-usb+bounces-31743-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C25CDBA98
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 09:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6D03300B8F6
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 08:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C05A32D7C7;
	Wed, 24 Dec 2025 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVHcS3/H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E424468B
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564503; cv=none; b=fGC6aBdnJHUVw/dyZnAcX/KcrjzVrke1ASsSM0UYV81Rc0jhMBYtR6ZnDzUQ6zUqNEvtJZ477cVY26PEkIUqqKezvL2RcH/FkJDQ+vdm2AGIGlFKNnO4rusqFEWLZMS06OSnI3WTKi9Set3RSFBTaPIl9CgHcayAGTtmhwAnIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564503; c=relaxed/simple;
	bh=k7yvHo2ZwJ/OULW+qXOcpCYk0LIcpEE+w6+GFRBWzH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JVdO0hl9jpPfM+iyoDgs6FOVQ8p408UUDDPUc98VPd88mmbBDvU1SkPs0kg3HzwlUUW1dxd55MaUY+tvTvA4ur5Tg7FfnRE/TZXKAVRF1UUOyZ8YS5sWJsWZy04UzekkXrv92D5ZDlPM1Qo4eqSRvvgOMPhhfBioTfKc9LFtp6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVHcS3/H; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a1022dda33so47635715ad.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 00:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766564501; x=1767169301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs+q/raxaG2h1x/D1IYwhRGtsaRix0PUab49pgsXyU0=;
        b=kVHcS3/HTKB45LtqESqYn+DPDKU4SgIab8G5gQ/YMcSuvD9aV/OJgS8x+UEMfztNTX
         SiHIiHEb9lYxTUbV8jxybCOm4yCt56bf2NpaQgWPQl5IK+7ZEVddiW7mcyw9Cr4fYn+n
         dEHBVrZXcqJClgZi3v+lE7Vj+ilRTZ3jht76Xg4GfcjzUTjP7v9QMBdNTmCXB5ftuRWt
         VJY8stsvqPFjQJ56SCh1RRmDXJbYVwO0Z1Eg/A9jyU90mouArQwbKW0bTGc5h6Rqy7WD
         rOlGnihBCdOzylme4GiRVlxfnFbiE3nLP/FgEyx9LLfgrKwDroAiVp/SKaHWe3sRbzBY
         macg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564501; x=1767169301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fs+q/raxaG2h1x/D1IYwhRGtsaRix0PUab49pgsXyU0=;
        b=jfXMQET34vegzMPomMT/4y4I1l4NXFMZdFlOj+JGRRAGRgW069irsTdwKQgX1GKI/K
         as1ark6DLbObAWiHeXEEahYTCce4hEwX0Kn26njPl4xA/pUp1C2WcOPPafG9INSEJ9Ef
         q0Wzn4eVsGlx9cY3eS6fVqL+bFwb/sPGgAnBDdz2sTwpfwjzCcG3+H1YEcpSeq5MZUrm
         /lKHPb+amoYkGPu6qdK7xMz+5oyGFLIz5GMM8u1hAlEQKbR8oRtrtj/SDog0vF95fOXU
         BDujtaH1u3K3GMLuAMwXIZspnEZFQCx5RmGVB9jcxtzGbr8GM+T2JOrRgnDo3Msbs19U
         GgQg==
X-Gm-Message-State: AOJu0Yxm3cX4aM8RS5FHYv61nf0s1SiD8NRQ/joSwX6X1wk+XAQWu45z
	0nJbUq4WGrlf+6/HGyC2rGyDZdsWisVGRG0EnY8+mGHawetzZ+fTJ5JB
X-Gm-Gg: AY/fxX5IGD1Ez6/Z5xXw9ogheBmHWmfcC1ZQNIT4P1cWt8DLBTEf39Vkp3u2M7oUPcw
	AV7dbCM2VIC1IodZYZcIDxuRqmaCs8pJ2BpffPqZcSst06D29B8+cU3F4qdRglF4lyiRoxndljd
	vyxyQ2AZ5HjuPBW6761gQjH5RtiP6AaQvfoI4IttyX7yTOfskcAJceYZJ0I+0sVeFC/gY09Gtcm
	1iA4BSZ9Mh1dmRalb+uYCo6k1ayF+rLavmB1l9QMtWfVXJZOk2cZtf6iFbWVW5+byDhKxDx4mh6
	D89Vd/tB4DrIUpc4F29Unz+nYIoK7DFq+AgcfBT8Su6+2a7nuvpEK7+0arOS5fbaczyCz9UP8KE
	3AiUABZ3yiBx02LKrF2VuEb0Gsw5NJXisGJv+lksLlONVMzXgE3uPYW56dhoozsMb/Ww5lRVTq6
	RILSe56ORjvPny/CdZ7SSSOYfAhg==
X-Google-Smtp-Source: AGHT+IHh1af0uc/lW9BEVz9XbF25P+o5iYz7XAwVVngT5Y8+Ypc19c0CHRgEaVOPBdahuy0Aq+n/+g==
X-Received: by 2002:a17:902:ec8d:b0:2a0:daa7:8a57 with SMTP id d9443c01a7336-2a2f2836573mr168213945ad.30.1766564500804;
        Wed, 24 Dec 2025 00:21:40 -0800 (PST)
Received: from localhost.localdomain ([113.98.62.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6661esm146155665ad.2.2025.12.24.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:21:40 -0800 (PST)
From: Jason Sun <jason.sun689@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunqian@senarytech.com,
	jason.sun689@gmail.com
Subject: [PATCH v2] dwc2: Delay resume until device connection is stable
Date: Wed, 24 Dec 2025 16:20:13 +0800
Message-Id: <20251224082013.87100-1-jason.sun689@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251215125317.85624-1-sunqian@senarytech.com>
References: <20251215125317.85624-1-sunqian@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Jason Sun <jason.sun689@gmail.com>
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


