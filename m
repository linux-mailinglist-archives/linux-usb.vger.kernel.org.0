Return-Path: <linux-usb+bounces-8424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FFD88C6A0
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A800A1C635B5
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 15:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899EE13C67C;
	Tue, 26 Mar 2024 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B008m7Vw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963913C82C
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466221; cv=none; b=A8tHUrAM5ATb1fZOfgh1RxrdP01InltHWRI91ZXitTDZYH1PCnWS0+QGGZV00KS2KKyRpLI2hncWLl69OuvA4vZEeZBTZXGNJ6k4wmjV5pET7yfL/Z50WSHHTnwY/qmCMiS65H582CEnGLKjU63A/gIt7LO59kzu6uzkkZzZdEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466221; c=relaxed/simple;
	bh=Uh39Uy50cW3MqKqA/GjWgxY94ppKdYJhtHJ/8QqFF9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTQSuvvIn3GbSM5ABopPkn8YQF7F8Hkv8huuIncoHzhVZXvgyKUzTUwZ5BXf9gDFDEihWqXyPnPRh5ixMQMN9kNRBQ48uRqo9aZJfWclE1G8DiR4L1QJCgwucmREdpHAuwAtXIh+hZmQWwFpFa7ePGmSe3dIF6hxXrPcL13PAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B008m7Vw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ea8ee55812so3287017b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711466219; x=1712071019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tymugleP+KMPqfQ6HdBlFr9cfdnMUYoOvvq4liDig9M=;
        b=B008m7VwtVOsuZUU35YOtxedUVJ1l8p/6CrHb97Oy2Ub20yY+DYB504ImWwlGeimjr
         9D4hFeNXPqw2ePEZqB/uH3CP/I0Gt9lXn6Kj7CBRlvdaT5XUbF8n6FsW+nSMoXO3uxAW
         Ys/xQvSenshpMIBiGtHIGcabwGWdNRRjd01IHW+i0yrwBK+4j1tdKg9FGdD1l/ZyH4Dq
         qiUGl528V6hIiFlYurg75pE+C1hfu+lM9ij+FJD6uPTJGUc68B2lkAakNQI77vYzwgPn
         UPJibblUYb+IV+/OGfnKi+qdDTZEj4G5baZkMGQ4TDKT/Kchg5qPSaeX3l7ttDXQ3Urc
         IBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466219; x=1712071019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tymugleP+KMPqfQ6HdBlFr9cfdnMUYoOvvq4liDig9M=;
        b=IXvr5Hwma7gLRfb2VJkI/sJQk5eistH7T8UO59piaEFEOVh7hT/nDogtNiUYazouGI
         eQ1FbeZM+ZJhKurlH6NPb7/b1+izJmg8zWU0jA3IzB81UwznagpIzqX0luxbR86M7iE6
         z6zUwrGiE2ibPmQYaZgbTorrlt7E9ouEcRhzPjE3dioOUs6j+2NcdSuJias8AbTSWcE+
         uK5oFmfO7LIQ+bA3o90wbjdyOxu0BvIUVQr2Sw3Lyn2UWENIjpKXaJVxbs+2Kxk+elWh
         MbiGA9IdBLfyilOjEPcv20ohHOmgGWDI3PQ+c3Fo/x6Fe3bCuFnKxsUeB+YmU8qekO0M
         13ww==
X-Forwarded-Encrypted: i=1; AJvYcCXhTlhCMvepNlKH/mkm2DAdbOGUnca5ZMW8/w89mt4Lc8NgW4QbdgQE32CGYh/QyLCW1Fk67Wyp7k074t6M0juU8eZJRtxBwR+Q
X-Gm-Message-State: AOJu0Yw2bAQoBmAHOy709gLGMJwD1MUxZPNEx0x/ov3MCjoTWzyMUQrF
	BtCE4fVm6vnWlyvKvSJvZz31vUI/AHFFp0d8o1vPAXLgYZ/63Ev6
X-Google-Smtp-Source: AGHT+IE/sR+6HsVDGhaf2JujhiyAKYBElqjSIk4Dznzsk+TOS+oozp9kHrr35TB3i22mXH3jKEvmdg==
X-Received: by 2002:a05:6a20:6f90:b0:1a3:d60c:d84d with SMTP id gv16-20020a056a206f9000b001a3d60cd84dmr2784725pzb.23.1711466219099;
        Tue, 26 Mar 2024 08:16:59 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::c91])
        by smtp.gmail.com with ESMTPSA id s3-20020aa78283000000b006e631af9cefsm6073126pfm.62.2024.03.26.08.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:16:58 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us,
	gregkh@linuxfoundation.org
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH v2 4/4] usb: misc: uss720: check for incompatible versions of the Belkin F5U002
Date: Tue, 26 Mar 2024 09:07:11 -0600
Message-ID: <20240326150723.99939-5-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326150723.99939-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-4-alexhenrie24@gmail.com>
 <20240326150723.99939-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The incompatible device in my possession has a sticker that says
"F5U002 Rev 2" and "P80453-B", and lsusb identifies it as
"050d:0002 Belkin Components IEEE-1284 Controller". There is a bug
report from 2007 from Michael Trausch who was seeing the exact same
errors that I saw in 2024 trying to use this cable.

Link: https://lore.kernel.org/all/46DE5830.9060401@trausch.us/
Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/misc/uss720.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index 5423da08a467..b26c1d382d59 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -677,7 +677,7 @@ static int uss720_probe(struct usb_interface *intf,
 	struct parport_uss720_private *priv;
 	struct parport *pp;
 	unsigned char reg;
-	int i;
+	int ret;
 
 	dev_dbg(&intf->dev, "probe: vendor id 0x%x, device id 0x%x\n",
 		le16_to_cpu(usbdev->descriptor.idVendor),
@@ -688,8 +688,8 @@ static int uss720_probe(struct usb_interface *intf,
 		usb_put_dev(usbdev);
 		return -ENODEV;
 	}
-	i = usb_set_interface(usbdev, intf->altsetting->desc.bInterfaceNumber, 2);
-	dev_dbg(&intf->dev, "set interface result %d\n", i);
+	ret = usb_set_interface(usbdev, intf->altsetting->desc.bInterfaceNumber, 2);
+	dev_dbg(&intf->dev, "set interface result %d\n", ret);
 
 	interface = intf->cur_altsetting;
 
@@ -728,12 +728,18 @@ static int uss720_probe(struct usb_interface *intf,
 	set_1284_register(pp, 7, 0x00, GFP_KERNEL);
 	set_1284_register(pp, 6, 0x30, GFP_KERNEL);  /* PS/2 mode */
 	set_1284_register(pp, 2, 0x0c, GFP_KERNEL);
-	/* debugging */
-	get_1284_register(pp, 0, &reg, GFP_KERNEL);
+
+	/* The Belkin F5U002 Rev 2 P80453-B USB parallel port adapter shares the
+	 * device ID 050d:0002 with some other device that works with this
+	 * driver, but it itself does not. Detect and handle the bad cable
+	 * here. */
+	ret = get_1284_register(pp, 0, &reg, GFP_KERNEL);
 	dev_dbg(&intf->dev, "reg: %7ph\n", priv->reg);
+	if (ret < 0)
+		return ret;
 
-	i = usb_find_last_int_in_endpoint(interface, &epd);
-	if (!i) {
+	ret = usb_find_last_int_in_endpoint(interface, &epd);
+	if (!ret) {
 		dev_dbg(&intf->dev, "epaddr %d interval %d\n",
 				epd->bEndpointAddress, epd->bInterval);
 	}
-- 
2.44.0


