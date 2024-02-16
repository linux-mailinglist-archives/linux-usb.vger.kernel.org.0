Return-Path: <linux-usb+bounces-6564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89147857EE2
	for <lists+linux-usb@lfdr.de>; Fri, 16 Feb 2024 15:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052FA1F21CE4
	for <lists+linux-usb@lfdr.de>; Fri, 16 Feb 2024 14:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8CB12C804;
	Fri, 16 Feb 2024 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgTOwf85"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B093612C532
	for <linux-usb@vger.kernel.org>; Fri, 16 Feb 2024 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092664; cv=none; b=NhWh6FMyG1DEvd/DkRInMECXVn7ThjMGN5TNarPmh0YgtK7lnR7Yy5gxWevTns+hDTspxtQ9B2r7KU0zFvClpkgV4bTRTKxxJKCG4MsGyXqSUPI+GjeeWQzr9mHIumkj+vd6vrFb/PvDvVhD69VZ4kjgb3l2xKQN8Yb8ARtoPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092664; c=relaxed/simple;
	bh=rhDvZV7ArBxuO8bVNqB1KAKXEYD4f8sCpKjbqpmBFzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSCYHg4JXwAuYJ6of8JSifyQVq7KDahJnGnvQRKK4eJ7zfVYAhtlfQcQZ61iGbkfoyugCcN0ZhF+2NaTIiQHZ3z67zotHprWpB6aAlKUAnMeXI+IiREWAsZA2E1guuDu402deQ6RFa82yPQq9FsvaVL2xCduRqWZXXdKnvIV7i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgTOwf85; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708092663; x=1739628663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rhDvZV7ArBxuO8bVNqB1KAKXEYD4f8sCpKjbqpmBFzE=;
  b=RgTOwf85aM2Im149gpvQEX6YqYdRh5QrR6TgxFyLJLOaADIRriIeQgLJ
   XZvJgpG0TKUEuM0rXldtcqE4ellObetbvmMPGWrLCwEfpcPyZ/H5HVkMt
   5pdQVHdGW0CPhvdfgTBIbPUJbygJXHlYWFQBC7MMzydqAlb8nVql2XmkW
   SKhFKemn/B4nIAVfg2W6mx9oAHQFs6KEtw6veZWKCAH0W+qJ/f/Bu3QH7
   V7QqrTVqHhjwOBcoF3L6u57ugrMOg3TwhVNSNZ04QkJptrJkf/sfoQdJK
   LW+qe4GbFfAZTX2o8xxHuhd6aDAzUYL+Rrzpmw0HVA0i+HrsYinLVwHgg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2126887"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2126887"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 06:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="935852246"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="935852246"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2024 06:11:00 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: pmenzel@molgen.mpg.de
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	aros@gmx.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 2/2] usb: port: Don't block port power-off on false peer failures
Date: Fri, 16 Feb 2024 16:12:30 +0200
Message-Id: <20240216141230.3924677-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240216141230.3924677-1-mathias.nyman@linux.intel.com>
References: <9c53ec38-812f-f701-d2f6-91e28367bb82@linux.intel.com>
 <20240216141230.3924677-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several unused ports may share the same bogus location data in ACPI
PLD tables. This causes port peering failures as these several unused
USB2 and USB3 ports suddenly match based on their location.

Don't print the "usb: port power management may be unreliable" warning,
or block port power-off in case peering failed for two ports with
connect type set to USB_PORT_NOT_USED.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/port.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index c628c1abc907..d45fc234bad1 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -517,6 +517,11 @@ static void link_peers_report(struct usb_port *left, struct usb_port *right)
 	rc = link_peers(left, right);
 	if (rc == 0) {
 		dev_dbg(&left->dev, "peered to %s\n", dev_name(&right->dev));
+
+	} else if (left->connect_type == USB_PORT_NOT_USED &&
+		   right->connect_type == USB_PORT_NOT_USED) {
+		dev_dbg(&left->dev, "ignore peering failure to %s as ports are not connectable\n",
+			dev_name(&right->dev));
 	} else {
 		dev_dbg(&left->dev, "failed to peer to %s (%d)\n",
 				dev_name(&right->dev), rc);
-- 
2.25.1


