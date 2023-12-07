Return-Path: <linux-usb+bounces-3855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A7808A42
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 15:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5B4BB214DA
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858E041C64;
	Thu,  7 Dec 2023 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com header.b="cD7b1e7i"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 2072 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Dec 2023 06:20:45 PST
Received: from devnull.tasossah.com (devnull.tasossah.com [IPv6:2001:41d0:1:e60e::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709E147A4
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 06:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JTFfzIRreVZQZMwPlb5hPJ5+ZDMf8o4AfcTzUjpODec=; b=cD7b1e7ipUb2uylqdqLwqOKyqz
	s6UfiIWr27p2diT5hJuPz6N5vHcQt3Wni39efrLCF4xO8f4d158pUA0ugaeTYAg6qW6gLaH4QNTYG
	MLpeTGHVUbDBWNyJqoMCantPqA94a93O3e+MC7m2M4jbRMI3Xh/pLEIPiRK79bpv/Xwc=;
Received: from [2a02:587:6a03:ec00::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1rBEhe-0065nK-1I; Thu, 07 Dec 2023 15:46:10 +0200
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	martin.petersen@oracle.com,
	Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH] usb-storage: Add quirk for incorrect WP on Kingston DT Ultimate 3.0 G3
Date: Thu,  7 Dec 2023 15:44:41 +0200
Message-Id: <20231207134441.298131-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flash drive reports write protect during the first mode sense.

In the past this was not an issue as the kernel called revalidate twice,
thus asking the device for its write protect status twice, with write
protect being disabled in the second mode sense.

However, since commit 1e029397d12f ("scsi: sd: Reorganize DIF/DIX code to
avoid calling revalidate twice") that is no longer the case, thus the
device shows up read only.

[490891.289495] sd 12:0:0:0: [sdl] Write Protect is on
[490891.289497] sd 12:0:0:0: [sdl] Mode Sense: 2b 00 80 08

This does not appear to be a timing issue, as enabling the usbcore quirk
USB_QUIRK_DELAY_INIT has no effect on write protect.

Fixes: 1e029397d12f ("scsi: sd: Reorganize DIF/DIX code to avoid calling revalidate twice")
Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 drivers/usb/storage/unusual_devs.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index 20dcbccb290b..fd68204374f2 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -1305,6 +1305,17 @@ UNUSUAL_DEV(  0x090c, 0x6000, 0x0100, 0x0100,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_INITIAL_READ10 ),
 
+/*
+ * Patch by Tasos Sahanidis <tasos@tasossah.com>
+ * This flash drive always shows up with write protect enabled
+ * during the first mode sense.
+ */
+UNUSUAL_DEV(0x0951, 0x1697, 0x0100, 0x0100,
+		"Kingston",
+		"DT Ultimate G3",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_WP_DETECT),
+
 /*
  * This Pentax still camera is not conformant
  * to the USB storage specification: -
-- 
2.25.1


