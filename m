Return-Path: <linux-usb+bounces-31379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B1CB4DCB
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 07:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83BF5300BBAD
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 06:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE49226B96A;
	Thu, 11 Dec 2025 06:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuzhO5At"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA3338DEC
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 06:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765434126; cv=none; b=FHbDDOMZ2UNzuwnbRx9coPHu+qdHG0cpu+1v3DGedfZcVyw4mRgqZJ+3jnpyC1b6VQQJ+W//tdypMW9cdkSSPhke/3V6RDZ+xjqnC5ZLpb8gTZ6zuQIBEtzylNoO5AG6ECVE6hvSX1pm7e8640RwYZE87ZcLTHvGl4A8HmN0ZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765434126; c=relaxed/simple;
	bh=ejNmUkNsy2DDxTYKBProBrA5RdV480Ius/UYayQUH+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=juXafDaoyB7nzWle2QLTIbjH8c/3U+Je+WpO56MWOE1954FXY+H+ym0KFSsRcvmHlY/OwfN7rK0Yzuy0d0o6v4xFiOOK9aI4j8li/3Fj/r1AIDJa+r9gjHTmGH6l5+M8QXuKDBJV9bNQrwqfm1zHHOoms0KDAt6x0Rb9yQW0ZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuzhO5At; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so387671a12.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 22:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765434124; x=1766038924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGqqL02UfC+vWBbqRBVTn5+VBHJjxRxIfjPPCX5exjE=;
        b=UuzhO5AtM1aRpP7itnQq9gBH2NPDZwWtwVQXaQ2T2urUzh62vSrMcbBFXWm9j9mcA6
         nxNKXwvW80jB96fZ5WadFM7wVr/+O8plFDc+ZLWjowQvIwFS5tvLEhNg54YcRMY4qsU9
         rTC5WftHMaUecPU0zY/JQ6W8M1k8Mmh5If2r8SMhAp1YaY/S4X6hWy81ux+mBIe2DOS6
         j9w4VZPe3DeSDnKjh1ErX7FUpfz9+5oN8G7hgeX04KJXymHw+hjIdUOiI5cfNMKK1ZDW
         fuqrDJGfJwTf/exGCRPW0O87AtROjHKKN02ygLN9/004xNGF6QPNnVBkbDWXM/kIDdLZ
         olOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765434124; x=1766038924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGqqL02UfC+vWBbqRBVTn5+VBHJjxRxIfjPPCX5exjE=;
        b=q3KbDlRdPWEaDiTwJHxat9xInm4X6F1kX77IXE3AzkilR5RKg1vXuDOes27MFucsDb
         PNjjabJq7gAQiM9ysNWPMxqJ5I7ATB4FRyxtRr4ZStOfkC9cIlKEm/DerrK3atr29PNH
         sVJYTZ86KU+ltlKhIKLrV9YrCOCIaaKRuskxQKuAznfD4UFKsIk6nw/f4mWsvjbpjhil
         N1S6BWKwT7G+aJ6sTiv3HKd40L/yDhAfTQO0B16JoSZx9E1ZtFFPeaGoKHjglmKlM1WN
         RKQm9MEUb5dxSsZsza3ioV7bZSdUyCGZ/nE52QHekZtRJvYrznKq5sZGnyB6NKWtRdhW
         OTIQ==
X-Gm-Message-State: AOJu0YxgJRDYtCkSlS5iON/SBdHaoks1T9ti6WsBlv6pfCavecGulyY5
	Z65A8gl1Q5y+3h2OOwD65tak1V2OE/gf5GoYaWtYrhBy7RvSmb8o6i+39r3lwHBrWLFBaw==
X-Gm-Gg: AY/fxX4nyD7xc2+ruA5OJF2TDZH0gaT+Gc1BdAVMyBEj1jWfva/SyBT1ylWadDafAwl
	CvxH7EG1wVH9tyCVyE+WCQuLcuIxrs9gulGrOjs6sQ+StkUoSrT8XUBvQw2FbnHiJfRMaWlM218
	51FZD6uyzQeGv19Xa7OQGTi/v+w1CSwA8qGcWFMSHd53SnjsSULnXA7d8HzBkfeGAllcMcZjoPm
	kk3GifOPkeNGm7mdpMc3sDRzxgf5RfZcJ9lPe4t/vbrHz0QeZ++BBkGspeWUpOSEn98Gj1YACQE
	mY9tfCMng2pVKUTFkGN90zxYBrv+dSKptjQu/cfrWafjtjKrp2dDI8AZJNpQ+BoQ+EtTm7wbPQ/
	VCho4xSXe3Dgy9M8CbHYhyGayyMZjSphSsC0RX7UKmkSyZ8rzZmP875T8hQaX85MP/fKlOUkuYn
	CDJyyYfHbNGg1HkPAYGJvs5HuVDj+Slh8SWliE8C1YEnTqxyO5SGczU3J3wqF19A+CBUQDkD0i3
	6YnqSQOm3jKs/0=
X-Google-Smtp-Source: AGHT+IEIonuCSLjlxhO4RSJl2p32iUioKetHjlnISBvmbMGl6MY5eePnpxt1YMFBduKsYvpu+HA3+Q==
X-Received: by 2002:a05:7300:c3af:b0:2a4:3593:466b with SMTP id 5a478bee46e88-2ac0553ba6dmr3365382eec.7.1765434124152;
        Wed, 10 Dec 2025 22:22:04 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff110sm5478844c88.10.2025.12.10.22.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:22:03 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] USB: storage: Ignore driver CD interface of SR9700 USB Ethernet adapters
Date: Wed, 10 Dec 2025 22:21:44 -0800
Message-ID: <20251211062144.138796-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SR9700 devices have an SPI flash chip containing a virtual driver
CD, in which case they appear as a device with two interfaces and
product ID 0x9702. Interface 0 is the driver CD and interface 1 is the
Ethernet device. A separate patch to the sr9700 driver will add
support for these devices.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/usb/storage/unusual_devs.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index 47f50d7a385c..b5a764d1ed50 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -1719,6 +1719,13 @@ UNUSUAL_DEV(  0x0fce, 0xe092, 0x0000, 0x0000,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_IGNORE_RESIDUE ),
 
+/* Ignore driver CD interface of SR9700 USB Ethernet adapters */
+UNUSUAL_DEV( 0x0fe6, 0x9702, 0x0000, 0xffff,
+		"CoreChips",
+		"SR9700 USB Ethernet Adapter",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_DEVICE ),
+
 /*
  * Reported by Kevin Cernekee <kpc-usbdev@gelato.uiuc.edu>
  * Tested on hardware version 1.10.
-- 
2.43.0


