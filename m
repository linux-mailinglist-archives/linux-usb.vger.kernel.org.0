Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F8E1BB17F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 00:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgD0W2I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 18:28:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45322 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbgD0W2I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 18:28:08 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C976EC053F;
        Mon, 27 Apr 2020 22:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588026487; bh=xRgkEWStEP7oEDWycAtlTsoEUdJtZ468nFFybFPGF6E=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=jTTZZ0gBCq0i3U3VaMoavvBCLXG4k8DH1AOKtJ1pz3xtikEYY7d+E7Nsju+AwmTGg
         rDkd8b67Qyf4Z7AoJ4KSyNi9wPzW3Wnoq3m7cf8bu1edLIDTZuZC4320QYKrkddgjN
         n9cydW3tohqrddGiSyv6/He9aM51CnzRwmkPyqm2BsoTNkazc9R8PnBFRn/QL1ZWJV
         PwPLG7sILJdeAOLT9SRTxsnxe6EAd96seuK6vrs37v5OPqogwpRRKe3v9Hxevn4yXI
         yWMD44rKR3oyO0w2ei+IcSz/givfjB1fMzI4MMgod2thEpklzbrsgBh/8lUmBh1Xlt
         qjY/CSwA8F2yg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 86680A007C;
        Mon, 27 Apr 2020 22:28:06 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 27 Apr 2020 15:28:06 -0700
Date:   Mon, 27 Apr 2020 15:28:06 -0700
Message-Id: <de2a2f541efb1acb9f4f18ceb6edbc9d5cfa2844.1588025916.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588025916.git.thinhn@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 5/5] usb: dwc3: gadget: Handle stream transfers
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3 driver wasn't implemented to handle streams.

This implementation handles the followings:
 * Handles device-initiated streams (e.g. UASP driver)
 * Handles some hosts' quirky behavior where they only prime each
   endpoint once
 * Does not use any timer for NoStream rejection

To use stream, the dwc3 driver must know which request is the last
request of a transfer. The controller uses this information to
reallocate its resources for different streams as transfers are
completed. Function drivers that support stream must indicate this via
usb_request->is_last field.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h   |  11 +++++
 drivers/usb/dwc3/debug.h  |   2 +
 drivers/usb/dwc3/gadget.c | 102 ++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 112 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index b11183a715a7..013f42a2b5dc 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -495,6 +495,7 @@
 #define DWC3_DGCMD_SELECTED_FIFO_FLUSH	0x09
 #define DWC3_DGCMD_ALL_FIFO_FLUSH	0x0a
 #define DWC3_DGCMD_SET_ENDPOINT_NRDY	0x0c
+#define DWC3_DGCMD_SET_ENDPOINT_PRIME	0x0d
 #define DWC3_DGCMD_RUN_SOC_BUS_LOOPBACK	0x10
 
 #define DWC3_DGCMD_STATUS(n)		(((n) >> 12) & 0x0F)
@@ -702,6 +703,9 @@ struct dwc3_ep {
 #define DWC3_EP_PENDING_REQUEST	BIT(5)
 #define DWC3_EP_DELAY_START	BIT(6)
 #define DWC3_EP_WAIT_TRANSFER_COMPLETE	BIT(7)
+#define DWC3_EP_IGNORE_NEXT_NOSTREAM	BIT(8)
+#define DWC3_EP_FORCE_RESTART_STREAM	BIT(9)
+#define DWC3_EP_FIRST_STREAM_PRIMED	BIT(10)
 
 	/* This last one is specific to EP0 */
 #define DWC3_EP0_DIR_IN		BIT(31)
@@ -1157,6 +1161,9 @@ struct dwc3 {
 #define DWC31_REVISION_180A	0x3138302a
 #define DWC31_REVISION_190A	0x3139302a
 
+#define DWC32_REVISION_ANY	0x0
+#define DWC32_REVISION_100A	0x3130302a
+
 	u32			version_type;
 
 #define DWC31_VERSIONTYPE_ANY		0x0
@@ -1301,6 +1308,10 @@ struct dwc3_event_depevt {
 #define DEPEVT_STREAMEVT_FOUND		1
 #define DEPEVT_STREAMEVT_NOTFOUND	2
 
+/* Stream event parameter */
+#define DEPEVT_STREAM_PRIME		0xfffe
+#define DEPEVT_STREAM_NOSTREAM		0x0
+
 /* Control-only Status */
 #define DEPEVT_STATUS_CONTROL_DATA	1
 #define DEPEVT_STATUS_CONTROL_STATUS	2
diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 0f95656c9622..d8f600e0e88f 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -68,6 +68,8 @@ dwc3_gadget_generic_cmd_string(u8 cmd)
 		return "All FIFO Flush";
 	case DWC3_DGCMD_SET_ENDPOINT_NRDY:
 		return "Set Endpoint NRDY";
+	case DWC3_DGCMD_SET_ENDPOINT_PRIME:
+		return "Set Endpoint Prime";
 	case DWC3_DGCMD_RUN_SOC_BUS_LOOPBACK:
 		return "Run SoC Bus Loopback Test";
 	default:
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 628f9d142876..5127fbb0521c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -610,6 +610,9 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 	return dwc3_send_gadget_ep_cmd(dep, DWC3_DEPCMD_SETEPCONFIG, &params);
 }
 
+static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
+		bool interrupt);
+
 /**
  * __dwc3_gadget_ep_enable - initializes a hw endpoint
  * @dep: endpoint to be initialized
@@ -670,7 +673,7 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
 	 * Issue StartTransfer here with no-op TRB so we can always rely on No
 	 * Response Update Transfer command.
 	 */
-	if ((usb_endpoint_xfer_bulk(desc) && !dep->stream_capable) ||
+	if (usb_endpoint_xfer_bulk(desc) ||
 			usb_endpoint_xfer_int(desc)) {
 		struct dwc3_gadget_ep_cmd_params params;
 		struct dwc3_trb	*trb;
@@ -689,6 +692,29 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
 		ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
 		if (ret < 0)
 			return ret;
+
+		if (dep->stream_capable) {
+			/*
+			 * For streams, at start, there maybe a race where the
+			 * host primes the endpoint before the function driver
+			 * queues a request to initiate a stream. In that case,
+			 * the controller will not see the prime to generate the
+			 * ERDY and start stream. To workaround this, issue a
+			 * no-op TRB as normal, but end it immediately. As a
+			 * result, when the function driver queues the request,
+			 * the next START_TRANSFER command will cause the
+			 * controller to generate an ERDY to initiate the
+			 * stream.
+			 */
+			dwc3_stop_active_transfer(dep, true, true);
+
+			/*
+			 * All stream eps will reinitiate stream on NoStream
+			 * rejection until we can determine that the host can
+			 * prime after the first transfer.
+			 */
+			dep->flags |= DWC3_EP_FORCE_RESTART_STREAM;
+		}
 	}
 
 out:
@@ -697,8 +723,6 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
 	return 0;
 }
 
-static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
-		bool interrupt);
 static void dwc3_remove_requests(struct dwc3 *dwc, struct dwc3_ep *dep)
 {
 	struct dwc3_request		*req;
@@ -2767,6 +2791,69 @@ static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
 	(void) __dwc3_gadget_start_isoc(dep);
 }
 
+static void dwc3_gadget_endpoint_stream_event(struct dwc3_ep *dep,
+		const struct dwc3_event_depevt *event)
+{
+	struct dwc3 *dwc = dep->dwc;
+
+	if (event->status == DEPEVT_STREAMEVT_FOUND) {
+		dep->flags |= DWC3_EP_FIRST_STREAM_PRIMED;
+		goto out;
+	}
+
+	/* Note: NoStream rejection event param value is 0 and not 0xFFFF */
+	switch (event->parameters) {
+	case DEPEVT_STREAM_PRIME:
+		/*
+		 * If the host can properly transition the endpoint state from
+		 * idle to prime after a NoStream rejection, there's no need to
+		 * force restarting the endpoint to reinitiate the stream. To
+		 * simplify the check, assume the host follows the USB spec if
+		 * it primed the endpoint more than once.
+		 */
+		if (dep->flags & DWC3_EP_FORCE_RESTART_STREAM) {
+			if (dep->flags & DWC3_EP_FIRST_STREAM_PRIMED)
+				dep->flags &= ~DWC3_EP_FORCE_RESTART_STREAM;
+			else
+				dep->flags |= DWC3_EP_FIRST_STREAM_PRIMED;
+		}
+
+		break;
+	case DEPEVT_STREAM_NOSTREAM:
+		if ((dep->flags & DWC3_EP_IGNORE_NEXT_NOSTREAM) ||
+		    !(dep->flags & DWC3_EP_FORCE_RESTART_STREAM))
+			break;
+
+		/*
+		 * If the host rejects a stream due to no active stream, by the
+		 * USB and xHCI spec, the endpoint will be put back to idle
+		 * state. When the host is ready (buffer added/updated), it will
+		 * prime the endpoint to inform the usb device controller. This
+		 * triggers the device controller to issue ERDY to restart the
+		 * stream. However, some hosts don't follow this and keep the
+		 * endpoint in the idle state. No prime will come despite host
+		 * streams are updated, and the device controller will not be
+		 * triggered to generate ERDY to move the next stream data. To
+		 * workaround this and maintain compatibility with various
+		 * hosts, force to reinitate the stream until the host is ready
+		 * instead of waiting for the host to prime the endpoint.
+		 */
+		if (DWC3_VER_IS_WITHIN(DWC32, 100A, ANY)) {
+			unsigned int cmd = DWC3_DGCMD_SET_ENDPOINT_PRIME;
+
+			dwc3_send_gadget_generic_command(dwc, cmd, dep->number);
+		} else {
+			dep->flags |= DWC3_EP_DELAY_START;
+			dwc3_stop_active_transfer(dep, true, true);
+			return;
+		}
+		break;
+	}
+
+out:
+	dep->flags &= ~DWC3_EP_IGNORE_NEXT_NOSTREAM;
+}
+
 static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		const struct dwc3_event_depevt *event)
 {
@@ -2812,6 +2899,7 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		}
 		break;
 	case DWC3_DEPEVT_STREAMEVT:
+		dwc3_gadget_endpoint_stream_event(dep, event);
 		break;
 	case DWC3_DEPEVT_XFERCOMPLETE:
 		dwc3_gadget_endpoint_transfer_complete(dep, event);
@@ -2907,6 +2995,14 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	WARN_ON_ONCE(ret);
 	dep->resource_index = 0;
 
+	/*
+	 * The END_TRANSFER command will cause the controller to generate a
+	 * NoStream Event, and it's not due to the host DP NoStream rejection.
+	 * Ignore the next NoStream event.
+	 */
+	if (dep->stream_capable)
+		dep->flags |= DWC3_EP_IGNORE_NEXT_NOSTREAM;
+
 	if (!interrupt)
 		dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
 	else
-- 
2.11.0

