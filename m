Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE5D336ADB
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhCKDnF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:43:05 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38238 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230416AbhCKDms (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:42:48 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0B029407E0;
        Thu, 11 Mar 2021 03:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434168; bh=R87UXnBn8SIAPGVmP4kMrnBjP3J/hAQt2TG9RvDwfIs=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=jRa+HVcGdn7vSJvUQUdcBxurt7m9x0WdDJdRdi8dp6G+ge7ai+u+d7sAc/4rfLiB0
         nLPdMW7OoaItxrfpA54YR/R6DNoVWfIn/28nkx78PkBu76LajF5wlrI2JhJbHM37Em
         Zm1w6Wds33A9fcVuoWJMIHBNVwToPHO0exO7Mbeor+DMD+UHAvJckJfrIyeuZSq6Dy
         jnogZsA9CUhKfTv4pMSJjNkCRFFM03GgGw4zFLCVWClHdIPeAVBBXjxooENx8W29+w
         BlEMlvSyHiFZjY900LEDqSCLbGCQ0WrtL0GWJuRePjqmWAA0EohXCUmyFdq0CwXKEV
         7Nj+oL9mDOPtQ==
Received: from lab-vbox (unknown [10.205.137.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3B498A0096;
        Thu, 11 Mar 2021 03:42:44 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 10 Mar 2021 19:42:44 -0800
Date:   Wed, 10 Mar 2021 19:42:44 -0800
Message-Id: <b7805d121e5ae4ad5ae144bd860b6ac04ee47436.1615432770.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 1/8] usb: core: Track SuperSpeed Plus GenXxY
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Allen Pais <allen.lkml@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce ssp_rate field to usb_device structure to capture the
connected SuperSpeed Plus signaling rate generation and lane count with
the corresponding usb_ssp_rate enum.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/core/hcd.c |  6 +++-
 drivers/usb/core/hub.c | 78 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    |  2 ++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 3f0381344221..6119fb41d736 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2721,6 +2721,7 @@ int usb_add_hcd(struct usb_hcd *hcd,
 
 	rhdev->rx_lanes = 1;
 	rhdev->tx_lanes = 1;
+	rhdev->ssp_rate = USB_SSP_GEN_UNKNOWN;
 
 	switch (hcd->speed) {
 	case HCD_USB11:
@@ -2738,8 +2739,11 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	case HCD_USB32:
 		rhdev->rx_lanes = 2;
 		rhdev->tx_lanes = 2;
-		fallthrough;
+		rhdev->ssp_rate = USB_SSP_GEN_2x2;
+		rhdev->speed = USB_SPEED_SUPER_PLUS;
+		break;
 	case HCD_USB31:
+		rhdev->ssp_rate = USB_SSP_GEN_2x1;
 		rhdev->speed = USB_SPEED_SUPER_PLUS;
 		break;
 	default:
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 7f71218cc1e5..e78b2dd7801a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -31,6 +31,7 @@
 #include <linux/pm_qos.h>
 #include <linux/kobject.h>
 
+#include <linux/bitfield.h>
 #include <linux/uaccess.h>
 #include <asm/byteorder.h>
 
@@ -2668,6 +2669,81 @@ int usb_authorize_device(struct usb_device *usb_dev)
 	return result;
 }
 
+/**
+ * get_port_ssp_rate - Match the extended port status to SSP rate
+ * @hdev: The hub device
+ * @ext_portstatus: extended port status
+ *
+ * Match the extended port status speed id to the SuperSpeed Plus sublink speed
+ * capability attributes. Base on the number of connected lanes and speed,
+ * return the corresponding enum usb_ssp_rate.
+ */
+static enum usb_ssp_rate get_port_ssp_rate(struct usb_device *hdev,
+					   u32 ext_portstatus)
+{
+	struct usb_ssp_cap_descriptor *ssp_cap = hdev->bos->ssp_cap;
+	u32 attr;
+	u8 speed_id;
+	u8 ssac;
+	u8 lanes;
+	int i;
+
+	if (!ssp_cap)
+		goto out;
+
+	speed_id = ext_portstatus & USB_EXT_PORT_STAT_RX_SPEED_ID;
+	lanes = USB_EXT_PORT_RX_LANES(ext_portstatus) + 1;
+
+	ssac = le32_to_cpu(ssp_cap->bmAttributes) &
+		USB_SSP_SUBLINK_SPEED_ATTRIBS;
+
+	for (i = 0; i <= ssac; i++) {
+		u8 ssid;
+
+		attr = le32_to_cpu(ssp_cap->bmSublinkSpeedAttr[i]);
+		ssid = FIELD_GET(USB_SSP_SUBLINK_SPEED_SSID, attr);
+		if (speed_id == ssid) {
+			u16 mantissa;
+			u8 lse;
+			u8 type;
+
+			/*
+			 * Note: currently asymmetric lane types are only
+			 * applicable for SSIC operate in SuperSpeed protocol
+			 */
+			type = FIELD_GET(USB_SSP_SUBLINK_SPEED_ST, attr);
+			if (type == USB_SSP_SUBLINK_SPEED_ST_ASYM_RX ||
+			    type == USB_SSP_SUBLINK_SPEED_ST_ASYM_TX)
+				goto out;
+
+			if (FIELD_GET(USB_SSP_SUBLINK_SPEED_LP, attr) !=
+			    USB_SSP_SUBLINK_SPEED_LP_SSP)
+				goto out;
+
+			lse = FIELD_GET(USB_SSP_SUBLINK_SPEED_LSE, attr);
+			mantissa = FIELD_GET(USB_SSP_SUBLINK_SPEED_LSM, attr);
+
+			/* Convert to Gbps */
+			for (; lse < USB_SSP_SUBLINK_SPEED_LSE_GBPS; lse++)
+				mantissa /= 1000;
+
+			if (mantissa >= 10 && lanes == 1)
+				return USB_SSP_GEN_2x1;
+
+			if (mantissa >= 10 && lanes == 2)
+				return USB_SSP_GEN_2x2;
+
+			if (mantissa >= 5 && lanes == 2)
+				return USB_SSP_GEN_1x2;
+
+			goto out;
+		}
+	}
+
+out:
+	return USB_SSP_GEN_UNKNOWN;
+}
+
 /*
  * Return 1 if port speed is SuperSpeedPlus, 0 otherwise
  * check it from the link protocol field of the current speed ID attribute.
@@ -2850,9 +2926,11 @@ static int hub_port_wait_reset(struct usb_hub *hub, int port1,
 		/* extended portstatus Rx and Tx lane count are zero based */
 		udev->rx_lanes = USB_EXT_PORT_RX_LANES(ext_portstatus) + 1;
 		udev->tx_lanes = USB_EXT_PORT_TX_LANES(ext_portstatus) + 1;
+		udev->ssp_rate = get_port_ssp_rate(hub->hdev, ext_portstatus);
 	} else {
 		udev->rx_lanes = 1;
 		udev->tx_lanes = 1;
+		udev->ssp_rate = USB_SSP_GEN_UNKNOWN;
 	}
 	if (hub_is_wusb(hub))
 		udev->speed = USB_SPEED_WIRELESS;
diff --git a/include/linux/usb.h b/include/linux/usb.h
index f15fd0fa95bd..07ec214cf0d8 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -560,6 +560,7 @@ struct usb3_lpm_parameters {
  * @speed: device speed: high/full/low (or error)
  * @rx_lanes: number of rx lanes in use, USB 3.2 adds dual-lane support
  * @tx_lanes: number of tx lanes in use, USB 3.2 adds dual-lane support
+ * @ssp_rate: SuperSpeed Plus phy signaling rate and lane count
  * @tt: Transaction Translator info; used with low/full speed dev, highspeed hub
  * @ttport: device port on that tt hub
  * @toggle: one bit for each endpoint, with ([0] = IN, [1] = OUT) endpoints
@@ -636,6 +637,7 @@ struct usb_device {
 	enum usb_device_speed	speed;
 	unsigned int		rx_lanes;
 	unsigned int		tx_lanes;
+	enum usb_ssp_rate	ssp_rate;
 
 	struct usb_tt	*tt;
 	int		ttport;
-- 
2.28.0

