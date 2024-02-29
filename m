Return-Path: <linux-usb+bounces-7342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B386CB16
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BA26B22C2A
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 14:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2111350C9;
	Thu, 29 Feb 2024 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyrXE8RR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3412FB29
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709216001; cv=none; b=Xld3pqxBW6mh1ZES7aje1ETekoaQMlyoK8S+ZAxeQfoIIagU2r/60JpGjs4KnYxwww9O8Wn14vpydbYIpq80QKfmIgrnRcRRh0IZn6rr4x9nhV6UxFKpnsuvfJB0scJXSAH7xYfhXT0omkf8W5aMu9bC8M/CzZfC1/bDYflWjKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709216001; c=relaxed/simple;
	bh=x8njXuX7QPqpTwdtLMXaToyhbmGMPg88HNXHkBcXCHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HGcpMJFWtJCHtHR+wCpcpRFML9KKAmUC6DNkf0orYbD0NpZsMt5oOreEvILYVtGgP5yHR5V/26Z24rR3lmzwGjJgbFHXEaragn8At3Eaq43cs3PODks3pRF1tqhAIBCKDK1HkABTq1s/+5bxEGzw6pSZ1NqEgYt1umkwEkSdXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyrXE8RR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709216000; x=1740752000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x8njXuX7QPqpTwdtLMXaToyhbmGMPg88HNXHkBcXCHs=;
  b=ZyrXE8RRhP5TRnFdYLF/rjRIkTBaU72v1Sd3LTYPcfGjPNycjwTj5e22
   JidIMKKF0txPhf+BvUgGCf0TckUc+Uc6KXPcZnZlVoCIIGtSmFwLgEMNb
   YJumRBq4UuOxYiNLlPjFKeRZGYFvfegL7jL+YCgHCh2Ld+C129EDfqsGK
   PLFnha25VqTPpWFiZBqU4QG6Qnv2Ew9C27Qn8a8yJvXm1NrORwv7xJDWw
   F+2P7/7ac5O1iRMZN4EquZe1dJbZQzFIxrzXFYK92Ow0LL7N01+AczwBC
   OhTVxAkNVSCBtfkRgSTVTD58BMC7jQG3JTHPLtHNSQcRSFaCJRfqmhnku
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3609406"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035996"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035996"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 06:13:16 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Uday M Bhat <uday.m.bhat@intel.com>
Subject: [PATCH 8/9] xhci: dbc: poll at different rate depending on data transfer activity
Date: Thu, 29 Feb 2024 16:14:37 +0200
Message-Id: <20240229141438.619372-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
References: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DbC driver starts polling for events immediately when DbC is enabled.
The current polling interval is 1ms, which keeps the CPU busy, impacting
power management even when there are no active data transfers.

Solve this by polling at a slower rate, with a 64ms interval as default
until a transfer request is queued, or if there are still are pending
unhandled transfers at event completion.

Tested-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 13 +++++++++++--
 drivers/usb/host/xhci-dbgcap.h |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index d82935d31126..8a9869ef0db6 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -634,7 +634,8 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
 		return ret;
 	}
 
-	return mod_delayed_work(system_wq, &dbc->event_work, 1);
+	return mod_delayed_work(system_wq, &dbc->event_work,
+				msecs_to_jiffies(dbc->poll_interval));
 }
 
 static void xhci_dbc_stop(struct xhci_dbc *dbc)
@@ -899,8 +900,10 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 	enum evtreturn		evtr;
 	struct xhci_dbc		*dbc;
 	unsigned long		flags;
+	unsigned int		poll_interval;
 
 	dbc = container_of(to_delayed_work(work), struct xhci_dbc, event_work);
+	poll_interval = dbc->poll_interval;
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	evtr = xhci_dbc_do_handle_events(dbc);
@@ -916,13 +919,18 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 			dbc->driver->disconnect(dbc);
 		break;
 	case EVT_DONE:
+		/* set fast poll rate if there are pending data transfers */
+		if (!list_empty(&dbc->eps[BULK_OUT].list_pending) ||
+		    !list_empty(&dbc->eps[BULK_IN].list_pending))
+			poll_interval = 1;
 		break;
 	default:
 		dev_info(dbc->dev, "stop handling dbc events\n");
 		return;
 	}
 
-	mod_delayed_work(system_wq, &dbc->event_work, 1);
+	mod_delayed_work(system_wq, &dbc->event_work,
+			 msecs_to_jiffies(poll_interval));
 }
 
 static const char * const dbc_state_strings[DS_MAX] = {
@@ -1175,6 +1183,7 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 	dbc->idVendor = DBC_VENDOR_ID;
 	dbc->bcdDevice = DBC_DEVICE_REV;
 	dbc->bInterfaceProtocol = DBC_PROTOCOL;
+	dbc->poll_interval = DBC_POLL_INTERVAL_DEFAULT;
 
 	if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
 		goto err;
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index e39e3ae1677a..92661b555c2a 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -94,6 +94,7 @@ struct dbc_ep {
 
 #define DBC_QUEUE_SIZE			16
 #define DBC_WRITE_BUF_SIZE		8192
+#define DBC_POLL_INTERVAL_DEFAULT	64	/* milliseconds */
 
 /*
  * Private structure for DbC hardware state:
@@ -140,6 +141,7 @@ struct xhci_dbc {
 
 	enum dbc_state			state;
 	struct delayed_work		event_work;
+	unsigned int			poll_interval;	/* ms */
 	unsigned			resume_required:1;
 	struct dbc_ep			eps[2];
 
-- 
2.25.1


