Return-Path: <linux-usb+bounces-12416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAAE93BD54
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 09:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F6B41C215BF
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 07:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9E6171E64;
	Thu, 25 Jul 2024 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wbts3rR3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D12746C
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721893752; cv=none; b=KklVw++G10LakHbYCVTLaF2oIEikLg0ViVDXhlDl6AQUiECojh6138WkbStif/1jma/t5Lz7bykb47JiegDaIAvCMnj2SN/CNSChn0S+wcTzDlPeTFkMAxcbF+Exe0q8+VmAeUl9wgZf+YRtYwAfTW62WXAG1iNq9op1v22hK+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721893752; c=relaxed/simple;
	bh=f936AIMq5LQ35JeLdOKx7+ljOBseO3MfdB3LW0sqiyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EqhWtrjfDvLHpnVa1JiwP1BCjOPf1ff2yXVW1RmybrVPLPN8Mnb7noXTq6RcacXD+0biDjAl58Lz9vbPAQ+0n04OkltRixNpulKpo7Eu1jrvcpH8u3JLiofjzlaWBFD9B3YqbYnh/LSLx6A837Z36GnZXKR746YHpSJ+8g1rANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wbts3rR3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52efba36802so858611e87.2
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721893748; x=1722498548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2e8lXrN6i5a4Gm1wt2hrkTl7urQ/sUi9XQToyUP1j+0=;
        b=Wbts3rR3fX4gr9ht7FqTLHcWS0MteeTM/HX4Npy+2E5+3rY41lTjDqvTKN1+nbKW6w
         ANSrluJtYRL38t+TCa0z3gDZJGbTkD0VOlQwzewYE75pwXKaL06zw312eJwLdzszZcGZ
         49jhFPgjPBfKnTwHdqhKT1eUy5dtJlUdZFU44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721893748; x=1722498548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e8lXrN6i5a4Gm1wt2hrkTl7urQ/sUi9XQToyUP1j+0=;
        b=q52I9PPydqieN8LBwBaAk1YTHfAQ4epKHuHRji+0qobzLTwB4LTnGc66OQAE6mCDdu
         Wy7ZQAR/8EqlOk8yeihZq74O9gXaczutOg9VWsZJ2fvzElSh6TPQ+YxQc1p8/fyw5Ku1
         i0WxyG20dSbw87F4TzZgAcYDPueCTHDkcK2s/SdvCzR8+cXpV1meOKDZCF2D5q0ul34h
         c3usmO0NPmMWECKUGCFaIUeG0scIvTZYYcfLWaiVX6miNbe6SPcKsDzv1f1+W+Nrzp6K
         Kidb9Z0Hk+NoLLvWAW87YDCFhGizV1tPbAkN2MfBqsVSBX6z4hkEN4DkFqVuEA7EGCVe
         qlZg==
X-Gm-Message-State: AOJu0YyEwK0pU0uOZWHZ1OIh1fq/JTCbciAf1Q07rLkaWJ7KtmjQ6mAn
	RKfj9QJqC23C5NIppiQ8+Gq16c4E+kRPpAvUHv1ZB8lS/dS4RLvtirblEd26zK0k+ePgWH4SoQ=
	=
X-Google-Smtp-Source: AGHT+IF2Nf2bgsd/ehA7fKtq0K2RQtL2fU/K8mEyuZbYfTS5HYgOw6YPqPohG3SeEaVmufyI42MfxQ==
X-Received: by 2002:a05:6512:308d:b0:52e:9cf1:a2ae with SMTP id 2adb3069b0e04-52fd6098286mr902943e87.51.1721893748003;
        Thu, 25 Jul 2024 00:49:08 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab22f9fsm43475066b.6.2024.07.25.00.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 00:49:07 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
Date: Thu, 25 Jul 2024 07:48:57 +0000
Message-ID: <20240725074857.623299-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DbC driver does not handle ClearFeature Halt requests correctly
which in turn may lead to dropping packets on the receive path.

Below is a trace capture where due to incorrect handling of
ClearFeature Halt packet gets dropped on the receive path.

/sys/kernel/debug/tracing # cat trace
1) kworker/10:3-514   [010] d..1.  2925.601843: xhci_dbc_handle_event:
	EVENT: TRB 000000019588c0e0 status 'Stall Error' len 0 slot 1 ep 2
	type 'Transfer Event' flags e:C

2) kworker/10:3-514   [010] d..1.  2925.613285: xhci_dbc_handle_event:
	EVENT: TRB 000000019588bc80 status 'Stall Error' len 1024 slot 1
	ep 3 type 'Transfer Event' flags e:C

3) kworker/10:3-514   [010] d..1.  2925.619024: xhci_dbc_handle_transfer:
	BULK: Buffer 0000000244b49800 length 1024 TD size 0 intr 0 type
	'Normal' flags b:i:I:c:s:i:e:C

4) kworker/10:3-514   [010] d..1.  2925.619025: xhci_dbc_giveback_request:
	bulk-in: req 00000000a70b5ad2 length 0/1024 ==> -6

5) kworker/10:3-514   [010] dNs2.  2925.623820: xhci_dbc_gadget_ep_queue:
	BULK: Buffer 0000000244b49800 length 1024 TD size 0 intr 0 type
	'Normal' flags b:i:I:c:s:i:e:c

6) kworker/10:3-514   [010] dNs1.  2925.623823: xhci_dbc_queue_request:
	bulk-in: req 00000000a70b5ad2 length 0/1024 ==> -115

7) kworker/10:3-514   [010] d..1.  2925.629865: xhci_dbc_handle_event:
	EVENT: TRB 000000019588bc80 status 'Short Packet' len 1000 slot 1
	ep 3 type 'Transfer Event' flags e:C

8) kworker/10:3-514   [010] d..1.  2925.635540: xhci_dbc_handle_event:
	EVENT: TRB 000000019588bc90 status 'Short Packet' len 763 slot 1
	ep 3 type 'Transfer Event' flags e:C

9) kworker/10:3-514   [010] d..1.  2925.635540: xhci_dbc_handle_transfer:
	BULK: Buffer 0000000244b49c00 length 1024 TD size 0 intr 0 type
	'Normal' flags b:i:I:c:s:i:e:C

10) kworker/10:3-514  [010] d..1.  2925.635541: xhci_dbc_giveback_request:
	bulk-in: req 00000000b4ec77d7 length 261/1024 ==> 0

11) kworker/10:3-514  [010] dNs2.  2925.635561: xhci_dbc_gadget_ep_queue:
	BULK: Buffer 0000000244b49c00 length 1024 TD size 0 intr 0 type
	'Normal' flags b:i:I:c:s:i:e:c

12) kworker/10:3-514  [010] dNs1.  2925.635562: xhci_dbc_queue_request:
	bulk-in: req 00000000b4ec77d7 length 0/1024 ==> -115

Lines 1 and 2 are Endpoints OUT and IN responses to receiving ClearFeature
Halt requests.

Line 7 notifies of reception of 24 bytes packet.

Line 8 notifies of reception of 261 bytes packet

In Lines [9, 12] 261 bytes packet is being processed.

However 24 bytes packet gets dropped. The kernel log includes entry which
is an indication of a packet drop:
[  127.651845] xhci_hcd 0000:00:0d.0: no matched request

This fix adds correct handling of ClearFeature Halt requests
by restarting an endpoint which received the request.

Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
Changes v2->v1:
- Documented both xhci_dbc_flush_single_request and 
xhci_dbc_flush_endpoint_requests functions.
---
 drivers/usb/host/xhci-dbgcap.c | 48 +++++++++++++++++++++++++++-------
 drivers/usb/host/xhci-dbgtty.c |  5 ++++
 2 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 872d9cddbcef..36ec3242e096 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -173,7 +173,17 @@ static void xhci_dbc_giveback(struct dbc_request *req, int status)
 	spin_lock(&dbc->lock);
 }
 
-static void xhci_dbc_flush_single_request(struct dbc_request *req)
+/**
+ * xhci_dbc_flush_single_request - flushes single request
+ * @req: request to flush
+ * @status: 0 or -ERESTART - after the request is flushed it will be queued
+ *          back to the endpoint
+ *
+ *          -ESHUTDOWN - after the request is flushed it won't be queued back
+ *          to the endpoint and if it was last endpoint's request the endpoint
+ *          will stay shut
+ */
+static void xhci_dbc_flush_single_request(struct dbc_request *req, int status)
 {
 	union xhci_trb	*trb = req->trb;
 
@@ -183,21 +193,36 @@ static void xhci_dbc_flush_single_request(struct dbc_request *req)
 	trb->generic.field[3]	&= cpu_to_le32(TRB_CYCLE);
 	trb->generic.field[3]	|= cpu_to_le32(TRB_TYPE(TRB_TR_NOOP));
 
-	xhci_dbc_giveback(req, -ESHUTDOWN);
+	xhci_dbc_giveback(req, status);
 }
 
-static void xhci_dbc_flush_endpoint_requests(struct dbc_ep *dep)
+/**
+ * xhci_dbc_flush_endpoint_requests - flushes endpoint's requests
+ * @dep: endpoint to flush requests
+ * @restart: true - after being flushed, the requests will be queued back
+ *           to the endpoint and its operation will resume
+ *
+ *           false - after flushing last endpoint's request the endpoint will
+ *           stay shut
+ */
+static void xhci_dbc_flush_endpoint_requests(struct dbc_ep *dep, bool restart)
 {
+	struct list_head	*list = &dep->list_pending;
 	struct dbc_request	*req, *tmp;
+	int			status = -ESHUTDOWN;
 
-	list_for_each_entry_safe(req, tmp, &dep->list_pending, list_pending)
-		xhci_dbc_flush_single_request(req);
+	list_for_each_entry_safe(req, tmp, list, list_pending) {
+		if (restart && list_is_last(&req->list_pending, list))
+			status = -ERESTART;
+
+		xhci_dbc_flush_single_request(req, status);
+	}
 }
 
 static void xhci_dbc_flush_requests(struct xhci_dbc *dbc)
 {
-	xhci_dbc_flush_endpoint_requests(&dbc->eps[BULK_OUT]);
-	xhci_dbc_flush_endpoint_requests(&dbc->eps[BULK_IN]);
+	xhci_dbc_flush_endpoint_requests(&dbc->eps[BULK_OUT], false);
+	xhci_dbc_flush_endpoint_requests(&dbc->eps[BULK_IN], false);
 }
 
 struct dbc_request *
@@ -718,10 +743,13 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 	case COMP_TRB_ERROR:
 	case COMP_BABBLE_DETECTED_ERROR:
 	case COMP_USB_TRANSACTION_ERROR:
-	case COMP_STALL_ERROR:
 		dev_warn(dbc->dev, "tx error %d detected\n", comp_code);
 		status = -comp_code;
 		break;
+	case COMP_STALL_ERROR:
+		/* Restart endpoint */
+		xhci_dbc_flush_endpoint_requests(dep, true);
+		return;
 	default:
 		dev_err(dbc->dev, "unknown tx error %d\n", comp_code);
 		status = -comp_code;
@@ -823,12 +851,12 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 
 			if (ctrl & DBC_CTRL_HALT_IN_TR) {
 				dep = get_in_ep(dbc);
-				xhci_dbc_flush_endpoint_requests(dep);
+				xhci_dbc_flush_endpoint_requests(dep, false);
 			}
 
 			if (ctrl & DBC_CTRL_HALT_OUT_TR) {
 				dep = get_out_ep(dbc);
-				xhci_dbc_flush_endpoint_requests(dep);
+				xhci_dbc_flush_endpoint_requests(dep, false);
 			}
 
 			return EVT_DONE;
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index b74e98e94393..bdf80aa2b28c 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -121,6 +121,7 @@ static void dbc_write_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 	list_add(&req->list_pool, &port->write_pool);
 	switch (req->status) {
 	case 0:
+	case -ERESTART:
 		dbc_start_tx(port);
 		break;
 	case -ESHUTDOWN:
@@ -318,6 +319,10 @@ static void dbc_rx_push(struct tasklet_struct *t)
 		case -ESHUTDOWN:
 			disconnect = true;
 			break;
+		case -ERESTART:
+			disconnect = false;
+			req->actual = 0;
+			break;
 		default:
 			pr_warn("ttyDBC0: unexpected RX status %d\n",
 				req->status);
-- 
2.45.2.1089.g2a221341d9-goog


