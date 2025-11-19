Return-Path: <linux-usb+bounces-30703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFAC6F5DB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC90E4F8A9C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F02236828C;
	Wed, 19 Nov 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8C/qFmo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099B366DDD
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562281; cv=none; b=MReEicJmuAln+bZo4zBtYEH7eDPOU+QaZMOA5cAlRe54jMtzKDSWHfGNQbzqTWBzvJdcQkHBm9Cf5F/2d0HCeiEw3f1nbbZBgMIwUjQo/RwQ04OW0QCvd9EuSTmSOU3r1dnJbV1ZdzItx0d7ZQB2iQSUbiXljCwRtZYyGp7xKCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562281; c=relaxed/simple;
	bh=4D/DEhTtKCIX6Tqnmtrf94HJc/VpnTXGia/5/640vRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtMgANGGbfbLgiRaxi3xw3fz5XurK31xA2NPY//GkU9fx3BZsHWeHceYy+qEuuXC1NEK82U8Wfp5CM9s9G+CH5o59nISCYqz8zVsv4vqb4BkUKnRjERwmm+AFXqUVuN+bi4cZpFs7S0I7/yIXLD8kxr2YWONSw4XHcMqHS9qZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8C/qFmo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562278; x=1795098278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4D/DEhTtKCIX6Tqnmtrf94HJc/VpnTXGia/5/640vRs=;
  b=d8C/qFmojQKBrz5wVSEQvxiTLnzOCob7YzWaOOGFrxjszdd3ptw56vTp
   oy3YYZlLnCnQ6JjDvXzeDCg+9uUU4reJsi7wnh3k32abkgd5qttFD/xSE
   QXmN9k72mYtPXghI4VXwOaMHX2Wd0xJJ+NK/7MZf7GML8cuud8yo2nL9g
   zR9HD1LGKsLPmtwKskMhZNIzbbQZP/3bCPi5Rn1fLe3+LdQttiwHSyNIm
   V2FReo2gWxULMa/4M/wGZ5W8TJN7BYllK+ercx7yHEpE+P8QEiEAuv62Y
   GJHkYO3Fbn0eLKq4koNdkY6Ekkrvx8GJQYFtvO97HYP0ObaXJVLu/Oo6V
   g==;
X-CSE-ConnectionGUID: k2klxtIlS1qwTgyTkTw2nw==
X-CSE-MsgGUID: VMlYmKoRRkic0CM/FqfbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645491"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645491"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:38 -0800
X-CSE-ConnectionGUID: jWmYgSUqSVajjM4cW6B20Q==
X-CSE-MsgGUID: dgx4alfjTPu1tRZXv+xSiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221991966"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:36 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Hongyu Xie <xiehongyu1@kylinos.cn>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/23] usb: xhci: limit run_graceperiod for only usb 3.0 devices
Date: Wed, 19 Nov 2025 16:23:55 +0200
Message-ID: <20251119142417.2820519-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

run_graceperiod blocks usb 2.0 devices from auto suspending after
xhci_start for 500ms.

Log shows:
[   13.387170] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get port status 7-1 read: 0x2a0, return 0x100
[   13.387177] hub_event:5779: hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.387182] hub_suspend:3903: hub 7-0:1.0: hub_suspend
[   13.387188] hcd_bus_suspend:2250: usb usb7: bus auto-suspend, wakeup 1
[   13.387191] hcd_bus_suspend:2279: usb usb7: suspend raced with wakeup event
[   13.387193] hcd_bus_resume:2303: usb usb7: usb auto-resume
[   13.387296] hub_event:5779: hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.393343] handle_port_status:2034: xhci-hcd PNP0D10:02: handle_port_status: starting usb5 port polling.
[   13.393353] xhci_hub_control:1271: xhci-hcd PNP0D10:02: Get port status 5-1 read: 0x206e1, return 0x10101
[   13.400047] hub_suspend:3903: hub 3-0:1.0: hub_suspend
[   13.403077] hub_resume:3948: hub 7-0:1.0: hub_resume
[   13.403080] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get port status 7-1 read: 0x2a0, return 0x100
[   13.403085] hub_event:5779: hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.403087] hub_suspend:3903: hub 7-0:1.0: hub_suspend
[   13.403090] hcd_bus_suspend:2250: usb usb7: bus auto-suspend, wakeup 1
[   13.403093] hcd_bus_suspend:2279: usb usb7: suspend raced with wakeup event
[   13.403095] hcd_bus_resume:2303: usb usb7: usb auto-resume
[   13.405002] handle_port_status:1913: xhci-hcd PNP0D10:04: Port change event, 9-1, id 1, portsc: 0x6e1
[   13.405016] hub_activate:1169: usb usb5-port1: status 0101 change 0001
[   13.405026] xhci_clear_port_change_bit:658: xhci-hcd PNP0D10:02: clear port1 connect change, portsc: 0x6e1
[   13.413275] hcd_bus_suspend:2250: usb usb3: bus auto-suspend, wakeup 1
[   13.419081] hub_resume:3948: hub 7-0:1.0: hub_resume
[   13.419086] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get port status 7-1 read: 0x2a0, return 0x100
[   13.419095] hub_event:5779: hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.419100] hub_suspend:3903: hub 7-0:1.0: hub_suspend
[   13.419106] hcd_bus_suspend:2250: usb usb7: bus auto-suspend, wakeup 1
[   13.419110] hcd_bus_suspend:2279: usb usb7: suspend raced with wakeup event
[   13.419112] hcd_bus_resume:2303: usb usb7: usb auto-resume
[   13.420455] handle_port_status:2034: xhci-hcd PNP0D10:04: handle_port_status: starting usb9 port polling.
[   13.420493] handle_port_status:1913: xhci-hcd PNP0D10:05: Port change event, 10-1, id 1, portsc: 0x6e1
[   13.425332] hcd_bus_suspend:2279: usb usb3: suspend raced with wakeup event
[   13.431931] handle_port_status:2034: xhci-hcd PNP0D10:05: handle_port_status: starting usb10 port polling.
[   13.435080] hub_resume:3948: hub 7-0:1.0: hub_resume
[   13.435084] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get port status 7-1 read: 0x2a0, return 0x100
[   13.435092] hub_event:5779: hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.435096] hub_suspend:3903: hub 7-0:1.0: hub_suspend
[   13.435102] hcd_bus_suspend:2250: usb usb7: bus auto-suspend, wakeup 1
[   13.435106] hcd_bus_suspend:2279: usb usb7: suspend raced with wakeup event

usb7 and other usb 2.0 root hub were rapidly toggling between suspend
and resume states. More, "suspend raced with wakeup event" confuses people.

So, limit run_graceperiod for only usb 3.0 devices

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b3a59ce1b3f4..5e1442e91743 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1671,7 +1671,7 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 	 * SS devices are only visible to roothub after link training completes.
 	 * Keep polling roothubs for a grace period after xHC start
 	 */
-	if (xhci->run_graceperiod) {
+	if (hcd->speed >= HCD_USB3 && xhci->run_graceperiod) {
 		if (time_before(jiffies, xhci->run_graceperiod))
 			status = 1;
 		else
-- 
2.43.0


