Return-Path: <linux-usb+bounces-6785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC085BDF4
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 14:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB767B25E5F
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 13:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6BE6A8D5;
	Tue, 20 Feb 2024 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXiZth1t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D6E65BD9
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708437495; cv=none; b=urE1Io/z0AJ3GZOSRQW3C08oJcyJXuaoVMg1Q5RWOv8dMogZDDlhknA89VPvvzRQsWxcEy0OcOML177XNv/gwSslVrQwAdPsSbXfIGYPETTPlsgdYp5Vm9Wd9NZNp82Ko7oIT0hpAWT+6DL9d10/x6sL4vTUoKgSsYvCAnceoZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708437495; c=relaxed/simple;
	bh=QdGpsTdKJUfM48znH89n8Ns6XitLS6UEngRa+Cqz/Wc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ScDCexk62pzeWK3FlIyrNtKn8xpDfXbYhfoUpXJf4mDjfSiZYUh4PukkfohdvHvhLuyFmt8e2bowAwqKCXCZou2WrwCQzr8viurs69xMKYapbnck50SQfTSNAIpk8cMXM1ADzKaxb45+lGaXFd+lmtmjfKiNw38ACyDAtAL1obg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXiZth1t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708437494; x=1739973494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QdGpsTdKJUfM48znH89n8Ns6XitLS6UEngRa+Cqz/Wc=;
  b=DXiZth1t/+4gGxfaY8GMlHJOMb274+KgdVKnwU2uhZQGTwBDJIwZ3Y8v
   XTpJUzu9ipEbbWy3Ijn6n/M6/7ZcPNHGl/cgQD2Rk/44TQml0B7D9S3bl
   oQDzLLvkqsaAfq64jVgqtH0BFgw0OeTGASo0PaXWhkWiydzZrRQs9ujCd
   BUyjfuTDTISm6dZq966s8cspH2droD5LRv/UdphxwBJUekeaif1LaPgzD
   2btDeaLF7IL/DXui+CHP5st6LCRZfDuC85gO5GCQFmWrFjcifi2k9Ctxq
   mmJMfmaaDZfzVppBwo8CWRpwFjgGmceu3iz/zM4NheClleM0WuFOcbTwe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2664424"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2664424"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:58:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="936455741"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="936455741"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2024 05:58:11 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: pmenzel@molgen.mpg.de
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	aros@gmx.com,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH v2 2/2] usb: port: Don't try to peer unused USB ports based on location
Date: Tue, 20 Feb 2024 15:59:46 +0200
Message-Id: <20240220135946.4028553-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220135946.4028553-1-mathias.nyman@linux.intel.com>
References: <1075b61e-d380-8e45-61e2-33d181444594@linux.intel.com>
 <20240220135946.4028553-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unused USB ports may have bogus location data in ACPI PLD tables.
This causes port peering failures as these unused USB2 and USB3 ports
location may match.

This is seen on DELL systems where all unused ports return zeroed
location data.

Don't try to peer or match ports that have connect type set to
USB_PORT_NOT_USED.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
v1 -> v2
  Don't try to peer unused ports instead of reacting to failed peering

drivers/usb/core/port.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index c628c1abc907..4d63496f98b6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -573,7 +573,7 @@ static int match_location(struct usb_device *peer_hdev, void *p)
 	struct usb_hub *peer_hub = usb_hub_to_struct_hub(peer_hdev);
 	struct usb_device *hdev = to_usb_device(port_dev->dev.parent->parent);
 
-	if (!peer_hub)
+	if (!peer_hub || port_dev->connect_type == USB_PORT_NOT_USED)
 		return 0;
 
 	hcd = bus_to_hcd(hdev->bus);
@@ -584,7 +584,8 @@ static int match_location(struct usb_device *peer_hdev, void *p)
 
 	for (port1 = 1; port1 <= peer_hdev->maxchild; port1++) {
 		peer = peer_hub->ports[port1 - 1];
-		if (peer && peer->location == port_dev->location) {
+		if (peer && peer->connect_type != USB_PORT_NOT_USED &&
+		    peer->location == port_dev->location) {
 			link_peers_report(port_dev, peer);
 			return 1; /* done */
 		}
-- 
2.25.1


