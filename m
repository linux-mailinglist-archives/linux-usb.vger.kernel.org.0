Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735C311C289
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 02:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfLLBnJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 20:43:09 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38625 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727631AbfLLBmm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 20:42:42 -0500
Received: by mail-pg1-f195.google.com with SMTP id a33so278503pgm.5
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 17:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G6kjJoovlC6cVfetXCubnmxNfzySZyzH70fmpOskqm8=;
        b=cGOZzqU13JOBPam+xdKigkTIGiAjbtkPvBYtjMIcRGUuLi4JiP7MUinvcn6DCHl3if
         FfTvBb4dk8U5AMVmF2CjA3dX++wBfx3pTTGhYpwAXjF+gVP7q2lyOJ71aGuUEDGgLDk+
         TMnP3JbWjTdAvowKhz6F66lifrsJQu8cJUerpX+PE5lpkYRjgLc7ZYnOaB5FZFDeXZLZ
         4XTD82pAK9BsC4PJHfrpswrG46E7SuRpdj1/clKJtXJ/dD0FqdjFwSmynLis5GtK1lV7
         /4QvRxBrdkNP0ceSSZ49Ot9qJNQWbR+IUoA7OE66lecnIgheFt5rQQ4O7VaQtW+J/H3+
         w9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G6kjJoovlC6cVfetXCubnmxNfzySZyzH70fmpOskqm8=;
        b=EVDeDKXdWiljyOzW8VbdPLvsef9lCmcLpsXpJzLAQNbuV0xZW3EC04wSdNfDW3QIrr
         phDYD9VNhjP1aQ5FV8sJCUnbrgOix8KPkDyzJ2oAuZgV2hVdpsRyCNCzJdk2ZKhJ4Zn1
         2itDl9tj4y9CzHj5XfqSfw/liXTBD6I4Ld/LX/afWrBeBHxQPdWL9MWhW2EtE6l+Cw4n
         //M707/UHuBkRJaqF615omYhn8qJtqldCfHVmBSaPu34OdUIQDruHVfhhA8Qa3OtykMC
         m8Gj7xQgY/9XtkyRIJVNd2+K/DF3vum2K/s8ZpsRYx+3+5kj2F0fSrwgxNasUotfVWQP
         Y5fA==
X-Gm-Message-State: APjAAAXEMSaI4uuxiWiI45VkX+aG4aPijb9flt3Eey2qNdKrNnhHZQx4
        jOKVztvu0YpjGSWsquaAgSuQIg==
X-Google-Smtp-Source: APXvYqwpqM70vNZbKae/RwdZ2CYgbgIkvtbmpvMV4ONBua+4aE8gJ9REa97neloI95Wm/o50zRSkzw==
X-Received: by 2002:a62:1a97:: with SMTP id a145mr7398556pfa.244.1576114961674;
        Wed, 11 Dec 2019 17:42:41 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id p16sm4217996pgi.50.2019.12.11.17.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 17:42:41 -0800 (PST)
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
Subject: [PATCH v7 5/8] usb: dwc3: Rework clock initialization to be more flexible
Date:   Thu, 12 Dec 2019 01:42:30 +0000
Message-Id: <20191212014233.32799-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212014233.32799-1-john.stultz@linaro.org>
References: <20191212014233.32799-1-john.stultz@linaro.org>
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

