Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D46922D24F
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 01:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgGXXjN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 19:39:13 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:41874 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726666AbgGXXjN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 19:39:13 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A31DFC0086;
        Fri, 24 Jul 2020 23:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633952; bh=5/7Lh+jBW9gsCO7Bwt6qCm/SH9fq+i4+hDek+ehIK7g=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=DCXAuxffkfaHILc30UXaVkGpZ3NVAz19sPIJcEjqe3M6QW1M66sCBuw521VViWVar
         mK6JqVWJR1rZUbCJj0+1FxRnscMw5avrSXdWQ2QRUzdfHGhElaWqYlXzpcitDHdv2b
         2L4ujj4js964ROOIUb/vvJgjF25DB+EU7rd9aNLVuOr0CcTh0B2n3a3VY6GH6Iv3Zy
         3GvNLpNRXd/GGtbwGBqjG6rimIQNBet/Gox0rAUML45sMy96o8HRuJZZ5s/9fXgz5P
         LblNPtsFwFwR8basDGFS6r25WU2m/q+bpvQXni+x+O6lmHApPRfXrvDxIJyLSypIy0
         HAhODCepaX9oA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 73183A0096;
        Fri, 24 Jul 2020 23:39:11 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:39:11 -0700
Date:   Fri, 24 Jul 2020 16:39:11 -0700
Message-Id: <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 07/12] usb: common: Add function to get num_lanes and transfer rate
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a new common function to parse maximum_speed property string for
the specified number of lanes and transfer rate.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v3:
- Add new function to parse "maximum-speed" for lanes and transfer rate
- Remove separate functions getting num_lanes and transfer rate properties
Changes in v2:
- New commit

 drivers/usb/common/common.c | 47 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/usb/ch9.h     | 25 ++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 1433260d99b4..53b4950c49e4 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -77,18 +77,59 @@ const char *usb_speed_string(enum usb_device_speed speed)
 }
 EXPORT_SYMBOL_GPL(usb_speed_string);
 
-enum usb_device_speed usb_get_maximum_speed(struct device *dev)
+void usb_get_maximum_speed_and_num_lanes(struct device *dev,
+					 enum usb_device_speed *speed,
+					 enum usb_phy_gen *gen,
+					 u8 *num_lanes)
 {
 	const char *maximum_speed;
+	enum usb_device_speed matched_speed = USB_SPEED_UNKNOWN;
+	enum usb_phy_gen matched_gen = USB_PHY_GEN_UNKNOWN;
+	u8 matched_num_lanes = 0;
 	int ret;
 
 	ret = device_property_read_string(dev, "maximum-speed", &maximum_speed);
 	if (ret < 0)
-		return USB_SPEED_UNKNOWN;
+		goto done;
 
 	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
+	if (ret >= 0) {
+		matched_speed = ret;
+		goto done;
+	}
+
+	if (strncmp("super-speed-plus-gen2x2", maximum_speed, 23) == 0) {
+		matched_speed = USB_SPEED_SUPER_PLUS;
+		matched_gen = USB_PHY_GEN_2;
+		matched_num_lanes = 2;
+	} else if (strncmp("super-speed-plus-gen2x1", maximum_speed, 23) == 0) {
+		matched_speed = USB_SPEED_SUPER_PLUS;
+		matched_gen = USB_PHY_GEN_2;
+		matched_num_lanes = 1;
+	} else if (strncmp("super-speed-plus-gen1x2", maximum_speed, 23) == 0) {
+		matched_speed = USB_SPEED_SUPER_PLUS;
+		matched_gen = USB_PHY_GEN_1;
+		matched_num_lanes = 2;
+	}
+
+done:
+	if (speed)
+		*speed = matched_speed;
+
+	if (num_lanes)
+		*num_lanes = matched_num_lanes;
+
+	if (gen)
+		*gen = matched_gen;
+}
+EXPORT_SYMBOL_GPL(usb_get_maximum_speed_and_num_lanes);
+
+enum usb_device_speed usb_get_maximum_speed(struct device *dev)
+{
+	enum usb_device_speed speed;
 
-	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
+	usb_get_maximum_speed_and_num_lanes(dev, &speed, NULL, NULL);
+	return speed;
 }
 EXPORT_SYMBOL_GPL(usb_get_maximum_speed);
 
diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index 01191649a0ad..46cfd72e7082 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -57,6 +57,13 @@ enum usb_link_protocol {
 	USB_LP_SSP = 1,
 };
 
+/* USB phy signaling rate gen */
+enum usb_phy_gen {
+	USB_PHY_GEN_UNKNOWN,
+	USB_PHY_GEN_1,
+	USB_PHY_GEN_2,
+};
+
 /**
  * struct usb_sublink_speed - sublink speed attribute
  * @id: sublink speed attribute ID (SSID)
@@ -95,6 +102,24 @@ extern const char *usb_ep_type_string(int ep_type);
  */
 extern const char *usb_speed_string(enum usb_device_speed speed);
 
+/**
+ * usb_get_maximum_speed_and_num_lanes - Get maximum requested speed and number
+ * of lanes for a given USB controller.
+ * @dev: Pointer to the given USB controller device
+ * @speed: Where to output enum usb_device_speed
+ * @gen: Where to output phy signaling rate gen
+ * @num_lanes: Where to output number of requested lanes
+ *
+ * This function gets the maximum speed string from property "maximum-speed"
+ * and output the appropriate speed of the device. If the maximum-speed string
+ * is super-speed-plus-gen*, then it also outputs the number of lanes and phy
+ * signaling rate 'Gen' value.
+ */
+extern void usb_get_maximum_speed_and_num_lanes(struct device *dev,
+						enum usb_device_speed *speed,
+						enum usb_phy_gen *gen,
+						u8 *num_lanes);
+
 /**
  * usb_get_maximum_speed - Get maximum requested speed for a given USB
  * controller.
-- 
2.11.0

