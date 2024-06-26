Return-Path: <linux-usb+bounces-11681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40402918151
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA7D91F24BE6
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEC6149C53;
	Wed, 26 Jun 2024 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SV7ZnN2V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC91822EF
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406017; cv=none; b=fgvafPHgMYIZbs3w1n4zOXbPxaHbTSyN4lKLfcwgjCcmcEBFLNToYLXPFPloRwgYFPuSboNRu3xZiVYAy9TM59kDnn6YSK2BwsSzyuw92FDWF/btD/E6HdV5pr5pHaXwgHO3x7fM+bzUEzz5RTlxMTSaZiezjymnsSikRfVsNg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406017; c=relaxed/simple;
	bh=9veFRl0wSCnpDIZtRVTFqklQSHOIwfpiY4mWIGD+K/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZRHlk8ygZ1hocXg3WGUO6s9WzjcqD6PY+rWr0vgHlUqx1ObRUJbCfD922UXiH39F0awzV5RuVdpC37ClDHkYZdZtvr5gjlPG7WdcHOeis2BGZiJiwommJ2gylp9kbR7SpwuPQOPcqkzAu5kfUT0wswH48LbEWrV+7ANT9hGfZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SV7ZnN2V; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406016; x=1750942016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9veFRl0wSCnpDIZtRVTFqklQSHOIwfpiY4mWIGD+K/k=;
  b=SV7ZnN2Vox06ybXSgpc+Uaby7ZxmOpbEbmai7z0LsTqteE1AF2xcJTnL
   8LLeMXrDy64EXQ2mObwkxThP0ryGdWHlaGN0AUG5ZqslD4k2cdm3biE6z
   N2AuFvRp8cFI2+V4btaWBB/Ke7fHATbwOw2GIMznJh5qy81bHsDg3wD0c
   nWWcBWThgS/LrELd2TmququditAxCdyu8u7uQWHKLHhI0Ym2eGm9k9hTl
   hE/LUvUI3FSXUW4R56hsCRZB5MxsKLUB2oCUdk+n+NPRqsMYKjl91DN0J
   l56MS2VdCbzIT5WUMsPZ8Tkeo8WqrQtJ92jDR9GdlJukm/QlMSRrYS2e6
   A==;
X-CSE-ConnectionGUID: Bj3UATPRSlGzenrbwCBRpg==
X-CSE-MsgGUID: RdPkAX6mRSuSmnxJA7/Eqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353387"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353387"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:55 -0700
X-CSE-ConnectionGUID: KEPPgcC+RGGmFTEZM/nUfQ==
X-CSE-MsgGUID: kemX2FqXQhuq/tOoi9T5Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442639"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:53 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/21] usb: xhci: remove unused argument from handle_port_status()
Date: Wed, 26 Jun 2024 15:48:22 +0300
Message-Id: <20240626124835.1023046-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Argument struct 'xhci_interrupter *ir' is not used, and as a consequence
is removed.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c2605e89adb0..e9130c7c2c53 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1883,9 +1883,7 @@ static void xhci_cavium_reset_phy_quirk(struct xhci_hcd *xhci)
 	} while (!(pll_lock_check & 0x1) && --retry_count);
 }
 
-static void handle_port_status(struct xhci_hcd *xhci,
-			       struct xhci_interrupter *ir,
-			       union xhci_trb *event)
+static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 {
 	struct usb_hcd *hcd;
 	u32 port_id;
@@ -2980,7 +2978,7 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
 		handle_cmd_completion(xhci, &event->event_cmd);
 		break;
 	case TRB_PORT_STATUS:
-		handle_port_status(xhci, ir, event);
+		handle_port_status(xhci, event);
 		break;
 	case TRB_TRANSFER:
 		handle_tx_event(xhci, ir, &event->trans_event);
-- 
2.25.1


