Return-Path: <linux-usb+bounces-29669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF6EC0AE06
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 17:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E893189D70D
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 16:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8972749D6;
	Sun, 26 Oct 2025 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxAXl5sQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65904212B31
	for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761497020; cv=none; b=uHI8h4Qn74bqwpibz+i6bQ5yr02y7ZLwn0U5sJFtX4Kbjy8lTRNFbPcLM3FOEEzVHrWPaZqGFYF97kyXmC/iuJHMQqWueD4Lbz3K3DzyfjYGJAoWehI1XB9Ov1Eknvox5jByNxHIItr/UyTcI636/1nQjMc9YCYDTSpvfwqawaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761497020; c=relaxed/simple;
	bh=2blCvwW/JNfSePtiQhOpyFAVkiDR84ySlcLJfmQoOvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YCgUlFavY80OxAeo7v2Y7MxBmYCj4OQqOgH46TOnsHJN2k7/0Nim1wLKpiCVaprXF2EaPx8cM4Hu5Gaq2xFhyT3QpbWsdzr+Ys+FKQVvqqASI85OIC9fEp0OdusU5Vs+5YEBLsaxGv79tISkDI/YbDhOIXLvTNC1HRW/Psj56x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxAXl5sQ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a4176547bfso929122b3a.2
        for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761497018; x=1762101818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCF061NAS8FhFP3hNpS05moHDGkV+h3U/U3CN5+nY3Y=;
        b=DxAXl5sQtELRP1vcSZKU/GpY9atRPG/tlMzgWNQqc6HLf0hkZWybnzK7UbPByM98hn
         Za0+1LO4s9ryppsa1kUqDjYSOxw0yMVtUAQwNo80OkcPKVh6Xmz55KvA0704fhyd4edn
         dgqFKS4Dj1l/wHvZJqaeMPE054Yc+NqKGL5aefM5iba2iVEbzsUqvxcAthlx76k+ri7f
         uE1RdSVkJvk8Kq0zgLEnp/rjyBNQQvp7UMmqjYE+LOo6aoIgRpohGWilR9XYq81sy0QS
         F1WEzUBKhEVM5LCJqcrOD26IWhmOtvRU7/GGDzf28RQV2diUrJrX9ABeMt9rOYSPNL2E
         wkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761497018; x=1762101818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCF061NAS8FhFP3hNpS05moHDGkV+h3U/U3CN5+nY3Y=;
        b=uetZGbWyYdZI5kXFCS0PoXuUUz5MwlAf1d1KfHnCnGieYIIKYcKDLs+ekJqUIUbg/J
         iB8PJX+pltidLVphAkX70RC3Jk12pTX9o6DjT/vAN+N9W+s1wKIJwNeXgO/5qnMbTgul
         y2VEnK4pXjM881/NEPStKxXu6MKlhrjHRMR6W7HPL/ctbGasrT20CU/JRekiMquU+jNG
         yhM2SFvNWLYtPibmxmcMThYs0I5iAqmkbDQpjXjax2bilPV7uhcsLbcKaagWCD7rlC4c
         Uc+MjTytYh43M0bLGkJfDfqXqtDp9pDCd+5wu2aWwAn8udEprq+iyQ4BQIPe/CM6/13u
         u6og==
X-Forwarded-Encrypted: i=1; AJvYcCUL5x2YNU4JXE93LiFVkOtkRS32p5o5NkM4XkSj4rMFoYbBgf+E109aqNEVqFTgKeO23jVEIdEOijQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGBGeEtzPLk2uwLtGXq94D5HEs2mAuvSXmYnbCr8l35Oz00Yd
	88Km8N5TVXbqDPQHdjb6NGSGpPAQdyQsMsPdkPXritb3gkHzpJp2lRsB
X-Gm-Gg: ASbGncvaGuzRQpXqqNQXRBF56Amv34n7D3rOUAfXrENhyCiAZ6eEK4gMqKTly0MJR1E
	ry3nVs1ddBOrQF8/BLZq8bx48+k2mfJHGnxqYNUimRpzISoBRQuGWfAHwTzKYVkhUjIFc+QdvqO
	2m1w7cFp6sP2/R89859SZrIbwzd/AKgF7mxIlBECElUD15K2tfuy3RiAruUY1d9emD41Pv0aU6V
	C2+1QeojX+GiqESZg+RfvHrvIPOSpCI3le5yD0JOR5ZNc9MVAIkD5u2PwG50OMe9utfHE//IBNV
	GfyfR65vOE4ZM6fN2cGPiZu3NK6Hwxmn0+VJ9xX8xgYcCV/WF/wEAptYVCG+P2WdjIMpdJPEvZA
	RI0QyhmUvLUaJs8XhWv5TrGoWz5ueGVdgvmJaGdoITNrKdOVAAdx6YcVfkleViYdsg0p7fRhkzG
	vTydwwbwnmcy3MUUcgM5WLUofcLai4rqlitkuyIDut/f8=
X-Google-Smtp-Source: AGHT+IFf+qjeyS6hjsC0nfYxfHIiI+ppqXHvuLXgsxBumfjvvdYcGEtHm3eqB+rkAU1cSh6c7pSxUA==
X-Received: by 2002:a17:903:2446:b0:290:6b30:fb3 with SMTP id d9443c01a7336-2948b97658bmr102681155ad.16.1761497017589;
        Sun, 26 Oct 2025 09:43:37 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33fee8014f6sm2961731a91.0.2025.10.26.09.43.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Oct 2025 09:43:37 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Xu Yang <xu.yang_2@nxp.com>,
	Yuichiro Tsuji <yuichtsu@amazon.com>,
	Max Schulze <max.schulze@online.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	David Hollis <dhollis@davehollis.com>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	David Brownell <david-b@pacbell.net>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] net: usb: asix_devices: Check return value of usbnet_get_endpoints
Date: Mon, 27 Oct 2025 00:43:16 +0800
Message-Id: <20251026164318.57624-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code did not check the return value of usbnet_get_endpoints.
Add checks and return the error if it fails to transfer the error.

Found via static anlaysis and this is similar to
commit 07161b2416f7 ("sr9800: Add check for usbnet_get_endpoints").

Fixes: 933a27d39e0e ("USB: asix - Add AX88178 support and many other changes")
Fixes: 2e55cc7210fe ("[PATCH] USB: usbnet (3/9) module for ASIX Ethernet adapters")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
- v1:http://lore.kernel.org/all/20250830103743.2118777-1-linmq006@gmail.com
changes in v2:
- fix the blank line.
- update message to clarify how this is detected
- add Cc: stable
---
 drivers/net/usb/asix_devices.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
index 85bd5d845409..232bbd79a4de 100644
--- a/drivers/net/usb/asix_devices.c
+++ b/drivers/net/usb/asix_devices.c
@@ -230,7 +230,9 @@ static int ax88172_bind(struct usbnet *dev, struct usb_interface *intf)
 	int i;
 	unsigned long gpio_bits = dev->driver_info->data;
 
-	usbnet_get_endpoints(dev,intf);
+	ret = usbnet_get_endpoints(dev, intf);
+	if (ret)
+		goto out;
 
 	/* Toggle the GPIOs in a manufacturer/model specific way */
 	for (i = 2; i >= 0; i--) {
@@ -848,7 +850,9 @@ static int ax88772_bind(struct usbnet *dev, struct usb_interface *intf)
 
 	dev->driver_priv = priv;
 
-	usbnet_get_endpoints(dev, intf);
+	ret = usbnet_get_endpoints(dev, intf);
+	if (ret)
+		return ret;
 
 	/* Maybe the boot loader passed the MAC address via device tree */
 	if (!eth_platform_get_mac_address(&dev->udev->dev, buf)) {
@@ -1281,7 +1285,9 @@ static int ax88178_bind(struct usbnet *dev, struct usb_interface *intf)
 	int ret;
 	u8 buf[ETH_ALEN] = {0};
 
-	usbnet_get_endpoints(dev,intf);
+	ret = usbnet_get_endpoints(dev, intf);
+	if (ret)
+		return ret;
 
 	/* Get the MAC address */
 	ret = asix_read_cmd(dev, AX_CMD_READ_NODE_ID, 0, 0, ETH_ALEN, buf, 0);
-- 
2.39.5 (Apple Git-154)


