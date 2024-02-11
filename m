Return-Path: <linux-usb+bounces-6210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A6C8509AA
	for <lists+linux-usb@lfdr.de>; Sun, 11 Feb 2024 15:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639951C20BBA
	for <lists+linux-usb@lfdr.de>; Sun, 11 Feb 2024 14:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F5F5A11C;
	Sun, 11 Feb 2024 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chaospixel.com header.i=@chaospixel.com header.b="EVilCSBD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.chaospixel.com (mail.chaospixel.com [78.46.244.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF501DFD8
	for <linux-usb@vger.kernel.org>; Sun, 11 Feb 2024 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.244.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707663053; cv=none; b=jFl2aCEe/gw5NSvmIeuMhEWRI2hXR1nnE9fcPhIlBFQXNtDNt1PGiPrSOJ4t0mefw4s5qpDQOIWyWDWVqN39kZDunsnYUfPX3c+W0pY+kwU1UbGw4RvS7OjIbgGb4yFnJHcocTOD6Uzu5gwu2ajA3RhvnmUJ4a0st2WesrTRteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707663053; c=relaxed/simple;
	bh=4/Z9Tj/do4wTaQtICFjnYk6QCQXfe/t2K42/lPtCVtU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yp3YLeSfGZtoBN+JhuIbtd+2I3xw3jwRXV67+uHtojTJqfGoPQRWUQsqdRCmmYRbF60z2GsmwZpxGN1/ydjyUaf7RWkcZT6toNK7XhchlLIQLgB5fRcPdYlv//bt60dLnsWHyAc+BS2IE6fE1EWOALFCUoNKd0p8d6zBxq/wt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chaospixel.com; spf=pass smtp.mailfrom=chaospixel.com; dkim=pass (2048-bit key) header.d=chaospixel.com header.i=@chaospixel.com header.b=EVilCSBD; arc=none smtp.client-ip=78.46.244.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chaospixel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaospixel.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=chaospixel.com;
	s=201811; t=1707662684;
	bh=4/Z9Tj/do4wTaQtICFjnYk6QCQXfe/t2K42/lPtCVtU=;
	h=From:To:Cc:Subject:Date:From;
	b=EVilCSBDq14AUeE1s6sTbItRZk2wuYJiEVt3xdnDEdejBJ6K4Mkut00pSk2YvDB7f
	 J2g/UcuAQG4nMwCC6rDNoc/gyI1vVxT1rMIUBy4dTF6TLHmpssPEv2InxdACBj45F2
	 cz8BaskQ1XS//Sv+wtF+6ukyf1a11Wtz7GwwprlViVQnfbFplq5PM97DgTpKx1pFWK
	 Re6lG5G3r/UAXbQuIECLesJzWAGCmuzBliQ/dwkPrCRpSKnWYh0FTRPWv/eGgaZ2+c
	 gzSs/zb85gk0U81RZd0ahEb3I5G1RaHpNXbAzM8TZgwoQ4COmnLY5Ea2acYEul/fFR
	 +DS8hZEVleEEA==
Received: from pollux.home.lan (unknown [IPv6:2a02:8071:b87:ca21:1d0:1416:ba0d:8e8c])
	by mail.chaospixel.com (Postfix) with ESMTPSA id BAFCA49EF97D;
	Sun, 11 Feb 2024 15:44:44 +0100 (CET)
From: Daniel Vogelbacher <daniel@chaospixel.com>
To: johan@kernel.org
Cc: linux-usb@vger.kernel.org,
	Daniel Vogelbacher <daniel@chaospixel.com>
Subject: [PATCH] ftdi_sio: Support for GMC Z216C Adapter IR-USB
Date: Sun, 11 Feb 2024 15:42:46 +0100
Message-Id: <20240211144245.2469439-1-daniel@chaospixel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GMC IR-USB adapter cable utilizes FTDI FT232R chip.

This patch adds VID/PID for this adapter so it can be used
as serial device via ftdi_sio.

Signed-off-by: Daniel Vogelbacher <daniel@chaospixel.com>
---
 drivers/usb/serial/ftdi_sio.c     | 2 ++
 drivers/usb/serial/ftdi_sio_ids.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 13a56783830d..22d01a0f10fb 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1077,6 +1077,8 @@ static const struct usb_device_id id_table_combined[] = {
 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
 	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_JTAG_UNBUF_PID),
 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+	/* GMC devices */
+	{ USB_DEVICE(GMC_VID, GMC_Z216C_PID) },
 	{ }					/* Terminating entry */
 };
 
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index 21a2b5a25fc0..5ee60ba2a73c 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -1606,3 +1606,9 @@
 #define UBLOX_VID			0x1546
 #define UBLOX_C099F9P_ZED_PID		0x0502
 #define UBLOX_C099F9P_ODIN_PID		0x0503
+
+/*
+ * GMC devices
+ */
+#define GMC_VID				0x1cd7
+#define GMC_Z216C_PID			0x0217 /* GMC Z216C Adapter IR-USB */
-- 
2.39.2


