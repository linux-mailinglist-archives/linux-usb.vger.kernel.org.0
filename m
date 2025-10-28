Return-Path: <linux-usb+bounces-29760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B7C1317F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 07:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BF56585322
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 06:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CE82BD5A4;
	Tue, 28 Oct 2025 06:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNpUO/q2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AA129827E
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632043; cv=none; b=Pf+xo2ltMmKAmG7dGcZ3ZDWrq3koNJwxwiyN8H969BrSaXZSm8jalN2uonb+NAPkH+U/RbLArw4m7HU2NHGnX4kRop8bKxZ64cOCYm6sEaAHygIjj/EGAlhX/2i4QabLajGXDMKeyJ0Jkeew0Rw3FDGVZ4ggjoo0i4vJQ6qIXmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632043; c=relaxed/simple;
	bh=1POQSgwR6np3tfUAaaJTQqpScPPct8l/UXMGIoYBcMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVKB7jkKv48x0z88PSoPsyxK4LPQxm0xDcJU7zYry2s43TB5YYBPi0evpy+9ZFpWAZ7rRuxVN2NLLZ39n7KK9rFNu8sPUUgeIZwHOPjZluxTFIEVN+8SPLjQY6jeCmL5Zdxu28kbtrV6G8Lp8d56VuElVy25LZd9dTwPwlxPPhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNpUO/q2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761632041; x=1793168041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1POQSgwR6np3tfUAaaJTQqpScPPct8l/UXMGIoYBcMk=;
  b=BNpUO/q2b95Oc5lEXzemcqg0lF4FDuGgkAwo540K2U0qPB3zNa7E1g3D
   ibG3SxpGen8if842aiWaqeuvqOpu0cNtP6kXUkKEy6LN7BL4lJJ7o9Z/i
   CAKEQswjHveW93je6CBTRw8ixK9CLqEaCfWjc3I9BZZ38apPdPLOP/QDE
   7Z78NarYVSE3CG940xGV31m0rvPGi6NyAg1RI/wmIQ1EEHWBzQR71ybGO
   C1dCeN8ipmhnM6wvOAb/9qBkef81FmK7u+nqCZTCMDP7unYNyP59+KgAP
   KRsoAs1h08FkJFPK/fGr4Hzys6aoZ6wxNsgUnahi4zcDmr4avpcJPLPJG
   g==;
X-CSE-ConnectionGUID: 8n/7gjHlSgmZo3Bp7kqk3A==
X-CSE-MsgGUID: oXUknIYhSuWQSmeIcoXESw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75168286"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="75168286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 23:14:00 -0700
X-CSE-ConnectionGUID: IEbeX42iRg+2hKkHvQ6E6g==
X-CSE-MsgGUID: 1xwXtBgISieuTz9a5F463A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="208856002"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2025 23:13:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 197EA96; Tue, 28 Oct 2025 07:13:57 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Update NVM firmware upgrade documentation
Date: Tue, 28 Oct 2025 07:13:56 +0100
Message-ID: <20251028061357.2164810-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251028061357.2164810-1-mika.westerberg@linux.intel.com>
References: <20251028061357.2164810-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Update guide about firmware upgrade of Thunderbolt devices, replacing
outdated recommendations with the use of modern "fwupd" tool.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 Documentation/admin-guide/thunderbolt.rst | 50 ++++++++++++++++-------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 102c693c8f81..07303c1346fb 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -203,10 +203,10 @@ host controller or a device, it is important that the firmware can be
 upgraded to the latest where possible bugs in it have been fixed.
 Typically OEMs provide this firmware from their support site.
 
-There is also a central site which has links where to download firmware
-for some machines:
-
-  `Thunderbolt Updates <https://thunderbolttechnology.net/updates>`_
+Currently, recommended method of updating firmware is through "fwupd" tool.
+It uses LVFS (Linux Vendor Firmware Service) portal by default to get the
+latest firmware from hardware vendors and updates connected devices if found
+compatible. For details refer to: https://github.com/fwupd/fwupd.
 
 Before you upgrade firmware on a device, host or retimer, please make
 sure it is a suitable upgrade. Failing to do that may render the device
@@ -215,18 +215,40 @@ tools!
 
 Host NVM upgrade on Apple Macs is not supported.
 
-Once the NVM image has been downloaded, you need to plug in a
-Thunderbolt device so that the host controller appears. It does not
-matter which device is connected (unless you are upgrading NVM on a
-device - then you need to connect that particular device).
+Fwupd is installed by default. If you don't have it on your system, simply
+use your distro package manager to get it.
+
+To see possible updates through fwupd, you need to plug in a Thunderbolt
+device so that the host controller appears. It does not matter which
+device is connected (unless you are upgrading NVM on a device - then you
+need to connect that particular device).
 
 Note an OEM-specific method to power the controller up ("force power") may
 be available for your system in which case there is no need to plug in a
 Thunderbolt device.
 
-After that we can write the firmware to the non-active parts of the NVM
-of the host or device. As an example here is how Intel NUC6i7KYK (Skull
-Canyon) Thunderbolt controller NVM is upgraded::
+Updating firmware using fwupd is straightforward - refer to official
+readme on fwupd github.
+
+If firmware image is written successfully, the device shortly disappears.
+Once it comes back, the driver notices it and initiates a full power
+cycle. After a while device appears again and this time it should be
+fully functional.
+
+Device of interest should display new version under "Current version"
+and "Update State: Success" in fwupd's interface.
+
+Upgrading firmware manually
+---------------------------------------------------------------
+If possible, use fwupd to updated the firmware. However, if your device OEM
+has not uploaded the firmware to LVFS, but it is available for download
+from their side, you can use method below to directly upgrade the
+firmware.
+
+Manual firmware update can be done with 'dd' tool. To update firmware
+using this method, you need to write it to the non-active parts of NVM
+of the host or device. Example on how to update Intel NUC6i7KYK
+(Skull Canyon) Thunderbolt controller NVM::
 
   # dd if=KYK_TBT_FW_0018.bin of=/sys/bus/thunderbolt/devices/0-0/nvm_non_active0/nvmem
 
@@ -235,10 +257,8 @@ upgrade process as follows::
 
   # echo 1 > /sys/bus/thunderbolt/devices/0-0/nvm_authenticate
 
-If no errors are returned, the host controller shortly disappears. Once
-it comes back the driver notices it and initiates a full power cycle.
-After a while the host controller appears again and this time it should
-be fully functional.
+If no errors are returned, device should behave as described in previous
+section.
 
 We can verify that the new NVM firmware is active by running the following
 commands::
-- 
2.50.1


