Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05FC2D40B5
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 12:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgLILIr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 06:08:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:56262 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730297AbgLILIr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 06:08:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1607512080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WhJefn4AqWADx2qY58SZ/UMmdOxySBuYsE2SmINQ2Go=;
        b=CMHR1kpVl2nHaWNrJMQ1o2phm4OT/E+NYEF/CFL5GMl5Sm86Tnfc4zP/xMuaHtGil9OBT7
        gBkvVPINyGcINPko9lU3T/YNZ/IhiHgEJ2MvcsrI+yJtqjOzfuZP/zKAr3pW0aBT/EiXRb
        xIXtwIqhR2G0A8RC4s71w+KOKJX6tf8=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2BC81ADCD;
        Wed,  9 Dec 2020 11:08:00 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        david.partridge@perdrix.co.uk
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: UAS: introduce a quirk to set no_write_same
Date:   Wed,  9 Dec 2020 12:07:34 +0100
Message-Id: <20201209110734.30831-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UAS does not share the pessimistic assumption storage
is making that devices cannot deal with WRITE_SAME.
A few devices supported by UAS, are reported to not
deal well with WRITE_SAME. Those need a quirk.

Add it to the device that needs it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: David C. Partridge <david.partridge@perdrix.co.uk>
---
 drivers/usb/storage/uas.c         | 3 +++
 drivers/usb/storage/unusual_uas.h | 7 +++++--
 drivers/usb/storage/usb.c         | 3 +++
 include/linux/usb_usual.h         | 2 ++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 56422c4b4ff3..bef89c6bd1d7 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -868,6 +868,9 @@ static int uas_slave_configure(struct scsi_device *sdev)
 	if (devinfo->flags & US_FL_NO_READ_CAPACITY_16)
 		sdev->no_read_capacity_16 = 1;
 
+	/* Some disks cannot handle WRITE_SAME */
+	if (devinfo->flags & US_FL_NO_SAME)
+		sdev->no_write_same = 1;
 	/*
 	 * Some disks return the total number of blocks in response
 	 * to READ CAPACITY rather than the highest block number.
diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 711ab240058c..870e9cf3d5dc 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -35,12 +35,15 @@ UNUSUAL_DEV(0x054c, 0x087d, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_OPCODES),
 
-/* Reported-by: Julian Groß <julian.g@posteo.de> */
+/*
+ *  Initially Reported-by: Julian Groß <julian.g@posteo.de>
+ *  Further reports David C. Partridge <david.partridge@perdrix.co.uk>
+ */
 UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
 		"LaCie",
 		"2Big Quadra USB3",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
-		US_FL_NO_REPORT_OPCODES),
+		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
 
 /*
  * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 94a64729dc27..90aa9c12ffac 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -541,6 +541,9 @@ void usb_stor_adjust_quirks(struct usb_device *udev, unsigned long *fflags)
 		case 'j':
 			f |= US_FL_NO_REPORT_LUNS;
 			break;
+		case 'k':
+			f |= US_FL_NO_SAME;
+			break;
 		case 'l':
 			f |= US_FL_NOT_LOCKABLE;
 			break;
diff --git a/include/linux/usb_usual.h b/include/linux/usb_usual.h
index 4a19ac3f24d0..6b03fdd69d27 100644
--- a/include/linux/usb_usual.h
+++ b/include/linux/usb_usual.h
@@ -84,6 +84,8 @@
 		/* Cannot handle REPORT_LUNS */			\
 	US_FLAG(ALWAYS_SYNC, 0x20000000)			\
 		/* lies about caching, so always sync */	\
+	US_FLAG(NO_SAME, 0x40000000)				\
+		/* Cannot handle WRITE_SAME */			\
 
 #define US_FLAG(name, value)	US_FL_##name = value ,
 enum { US_DO_ALL_FLAGS };
-- 
2.26.2

