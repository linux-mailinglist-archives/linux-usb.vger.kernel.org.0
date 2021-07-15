Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12413CA109
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 16:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbhGOPCE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 11:02:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:64815 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232108AbhGOPCD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Jul 2021 11:02:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="190242718"
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; 
   d="scan'208";a="190242718"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 07:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; 
   d="scan'208";a="495474083"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2021 07:59:08 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        stable@kernel.org
Subject: [PATCH v2 1/2] usb: hub: Fix link power management max exit latency (MEL) calculations
Date:   Thu, 15 Jul 2021 18:01:21 +0300
Message-Id: <20210715150122.1995966-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Maximum Exit Latency (MEL) value is used by host to know how much in
advance it needs to start waking up a U1/U2 suspended link in order to
service a periodic transfer in time.

Current MEL calculation only includes the time to wake up the path from
U1/U2 to U0. This is called tMEL1 in USB 3.1 section C 1.5.2

Total MEL = tMEL1 + tMEL2 +tMEL3 + tMEL4 which should additinally include:
- tMEL2 which is the time it takes for PING message to reach device
- tMEL3 time for device to process the PING and submit a PING_RESPONSE
- tMEL4 time for PING_RESPONSE to traverse back upstream to host.

Add the missing tMEL2, tMEL3 and tMEL4 to MEL calculation.

Cc: <stable@kernel.org> # v3.5
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
v2: Add stable tag

 drivers/usb/core/hub.c | 52 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index d1efc7141333..a35d0bedafa3 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -48,6 +48,7 @@
 
 #define USB_TP_TRANSMISSION_DELAY	40	/* ns */
 #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
+#define USB_PING_RESPONSE_TIME		400	/* ns */
 
 /* Protect struct usb_device->state and ->children members
  * Note: Both are also protected by ->dev.sem, except that ->state can
@@ -182,8 +183,9 @@ int usb_device_supports_lpm(struct usb_device *udev)
 }
 
 /*
- * Set the Maximum Exit Latency (MEL) for the host to initiate a transition from
- * either U1 or U2.
+ * Set the Maximum Exit Latency (MEL) for the host to wakup up the path from
+ * U1/U2, send a PING to the device and receive a PING_RESPONSE.
+ * See USB 3.1 section C.1.5.2
  */
 static void usb_set_lpm_mel(struct usb_device *udev,
 		struct usb3_lpm_parameters *udev_lpm_params,
@@ -193,35 +195,37 @@ static void usb_set_lpm_mel(struct usb_device *udev,
 		unsigned int hub_exit_latency)
 {
 	unsigned int total_mel;
-	unsigned int device_mel;
-	unsigned int hub_mel;
 
 	/*
-	 * Calculate the time it takes to transition all links from the roothub
-	 * to the parent hub into U0.  The parent hub must then decode the
-	 * packet (hub header decode latency) to figure out which port it was
-	 * bound for.
-	 *
-	 * The Hub Header decode latency is expressed in 0.1us intervals (0x1
-	 * means 0.1us).  Multiply that by 100 to get nanoseconds.
+	 * tMEL1. time to transition path from host to device into U0.
+	 * MEL for parent already contains the delay up to parent, so only add
+	 * the exit latency for the last link (pick the slower exit latency),
+	 * and the hub header decode latency. See USB 3.1 section C 2.2.1
+	 * Store MEL in nanoseconds
 	 */
 	total_mel = hub_lpm_params->mel +
-		(hub->descriptor->u.ss.bHubHdrDecLat * 100);
+		max(udev_exit_latency, hub_exit_latency) * 1000 +
+		hub->descriptor->u.ss.bHubHdrDecLat * 100;
 
 	/*
-	 * How long will it take to transition the downstream hub's port into
-	 * U0?  The greater of either the hub exit latency or the device exit
-	 * latency.
-	 *
-	 * The BOS U1/U2 exit latencies are expressed in 1us intervals.
-	 * Multiply that by 1000 to get nanoseconds.
+	 * tMEL2. Time to submit PING packet. Sum of tTPTransmissionDelay for
+	 * each link + wHubDelay for each hub. Add only for last link.
+	 * tMEL4, the time for PING_RESPONSE to traverse upstream is similar.
+	 * Multiply by 2 to include it as well.
 	 */
-	device_mel = udev_exit_latency * 1000;
-	hub_mel = hub_exit_latency * 1000;
-	if (device_mel > hub_mel)
-		total_mel += device_mel;
-	else
-		total_mel += hub_mel;
+	total_mel += (__le16_to_cpu(hub->descriptor->u.ss.wHubDelay) +
+		      USB_TP_TRANSMISSION_DELAY) * 2;
+
+	/*
+	 * tMEL3, tPingResponse. Time taken by device to generate PING_RESPONSE
+	 * after receiving PING. Also add 2100ns as stated in USB 3.1 C 1.5.2.4
+	 * to cover the delay if the PING_RESPONSE is queued behind a Max Packet
+	 * Size DP.
+	 * Note these delays should be added only once for the entire path, so
+	 * add them to the MEL of the device connected to the roothub.
+	 */
+	if (!hub->hdev->parent)
+		total_mel += USB_PING_RESPONSE_TIME + 2100;
 
 	udev_lpm_params->mel = total_mel;
 }
-- 
2.25.1

