Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047AF22A521
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 04:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387754AbgGWCMs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 22:12:48 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54268 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387467AbgGWCMr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 22:12:47 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8011F40140;
        Thu, 23 Jul 2020 02:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470367; bh=k9v8smLqRJvUjNhbHk0Lo0a8mlkrSCnenpl6IlnK730=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GsAF1Bn9qJbj7OkixPGwIUz9ER8VZ5Kxj3sl36gUzaAG0piJgFvfz4fUZ5a8tJEZx
         iy7kU12G/0ljBw1xSB6j/z42irrPpsrTbDdtaqmFIRh6JLvqXHVp8rS9m6NA0Ufk+S
         BVLgel3Gk/PxR6nYH4DjN6/E1OjSS42+YODWuNnnPPDImC+tbwtLX6DHbsGMTFRsL5
         /7nKmF33cz4b+qseIONzXy238jbKdTRcyHRewskFWT8bAtXgQ2DINYxMvNWXBj1wCy
         waawhHimKqxDJL1e8QugPCJ29yrbGJSw4G0eR12nhaqQkEetZ8s4HhYGHtal8Ygn6a
         wM4mJOwNpXL6A==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 69FACA009A;
        Thu, 23 Jul 2020 02:12:46 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 22 Jul 2020 19:12:46 -0700
Date:   Wed, 22 Jul 2020 19:12:46 -0700
Message-Id: <830743026ec46eacc5f7f28f39d2f1dae413dc05.1595468673.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595468673.git.thinhn@synopsys.com>
References: <cover.1595468673.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 07/12] usb: common: Add functions to get lanes and lsm
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add common functions to get the requested number of lanes and lane speed
mantissa from device properties.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
- New commit

 drivers/usb/common/common.c | 26 ++++++++++++++++++++++++++
 include/linux/usb/ch9.h     | 19 +++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 1433260d99b4..871a7326b6b7 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -92,6 +92,32 @@ enum usb_device_speed usb_get_maximum_speed(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_get_maximum_speed);
 
+u8 usb_get_num_lanes(struct device *dev)
+{
+	u8 num_lanes;
+	int ret;
+
+	ret = device_property_read_u8(dev, "num-lanes", &num_lanes);
+	if (ret < 0)
+		return 0;
+
+	return num_lanes;
+}
+EXPORT_SYMBOL_GPL(usb_get_num_lanes);
+
+u16 usb_get_lsm(struct device *dev)
+{
+	u16 lsm;
+	int ret;
+
+	ret = device_property_read_u16(dev, "lane-speed-mantissa-gbps", &lsm);
+	if (ret < 0)
+		return 0;
+
+	return lsm;
+}
+EXPORT_SYMBOL_GPL(usb_get_lsm);
+
 const char *usb_state_string(enum usb_device_state state)
 {
 	static const char *const names[] = {
diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index f87ef9a2f859..1097c6f8e2ef 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -105,6 +105,25 @@ extern const char *usb_speed_string(enum usb_device_speed speed);
  */
 extern enum usb_device_speed usb_get_maximum_speed(struct device *dev);
 
+/**
+ * usb_get_num_lanes - Get maximum number of requested lanes for a given USB
+ * controller.
+ * @dev: Pointer to the given USB controller device
+ *
+ * The function returns the number of requested lanes from the property
+ * "num-lanes".
+ */
+extern u8 usb_get_num_lanes(struct device *dev);
+
+/**
+ * usb_get_lsm - Get requested lane speed mantissa for a given USB controller.
+ * @dev: Pointer to the given USB controller device
+ *
+ * The function returns the requested symmetric lane speed mantissa in Gbps from
+ * the property "lane-speed-mantissa-gbps".
+ */
+extern u16 usb_get_lsm(struct device *dev);
+
 /**
  * usb_state_string - Returns human readable name for the state.
  * @state: The state to return a human-readable name for. If it's not
-- 
2.11.0

