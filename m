Return-Path: <linux-usb+bounces-18828-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8E9FD409
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 13:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F46F3A08A8
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 12:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF601F191B;
	Fri, 27 Dec 2024 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAzZBcxN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8095B156F30
	for <linux-usb@vger.kernel.org>; Fri, 27 Dec 2024 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300854; cv=none; b=WeSvt7+wc02dUHUSg4F2GEAduo3WrQGu7aapQKCi42TDNbIWZ9xlsByOEsyDTvbH0/F+rpCxeSPH3lwikqe6q2x+MDC18ENrOHDk4yFNXB/3coMcAlWraZ+2qbESSdFRxskSXfFzxcvPK2iUW+C3XF3C/VGlxWtXOrPBo5rHvNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300854; c=relaxed/simple;
	bh=vfrezEXgg5FfHcY5XjWZybh4amu/zpUhGq8PHVUsPOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H17Nv5QdiR5NE+DMnDz40zMwUAFnkA5pyVKjiKNamKsj9z5bm18t2DbVMqM0MbSJaHhXFiicwCwqNspGdkS0X8UER1+EgWAahPUUYsKgJo3kbdYmO7Yie/nQ/TXYRkKL6+AOjCmknSvz2BkVpd0Els9U4efR5vuZA4iWuZO5kl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAzZBcxN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735300853; x=1766836853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vfrezEXgg5FfHcY5XjWZybh4amu/zpUhGq8PHVUsPOc=;
  b=HAzZBcxNxI78zbMkba788VHw7fzqxEGDQxBe6DahGBYZXJnn8A3ksbEN
   Fj6ZUolNAeQBwp68upyplTsman9P9vXDbdndStOIkSGcDTkJ1r/QWh2Dv
   mSxDY6eLe+K7h8j8Z52lDax2logCfc+5+G9Q6ulOcFDrDMHHC1Q6Cp0TG
   9hV9XRGesUe0SXojBYwveTXzFC7f/bOfrOqmrxJZ/6G5aXayx2mqVnR1U
   c6kr/mGurqjcdJLG9Jlvd1JUQ3WOSdRnTMVNtHAY4WQYx/bWjhgIjJE0g
   NDEMO1bf8bKS2CZC7qemCZkCID568iYA8Pl4Yr8lmieUp2s75qYI9ZCg1
   w==;
X-CSE-ConnectionGUID: wlWdcrYJTIC4KaYeV5ev1Q==
X-CSE-MsgGUID: tQ3AYcKkTD2QpORttOvfGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35932522"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35932522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 04:00:52 -0800
X-CSE-ConnectionGUID: AP7zFGK8QUyCLTf3GtV6zg==
X-CSE-MsgGUID: fDcDkELWSM2vU5dtn4N7pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104772441"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 04:00:51 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH 2/5] xhci: dbgtty: Improve performance by handling received data immediately.
Date: Fri, 27 Dec 2024 14:01:39 +0200
Message-Id: <20241227120142.1035206-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
References: <20241227120142.1035206-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Improve dbc transfer rate performance by copying the received data to
the tty buffer directly in the request complete callback function if
possible.
Only defer it in case there is already pending deferred work, tty is
throttled, or we fail copy the data to the tty buffer

The request complete callback is already called by a workqueue.

This is part 3/3 of a dbc performance improvement series that roughly
triples dbc performace when using adb push and pull over dbc.

Max/min push rate after patches is 210/118 MB/s, pull rate 171/133 MB/s,
tested with large files (300MB-9GB) by Łukasz Bartosik

Cc: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgtty.c | 98 ++++++++++++++++++++++------------
 1 file changed, 65 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index d719c16ea30b..60ed753c85bb 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -110,15 +110,74 @@ static void dbc_start_rx(struct dbc_port *port)
 	}
 }
 
+/*
+ * Queue received data to tty buffer and push it.
+ *
+ * Returns nr of remaining bytes that didn't fit tty buffer, i.e. 0 if all
+ * bytes sucessfullt moved. In case of error returns negative errno.
+ * Call with lock held
+ */
+static int dbc_rx_push_buffer(struct dbc_port *port, struct dbc_request *req)
+{
+	char		*packet = req->buf;
+	unsigned int	n, size = req->actual;
+	int		count;
+
+	if (!req->actual)
+		return 0;
+
+	/* if n_read is set then request was partially moved to tty buffer */
+	n = port->n_read;
+	if (n) {
+		packet += n;
+		size -= n;
+	}
+
+	count = tty_insert_flip_string(&port->port, packet, size);
+	if (count)
+		tty_flip_buffer_push(&port->port);
+	if (count != size) {
+		port->n_read += count;
+		return size - count;
+	}
+
+	port->n_read = 0;
+	return 0;
+}
+
 static void
 dbc_read_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 {
 	unsigned long		flags;
 	struct dbc_port		*port = dbc_to_port(dbc);
+	struct tty_struct	*tty;
+	int			untransferred;
+
+	tty = port->port.tty;
 
 	spin_lock_irqsave(&port->port_lock, flags);
+
+	/*
+	 * Only defer copyig data to tty buffer in case:
+	 * - !list_empty(&port->read_queue), there are older pending data
+	 * - tty is throttled
+	 * - failed to copy all data to buffer, defer remaining part
+	 */
+
+	if (list_empty(&port->read_queue) && tty && !tty_throttled(tty)) {
+		untransferred = dbc_rx_push_buffer(port, req);
+		if (untransferred == 0) {
+			list_add_tail(&req->list_pool, &port->read_pool);
+			if (req->status != -ESHUTDOWN)
+				dbc_start_rx(port);
+			goto out;
+		}
+	}
+
+	/* defer moving data from req to tty buffer to a tasklet */
 	list_add_tail(&req->list_pool, &port->read_queue);
 	tasklet_schedule(&port->push);
+out:
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
@@ -331,10 +390,10 @@ static void dbc_rx_push(struct tasklet_struct *t)
 	struct dbc_request	*req;
 	struct tty_struct	*tty;
 	unsigned long		flags;
-	bool			do_push = false;
 	bool			disconnect = false;
 	struct dbc_port		*port = from_tasklet(port, t, push);
 	struct list_head	*queue = &port->read_queue;
+	int			untransferred;
 
 	spin_lock_irqsave(&port->port_lock, flags);
 	tty = port->port.tty;
@@ -356,42 +415,15 @@ static void dbc_rx_push(struct tasklet_struct *t)
 			break;
 		}
 
-		if (req->actual) {
-			char		*packet = req->buf;
-			unsigned int	n, size = req->actual;
-			int		count;
-
-			n = port->n_read;
-			if (n) {
-				packet += n;
-				size -= n;
-			}
-
-			count = tty_insert_flip_string(&port->port, packet,
-						       size);
-			if (count)
-				do_push = true;
-			if (count != size) {
-				port->n_read += count;
-				break;
-			}
-			port->n_read = 0;
-		}
+		untransferred = dbc_rx_push_buffer(port, req);
+		if (untransferred > 0)
+			break;
 
 		list_move_tail(&req->list_pool, &port->read_pool);
 	}
 
-	if (do_push)
-		tty_flip_buffer_push(&port->port);
-
-	if (!list_empty(queue) && tty) {
-		if (!tty_throttled(tty)) {
-			if (do_push)
-				tasklet_schedule(&port->push);
-			else
-				pr_warn("ttyDBC0: RX not scheduled?\n");
-		}
-	}
+	if (!list_empty(queue))
+		tasklet_schedule(&port->push);
 
 	if (!disconnect)
 		dbc_start_rx(port);
-- 
2.25.1


