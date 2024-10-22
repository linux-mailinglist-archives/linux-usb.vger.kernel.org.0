Return-Path: <linux-usb+bounces-16526-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B119AA230
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 14:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A67E282FD8
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 12:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E8719D897;
	Tue, 22 Oct 2024 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nucXsCCe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8FD19538D
	for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729600541; cv=none; b=iOFSAYVgEmteiM//CdYKLzJHcfwDOP1vnQHOnnI+UXGfiULsae6ZRsI+LCqV2ymODP9gpkfenQ0pFHr0Md9fje/ZGBQMqNNHkeM9jP/Hd8wX2DATnEIuD3fidbd/Pk+5Rg9CZRIFrBkHxV54NS8NcFrJseYO2yEgDT6M3BJTWxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729600541; c=relaxed/simple;
	bh=gm7u2qJ8fuFFQDDM5lGtWXk9AhmwCvyfv2bCd7AOgw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SWd2S8jNnsV8d2liFQ46lKluQUIMsG2i2/JDqY+NSmeHVGnDkshKd315VUCDJIzouQchIhk+H5Z1raYUKyJHYQXEeoil8J3jukq2zZSN0WeYGWf5NNn5cEGhz/Ml9/EDyqNQP2mq5hRzynTADxU2O3FDt7YNI3xhStxbcJ6UuNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nucXsCCe; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729600540; x=1761136540;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gm7u2qJ8fuFFQDDM5lGtWXk9AhmwCvyfv2bCd7AOgw8=;
  b=nucXsCCe+PQw26+EsHhp6LLC5gpBnZGWiDyD2WMxVyGltzJJGwxzg2WB
   Jmv5Ru7GNS8xxGRwAjnf6DwlryszxmNGT0GicrFoxan3eKEZ/J+TgmLRP
   kRc3frbdrgvYhBqake5KyQNK/opPVU4UXbLpMAHnmV4HmKPF9WNAehjIE
   aW391cf4WsTUwDW0MPqoMqqz0m4d4PalxLHgiMCT7RPG2lBINm/HQYdV8
   WVLw065NHZU5jU60+FKGdeZeI/xTakLXB+YqWpeVN5oUa+0/99NwKINU5
   EnDvKK2FnyU/hSidKNuPvwhJ6rLh451lbmdCyNKQu+cIYyb5Glmqjw/R8
   A==;
X-CSE-ConnectionGUID: RHaytLPhRoWzXsvKZn/+/Q==
X-CSE-MsgGUID: Qoe+K9PgTuqduxIl02jGsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39716015"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39716015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 05:35:39 -0700
X-CSE-ConnectionGUID: azupuTS1QHWG5PYBNoQazg==
X-CSE-MsgGUID: QGV8q0wXRNiMrPS0TgQQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84647255"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 22 Oct 2024 05:35:37 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	mika.westerberg@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] usb: acpi: fix boot hang due to early incorrect 'tunneled' USB3 device links
Date: Tue, 22 Oct 2024 15:37:42 +0300
Message-Id: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>
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

If the USB4 host interface hasn't probed yet, then we know the USB3
device is not in a tunnel created by the USB4 Host Interface driver, so
don't try to create a device link in this case.

cc: Mario Limonciello <mario.limonciello@amd.com>
Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
Tested-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/usb-acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 21585ed89ef8..9e1ec71881db 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -173,6 +173,17 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
 	if (IS_ERR(nhi_fwnode))
 		return 0;
 
+	/*
+	 * If USB4 Host interface driver isn't set up yet we can't be in a USB3
+	 * tunnel created by it.
+	 */
+	if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
+		dev_info(&port_dev->dev, "%s probed before USB4 host interface\n",
+			 dev_name(&port_dev->child->dev));
+		udev->tunnel_mode = USB_LINK_NATIVE;
+		return 0;
+	}
+
 	link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
 			       DL_FLAG_AUTOREMOVE_CONSUMER |
 			       DL_FLAG_RPM_ACTIVE |
-- 
2.25.1


