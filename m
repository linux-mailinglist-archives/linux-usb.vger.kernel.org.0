Return-Path: <linux-usb+bounces-16635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D059AE5C6
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 15:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98E2DB25B6B
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 13:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2415A1D8DEA;
	Thu, 24 Oct 2024 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1PPBN7i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F71D5AD3
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729775513; cv=none; b=QPFzsZuexgvNBhAhGukXRY/A9S/YCN0tkyuZxwbiL8b+eUL0y2nwdLfOuCpFUUqKBRB1vfOm/Z5ySpwPhyp1FmiqX+z6XixX3+0sxZ7LI2160JCwZQdOyl5gTYEifpSeaQp0KMl0xLatdicHSwuB10lG0r4ViykaYESfNNMXiCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729775513; c=relaxed/simple;
	bh=4w4puW4nXNWxuhdhQzjyvqm6LU1kDZ35oN+wlyDKVSA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=peWolAUNW59hjqN6NaiA+IRznNzuNDBr/blsIuYdO+ugeSPXlbyr+9ASclMjl2WRZfzEPogP6cEl9+NJwGSm9ybqaTFnQ1W6Ftbr2exHSjEQiDy0nU85EKc1bnNczLZO3xi0Xt4cqQfr+AJqgFNgzEksGwhkTlsCYmbyNwK4dJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1PPBN7i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729775510; x=1761311510;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4w4puW4nXNWxuhdhQzjyvqm6LU1kDZ35oN+wlyDKVSA=;
  b=J1PPBN7ioN5pGfQhNOr9/+MxDKdWz0TCtWT4TCRQIBxmIZIKhk+yTSbm
   x/uiwJP7Atr4roEY3ZUCCXZhun34wuooI3R+jhh7hW3z/dJbLLh/Mywzr
   4SreneC39FR664mcswT5qyNPJCljlRIS/gm+SOIFcpFbpTBrIltIlKdz8
   f5HKNSBkYBzK7/Q/f5QTFk7K1QHWmqN7a5heUoCArj40XpHDxYtOPhF37
   M42GNPJg27mC0DPQA4maMcTVFVJL/Kj29JF2/+Ofy0esRy99CnNv5XLoq
   xCLtQQVvaUp+Os8BhJIQhsE4G1HMh964Hyp1phg9iG+ZSw9VoYBXUkOYW
   Q==;
X-CSE-ConnectionGUID: 6bHrkMWVTtiaqQeo3mIIhw==
X-CSE-MsgGUID: Q7WmE2vrSZ23ZZ4DvBeWcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="39990919"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="39990919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 06:11:49 -0700
X-CSE-ConnectionGUID: EddZTgMfS12920P9t9I6Sg==
X-CSE-MsgGUID: Nn7KEyVTQMKznqfclAqLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80504222"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 24 Oct 2024 06:11:48 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	mika.westerberg@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v2] usb: acpi: fix boot hang due to early incorrect 'tunneled' USB3 device links
Date: Thu, 24 Oct 2024 16:13:55 +0300
Message-Id: <20241024131355.3836538-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a boot hang issue triggered when a USB3 device is incorrectly assumed
to be tunneled over USB4, thus attempting to create a device link between
the USB3 "consumer" device and the USB4 "supplier" Host Interface before
the USB4 side is properly bound to a driver.

This could happen if xhci isn't capable of detecting tunneled devices,
but ACPI tables contain all info needed to assume device is tunneled.
i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.

It turns out that even for actual tunneled USB3 devices it can't be
assumed that the thunderbolt driver providing the tunnel is loaded
before the tunneled USB3 device is created.
The tunnel can be created by BIOS and remain in use by thunderbolt/USB4
host driver once it loads.

Solve this by making the device link "stateless", which doesn't create
a driver presence order dependency between the supplier and consumer
drivers.
It still guarantees correct suspend/resume and shutdown ordering.

cc: Mario Limonciello <mario.limonciello@amd.com>
Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
Tested-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 v2: Use stateless device link instead of checking if driver is bound

 drivers/usb/core/usb-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 21585ed89ef8..03c22114214b 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -170,11 +170,11 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
 	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
 		fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
 
-	if (IS_ERR(nhi_fwnode))
+	if (IS_ERR(nhi_fwnode) || !nhi_fwnode->dev)
 		return 0;
 
 	link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
-			       DL_FLAG_AUTOREMOVE_CONSUMER |
+			       DL_FLAG_STATELESS |
 			       DL_FLAG_RPM_ACTIVE |
 			       DL_FLAG_PM_RUNTIME);
 	if (!link) {
-- 
2.25.1


