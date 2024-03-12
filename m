Return-Path: <linux-usb+bounces-7850-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE69878E51
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 06:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF22328394D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 05:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8F74122C;
	Tue, 12 Mar 2024 05:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9JOr7xf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661843FB87
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710222979; cv=none; b=NuOBJAEhlej8TU6w7tv/rxT64ISWtMXo/ig7avunmsK6eSHAdlVjdBoL7HBsuPd/ZrStn4rBCg+Ut2obIQApsSIq2ZfWpgVPtVFE952SglhTjRq7E5DDveUY2sNh9Hdf2VnyhaTNm17gmwQmcbIKwPOwrX9+L+NVS2dxv3qg7HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710222979; c=relaxed/simple;
	bh=GcGEJYsPsh3uR61ceoiYbkA8Pkb4fKfxwPxjposDJNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5o9eJa09NR39cNYqe1tYW4uhsnQrS/SnNFCotu3rulze5kDqGC+0rVITHb4Nxke3C86vLhohnWQJi1Xmw/8H6lq4/sOZPy9O7RjRwQA6JsndwMmiCOQGnprZZSkmHNIjLKQCyBkmDqQRQlWNWhNJ1civq6xdQd9nHo4mk8P+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9JOr7xf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6aaa2f02cso25777b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 22:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710222978; x=1710827778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLZv7VCenyNKQ2C9zwf/Bi1epoam6M6xNx1Z1DBfiM0=;
        b=D9JOr7xfZK+aWLUba3Dqx8dT9whUCGSOUXS/86OQI4lco4/ZvqZSlXbAWEbubgpgKP
         kvNPSpWwTc9Xdc7wbsNExJNbrovUUmWUDcqLx3qKOwzW3/XY4GBxIW9EONxijWxYW14E
         f9NwsFM1XWxEYSJoCqi90J4XWyaB3E/W/sGErJld37RsOAN0E3KNaEs0VdlmfnR5x3hg
         mGDxpBGn6FSjXS6xLnOl20BQvvkq6lnsnbbLDNZt9CdTVOQoCj3CgPCrBMa+RJsUzlXz
         aZlpPOO+vE51V9pO1GWHlF8PqweNeXrrqC0jkoElnrBknl8WVl0VsTQYPFYXz0CNP8DH
         xQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222978; x=1710827778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLZv7VCenyNKQ2C9zwf/Bi1epoam6M6xNx1Z1DBfiM0=;
        b=KbUBA1y6VULEgiZpi3+NN90NyNxmcO4l9VVHtAj2NZ2RlFxkcH9tO2hthaMclWwg9W
         LgKQpNn1EiVnhygTYohvy8pMIBdVxFIKQEsNBZGQD/6A0MDUjqKdpDuETqtUy/EZKl79
         psZVXBYlgf+itf71WFJbrhvmVnUmJ7lm5WrzW8RDm7p3VCoFsumA5lI/HYHEZG9PIVB4
         2RWMQxD+JdQlSROmZ9GAjiuiJ2gIYUS1WDrGcDeB7pW42BwIIKU7MQaSK2u70m6WL8Qh
         BUud3qZCQckj1i87IM91YOysUqNCJ9LWAfkFeRUj3AEBtUg/sb+yGRNskxKgVNsEWbGi
         JVTg==
X-Forwarded-Encrypted: i=1; AJvYcCUdnre3JwH2nSteRkOKtnX4X0okGETDArWlhsnPqgLbn5FW6WPidpflXhE9ZKZoBsN2Kv/oG3BsBJvyPmUi/qQNU1pruDZ0VMQJ
X-Gm-Message-State: AOJu0Yz21BkDkSXFPtDe+mbm3rqLnhq0es7YuIUrWA+1Op7O1xcMFQ6u
	RXp2ZQ/kyDseddg4d3NOJHr7HaoJ+c2sQQzdFb95Uv7C3SUJ7k2W
X-Google-Smtp-Source: AGHT+IHkWbaDI2E6x3C5rP5FbpAv0qrTyRf4uYYyX7KjmKb//KoCNhTf41tTtcJ7kA81bVUndvFypQ==
X-Received: by 2002:a62:5347:0:b0:6e6:8b59:1bad with SMTP id h68-20020a625347000000b006e68b591badmr5731778pfb.25.1710222977585;
        Mon, 11 Mar 2024 22:56:17 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::d95])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b006e65720e892sm5448898pfp.94.2024.03.11.22.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 22:56:17 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 7/7] usb: misc: uss720: check for incompatible versions of the Belkin F5U002
Date: Mon, 11 Mar 2024 23:50:32 -0600
Message-ID: <20240312055350.205878-7-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312055350.205878-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
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
index 5803919d7cc4..0ad2bfc6af78 100644
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


