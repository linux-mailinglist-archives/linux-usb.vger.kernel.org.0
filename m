Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 149E616ED2F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 18:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731390AbgBYRyK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 12:54:10 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46644 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731205AbgBYRyJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 12:54:09 -0500
Received: by mail-pg1-f195.google.com with SMTP id y30so7211673pga.13
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 09:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EGHWPlxApQjuktMa4xDP9Q063H+hJfu1b6AJ+NVENyk=;
        b=mopFLxsWbeU0/yL28BByX3Qmrqu4/lNA+fcgdrQ0c38OZPHrInJHNTj2WYC/ILCWI3
         rXsIHYNPOo1xWFMGo7b/0CEJyDfVXjQ/OF3IJs1bd8q8HuaPPs18JlBn3fRBNx7jqN5f
         fC8vxPOg23B/AWvtJ+Qf4eNAws51cK2BgiyA2EA5uI5P3NgCw0Wv9hQUdeTRc3PUrZ0V
         hRk0YjbtV5tCBvV82AvEH/9gQey8wstJTVxNI3gzLRzj7PSSlwWMWxLKk9pa39J5/c6r
         JpjLoP7WYSaFE7JvzH24FqeckT308GZ6KURzKIQEE9oy3BJrKRDDhYmWeLqZFBVK+T/2
         mbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EGHWPlxApQjuktMa4xDP9Q063H+hJfu1b6AJ+NVENyk=;
        b=qlk8Q7B+WcW9bQ/kQ9l9xG/eHcg26BylIJH9O2oCF6W1CnCV2H1kBAfgNtSJzg8Sc/
         hAfCaZObAVMQRocN93tuG4h3J3FXNJkutYfi7neLo99s4WaGKvA6i4SuJcVEltKb8LeV
         if8EUvkjJegziYsTnheQwYA34tv5XdH4vupx5ZjZoOvkdskvHxbVo24DJ2/8e8tHSCI9
         ab4GfN2zeQl1FMwrHTunlTH359BJt4q/Y3bra8EvLAQNx4cM516/WuhslkyWaiPt2EYg
         zRyp6AsyKqFJWXF9f/E1Xsu5bEAwSnJUQt9BFvIn/qxNjaeWvLziTYuoHIgJE8y2rNMm
         hgAQ==
X-Gm-Message-State: APjAAAV4MsP/XKkPfhnrQHbJqsjyVSj/zWjScTGUDCS+l2q9NVTACG6B
        wSBKONgX4nGv2SXCTvWyno8xBQ==
X-Google-Smtp-Source: APXvYqzHMYAmH1VGS/4L4IKuT3hh7pV1x1nh2bDeq23It8zTwLG0Ky2zYk/YSXEkpzQl6uUTVp43bQ==
X-Received: by 2002:a63:2b0a:: with SMTP id r10mr12434661pgr.213.1582653248359;
        Tue, 25 Feb 2020 09:54:08 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id v8sm18013291pgt.52.2020.02.25.09.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:54:07 -0800 (PST)
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
Subject: [PATCH v8 6/6] usb: dwc3: Rework resets initialization to be more flexible
Date:   Tue, 25 Feb 2020 17:53:04 +0000
Message-Id: <20200225175304.36406-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225175304.36406-1-john.stultz@linaro.org>
References: <20200225175304.36406-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3 core binding specifies one reset.

However some variants of the hardware may have more. Previously
this was handled by using the dwc3-of-simple glue driver, but
that resulted in a proliferation of bindings for for every
variant, when the only difference was the clocks and resets
lists.

So this patch reworks the reading of the resets to fetch all the
resets specified in the dts together.

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
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ba21af5c1204..2afcc04da338 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1465,7 +1465,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc3_get_properties(dwc);
 
-	dwc->reset = devm_reset_control_get_optional_shared(dev, NULL);
+	dwc->reset = devm_reset_control_array_get(dev, true, true);
 	if (IS_ERR(dwc->reset))
 		return PTR_ERR(dwc->reset);
 
-- 
2.17.1

