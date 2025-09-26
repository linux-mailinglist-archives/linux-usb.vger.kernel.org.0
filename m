Return-Path: <linux-usb+bounces-28693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8EDBA27CB
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 08:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EE544C8334
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 06:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885C027A442;
	Fri, 26 Sep 2025 06:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHbySpC4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517D8275B02
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 06:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758866565; cv=none; b=BVMdbqHnkN7sKu2E8FNjtM228hIFLGpEPMslRskhusU5jNBlUpFqPPyyiiAOK5Xp3laF5Um8RFx3MruFpE0FIFEgz84hL+fK9UYm3U+432CdpvngHcIhaeNyhTDfrgaR/ZzBVRAqtCvWpCqstvH6uWuHyNHI/OhFwUhLBWDVMsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758866565; c=relaxed/simple;
	bh=POyFtLZ7UIXGuFMD1yKppyUrmoQC7dA7w7dQvtUqCm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ApSgshnCih7AXAZfvL6IvaPcOHyAixezjugUSKSdVHaqQ6ARTf+TDgM+S5j6Ko4YuYbb/NBbpNi6EAUPSJ2VjTd/JAiazyCsxGo9aLU9S7pabenHUgRluNVvGtywNnjSeRpxGqAc6i4JWUtd8dSaDEeQqwL8moXonAr9h4s6bpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHbySpC4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-579d7104c37so2453280e87.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 23:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758866561; x=1759471361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fBcy3c/E/T3NGDH5JHB3RnEcKctDeRvXgPqBJQGNSA=;
        b=WHbySpC46b35XnuWdjNKRiuWu3/yPOP11IBf6syhJhsgNU9a7C88KcJZE85qt87fI9
         2UTl5P+Mw9QgksPbvS9SUhtXIx5TAs+MzsDg3Zy7uvazcgYN27MQ9gNHQtfCPzAJsmWP
         HTjBMDCNKAfGbDI3U/oke8FW0H4Igg+F9BvouFS0Y8Fm044tZWc/0o31ERbNtRRsfZwD
         IX8pPn+3oh1SkaxwI4tDG8tfCdeTYAvdP/Je+OtDMrnjoPkgiu2zAIscbm4hk2yHeF5B
         cS2UkT0rkZ1KNal2igh4tLfbaXsEgr9gtxdRAfrBhScPuK2DWYmu9TbMlUbaTrNNYZ91
         KLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758866561; x=1759471361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fBcy3c/E/T3NGDH5JHB3RnEcKctDeRvXgPqBJQGNSA=;
        b=bDM1OhB4VodZ6yzCDNvY0rJK04zY/x2K5jvkjD0QXDJs+qKzAac7ecV0cF+kCgd7B2
         7oy1v1jDWj+iuqSgqAHSFYb69flacETM60mBuImcHnEph3kCp3qkCNcideqRPrcNsonD
         Hf4yRu2c8VNvXfAFSJ+ZTHz0cGZTvkWzpUsHEbc8JB3HbN33Df3PFhVmB6vVk8RShbY5
         /Ed5KDJcrwEIKZt7BQueucxbRz1joGnnMWewpvZs/UiUkfu9xwdFaprr1sAIXyhcmpRq
         ODqj0liXdpFRo419eYBQ//tYadx4KKerP7j8bL68nDLp/ipJQcpSpzRqi8p2z33vGPRU
         WIdg==
X-Forwarded-Encrypted: i=1; AJvYcCV+szAu15dqCLRqxO9WbaRxa+FMHyEfG2qDx/f7I+QmtOIj0yX3IQcHtMCFv8rHERLgRGVL+kGmMJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg/9QNih/gRZFg6I/MZz9y4BHX1RQlCH8lR9NEbVxzyxpjCO1L
	ox2ZlW6PDhQ36ri+8r4gLP+XyZPYhFP1gIrfkOW4hhhByZRqcxwhSbwC
X-Gm-Gg: ASbGncuP9d/krRknEvgvYKHNH3PMW86zr4cCH3BIK9cz5aLYD/lWWlfrLPESb2Vic8v
	rUVeMlq83KsgYb9OkSvttGCxpYAAtvlUYG7taa/U/O5IqQ+pjVr5U3pozuJFDuL+A5gIjCakLqo
	qm249euMIvwwIGiN79mB8OaAlBVIfK2oxhE35HtLEZmqtF7thklZ3/j+083m3gj1XlH2+XNkvMx
	ReN4/fL5goUIdAfCy5O98nGK+axvosY6HgU818NLp43e2pDiV/vWfOh5psqR5LeJdfJZkbwdShB
	1jhkqyGmx5i326OsubQs1N6AdpjWLMuY9jkqYfUXU3Hf5XEPUHqdKEOmp+xEDhOlPKRi7LyRxVG
	9+KvSbigpMQexzarlR2ocf0/8HDMnRlW2LYTawA8gQcEXmayBHd3Sd+F5A0Fn7XZmne2XW2u2fu
	8bKw==
X-Google-Smtp-Source: AGHT+IGV8QDcAeAN6q0hBhlpXKx5E3Z5Sk+qkGALyzG9+OrIh/NJRGoVi2Z2NS1LSyZkITzGL0IGHw==
X-Received: by 2002:a05:6512:3d8a:b0:577:494e:ca70 with SMTP id 2adb3069b0e04-582d092d95cmr1963358e87.8.1758866561031;
        Thu, 25 Sep 2025 23:02:41 -0700 (PDT)
Received: from Cryo-Lima.localdomain (109-227-126-171.dynamic-pool.mclaut.cc. [109.227.126.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583173d0f44sm1499633e87.143.2025.09.25.23.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 23:02:40 -0700 (PDT)
From: Oleksandr Suvorov <cryosay@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Suvorov <cryosay@gmail.com>
Subject: [PATCH] USB: serial: ftdi_sio: add device ID for U-Blox EVK-M101
Date: Fri, 26 Sep 2025 09:02:35 +0300
Message-ID: <20250926060235.3442748-1-cryosay@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The U-Blox has a USB Type-C port that presents itself as a USB device
(1546:0506) [1] with four attached FTDI serial ports, connected to:
- EVK-M101 current sensors
- EVK-M101 I2C
- EVK-M101 UART
- EVK-M101 port D

This commit registers U-Blox's VID/PID of this device so that FTDI SIO driver
successfully registers these 4 serial ports.

[1]
usb 5-1.3: new high-speed USB device number 11 using xhci_hcd
usb 5-1.3: New USB device found, idVendor=1546, idProduct=0506, bcdDevice= 8.00
usb 5-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 5-1.3: Product: EVK-M101
usb 5-1.3: Manufacturer: u-blox AG

Datasheet: https://content.u-blox.com/sites/default/files/documents/EVK-M10_UserGuide_UBX-21003949.pdf

Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>
---
 drivers/usb/serial/ftdi_sio.c     | 1 +
 drivers/usb/serial/ftdi_sio_ids.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 49666c33b41f..5fc9266c1cb3 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1074,6 +1074,7 @@ static const struct usb_device_id id_table_combined[] = {
 	/* U-Blox devices */
 	{ USB_DEVICE(UBLOX_VID, UBLOX_C099F9P_ZED_PID) },
 	{ USB_DEVICE(UBLOX_VID, UBLOX_C099F9P_ODIN_PID) },
+	{ USB_DEVICE(UBLOX_VID, UBLOX_EVK_M101_PID) },
 	/* FreeCalypso USB adapters */
 	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_JTAG_BUF_PID),
 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index 4cc1fae8acb9..2539b9e2f712 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -1614,6 +1614,7 @@
 #define UBLOX_VID			0x1546
 #define UBLOX_C099F9P_ZED_PID		0x0502
 #define UBLOX_C099F9P_ODIN_PID		0x0503
+#define UBLOX_EVK_M101_PID		0x0506
 
 /*
  * GMC devices
-- 
2.48.1


