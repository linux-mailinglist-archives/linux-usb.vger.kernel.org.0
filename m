Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6EF10C36E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 06:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfK1FKc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 00:10:32 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35877 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbfK1FKL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 00:10:11 -0500
Received: by mail-pg1-f194.google.com with SMTP id k13so12302294pgh.3
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 21:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QO/lP+KDcMBuBF0dCbiBImn3ahE7Jw+zkWapBF57MgQ=;
        b=jS4vAou0Kr4VlWLGW46xQ2mOeWEBO9xSfclqVZzZY6prqeXpGcE4q3l3Xx5PLk79oZ
         yt8FdpGPdNdZ2G8OZY9ofcFQ6RHGR/f2dmna1niRT8P5LRmymIw7yNiS+X9eeNUaSlKM
         2+Gs+JwPGWvX/7EfC2IcTHHOGHpS+4ftgU3cqPhiiDhxJSkfTu79VkQa1UQCn5whtfc+
         WdfrCLD+xeu9oUM2RU6+TnqnRiKNvRf/UlbT/bVixd63o8ou4RXmjFL54TiWbfOqRbP0
         3zICwN84cBLfHoYmUrXv9WU5uVkpPXB1CcpQ3HCpuvkP5D8mwXDwQ75SxOO+wqV2yqcB
         tXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QO/lP+KDcMBuBF0dCbiBImn3ahE7Jw+zkWapBF57MgQ=;
        b=BO+i/iMQJG2O/sCss3u4E6PfsdJTEgHxmYmUdVWo7SWiVeBuLgsd1jZrSram+r/uWh
         PsGHxgqkREC+57i4VSSOw1lMmlZraL7IbWHyvMQswiNg0rQGtR8GNCPlLxVhXVjSO2Ow
         sXNuyjo/FpcocZQwhfYi1jvrxXcRjCbJBjqVzYQ4pT/wpGlEr6SrZtDZ3ZDDyeeFzsD6
         eFsI2KfTnpTf4GV+uMx799fmrzVyZax9CkuZYJ9/ZEWOqkjX5y/C8sBtwlATCDG99w71
         ZVsjJoMIp5dAwbdbfb6sCXdcDPJzgWeLo112FzgUyCU5VULpVfsag987fFeoY3YtQp7M
         J3Og==
X-Gm-Message-State: APjAAAW4LP94SNH7Rp7CRWw8n7b/Uq1MCkJyJehAItzfLZKDBJsHbEwR
        hDznG7OK5bTXU5Ek/8upJUSOaQ==
X-Google-Smtp-Source: APXvYqxGPRbiVlZZUV1rk9y+AqcuPPIRI6ejj7HTdsPF3VM9U1EQBetfUhFQXHuhzrFwXyT1lX4LXQ==
X-Received: by 2002:a62:1488:: with SMTP id 130mr3242980pfu.238.1574917810740;
        Wed, 27 Nov 2019 21:10:10 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id j20sm17799838pff.182.2019.11.27.21.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 21:10:10 -0800 (PST)
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
Subject: [PATCH v6 6/8] usb: dwc3: Rework resets initialization to be more flexible
Date:   Thu, 28 Nov 2019 05:09:59 +0000
Message-Id: <20191128051001.18995-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191128051001.18995-1-john.stultz@linaro.org>
References: <20191128051001.18995-1-john.stultz@linaro.org>
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
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Change-Id: I4a26492f19e857f3f9f29bcdab81458016f70977
---
v3: Rework dwc3 core rather then adding another dwc-of-simple
    binding.
v6: Re-introduce this patch, on Rob's suggestion
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c6316d4b7593..19504b907476 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1462,7 +1462,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc3_get_properties(dwc);
 
-	dwc->reset = devm_reset_control_get_optional_shared(dev, NULL);
+	dwc->reset = devm_reset_control_array_get(dev, true, true);
 	if (IS_ERR(dwc->reset))
 		return PTR_ERR(dwc->reset);
 
-- 
2.17.1

