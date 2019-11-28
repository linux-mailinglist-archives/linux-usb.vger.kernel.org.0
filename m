Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB9D10C36D
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 06:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfK1FKL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 00:10:11 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45569 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfK1FKK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 00:10:10 -0500
Received: by mail-pg1-f195.google.com with SMTP id k1so12263784pgg.12
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 21:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BvSTajJ0/txDo3oQ9anR2MLYElhTmMiqKohTpjPUH4Y=;
        b=hEcBgdZf62B5VBmMPEBMROUIXTik/BmhILgVyVtvBnFUL+wplH8lMAizJ0o0t3/ng/
         iKfkb0yh4LkTNwbo9TqW1UBDse7OefhHp8STTYmoQFwejSusy11WfaIqzr0xEq29Aovr
         SZXB0JEgIUGPzDtNjE816xl2J45Cm2GSK5ykeQgEZkH5nGJijSLPBkdL4qnvjle75Giy
         W+JaJPW95XhtAntBeGnN2+nKIFtQCjTVptuFfZTjIdT3FltrfPmPadJ8D9pLtk1nAkXU
         hWfXB3h/Mjf1HyqlidX7XwaVp3uY5B2UiNZSduoUE4Yc4j9x6jM4LtnvD45MvbkJr0B4
         l9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BvSTajJ0/txDo3oQ9anR2MLYElhTmMiqKohTpjPUH4Y=;
        b=C/ra0wqBfQTVXv7mVgP1vzUkogElz64W+8iJJbxYGmqjyKzbkCb1uu58+lQd78aLtr
         cRdwcO8uZN2Abh5i1VeblHj/1WlK8R1Xq8Vmf357A7XOLcaK7vichgmYR/tCrolbdVFJ
         u4KUVVeTkhTyIiKpSSl7GuRo5Rd2M5yfVhPs5wAKaNROjOw20oLxt008WzNMSPa2DSyp
         cBX2o1Bs31txHYl/q+IHaerhNAlrRpXVH0Dvjez3CGpYnXEIPXuYAu1HhKeo0vyUivfJ
         8UwyLmOw7Sl9o27CPZ/F4W2da79TK/ZOtaRLALRBbI08mYirzG/O/KNt5PmcdA5qkea5
         rmWQ==
X-Gm-Message-State: APjAAAXa0HkybHfjRT/+aJS7ZSQ/MWbXYJhkMa9RjGRdxU0HLUKvUleK
        TsMRgXxrJJwste57kCunkVTq/A==
X-Google-Smtp-Source: APXvYqyql6x+1lm7cxFqUepsOsRjBk9AfB5o3/t6r/N0vThhH09XFvGWl/xVmQ8NaYF3vh/pvqejmQ==
X-Received: by 2002:a62:5e04:: with SMTP id s4mr52193789pfb.63.1574917809693;
        Wed, 27 Nov 2019 21:10:09 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id j20sm17799838pff.182.2019.11.27.21.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 21:10:09 -0800 (PST)
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
Subject: [PATCH v6 5/8] usb: dwc3: Rework clock initialization to be more flexible
Date:   Thu, 28 Nov 2019 05:09:58 +0000
Message-Id: <20191128051001.18995-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191128051001.18995-1-john.stultz@linaro.org>
References: <20191128051001.18995-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3 core binding specifies three clocks:
  ref, bus_early, and suspend

which are all controlled in the driver together.

However some variants of the hardware my not have all three
clks, or some may have more. Usually this was handled by using
the dwc3-of-simple glue driver, but that resulted in a
proliferation of bindings for for every variant, when the only
difference was the clocks and resets lists.

So this patch reworks the reading of the clks from the dts to
use devm_clk_bulk_get_all() will will fetch all the clocks
specified in the dts together.

This patch was recommended by Rob Herring <robh@kernel.org>
as an alternative to creating multiple bindings for each variant
of hardware.

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
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Change-Id: I3319bec8253edc131d772ca66dc9335435b06424
---
v3: Rework dwc3 core rather then adding another dwc-of-simple
    binding.
v6: Re-introduce this patch, on Rob's suggestion
---
 drivers/usb/dwc3/core.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f561c6c9e8a9..c6316d4b7593 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -289,12 +289,6 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
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
@@ -1438,11 +1432,6 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (!dwc)
 		return -ENOMEM;
 
-	dwc->clks = devm_kmemdup(dev, dwc3_core_clks, sizeof(dwc3_core_clks),
-				 GFP_KERNEL);
-	if (!dwc->clks)
-		return -ENOMEM;
-
 	dwc->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1478,17 +1467,18 @@ static int dwc3_probe(struct platform_device *pdev)
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

