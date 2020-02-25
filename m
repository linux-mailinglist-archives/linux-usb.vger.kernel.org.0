Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0076216ED2D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 18:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731379AbgBYRyF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 12:54:05 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43052 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728913AbgBYRyF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 12:54:05 -0500
Received: by mail-pf1-f193.google.com with SMTP id s1so7574005pfh.10
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 09:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CpmywWyp6aExqYXO2nsoyNHZG6T/FiFmGDy6H1VmZYo=;
        b=ASuZESBsToschmHjBbgEc3jfR3shNL1vpcT7qJeCfsurb2NjTft4SutlPuhnOOJwpv
         w0YXal/pHV67j2wlcIfNz8ABT7AzFinBpm71SU6eHSOmUaw2rOn4Oele9Nx4ekt5GQ+P
         VwPPurcKjc99Z1vChtyxA5w2NbZkayU8asApDjoLX416t0GGg3AR6Teub6jG0AjwsXxP
         lsGccjBqajtNtNTqwyuVBO0mLXkidobN/csXNNDzhYC9LxjFana27NKfoAGwFKPzOsb0
         66/ycCvpXGQ26/Ou5JNA41pfnmjA3kQnBbJ/QqDVvP8xBOPFiUS/jF5tm3IL6bD0RgPc
         G1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CpmywWyp6aExqYXO2nsoyNHZG6T/FiFmGDy6H1VmZYo=;
        b=t8PCD4py0ulc6YkCUqY2hFbi3y3MduAp4VMlKOlB+573/26YYpZcKCnESU9yS6IQv7
         h8x70vqaDrgEWt6of1MJGU2qyuHEHK9Ne9kQ35pRLOzf1i3WGjBp38AJzMzLG/rqsTWH
         vbxE1DmoXYhhahPlmuMMsyNcGBqwD1EKwy+dkhielumBlhS5wcrTR5oHZuizB7BmH2gY
         5V3541AH43IfppY9bVuo/ORYQvqdiOoiQLkBYGAN8MFSDZvWt6pdNYKz5YbroSNhX7iZ
         UqCXyF+5gcX+eikvoLq8L0HUNcftAiXLlkwnz0s3klkMNf8tRgSIKaaoRE+79slmocqS
         qvxw==
X-Gm-Message-State: APjAAAWZdw+TLGmZp7hqyntv0nOO4B3RpV0ZDJZ0CUtQ1nVprmt1N99Q
        njTf/D5ktKp7QX+UuJLcBo5UKg==
X-Google-Smtp-Source: APXvYqwpHKqD+EUq28KEJF7IXzIP1hpR7FRD9XctnUIftrS+HfPh4WaCyCgkjKFUI/d1YZOsWn0oKA==
X-Received: by 2002:a63:7e1a:: with SMTP id z26mr5483897pgc.226.1582653244705;
        Tue, 25 Feb 2020 09:54:04 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id v8sm18013291pgt.52.2020.02.25.09.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:54:04 -0800 (PST)
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
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v8 5/6] usb: dwc3: Rework clock initialization to be more flexible
Date:   Tue, 25 Feb 2020 17:53:03 +0000
Message-Id: <20200225175304.36406-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225175304.36406-1-john.stultz@linaro.org>
References: <20200225175304.36406-1-john.stultz@linaro.org>
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
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Rework dwc3 core rather then adding another dwc-of-simple
    binding.
v6: Re-introduce this patch, on Rob's suggestion
---
 drivers/usb/dwc3/core.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 1d85c42b9c67..ba21af5c1204 100644
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
@@ -1441,11 +1435,6 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (!dwc)
 		return -ENOMEM;
 
-	dwc->clks = devm_kmemdup(dev, dwc3_core_clks, sizeof(dwc3_core_clks),
-				 GFP_KERNEL);
-	if (!dwc->clks)
-		return -ENOMEM;
-
 	dwc->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1481,17 +1470,18 @@ static int dwc3_probe(struct platform_device *pdev)
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

