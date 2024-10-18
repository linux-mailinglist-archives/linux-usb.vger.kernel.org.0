Return-Path: <linux-usb+bounces-16421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DC9A40D7
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 16:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C5251C20CFE
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 14:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF211DFDAC;
	Fri, 18 Oct 2024 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GhfU0t90"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9D126BED
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729260829; cv=none; b=jMSa+eIDMG4FzeOF/f9Xkp+63DCbR8+CgBqTvMOQ0CCkQDFobe+rFQs2O+Q2lNuKl44tebdfFK+CzfIxGSfozmzuXsVptRGEvEPsbfuHmD51GL7gL65oArL2jliATNxK4PVeD/SLYrXrN1x+WxEy/uw25QD/9wZcbKmTTVvbccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729260829; c=relaxed/simple;
	bh=aTjJHkeizGoF2aL/NsmUH1ir4yw+IHippm3XRfe5XeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNjylhz/HxpEDyBsWGppfqscN5wal32s66fKqkLsT+X5QsykEDCl0QRPqvufWjPXk2VIiOnxJk6QVIx3P1TqPKDlgRXWr3IlP14qfcZwkaEkgPW+R7/uFiAcUhMBbLxxz0bdo/QDIt+FMsgT2NqkLkwV5Zo+V8TBSr57YEH+Y0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GhfU0t90; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c960af31daso2460256a12.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729260825; x=1729865625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Apj0eT9Mg3hZ0v/Yrd4Bur1u0D3lhRaTOHmpXdEdIxs=;
        b=GhfU0t90RVEmCVHj0TH7kKXbHLKQhFqZ5P0d41r95jOPPriiZslb64pvv9k2muFuAJ
         hT7cUXQvP/tUlUEDj7eW9666XR6EtJPi8CeIU+E8ckSl2ZiDIaQ8qSw/zHxNYs3fTQlw
         vbCbFTHL9cC1sj1m2a1biCql3jo6x+mugO26o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729260825; x=1729865625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Apj0eT9Mg3hZ0v/Yrd4Bur1u0D3lhRaTOHmpXdEdIxs=;
        b=gI6HOYE6o7aIbqN5ehTSEIoeOlD3bzhiWD2f6AJhK3rB/4kSZnNE27QD4QTczoaPwr
         KPsEpmeqPWRpJkSAG+izkeqFIyhW9Ehez23ZaAN5NOui3Rg9ZLCwZqjDLw/23btvWFEy
         zppOYjM7XLsxKGA/CkO61kswf70njbE2lJEeAGPS3oVBZWGBk1xceG+t6SK2YNS4c58x
         bg51o1irBtvtjnrdqPm0APmerZtmujtTSgokI3i4dKy/w7JEItbVW8/WW6Dvic6WDsEF
         QWzhy2cSNUXNVgb1ScWV6/vdwdXIUALBAqitHlnuSD24Ye/0uCpGCW8iFKc2gwT9Z4Vq
         vuyA==
X-Gm-Message-State: AOJu0YwCpqAm9BLQXzhnhCn8rgZau0X/5eqNVJk6375lISRJfazhYVSn
	G1bJswS+X2F3b3LXMzfrtLu369DRiKzlYOE7kHqhJmSM9pJVn4czUfo9oMZBvQ==
X-Google-Smtp-Source: AGHT+IGVBYeZBZWhXD/cEilqQhrjnOdaUTHRO5t00IXj4RrMljKseNFHLKpMU2CYeJeAK1io0ZUlmg==
X-Received: by 2002:a17:907:3f9e:b0:a9a:6ab:c93b with SMTP id a640c23a62f3a-a9a69cd5d18mr245321666b.62.1729260825517;
        Fri, 18 Oct 2024 07:13:45 -0700 (PDT)
Received: from danielgeorgem.c.googlers.com.com (186.66.34.34.bc.googleusercontent.com. [34.34.66.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bc5e37sm102202166b.120.2024.10.18.07.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:13:45 -0700 (PDT)
From: George-Daniel Matei <danielgeorgem@chromium.org>
To: "David S. Miller" <davem@davemloft.net>,
	Hayes Wang <hayeswang@realtek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Grant Grundler <grundler@chromium.org>,
	George-Daniel Matei <danielgeorgem@chromium.org>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] r8152: fix deadlock in usb reset during resume
Date: Fri, 18 Oct 2024 14:13:37 +0000
Message-ID: <20241018141337.316807-1-danielgeorgem@chromium.org>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8152_system_resume() issues a synchronous usb reset if the device is
inaccessible. __rtl8152_set_mac_address() is called via
rtl8152_post_reset() and it tries to take the same mutex that was already
taken in rtl8152_resume(). Move the call to reset usb in rtl8152_resume()
outside mutex protection.

Signed-off-by: George-Daniel Matei <danielgeorgem@chromium.org>
---
 drivers/net/usb/r8152.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index a5612c799f5e..69d66ce7a5c5 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8564,19 +8564,6 @@ static int rtl8152_system_resume(struct r8152 *tp)
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
 
@@ -8681,6 +8668,19 @@ static int rtl8152_suspend(struct usb_interface *intf, pm_message_t message)
 
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
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		usb_reset_device(tp->udev);
+
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog


