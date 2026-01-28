Return-Path: <linux-usb+bounces-32859-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOxQNp20eWk0ygEAu9opvQ
	(envelope-from <linux-usb+bounces-32859-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 08:02:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6669D901
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 08:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 971503013732
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 07:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87EC328247;
	Wed, 28 Jan 2026 07:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Eu/btvwj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816821257E
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 07:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769583762; cv=none; b=R/t6EecnltqVkDgOULOETC+oGm2b/SFmo1DeYYH4wIaKqEAwZjzioUUVsSzN32bZe7mOBxlSCUW+StWxPTZFNyKjRAU/IiFKByso/UlKOY3btO7oqVmTSO6hqEvrxQZsKwDFCwa1OG5DYDIvjhLuKhrH5c5q0sYebrH+GoZiLPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769583762; c=relaxed/simple;
	bh=jNWVs3NoJCDLt3Uob6MZkTWfmT/4JmZ5ZegDFFtHMQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=opGtizx5zx3cUhfR9A9g+fHsLofz7nMc/KS8oGTD22G/+fpI1G++hDIhSbVc5fG+pJme3LaQeYQ5J25XyAijzrchdsJf/0vCs1ZSgjTPN553A+V7ZxfAn6ns+EHWV8GdpuVEbf4itaX6PuWN8h7uFnEjRQVb+io8/0XKfhsTQFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Eu/btvwj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f30233d8aso43696815ad.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 23:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769583759; x=1770188559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpz1+E5bIfL6Vl+vGItOAAFJ78Sq/brE0PF9AQXfuD0=;
        b=Eu/btvwjDHWSVkM9sBMw1iYxgv4q/mCO7Cw+OEWWYn2R9r5ftSc8DJ4Zsx+LGvcBM9
         +nfPnxxJETpAAKIx6p2eYeI5qqEO/fgie7iWQwsITNKGv3DW1SUF8lmPFHc52nWdZ4ZS
         eLCJcB3xtHYc4uz9gNZQmv5pfyjMpXzC5cpBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769583759; x=1770188559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpz1+E5bIfL6Vl+vGItOAAFJ78Sq/brE0PF9AQXfuD0=;
        b=NNl0LWIdOAG75Za++iLyrqBXzyEULKJJ8QSPo92sAklJU6Bfr0gbGl7EYL2vs5z6IK
         TtTeR4IDig1dDi0ZpcAfQciyLtYaVXG4d5B0YrCjhtqZlw+Na48lvRCfYNjAW4JgA/eg
         7eRAy5OMhPSGNflqP1unNH8HdljoChIkSlbubKQagZXCE7+OGx1Ecqtg1blSMIy+MlRF
         L8Bz5ZztmgWkLKdpiXgZ8I6T4jBllbtkfJd1PEZ1Dq/vqQ4IlV1C1FXmI9shoHQzS5sJ
         Jl3eU4FDyikMsKcb2a5vH0Gnq0Le03ledtA7Z4+h6+7PXVzPkfnZwHa9ythL3mpJLEJV
         7eEg==
X-Forwarded-Encrypted: i=1; AJvYcCUD+sJE8Q+qx99DoIIgeKWPLt8EessKkqvip3Ci5RFB/tH52GSW5ZTy6IA1sXqJOSFVcAS/M/loBt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Y0mV+Z0pw9LIHKkX4pOd6vA7DlaxK9A44HdeDl75Y50TTMkK
	796zIMR/EyQWNBDkimIGSxozZVW4ECVH/o8Gcvzq1yc1E6/nqcwpMMRV13KsOUYvkw==
X-Gm-Gg: AZuq6aKgmWEjyvirjnMeuH+gPkzMj3hpFq/P2G+QiEciVTpqU18Bq2ANJ2TL0Ki/Pv/
	ZT3IhZcy8lF/lJt5v8lSa/Y72iCiaAZpdrJY5R95On/GXqvFCNFH56d8Xc3U6O/ykG2M1dP8ijr
	2ESWNZPgl/XI8uRieNivFSwHXRiRigoDxryin2NWoFH1nv4TsSm8MhUBXWvVgBMCevAB5kDcyoq
	ii/byijAN6zsBFSiteSnR5WMrkq0Qvw56exn5tk6dhE/BChX7oQSle0jQrn2PtXXC8n+cIgwI+V
	thzr/RSoncRqtx/80p0gWY2jgZFsvujb0jWzKIFKplnInsw1f32mJOIoYbZQbzaBry0sUB4MHBT
	TVeA70PyzvYbSxpC16qFqmDtu61j7cWc7Ksw5F89Ledu9c9kmu4WdnOJIyNdWtFwyp7dHJhp7gi
	yvZmsdh/d2+l9+4hcNxlfoafEdrrVo1dcUnOlRGo8KWdNIYuIlwwkDcBxgxXiT2Y/v6JCg/NM9
X-Received: by 2002:a17:903:40ca:b0:2a0:f0db:690e with SMTP id d9443c01a7336-2a870e8ac0bmr41142995ad.52.1769583758569;
        Tue, 27 Jan 2026 23:02:38 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:bf24:413d:1e8a:6aa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm12975735ad.3.2026.01.27.23.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:02:37 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Douglas Anderson <dianders@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] net: usb: r8152: fix resume reset deadlock
Date: Wed, 28 Jan 2026 16:01:52 +0900
Message-ID: <20260128070222.3393746-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32859-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A6669D901
X-Rspamd-Action: no action

rtl8152 can trigger device reset during reset which
potentially can result in a deadlock:

 **** DPM device timeout after 10 seconds; 15 seconds until panic ****
 Call Trace:
 <TASK>
 schedule+0x483/0x1370
 schedule_preempt_disabled+0x15/0x30
 __mutex_lock_common+0x1fd/0x470
 __rtl8152_set_mac_address+0x80/0x1f0
 dev_set_mac_address+0x7f/0x150
 rtl8152_post_reset+0x72/0x150
 usb_reset_device+0x1d0/0x220
 rtl8152_resume+0x99/0xc0
 usb_resume_interface+0x3e/0xc0
 usb_resume_both+0x104/0x150
 usb_resume+0x22/0x110

The problem is that rtl8152 resume calls reset under
tp->control mutex while reset basically re-enters rtl8152
and attempts to acquire the same tp->control lock once
again.

Reset INACCESSIBLE device outside of tp->control mutex
scope to avoid recursive mutex_lock() deadlock.

Fixes: 4933b066fefb ("r8152: If inaccessible at resume time, issue a reset")
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/net/usb/r8152.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 30f937527cd2..c4f4e6a35ff4 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8538,19 +8538,6 @@ static int rtl8152_system_resume(struct r8152 *tp)
 		usb_submit_urb(tp->intr_urb, GFP_NOIO);
 	}
 
-	/* If the device is RTL8152_INACCESSIBLE here then we should do a
-	 * reset. This is important because the usb_lock_device_for_reset()
-	 * that happens as a result of usb_queue_reset_device() will silently
-	 * fail if the device was suspended or if too much time passed.
-	 *
-	 * NOTE: The device is locked here so we can directly do the reset.
-	 * We don't need usb_lock_device_for_reset() because that's just a
-	 * wrapper over device_lock() and device_resume() (which calls us)
-	 * does that for us.
-	 */
-	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
-		usb_reset_device(tp->udev);
-
 	return 0;
 }
 
@@ -8661,6 +8648,7 @@ static int rtl8152_suspend(struct usb_interface *intf, pm_message_t message)
 static int rtl8152_resume(struct usb_interface *intf)
 {
 	struct r8152 *tp = usb_get_intfdata(intf);
+	bool system_resume = !test_bit(SELECTIVE_SUSPEND, &tp->flags);
 	int ret;
 
 	mutex_lock(&tp->control);
@@ -8674,6 +8662,19 @@ static int rtl8152_resume(struct usb_interface *intf)
 
 	mutex_unlock(&tp->control);
 
+	/* If the device is RTL8152_INACCESSIBLE here then we should do a
+	 * reset. This is important because the usb_lock_device_for_reset()
+	 * that happens as a result of usb_queue_reset_device() will silently
+	 * fail if the device was suspended or if too much time passed.
+	 *
+	 * NOTE: The device is locked here so we can directly do the reset.
+	 * We don't need usb_lock_device_for_reset() because that's just a
+	 * wrapper over device_lock() and device_resume() (which calls us)
+	 * does that for us.
+	 */
+	if (system_resume && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		ret = usb_reset_device(tp->udev);
+
 	return ret;
 }
 
-- 
2.53.0.rc1.225.gd81095ad13-goog


