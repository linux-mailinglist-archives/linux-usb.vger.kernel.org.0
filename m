Return-Path: <linux-usb+bounces-4134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6068119DF
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24236282460
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EE053E27;
	Wed, 13 Dec 2023 16:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dqtg2pM9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E787E3A8F8
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B93C433CA;
	Wed, 13 Dec 2023 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485799;
	bh=rdciy/0/Z93nKkXxUuM7UguPu20ZVfuX9LAn386poEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dqtg2pM9xbljP02JIqTH46nYNlnAMc7Q0E0OQra/fNqCKcgEKD1nnQ5YsUa14ouEy
	 dznp2ey28JKoFwQWuHBrgt6FVXBO6zOqssz14lC9Q8kNx4XJ9tMYscdQbAIPfA76Bq
	 T9xxaf0x1MycykiWCpwo9huxkrQsKX+chqZAz1xI98HJ3A3JfmXM3THD/QqVp9nGiP
	 N6DzwPtdtNjTT7Xwx+rUyTC3epNyMTShrjkj0SLWt8udrbZd++IrE7EE2PhRggtR+R
	 q29LTgz93GTzFyA5dkn2L54biIrmynq+pYy9AwbLkPbFmMk8AyktcVpevdhthplqVi
	 jlisSRxWHe04Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 12/12] usb: storage: Remove snprintf() from sysfs call-backs and replace with sysfs_emit()
Date: Wed, 13 Dec 2023 16:42:41 +0000
Message-ID: <20231213164246.1021885-13-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since snprintf() has the documented, but still rather strange trait of
returning the length of the data that *would have been* written to the
array if space were available, rather than the arguably more useful
length of data *actually* written, it is usually considered wise to use
something else instead in order to avoid confusion.

In the case of sysfs call-backs, new wrappers exist that do just that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: usb-storage@lists.one-eyed-alien.net
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/storage/sierra_ms.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sierra_ms.c
index 0774ba22fb66e..177fa6cd143ab 100644
--- a/drivers/usb/storage/sierra_ms.c
+++ b/drivers/usb/storage/sierra_ms.c
@@ -98,26 +98,26 @@ static ssize_t truinst_show(struct device *dev, struct device_attribute *attr,
 	struct usb_device *udev = interface_to_usbdev(intf);
 	int result;
 	if (swi_tru_install == TRU_FORCE_MS) {
-		result = snprintf(buf, PAGE_SIZE, "Forced Mass Storage\n");
+		result = sysfs_emit(buf, "Forced Mass Storage\n");
 	} else {
 		swocInfo = kmalloc(sizeof(struct swoc_info), GFP_KERNEL);
 		if (!swocInfo) {
-			snprintf(buf, PAGE_SIZE, "Error\n");
+			sysfs_emit(buf, "Error\n");
 			return -ENOMEM;
 		}
 		result = sierra_get_swoc_info(udev, swocInfo);
 		if (result < 0) {
 			dev_dbg(dev, "SWIMS: failed SWoC query\n");
 			kfree(swocInfo);
-			snprintf(buf, PAGE_SIZE, "Error\n");
+			sysfs_emit(buf, "Error\n");
 			return -EIO;
 		}
 		debug_swoc(dev, swocInfo);
-		result = snprintf(buf, PAGE_SIZE,
-			"REV=%02d SKU=%04X VER=%04X\n",
-			swocInfo->rev,
-			swocInfo->LinuxSKU,
-			swocInfo->LinuxVer);
+		result = sysfs_emit(buf,
+				    "REV=%02d SKU=%04X VER=%04X\n",
+				    swocInfo->rev,
+				    swocInfo->LinuxSKU,
+				    swocInfo->LinuxVer);
 		kfree(swocInfo);
 	}
 	return result;
-- 
2.43.0.472.g3155946c3a-goog


