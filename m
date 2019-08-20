Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B59F9537C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 03:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfHTBhI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 21:37:08 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:51752 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728627AbfHTBhI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 21:37:08 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C1DC2C03C4;
        Tue, 20 Aug 2019 01:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1566265027; bh=VlZDTO/BRBEHD15Vt263ZxdlPukJfCSaXmqQS6GIOgc=;
        h=Date:In-Reply-To:References:From:Subject:To:CC:From;
        b=kplzLE5N4y56OePkOfqoFlAjBjXqiTE91boOTu3NUiBmRwjMQjPRTY9C3dUwJnxPb
         robRalIV3yixyV2pkLZDXYG4y0cCTq3x3BkqZtFrxON+oeeF26JanZHqmNEx+bjRcK
         bbogUgIepya4Gqf0MxxP7z/uLeaR8biqik7DsKN9krodmdkQ8pPeqJEJFuuz2URwkH
         cU+1Dype2dbvTBQbk15sNFcnhJeReDKZjPiySXoC4+Fx7qMrnMVs8Mm/uPkY2hPBoh
         Q3iwVOKWRMCg28YSCOpPy4+GVGFV4zk9d8tCns4cYpS6SOVIbqMOBYt6IviYWgOfTo
         TV1I0JW0UjpIg==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id AFA8FA023C;
        Tue, 20 Aug 2019 01:37:07 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com (10.15.84.232) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 19 Aug 2019 18:36:13 -0700
Received: from te-lab16 (10.13.184.19) by US01WEHTC3.internal.synopsys.com
 (10.15.84.231) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 19 Aug
 2019 18:36:12 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 19 Aug 2019 18:36:12
 -0700
Date:   Mon, 19 Aug 2019 18:36:12 -0700
Message-ID: <9e58a83fe6dab6778c48f40e77d03dc25e14f396.1566263914.git.thinhn@synopsys.com>
In-Reply-To: <cover.1566263914.git.thinhn@synopsys.com>
References: <cover.1566263914.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 4/4] usb: gadget: composite: Set recommended BESL values
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set the recommended BESL deep and baseline values based on the gadget's
configuration parameters to the extended BOS descriptor. This feature
helps to optimize power savings by maximizing the opportunity for longer
L1 residency time.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/gadget/composite.c | 38 ++++++++++++++++++++++++++------------
 include/uapi/linux/usb/ch9.h   |  2 ++
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 9118b42c70b6..7ed009dc0f92 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -612,6 +612,7 @@ static int bos_desc(struct usb_composite_dev *cdev)
 	struct usb_ext_cap_descriptor	*usb_ext;
 	struct usb_dcd_config_params	dcd_config_params;
 	struct usb_bos_descriptor	*bos = cdev->req->buf;
+	unsigned int			besl = 0;
 
 	bos->bLength = USB_DT_BOS_SIZE;
 	bos->bDescriptorType = USB_DT_BOS;
@@ -619,6 +620,29 @@ static int bos_desc(struct usb_composite_dev *cdev)
 	bos->wTotalLength = cpu_to_le16(USB_DT_BOS_SIZE);
 	bos->bNumDeviceCaps = 0;
 
+	/* Get Controller configuration */
+	if (cdev->gadget->ops->get_config_params) {
+		cdev->gadget->ops->get_config_params(cdev->gadget,
+						     &dcd_config_params);
+	} else {
+		dcd_config_params.besl_baseline =
+			USB_DEFAULT_BESL_UNSPECIFIED;
+		dcd_config_params.besl_deep =
+			USB_DEFAULT_BESL_UNSPECIFIED;
+		dcd_config_params.bU1devExitLat =
+			USB_DEFAULT_U1_DEV_EXIT_LAT;
+		dcd_config_params.bU2DevExitLat =
+			cpu_to_le16(USB_DEFAULT_U2_DEV_EXIT_LAT);
+	}
+
+	if (dcd_config_params.besl_baseline != USB_DEFAULT_BESL_UNSPECIFIED)
+		besl = USB_BESL_BASELINE_VALID |
+			USB_SET_BESL_BASELINE(dcd_config_params.besl_baseline);
+
+	if (dcd_config_params.besl_deep != USB_DEFAULT_BESL_UNSPECIFIED)
+		besl |= USB_BESL_DEEP_VALID |
+			USB_SET_BESL_DEEP(dcd_config_params.besl_deep);
+
 	/*
 	 * A SuperSpeed device shall include the USB2.0 extension descriptor
 	 * and shall support LPM when operating in USB2.0 HS mode.
@@ -629,7 +653,8 @@ static int bos_desc(struct usb_composite_dev *cdev)
 	usb_ext->bLength = USB_DT_USB_EXT_CAP_SIZE;
 	usb_ext->bDescriptorType = USB_DT_DEVICE_CAPABILITY;
 	usb_ext->bDevCapabilityType = USB_CAP_TYPE_EXT;
-	usb_ext->bmAttributes = cpu_to_le32(USB_LPM_SUPPORT | USB_BESL_SUPPORT);
+	usb_ext->bmAttributes = cpu_to_le32(USB_LPM_SUPPORT |
+					    USB_BESL_SUPPORT | besl);
 
 	/*
 	 * The Superspeed USB Capability descriptor shall be implemented by all
@@ -650,17 +675,6 @@ static int bos_desc(struct usb_composite_dev *cdev)
 						      USB_HIGH_SPEED_OPERATION |
 						      USB_5GBPS_OPERATION);
 		ss_cap->bFunctionalitySupport = USB_LOW_SPEED_OPERATION;
-
-		/* Get Controller configuration */
-		if (cdev->gadget->ops->get_config_params) {
-			cdev->gadget->ops->get_config_params(cdev->gadget,
-				&dcd_config_params);
-		} else {
-			dcd_config_params.bU1devExitLat =
-				USB_DEFAULT_U1_DEV_EXIT_LAT;
-			dcd_config_params.bU2DevExitLat =
-				cpu_to_le16(USB_DEFAULT_U2_DEV_EXIT_LAT);
-		}
 		ss_cap->bU1devExitLat = dcd_config_params.bU1devExitLat;
 		ss_cap->bU2DevExitLat = dcd_config_params.bU2DevExitLat;
 	}
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index d5a5caec8fbc..2b623f36af6b 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -894,6 +894,8 @@ struct usb_ext_cap_descriptor {		/* Link Power Management */
 #define USB_BESL_SUPPORT		(1 << 2)	/* supports BESL */
 #define USB_BESL_BASELINE_VALID		(1 << 3)	/* Baseline BESL valid*/
 #define USB_BESL_DEEP_VALID		(1 << 4)	/* Deep BESL valid */
+#define USB_SET_BESL_BASELINE(p)	(((p) & 0xf) << 8)
+#define USB_SET_BESL_DEEP(p)		(((p) & 0xf) << 12)
 #define USB_GET_BESL_BASELINE(p)	(((p) & (0xf << 8)) >> 8)
 #define USB_GET_BESL_DEEP(p)		(((p) & (0xf << 12)) >> 12)
 } __attribute__((packed));
-- 
2.11.0

