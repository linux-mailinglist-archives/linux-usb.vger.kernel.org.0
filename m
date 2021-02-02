Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5792330B5F9
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhBBDna (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:43:30 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54144 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231488AbhBBDn1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:43:27 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A26F2400A3;
        Tue,  2 Feb 2021 03:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237343; bh=IXiNgyLNOfrFDGmrFJMas49lucSrFRVMxcoSQj7gjF8=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=SuAjNE9Zo54wxc6b/NhTeuV1VEDcmd+s1WqjnaG2GlUPihaXz2w5Ksu9k97lSUznl
         u3mJ0bHZ5mnGPcqBL5G2Be8SM3VCY0LbGTO4q6W7ww8OYTsAVR/23PiCodNUTM4n6H
         trm8TmRk7wYTd2sPu+epuQ9e1Od0z1Gs6zJjIGPiDgbjn5XzAV2e2gfzr7f4QSxZ6f
         liVxDiJlIKR9P61vVgFEGmqcLLgFzsXImJ7Vue0aubrODGM8igOl65Jh2jVkTryvbK
         ubc+SdZu107bRJ2lL2Tbmrgpwjs3rxMUpVpuos541i4VlzGhM2xM50ih2794/r5of/
         Arq5lZXTLTXxQ==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 32944A007C;
        Tue,  2 Feb 2021 03:42:19 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:42:18 -0800
Date:   Mon, 01 Feb 2021 19:42:18 -0800
Message-Id: <3ea65aec93bca0e4e44a786a5af5b669d8c6570d.1612237179.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 1/8] usb: core: Track SuperSpeed Plus GenXxY
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Allen Pais <allen.lkml@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Romain Perier <romain.perier@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce ssp_rate field to usb_device structure to capture the
connected SuperSpeed Plus signaling rate generation and lane count with
the corresponding usb_ssp_rate enum.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/core/hcd.c |  6 +++-
 drivers/usb/core/hub.c | 78 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    |  2 ++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index ad5a0f405a75..55de04df3022 100644
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
index 7d72c4e0713c..c334387f950e 100644
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

