Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC7D210D5
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2019 01:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfEPXAE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 19:00:04 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41972 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfEPXAD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 19:00:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id q17so2607685pfq.8
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2019 16:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p30np0hBvMX1W0YNEuSMq1CSpTbZYqwy7zvLBclQiMg=;
        b=hnwqtn4JqSKOmxF6F6aOvVZPfAMcvwgoVPhGJa2PEdo51Ap8JlUtuAY2CJSHEyDVYV
         vSze5SeLV2+X/MXsIREhNKn0NR9xWforO5St/7l1vL3rauhgMuBYRP36oxrEz20D9bGu
         lhczrRbaCpU33cWHGY3m0CrUWZvQzkOPtRH7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p30np0hBvMX1W0YNEuSMq1CSpTbZYqwy7zvLBclQiMg=;
        b=ts4yEZZEhwWmbxuU7nZyTrsOCVyyYiAGX1PaRtackhIoB6cMpx5fOJAhshYZqxlt24
         gSMfnXrUwr3UffWXMsshzEv50QPUQ9CSrNEsqjkZgQyl7MIbkk9mr4kkj7WMuDmh3GyQ
         amuhQhoNiWzFBGBuIu/W5FwrVemMtL0xU0xwwrrSXsEdTUAX05F3pNUg1MmlluWWgovc
         tZM/dC91+whNxO2rXlerwct/iyz1DVcV6vdQuSYlH8NDxmiLIPagPxzK2t70SL0FxIn9
         4N30rtM2Ll212pxyOdgB3b73TjU//M1xJSsdwKjyI1uVX+wI+3YBmLy8WmPR/cuDGKGm
         UFQQ==
X-Gm-Message-State: APjAAAVjVkpMlH4h4FKGVaUfB1/mcSR1Zp6+/Zt2KMwpU+L6Q4U7QNGl
        11sM1OiaQCcCMnjsybtqA+z6NA==
X-Google-Smtp-Source: APXvYqyampXLABKCDp8VcVjgoHUFrixxBlRr0s7eAKWfWzxdOZDovZV5RuvhDu3ZsPNNzNxXoK+duw==
X-Received: by 2002:aa7:881a:: with SMTP id c26mr49711613pfo.254.1558047602038;
        Thu, 16 May 2019 16:00:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id j64sm1769506pfb.126.2019.05.16.16.00.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 16:00:01 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        amstan@chromium.org, linux-rockchip@lists.infradead.org,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, zyw@rock-chips.com,
        mka@chromium.org, ryandcase@chromium.org,
        Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org,
        dinguyen@opensource.altera.com,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [REPOST PATCH v2 2/3] USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled
Date:   Thu, 16 May 2019 15:59:40 -0700
Message-Id: <20190516225941.170355-3-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190516225941.170355-1-dianders@chromium.org>
References: <20190516225941.170355-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the 'snps,need-phy-for-wake' is set in the device tree then:

- We know that we can wakeup, so call device_set_wakeup_capable().
  The USB core will use this knowledge to enable wakeup by default.
- We know that we should keep the PHY on during suspend if something
  on our root hub needs remote wakeup.  This requires the patch (USB:
  Export usb_wakeup_enabled_descendants()).  Note that we don't keep
  the PHY on at suspend time if it's not needed because it would be a
  power draw.

If we later find some users of dwc2 that can support wakeup without
keeping the PHY on we may want to add a way to call
device_set_wakeup_capable() without keeping the PHY on at suspend
time.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
---
For relevant prior discussion of this idea, see:

https://lkml.kernel.org/r/1436207224-21849-4-git-send-email-dianders@chromium.org

If I'm reading all the responses correctly folks were of the opinion
that this patch is still the right way to go.

Changes in v2:
- Rebased to mainline atop rk3288 remote wake quirk series.

 drivers/usb/dwc2/core.h     |  5 +++++
 drivers/usb/dwc2/platform.c | 43 +++++++++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 152ac41dfb2d..73c1e998f27a 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -861,6 +861,9 @@ struct dwc2_hregs_backup {
  * @hibernated:		True if core is hibernated
  * @reset_phy_on_wake:	Quirk saying that we should assert PHY reset on a
  *			remote wakeup.
+ * @phy_off_for_suspend: Status of whether we turned the PHY off at suspend.
+ * @need_phy_for_wake:	Quirk saying that we should keep the PHY on at
+ *			suspend if we need USB to wake us up.
  * @frame_number:       Frame number read from the core. For both device
  *			and host modes. The value ranges are from 0
  *			to HFNUM_MAX_FRNUM.
@@ -1049,6 +1052,8 @@ struct dwc2_hsotg {
 	unsigned int ll_hw_enabled:1;
 	unsigned int hibernated:1;
 	unsigned int reset_phy_on_wake:1;
+	unsigned int need_phy_for_wake:1;
+	unsigned int phy_off_for_suspend:1;
 	u16 frame_number;
 
 	struct phy *phy;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index d10a7f8daec3..31be644d1273 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -47,7 +47,9 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_data/s3c-hsotg.h>
 #include <linux/reset.h>
+#include <linux/usb.h>
 
+#include <linux/usb/hcd.h>
 #include <linux/usb/of.h>
 
 #include "core.h"
@@ -447,6 +449,10 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	if (retval)
 		goto error;
 
+	hsotg->need_phy_for_wake =
+		of_property_read_bool(dev->dev.of_node,
+				      "snps,need-phy-for-wake");
+
 	/*
 	 * Reset before dwc2_get_hwparams() then it could get power-on real
 	 * reset value form registers.
@@ -478,6 +484,14 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		hsotg->gadget_enabled = 1;
 	}
 
+	/*
+	 * If we need PHY for wakeup we must be wakeup capable.
+	 * When we have a device that can wake without the PHY we
+	 * can adjust this condition.
+	 */
+	if (hsotg->need_phy_for_wake)
+		device_set_wakeup_capable(&dev->dev, true);
+
 	hsotg->reset_phy_on_wake =
 		of_property_read_bool(dev->dev.of_node,
 				      "snps,reset-phy-on-wake");
@@ -513,6 +527,28 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	return retval;
 }
 
+static bool __maybe_unused dwc2_can_poweroff_phy(struct dwc2_hsotg *dwc2)
+{
+	struct usb_device *root_hub = dwc2_hsotg_to_hcd(dwc2)->self.root_hub;
+
+	if (!dwc2->ll_hw_enabled)
+		return false;
+
+	/* If the controller isn't allowed to wakeup then we can power off. */
+	if (!device_may_wakeup(dwc2->dev))
+		return true;
+
+	/*
+	 * We don't want to power off the PHY if something under the
+	 * root hub has wakeup enabled.
+	 */
+	if (usb_wakeup_enabled_descendants(root_hub))
+		return false;
+
+	/* No reason to keep the PHY powered, so allow poweroff */
+	return true;
+}
+
 static int __maybe_unused dwc2_suspend(struct device *dev)
 {
 	struct dwc2_hsotg *dwc2 = dev_get_drvdata(dev);
@@ -521,8 +557,10 @@ static int __maybe_unused dwc2_suspend(struct device *dev)
 	if (dwc2_is_device_mode(dwc2))
 		dwc2_hsotg_suspend(dwc2);
 
-	if (dwc2->ll_hw_enabled)
+	if (dwc2_can_poweroff_phy(dwc2)) {
 		ret = __dwc2_lowlevel_hw_disable(dwc2);
+		dwc2->phy_off_for_suspend = true;
+	}
 
 	return ret;
 }
@@ -532,11 +570,12 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 	struct dwc2_hsotg *dwc2 = dev_get_drvdata(dev);
 	int ret = 0;
 
-	if (dwc2->ll_hw_enabled) {
+	if (dwc2->phy_off_for_suspend && dwc2->ll_hw_enabled) {
 		ret = __dwc2_lowlevel_hw_enable(dwc2);
 		if (ret)
 			return ret;
 	}
+	dwc2->phy_off_for_suspend = false;
 
 	if (dwc2_is_device_mode(dwc2))
 		ret = dwc2_hsotg_resume(dwc2);
-- 
2.21.0.1020.gf2820cf01a-goog

