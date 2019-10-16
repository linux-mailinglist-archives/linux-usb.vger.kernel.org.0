Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D700DD86C1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 05:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391082AbfJPDe6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 23:34:58 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42356 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403837AbfJPDdv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 23:33:51 -0400
Received: by mail-pf1-f194.google.com with SMTP id q12so13780282pff.9
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 20:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mmGMZQlCR6mgA59oWS1f2Nk927cLgLJYDtngM3i0DmQ=;
        b=uLkbH/AL8pOg7wAkq783Kv7Wli+S4S1fkwXvQK1hsdZz8RMDlTmkhaDVpBDw/mkoO4
         zBTWunDgn6kC1ewqFmgahk4sa4DL54pMRwCKWKiTye44tvTXsqTp6tTiQkBUQj9ZE7WX
         GFlecPGJ8qg9BS/QnlLtz2ltiSGv/DD9h60Nk3yaik8zidbbaF1cr9PvCiBb3MgexH43
         QqgoYOBBbb1zOJvedENxG6asKQFB/TzSZAY/z04OpFQSmYX6mevmQD1DMHMmEQbMZkNW
         uW8J/Od3UKmRiRZSjx5lUM8HYObGLRFjd7aVMByq0wV3Rc+Qi/ZvxrF44OpKP2tjyR0R
         0vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mmGMZQlCR6mgA59oWS1f2Nk927cLgLJYDtngM3i0DmQ=;
        b=mBXPZ8hLiMWHKw69R+PEbx6cXKXWgtUb6MyHDSi9PM5AHRyXfVbpdUMjQ2RtjDkH0a
         2FjCzdL+QMqz72Kc1l8LLWi1pG9kLsOxS3UeD7PvIc35vKzY762dRXfTzOIw8K7KuAgb
         iRvc3ErDHhMTq02aHHh7VTV2EE1UyYJRD3crYo1vx33P5yqmpquhQqBjgtf+VesgXwwQ
         qNx8zLlQuQHOdTZV/XohykOud2XGmXZ5ntHDOrgpOGgIFTZriEK9CBT4hOBFUt3fOSyM
         sbdAqPSoiH2b4jGs1XSODYW4+KgITW5l/zSAz40zDN9ZCxPpEsUkAdARua8u3kNZLjdd
         JKLw==
X-Gm-Message-State: APjAAAVsEbix79V09ArRvQAwJUtkQT6mJOQuBkGWvUtuoo1+Dwi5gWNV
        mOU2PMs/+DS8wP9ZtVSYnt5isg==
X-Google-Smtp-Source: APXvYqws+YMGIIyJ9Z71j/JJfgVn5iU2tJXSMhO0gdaPFucclq53zCDhmjLlxCTNhG2oSTVllo97hA==
X-Received: by 2002:a62:e206:: with SMTP id a6mr42231705pfi.64.1571196830986;
        Tue, 15 Oct 2019 20:33:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l23sm748356pjy.12.2019.10.15.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 20:33:50 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RFC][PATCH v3 05/11] usb: dwc3: Rework clock initialization to be more flexible
Date:   Wed, 16 Oct 2019 03:33:34 +0000
Message-Id: <20191016033340.1288-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016033340.1288-1-john.stultz@linaro.org>
References: <20191016033340.1288-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3 core binding specifies three clocks:
  ref, bus_early, and suspend

which are all controlled in the driver together.

However some variants of the hardware my not have all three clks

So this patch reworks the reading of the clks from the dts to
use devm_clk_bulk_get_all() will will fetch all the clocks
specified in the dts together.

This patch was reccomended by Rob Herring <Rob.Herring@arm.com>
as an alternative to creating multiple bindings for each variant
of hardware when the only unique bits were clocks and resets.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <Rob.Herring@arm.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Rework dwc3 core rather then adding another dwc-of-simple
    binding.
---
 drivers/usb/dwc3/core.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index a039e35ec7ad..4d4f1836b62c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -305,12 +305,6 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 	return 0;
 }
 
-static const struct clk_bulk_data dwc3_core_clks[] = {
-	{ .id = "ref" },
-	{ .id = "bus_early" },
-	{ .id = "suspend" },
-};
-
 /*
  * dwc3_frame_length_adjustment - Adjusts frame length if required
  * @dwc3: Pointer to our controller context structure
@@ -1418,11 +1412,6 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (!dwc)
 		return -ENOMEM;
 
-	dwc->clks = devm_kmemdup(dev, dwc3_core_clks, sizeof(dwc3_core_clks),
-				 GFP_KERNEL);
-	if (!dwc->clks)
-		return -ENOMEM;
-
 	dwc->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1458,17 +1447,18 @@ static int dwc3_probe(struct platform_device *pdev)
 		return PTR_ERR(dwc->reset);
 
 	if (dev->of_node) {
-		dwc->num_clks = ARRAY_SIZE(dwc3_core_clks);
-
-		ret = devm_clk_bulk_get(dev, dwc->num_clks, dwc->clks);
+		ret = devm_clk_bulk_get_all(dev, &dwc->clks);
 		if (ret == -EPROBE_DEFER)
 			return ret;
 		/*
 		 * Clocks are optional, but new DT platforms should support all
 		 * clocks as required by the DT-binding.
 		 */
-		if (ret)
+		if (ret < 0)
 			dwc->num_clks = 0;
+		else
+			dwc->num_clks = ret;
+
 	}
 
 	ret = reset_control_deassert(dwc->reset);
-- 
2.17.1

