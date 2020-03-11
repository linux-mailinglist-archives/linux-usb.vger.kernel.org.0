Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF64181F35
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 18:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730573AbgCKRVa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 13:21:30 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35399 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730564AbgCKRV3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 13:21:29 -0400
Received: by mail-pg1-f194.google.com with SMTP id 7so1568090pgr.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EGHWPlxApQjuktMa4xDP9Q063H+hJfu1b6AJ+NVENyk=;
        b=wzs9yWYIHxuZrh+l83G2npKrDy1oqKA1xypVVS2U3HsnbNYgw41X9lhRBnp5I2yzT1
         g5VgsJUrdt4LeNiaK2vJ/mH7MyOeWmpLGprY3DMJa9CbNM0R9zNZPcoJYAiL9T2Rdcj9
         +LcoDzpvuTgfkwpvij9j9ByGn7+WdlzBB7svWaFuqsRzYYOtH7AnAG602VatDxsx6EF9
         594VtuNPghhGM6IC4h6UAS0/ANrg2roTguqX5Lx8EvmYVVJDXFkKA9wFpYUK84uDLvjJ
         Qk+4ms1LaPNgumDoE2yBA9ihADez2A0VyLMvk8/f567jxhIes7jevL9y497QVZCU0BzV
         poOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EGHWPlxApQjuktMa4xDP9Q063H+hJfu1b6AJ+NVENyk=;
        b=PtE8pMdB5zN2oJK+HQaIruzizeQJDA6Pojia6NrVF1zcKsSHJYoslw1deGIho4jrlX
         ktK2euX/pm0U+UOBF6FtW6pBGF9UiIK+A8T/pYeAw60vN8+Oe5DVRe/TBsivxy/Ir56X
         YtnKB43KKW6FjS37sv5N8VvBdxOTeIUtnzpAfDGF64OJY5j/IildiiipHppqq1WzabT9
         d2IkrQseFSZkWgXCLf+CZ+UvGzQbXc1HGKLvWpH1B+0ITxcJwqYP2ogQEfTu6DQKDIja
         YUa6DhMykmTkxm+g7YjAFHKHlinqPG7vyXpqZc48LvLyOcQCxG2cIrvrgio22YiiLMPe
         d0Sg==
X-Gm-Message-State: ANhLgQ0x7MzZVVVS8FWSG7eaOHjury1nTAPSVKB1hHvBEKOAfWfaN2Fz
        CKpEGZvGwKFqsStUvsnjIDUXvw==
X-Google-Smtp-Source: ADFU+vsIQvS6vI9A6/ZJeX7p5NOAE/vGwSitovbBlSU6A/ubzt4w/w/19x/VN1rAPQPkC6KZ7bZHVw==
X-Received: by 2002:a62:382:: with SMTP id 124mr3867452pfd.11.1583947287937;
        Wed, 11 Mar 2020 10:21:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b24sm14914053pfi.52.2020.03.11.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 10:21:27 -0700 (PDT)
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
Subject: [RESEND][PATCH v8 6/6] usb: dwc3: Rework resets initialization to be more flexible
Date:   Wed, 11 Mar 2020 17:21:09 +0000
Message-Id: <20200311172109.45134-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311172109.45134-1-john.stultz@linaro.org>
References: <20200311172109.45134-1-john.stultz@linaro.org>
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

