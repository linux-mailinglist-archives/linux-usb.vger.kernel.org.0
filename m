Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB20D2FC6FF
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 02:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbhATBnY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 20:43:24 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47288 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729220AbhATBhX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 20:37:23 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8CB6BC00A7;
        Wed, 20 Jan 2021 01:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1611106576; bh=IC0nVcISXmIO27HKsEeFGGLslgTi1q1NOwY16koqyiU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=JYCO01RlxG3UXPIcdKp6DDwDVGxDeJNLyTWg7oVRcwuX69W046gNCa59xisKepv7P
         cP9LB711G2FXe0JgSWfSLdWHj33rlHh94/MmG5JnRQgrM1lYUTxM+awqCRcQJL/LLY
         yEngY8Gd12VmJIKs8Ti9RpzMx5a/ju844ewyDNpz3tAcWcETTo/FtNKwQcCvoiFqVU
         TNDtz2wkqYn5Eouz6A9QTaAwQbLm5rKFRlSq+HgjU9QyeGtpQvjVIokcp/CCaVZLw0
         vMFQ7ZxF1d5zF2NpmCYsbcZNeciUAm0zDmJRoPLOhf4IdFTzq9Qaa00pHCEqUUA89h
         DtKtC6mg4DnDA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 05726A0068;
        Wed, 20 Jan 2021 01:36:14 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 19 Jan 2021 17:36:14 -0800
Date:   Tue, 19 Jan 2021 17:36:14 -0800
Message-Id: <f8ed896313d8cd8e2d2b540fc82db92b3ddf8a47.1611106162.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v7 2/6] usb: common: Parse for USB SSP genXxY
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB "maximum-speed" property can now take the SSP signaling rate
generation and lane count with these new strings:

"super-speed-plus-gen2x2"
"super-speed-plus-gen2x1"
"super-speed-plus-gen1x2"

Introduce usb_get_maximum_ssp_rate() to parse for the corresponding
usb_ssp_rate enum. The original usb_get_maximum_speed() will return
USB_SPEED_SUPER_PLUS if it matches one of these new strings.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v7:
- Rebase on Greg's usb-testing branch
Changes in v6:
- Rebase on Greg's usb-testing branch
- Remove usb_get_ssp_num_lanes() and usb_get_ssp_phy_gen() and use
  usb_get_ssp_rate() to return the corresponding usb_ssp_rate enum instead
- Update commit message
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

 drivers/usb/common/common.c | 26 +++++++++++++++++++++++++-
 include/linux/usb/ch9.h     | 11 +++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 1433260d99b4..fc21cf2d36f6 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -69,6 +69,13 @@ static const char *const speed_names[] = {
 	[USB_SPEED_SUPER_PLUS] = "super-speed-plus",
 };
 
+static const char *const ssp_rate[] = {
+	[USB_SSP_GEN_UNKNOWN] = "UNKNOWN",
+	[USB_SSP_GEN_2x1] = "super-speed-plus-gen2x1",
+	[USB_SSP_GEN_1x2] = "super-speed-plus-gen1x2",
+	[USB_SSP_GEN_2x2] = "super-speed-plus-gen2x2",
+};
+
 const char *usb_speed_string(enum usb_device_speed speed)
 {
 	if (speed < 0 || speed >= ARRAY_SIZE(speed_names))
@@ -86,12 +93,29 @@ enum usb_device_speed usb_get_maximum_speed(struct device *dev)
 	if (ret < 0)
 		return USB_SPEED_UNKNOWN;
 
-	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
+	ret = match_string(ssp_rate, ARRAY_SIZE(ssp_rate), maximum_speed);
+	if (ret > 0)
+		return USB_SPEED_SUPER_PLUS;
 
+	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
 	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
 }
 EXPORT_SYMBOL_GPL(usb_get_maximum_speed);
 
+enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev)
+{
+	const char *maximum_speed;
+	int ret;
+
+	ret = device_property_read_string(dev, "maximum-speed", &maximum_speed);
+	if (ret < 0)
+		return USB_SSP_GEN_UNKNOWN;
+
+	ret = match_string(ssp_rate, ARRAY_SIZE(ssp_rate), maximum_speed);
+	return (ret < 0) ? USB_SSP_GEN_UNKNOWN : ret;
+}
+EXPORT_SYMBOL_GPL(usb_get_maximum_ssp_rate);
+
 const char *usb_state_string(enum usb_device_state state)
 {
 	static const char *const names[] = {
diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index 86c50907634e..abdd310c77f0 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -71,6 +71,17 @@ extern const char *usb_speed_string(enum usb_device_speed speed);
  */
 extern enum usb_device_speed usb_get_maximum_speed(struct device *dev);
 
+/**
+ * usb_get_maximum_ssp_rate - Get the signaling rate generation and lane count
+ *	of a SuperSpeed Plus capable device.
+ * @dev: Pointer to the given USB controller device
+ *
+ * If the string from "maximum-speed" property is super-speed-plus-genXxY where
+ * 'X' is the generation number and 'Y' is the number of lanes, then this
+ * function returns the corresponding enum usb_ssp_rate.
+ */
+extern enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev);
+
 /**
  * usb_state_string - Returns human readable name for the state.
  * @state: The state to return a human-readable name for. If it's not
-- 
2.28.0

