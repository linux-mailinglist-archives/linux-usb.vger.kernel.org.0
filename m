Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDAB38900D
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 16:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347106AbhESOOM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 10:14:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:32007 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347100AbhESOOE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 10:14:04 -0400
IronPort-SDR: ebQsB83jEHs8jErkUOiNb2y08EBNQGaKco8MAVDioSKOtm9emdyRlSpmJ9EGpU8KMZDR2YYLdz
 uBxUxE4qUQDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200677119"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="200677119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 07:12:44 -0700
IronPort-SDR: F7P/YX9xKFL8tR5Z6kgReDgMH7KpuLUFNrZ7mswEVfEqKMluegB0m4c0RkVUDJnV2uih/OgguZ
 tcetupXKo2uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="405607657"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 19 May 2021 07:12:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A6DBE6C9; Wed, 19 May 2021 17:12:59 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-acpi@vger.kernel.org,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 7/9] thunderbolt: Allow router NVM authenticate separately
Date:   Wed, 19 May 2021 17:12:57 +0300
Message-Id: <20210519141259.84839-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519141259.84839-1-mika.westerberg@linux.intel.com>
References: <20210519141259.84839-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It may be useful if the actual NVM authentication can be delayed to be
run later, for instance when the user logs out. For this reason add a
new NVM operation (AUHENTICATE_ONLY) that just triggers the authentication
procedure over whatever was written to the NVM storage.

This is not supported with Thunderbolt 1-3 devices, though.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         |  5 +-
 drivers/thunderbolt/switch.c                  | 50 ++++++++++++-------
 drivers/thunderbolt/tb.h                      |  2 +
 drivers/thunderbolt/usb4.c                    | 13 ++++-
 4 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index f6743dc33aac..da580b504c87 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -213,12 +213,15 @@ Description:	When new NVM image is written to the non-active NVM
 		restarted with the new NVM firmware. If the image
 		verification fails an error code is returned instead.
 
-		This file will accept writing values "1" or "2"
+		This file will accept writing values "1", "2" or "3".
 
 		- Writing "1" will flush the image to the storage
 		  area and authenticate the image in one action.
 		- Writing "2" will run some basic validation on the image
 		  and flush it to the storage area.
+		- Writing "3" will authenticate the image that is
+		  currently written in the storage area. This is only
+		  supported with USB4 devices.
 
 		When read holds status of the last authentication
 		operation if an error occurred during the process. This
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index bf4821d3bbab..83b1ef3d5d03 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -303,13 +303,23 @@ static inline int nvm_read(struct tb_switch *sw, unsigned int address,
 	return dma_port_flash_read(sw->dma_port, address, buf, size);
 }
 
-static int nvm_authenticate(struct tb_switch *sw)
+static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
 {
 	int ret;
 
-	if (tb_switch_is_usb4(sw))
+	if (tb_switch_is_usb4(sw)) {
+		if (auth_only) {
+			ret = usb4_switch_nvm_set_offset(sw, 0);
+			if (ret)
+				return ret;
+		}
+		sw->nvm->authenticating = true;
 		return usb4_switch_nvm_authenticate(sw);
+	} else if (auth_only) {
+		return -EOPNOTSUPP;
+	}
 
+	sw->nvm->authenticating = true;
 	if (!tb_route(sw)) {
 		nvm_authenticate_start_dma_port(sw);
 		ret = nvm_authenticate_host_dma_port(sw);
@@ -1713,8 +1723,7 @@ static ssize_t nvm_authenticate_sysfs(struct device *dev, const char *buf,
 				      bool disconnect)
 {
 	struct tb_switch *sw = tb_to_switch(dev);
-	int val;
-	int ret;
+	int val, ret;
 
 	pm_runtime_get_sync(&sw->dev);
 
@@ -1737,22 +1746,27 @@ static ssize_t nvm_authenticate_sysfs(struct device *dev, const char *buf,
 	nvm_clear_auth_status(sw);
 
 	if (val > 0) {
-		if (!sw->nvm->flushed) {
-			if (!sw->nvm->buf) {
+		if (val == AUTHENTICATE_ONLY) {
+			if (disconnect)
 				ret = -EINVAL;
-				goto exit_unlock;
+			else
+				ret = nvm_authenticate(sw, true);
+		} else {
+			if (!sw->nvm->flushed) {
+				if (!sw->nvm->buf) {
+					ret = -EINVAL;
+					goto exit_unlock;
+				}
+
+				ret = nvm_validate_and_write(sw);
+				if (ret || val == WRITE_ONLY)
+					goto exit_unlock;
 			}
-
-			ret = nvm_validate_and_write(sw);
-			if (ret || val == WRITE_ONLY)
-				goto exit_unlock;
-		}
-		if (val == WRITE_AND_AUTHENTICATE) {
-			if (disconnect) {
-				ret = tb_lc_force_power(sw);
-			} else {
-				sw->nvm->authenticating = true;
-				ret = nvm_authenticate(sw);
+			if (val == WRITE_AND_AUTHENTICATE) {
+				if (disconnect)
+					ret = tb_lc_force_power(sw);
+				else
+					ret = nvm_authenticate(sw, false);
 			}
 		}
 	}
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 863d80ad44ab..53f6bb85b178 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -61,6 +61,7 @@ struct tb_nvm {
 enum tb_nvm_write_ops {
 	WRITE_AND_AUTHENTICATE = 1,
 	WRITE_ONLY = 2,
+	AUTHENTICATE_ONLY = 3,
 };
 
 #define TB_SWITCH_KEY_SIZE		32
@@ -1049,6 +1050,7 @@ int usb4_switch_set_sleep(struct tb_switch *sw);
 int usb4_switch_nvm_sector_size(struct tb_switch *sw);
 int usb4_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 			 size_t size);
+int usb4_switch_nvm_set_offset(struct tb_switch *sw, unsigned int address);
 int usb4_switch_nvm_write(struct tb_switch *sw, unsigned int address,
 			  const void *buf, size_t size);
 int usb4_switch_nvm_authenticate(struct tb_switch *sw);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 8af96dbaa7a7..76d7335aa440 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -547,8 +547,17 @@ int usb4_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 				usb4_switch_nvm_read_block, sw);
 }
 
-static int usb4_switch_nvm_set_offset(struct tb_switch *sw,
-				      unsigned int address)
+/**
+ * usb4_switch_nvm_set_offset() - Set NVM write offset
+ * @sw: USB4 router
+ * @address: Start offset
+ *
+ * Explicitly sets NVM write offset. Normally when writing to NVM this
+ * is done automatically by usb4_switch_nvm_write().
+ *
+ * Returns %0 in success and negative errno if there was a failure.
+ */
+int usb4_switch_nvm_set_offset(struct tb_switch *sw, unsigned int address)
 {
 	u32 metadata, dwaddress;
 	u8 status = 0;
-- 
2.30.2

