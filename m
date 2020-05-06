Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22B71C65FC
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgEFCrM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:47:12 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35350 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbgEFCrL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:47:11 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D2EC4407EB;
        Wed,  6 May 2020 02:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733230; bh=QJEDb6O5ZScCj1lbVmTqdBKZOam2RSzMoqvwYG5aHpA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ej+r1gWWk9sd5bW+JJxM+LsqTiatODHgAb/mWpUzxTibMNF/wzbW88mVrybOzk3q/
         2bHa2lRLgHZN4W8nRx9j+a7evgfdcEw6mgBAOumAcKr6lekSe5m97pdpgqOGTTGnU6
         k5aYxVIWm4IR+nt7M9tvaNcnkFzs3I9/owhW8f39nwh6fF9PNxRUHNgXHglaOrvMQP
         EQYDZzOGA1KbeSRxutwzdGFfIoOm3q0ku8+FZKPDPp/9bsUavbhl9Qkl763xl2WT4t
         Rz1Uf4Dd7GvdJ+u7T0h51bzkFi4L4dZ2XjKspp+jbUG+igN7dR1WAxFl8YmAZTKzAI
         ajKmnIAC1jvZQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id BC49DA0252;
        Wed,  6 May 2020 02:47:09 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:47:09 -0700
Date:   Tue, 05 May 2020 19:47:09 -0700
Message-Id: <2e4105b7476563b25a8b4e0896fdcd76b6a29b9c.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 10/11] usb: dwc3: gadget: Handle stream transfers
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Overview of stream transfer requirement:
 * A transfer will have a set of TRBs of the same stream ID.
 * A transfer is started with a stream ID in START_TRANSFER command.
 * A new stream will only start when the previous completes.

Overview of stream events:
 * A "prime" from host indicates that its endpoints are active
   (buffers prepared and ready to receive/transmit data). The controller
   automatically initiates stream if it sees this.
 * A "NoStream" rejection event indicates that the host isn't ready.
   Host will put the endpoint back to idle state. Device may need to
   reinitiate the stream to start transfer again.
 * A Stream Found event means host accepted device initiated stream.
   Nothing needs to be done from driver.

To initiate a stream, the driver will issue START_TRANSFER command with
a stream ID. To reinitiate the stream, the driver must issue
END_TRANSFER and restart the transfer with START_TRANSFER command with
the same stream ID.

This implementation handles device-initated streams (e.g. UASP driver).
It also handles some hosts' quirky behavior where they only prime each
endpoint once.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h   |  8 ++++
 drivers/usb/dwc3/debug.h  |  2 +
 drivers/usb/dwc3/gadget.c | 97 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index b11183a715a7..4def088329c7 100644
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
@@ -1301,6 +1305,10 @@ struct dwc3_event_depevt {
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
index 07824b670440..0380f76151a1 100644
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
@@ -2772,6 +2796,63 @@ static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
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
+		    !(dep->flags & DWC3_EP_FORCE_RESTART_STREAM) ||
+		    !(dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE))
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
+		dep->flags |= DWC3_EP_DELAY_START;
+		dwc3_stop_active_transfer(dep, true, true);
+		return;
+	}
+
+out:
+	dep->flags &= ~DWC3_EP_IGNORE_NEXT_NOSTREAM;
+}
+
 static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		const struct dwc3_event_depevt *event)
 {
@@ -2820,6 +2901,8 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		dwc3_gadget_endpoint_transfer_complete(dep, event);
 		break;
 	case DWC3_DEPEVT_STREAMEVT:
+		dwc3_gadget_endpoint_stream_event(dep, event);
+		break;
 	case DWC3_DEPEVT_RXTXFIFOEVT:
 		break;
 	}
@@ -2911,6 +2994,14 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
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

