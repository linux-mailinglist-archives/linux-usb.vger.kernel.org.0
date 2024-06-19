Return-Path: <linux-usb+bounces-11437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D3890EBE7
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 15:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B467B26623
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 13:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0566F146A85;
	Wed, 19 Jun 2024 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZxieKUU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A7714532C
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802077; cv=none; b=XQ0q1Fdc3c2BVwnd1xcd/7JvEgbNukfipWloJdnFtxhQv78HwVI3sw4kb3ryvjoxXrgzbi607IHcweG2xOxJlv3PNG+6K+6p1OVfGrwYeDPR6fXd/HlRKFUSXJkhGhoKVXz8ptf+pzhK8W9udRN1Y8HSOBsbwq6Zcs+MsFEmGCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802077; c=relaxed/simple;
	bh=ylzkqJRVSfHTqISmIX8Uzce5RftmPAJfUFfEbR666a4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=its87Ab0Yt+l6lIY6l6eDROlDNkwRMnESHbVEjkiBS3RL7hIaMn0QDia4sDNQaIL/xbSkGO31Qsm2khajiRryMJKmLDGWa1L44w3o5y0x/tcyOfWqDdmggLiXp5c1cpY8qSrhO/bgeG/uwfITyTk8fr/0rKhP14WziiSjhJ8jHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZxieKUU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718802077; x=1750338077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ylzkqJRVSfHTqISmIX8Uzce5RftmPAJfUFfEbR666a4=;
  b=KZxieKUUyUcS1J0JLY5OCaNFGo14hgmW8YVCcxvqBdu8VKMVMmoqrA9c
   xgBOvffSWjgbeSFtfBkopnrLxBDwwf+Pw1aB0wrnWhYhtSsgcvKheWxol
   YYVcDYZczDOBVs7afhmNttjuak2g4O3YvFjKdkvw6KWXvrv9t4RDg3Whj
   B+H0tmd7uqsQ28EfO4FlDxjxqxAopCb/Wui6Vv9CwatXPfVOGYU1WswiM
   L35CTpZ3cxonojjzfRVWwHuBqh3V//yMGKZ2hhY+V7miPiawDjVfREGXh
   flUwNSNll8gHoXqRaJAC77ykZM1j9vOoXJvMbCfB8m8B981KtflfKsOOM
   w==;
X-CSE-ConnectionGUID: f5wlooCVRfmNOJxljiofdw==
X-CSE-MsgGUID: biNVa49cSb6amsiyB7Q8aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15868294"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15868294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:01:17 -0700
X-CSE-ConnectionGUID: LuQgVL5lRi2Sw96F1VuMOQ==
X-CSE-MsgGUID: H2dNWCbcRt6YvSdJ08JFtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="47040483"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2024 06:01:15 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Cc: mika.westerberg@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/4] usb: Add tunneled parameter to usb device structure
Date: Wed, 19 Jun 2024 16:03:03 +0300
Message-Id: <20240619130305.2617784-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 'tunneled' parameter to usb device structure to describe if a device
connection is tunneled over USB4 or connected directly using native
USB2/USB3.

Tunneled devices depend on USB4 NHI host to maintain the tunnel.
Knowledge about tunneled devices is important to ensure correct
suspend and resume order between USB4 hosts and tunneled devices.
i.e. make sure tunnel is up before the USB device using it resumes.

USB hosts such as xHCI have vendor specific ways to detect tunneled
connections. This 'tunneled' parameter can be set by USB3 host driver
during hcd->driver->update_device(hcd, udev) callback

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 ++-
 include/linux/usb.h     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a85173098de1..e11251e3e4fc 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4517,7 +4517,8 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 	if (hcd->speed >= HCD_USB3 && !udev->parent->parent) {
 		port = xhci->usb3_rhub.ports[udev->portnum - 1];
 
-		if (xhci_port_is_tunneled(xhci, port))
+		udev->tunneled = xhci_port_is_tunneled(xhci, port);
+		if (udev->tunneled)
 			dev_dbg(&udev->dev, "tunneled over USB4 link\n");
 		else
 			dev_dbg(&udev->dev, "native USB 3.x link\n");
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1913a13833f2..a4c5c09ea2bd 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -605,6 +605,7 @@ struct usb3_lpm_parameters {
  *	WUSB devices are not, until we authorize them from user space.
  *	FIXME -- complete doc
  * @authenticated: Crypto authentication passed
+ * @tunneled: Connected to root port and tunneled over USB4
  * @lpm_capable: device supports LPM
  * @lpm_devinit_allow: Allow USB3 device initiated LPM, exit latency is in range
  * @usb2_hw_lpm_capable: device can perform USB2 hardware LPM
@@ -685,6 +686,7 @@ struct usb_device {
 	unsigned have_langid:1;
 	unsigned authorized:1;
 	unsigned authenticated:1;
+	unsigned tunneled:1;
 	unsigned lpm_capable:1;
 	unsigned lpm_devinit_allow:1;
 	unsigned usb2_hw_lpm_capable:1;
-- 
2.25.1


