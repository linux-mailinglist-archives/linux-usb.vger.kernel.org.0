Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E27277E18
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgIYCm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:42:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50882 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726764AbgIYCm1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:42:27 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 820E9409E3;
        Fri, 25 Sep 2020 02:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001747; bh=h9Xwf0J43xLa6QHPltBUdAuGjj2TaDoKU/QghT5cA0o=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=WdulwM8v5OUpeHCTt6zESVkAGbJ5PlSZugoMV2MjBZrANRAIFoFs7GTki5DpWhO9E
         VNOw+58UbM2hk4AwQas6KRc8QEAs5gDc9MyAVMKdFhkvd1yr+VfAa5kdeIj3aW+Iq+
         dat68h4Khkh1jVEszKTDt9uGWTJUYqEJ3DuLrT1v1XOeMqVpMDDftHr6Fs1FdJ0Oq2
         ooQXeDMH9oo570cZNn1xfDXF31elxBNHTmONueg3uXwuUwrRxJEovnfmUjOcFSSvLa
         WfG+ULKWVv5ihUzYtgEvcmVT8vy+8gwALgMVkX6MK4awRdR1qD+HjvNgBjNOCo5y2V
         lS8ynCKf1iiJw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 6B1EAA0099;
        Fri, 25 Sep 2020 02:42:26 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:42:26 -0700
Date:   Thu, 24 Sep 2020 19:42:26 -0700
Message-Id: <4e7420d94d109a073d635172778dacf394fbe9aa.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 07/12] usb: common: Add and update common functions for SSP speeds
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB "maximum-speed" property now can take these new strings for
super-speed-plus:

"super-speed-plus-gen2x2"
"super-speed-plus-gen2x1"
"super-speed-plus-gen1x2"

As a result, let's do the follow:
* Update usb_get_maximum_speed() to parse these new speed strings
* Add 2 new common functions to get the Gen number and number of lanes

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- Create 2 functions to get the SSP gen and number of lanes from "maximum-speed" property
- Update usb_get_maximum_speed() to check new SSP strings with genXxY
- Update commit message and subject title to reflect the new changes
Changes in v3:
- Add new function to parse "maximum-speed" for lanes and transfer rate
- Remove separate functions getting num_lanes and transfer rate properties
Changes in v2:
- New commit

 drivers/usb/common/common.c | 46 ++++++++++++++++++++++++++++++++++++-
 include/linux/usb/ch9.h     | 30 ++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 1433260d99b4..b3b3972d5be7 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -86,12 +86,56 @@ enum usb_device_speed usb_get_maximum_speed(struct device *dev)
 	if (ret < 0)
 		return USB_SPEED_UNKNOWN;
 
-	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
+	if (strncmp("super-speed-plus-gen2x2", maximum_speed, 23) == 0 ||
+	    strncmp("super-speed-plus-gen2x1", maximum_speed, 23) == 0 ||
+	    strncmp("super-speed-plus-gen1x2", maximum_speed, 23) == 0)
+		return USB_SPEED_SUPER_PLUS;
 
+	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
 	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
 }
 EXPORT_SYMBOL_GPL(usb_get_maximum_speed);
 
+u8 usb_get_ssp_num_lanes(struct device *dev)
+{
+	const char *maximum_speed;
+	int ret;
+
+	ret = device_property_read_string(dev, "maximum-speed", &maximum_speed);
+	if (ret < 0)
+		return 0;
+
+	if (strncmp("super-speed-plus-gen2x1", maximum_speed, 23) == 0)
+		return 1;
+
+	if (strncmp("super-speed-plus-gen2x2", maximum_speed, 23) == 0 ||
+	    strncmp("super-speed-plus-gen1x2", maximum_speed, 23) == 0)
+		return 2;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_get_ssp_num_lanes);
+
+enum usb_phy_gen usb_get_ssp_phy_gen(struct device *dev)
+{
+	const char *maximum_speed;
+	int ret;
+
+	ret = device_property_read_string(dev, "maximum-speed", &maximum_speed);
+	if (ret < 0)
+		return USB_PHY_GEN_UNKNOWN;
+
+	if (strncmp("super-speed-plus-gen1x2", maximum_speed, 23) == 0)
+		return USB_PHY_GEN_1;
+
+	if (strncmp("super-speed-plus-gen2x2", maximum_speed, 23) == 0 ||
+	    strncmp("super-speed-plus-gen2x1", maximum_speed, 23) == 0)
+		return USB_PHY_GEN_2;
+
+	return USB_PHY_GEN_UNKNOWN;
+}
+EXPORT_SYMBOL_GPL(usb_get_ssp_phy_gen);
+
 const char *usb_state_string(enum usb_device_state state)
 {
 	static const char *const names[] = {
diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index 01191649a0ad..bd13d27551e5 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -57,6 +57,13 @@ enum usb_link_protocol {
 	USB_LP_SSP = 1,
 };
 
+/* USB phy signaling rate generation */
+enum usb_phy_gen {
+	USB_PHY_GEN_UNKNOWN,
+	USB_PHY_GEN_1,
+	USB_PHY_GEN_2,
+};
+
 /**
  * struct usb_sublink_speed - sublink speed attribute
  * @id: sublink speed attribute ID (SSID)
@@ -105,6 +112,29 @@ extern const char *usb_speed_string(enum usb_device_speed speed);
  */
 extern enum usb_device_speed usb_get_maximum_speed(struct device *dev);
 
+/**
+ * usb_get_ssp_num_lanes - Get requested number of lanes for a given
+ * super-speed-plus capable USB controller.
+ * @dev: Pointer to the given USB controller device
+ *
+ * If the string from "maximum-speed" property is super-speed-plus-genXxY where
+ * 'Y' is the number of lanes, then this function returns 1 for single lane and
+ * 2 for dual-lane base on 'Y'. If the number of lanes is not specified, then it
+ * returns 0.
+ */
+extern u8 usb_get_ssp_num_lanes(struct device *dev);
+
+/**
+ * usb_get_ssp_phy_gen - Get requested phy signaling rate generation for a given
+ * super-speed-plus capable USB controller.
+ * @dev: Pointer to the given USB controller device
+ *
+ * If the string from "maximum-speed" property is super-speed-plus-genXxY where
+ * 'X' is the Gen number, then this function returns the corresponding enum
+ * usb_phy_gen base on 'X'.
+ */
+extern enum usb_phy_gen usb_get_ssp_phy_gen(struct device *dev);
+
 /**
  * usb_state_string - Returns human readable name for the state.
  * @state: The state to return a human-readable name for. If it's not
-- 
2.28.0

