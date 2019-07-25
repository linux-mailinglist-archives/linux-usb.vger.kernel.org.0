Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D04D74F34
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 15:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbfGYNXg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 09:23:36 -0400
Received: from mga07.intel.com ([134.134.136.100]:37484 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfGYNXf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Jul 2019 09:23:35 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 06:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; 
   d="scan'208";a="369643233"
Received: from jerryopenix.sh.intel.com (HELO jerryopenix) ([10.239.158.171])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 06:23:34 -0700
Date:   Thu, 25 Jul 2019 21:22:09 +0800
From:   "Liu, Changcheng" <changcheng.liu@intel.com>
To:     valentina.manea.m@gmail.com, shuah@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v2] usbip: tools: fix GCC8 warning for strncpy
Message-ID: <20190725132209.GA27590@jerryopenix>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

GCC8 started emitting warning about using strncpy with number of bytes
exactly equal destination size which could lead to non-zero terminated
string being copied. Use "SYSFS_PATH_MAX - 1" & "SYSFS_BUS_ID_SIZE - 1"
as number of bytes to ensure name is always zero-terminated.

Signed-off-by: Changcheng Liu <changcheng.liu@aliyun.com>
---
v1 -> v2:
 * Correct array tail index
---
 tools/usb/usbip/libsrc/usbip_common.c        | 6 ++++--
 tools/usb/usbip/libsrc/usbip_device_driver.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
index bb424638d75b..b8d7d480595a 100644
--- a/tools/usb/usbip/libsrc/usbip_common.c
+++ b/tools/usb/usbip/libsrc/usbip_common.c
@@ -226,8 +226,10 @@ int read_usb_device(struct udev_device *sdev, struct usbip_usb_device *udev)
 	path = udev_device_get_syspath(sdev);
 	name = udev_device_get_sysname(sdev);
 
-	strncpy(udev->path,  path,  SYSFS_PATH_MAX);
-	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE);
+	strncpy(udev->path,  path,  SYSFS_PATH_MAX - 1);
+	udev->path[SYSFS_PATH_MAX - 1] = '\0';
+	strncpy(udev->busid, name, SYSFS_BUS_ID_SIZE - 1);
+	udev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';
 
 	sscanf(name, "%u-%u", &busnum, &devnum);
 	udev->busnum = busnum;
diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
index 5a3726eb44ab..051d7d3f443b 100644
--- a/tools/usb/usbip/libsrc/usbip_device_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
@@ -91,7 +91,8 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
 	copy_descr_attr16(dev, &descr, idProduct);
 	copy_descr_attr16(dev, &descr, bcdDevice);
 
-	strncpy(dev->path, path, SYSFS_PATH_MAX);
+	strncpy(dev->path, path, SYSFS_PATH_MAX - 1);
+	dev->path[SYSFS_PATH_MAX - 1] = '\0';
 
 	dev->speed = USB_SPEED_UNKNOWN;
 	speed = udev_device_get_sysattr_value(sdev, "current_speed");
@@ -110,7 +111,8 @@ int read_usb_vudc_device(struct udev_device *sdev, struct usbip_usb_device *dev)
 	dev->busnum = 0;
 
 	name = udev_device_get_sysname(plat);
-	strncpy(dev->busid, name, SYSFS_BUS_ID_SIZE);
+	strncpy(dev->busid, name, SYSFS_BUS_ID_SIZE - 1);
+	dev->busid[SYSFS_BUS_ID_SIZE - 1] = '\0';
 	return 0;
 err:
 	fclose(fd);
-- 
2.17.1

