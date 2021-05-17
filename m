Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A74382CE4
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 15:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237249AbhEQNKw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 09:10:52 -0400
Received: from mga02.intel.com ([134.134.136.20]:52611 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237247AbhEQNKv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 09:10:51 -0400
IronPort-SDR: hZnovEpcOqhGPgfvEdQbsmghStV7tVolHKy1V1cdD5ZDee2H/GT1s5pgSwCrZkWDHkjLyE+EXx
 QPf7/M/ssoMw==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="187582856"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="187582856"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:06:54 -0700
IronPort-SDR: yR1+fiffJuzmecz8Cf5hrQFvUicsiTI55ZHkbVi+r6IVLr8kEmdmUN2OZUV+OKWW9W8JXstuzG
 vHp/o2sx6Wjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="629982073"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2021 06:06:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2CB4E348; Mon, 17 May 2021 16:07:13 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] Documentation / thunderbolt: Clean up entries
Date:   Mon, 17 May 2021 16:07:11 +0300
Message-Id: <20210517130713.30005-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
References: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Align the "What" entries along with the rest and move
nvm_authenticate_on_disconnect to correct place.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index c41c68f64693..05afeee05538 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -1,4 +1,4 @@
-What: /sys/bus/thunderbolt/devices/.../domainX/boot_acl
+What:		/sys/bus/thunderbolt/devices/.../domainX/boot_acl
 Date:		Jun 2018
 KernelVersion:	4.17
 Contact:	thunderbolt-software@lists.01.org
@@ -21,7 +21,7 @@ Description:	Holds a comma separated list of device unique_ids that
 		If a device is authorized automatically during boot its
 		boot attribute is set to 1.
 
-What: /sys/bus/thunderbolt/devices/.../domainX/deauthorization
+What:		/sys/bus/thunderbolt/devices/.../domainX/deauthorization
 Date:		May 2021
 KernelVersion:	5.12
 Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
@@ -30,7 +30,7 @@ Description:	This attribute tells whether the system supports
 		de-authorize PCIe tunnel by writing 0 to authorized
 		attribute under each device.
 
-What: /sys/bus/thunderbolt/devices/.../domainX/iommu_dma_protection
+What:		/sys/bus/thunderbolt/devices/.../domainX/iommu_dma_protection
 Date:		Mar 2019
 KernelVersion:	4.21
 Contact:	thunderbolt-software@lists.01.org
@@ -39,7 +39,7 @@ Description:	This attribute tells whether the system uses IOMMU
 		it is not (DMA protection is solely based on Thunderbolt
 		security levels).
 
-What: /sys/bus/thunderbolt/devices/.../domainX/security
+What:		/sys/bus/thunderbolt/devices/.../domainX/security
 Date:		Sep 2017
 KernelVersion:	4.13
 Contact:	thunderbolt-software@lists.01.org
@@ -61,7 +61,7 @@ Description:	This attribute holds current Thunderbolt security level
 			 the BIOS.
 		=======  ==================================================
 
-What: /sys/bus/thunderbolt/devices/.../authorized
+What:		/sys/bus/thunderbolt/devices/.../authorized
 Date:		Sep 2017
 KernelVersion:	4.13
 Contact:	thunderbolt-software@lists.01.org
@@ -95,14 +95,14 @@ Description:	This attribute is used to authorize Thunderbolt devices
 		    EKEYREJECTED if the challenge response did not match.
 		==  ========================================================
 
-What: /sys/bus/thunderbolt/devices/.../boot
+What:		/sys/bus/thunderbolt/devices/.../boot
 Date:		Jun 2018
 KernelVersion:	4.17
 Contact:	thunderbolt-software@lists.01.org
 Description:	This attribute contains 1 if Thunderbolt device was already
 		authorized on boot and 0 otherwise.
 
-What: /sys/bus/thunderbolt/devices/.../generation
+What:		/sys/bus/thunderbolt/devices/.../generation
 Date:		Jan 2020
 KernelVersion:	5.5
 Contact:	Christian Kellner <christian@kellner.me>
@@ -110,7 +110,7 @@ Description:	This attribute contains the generation of the Thunderbolt
 		controller associated with the device. It will contain 4
 		for USB4.
 
-What: /sys/bus/thunderbolt/devices/.../key
+What:		/sys/bus/thunderbolt/devices/.../key
 Date:		Sep 2017
 KernelVersion:	4.13
 Contact:	thunderbolt-software@lists.01.org
@@ -226,6 +226,20 @@ Description:	When new NVM image is written to the non-active NVM
 		based mailbox before the device is power cycled. Writing
 		0 here clears the status.
 
+What:		/sys/bus/thunderbolt/devices/.../nvm_authenticate_on_disconnect
+Date:		Oct 2020
+KernelVersion:	v5.9
+Contact:	Mario Limonciello <mario.limonciello@dell.com>
+Description:	For supported devices, automatically authenticate the new Thunderbolt
+		image when the device is disconnected from the host system.
+
+		This file will accept writing values "1" or "2"
+
+		- Writing "1" will flush the image to the storage
+		  area and prepare the device for authentication on disconnect.
+		- Writing "2" will run some basic validation on the image
+		  and flush it to the storage area.
+
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/key
 Date:		Jan 2018
 KernelVersion:	4.15
@@ -308,17 +322,3 @@ Date:		Oct 2020
 KernelVersion:	v5.9
 Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	Retimer vendor identifier read from the hardware.
-
-What:		/sys/bus/thunderbolt/devices/.../nvm_authenticate_on_disconnect
-Date:		Oct 2020
-KernelVersion:	v5.9
-Contact:	Mario Limonciello <mario.limonciello@dell.com>
-Description:	For supported devices, automatically authenticate the new Thunderbolt
-		image when the device is disconnected from the host system.
-
-		This file will accept writing values "1" or "2"
-
-		- Writing "1" will flush the image to the storage
-		  area and prepare the device for authentication on disconnect.
-		- Writing "2" will run some basic validation on the image
-		  and flush it to the storage area.
-- 
2.30.2

