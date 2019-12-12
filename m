Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C51E111C281
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 02:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfLLBmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 20:42:53 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43879 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbfLLBmn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 20:42:43 -0500
Received: by mail-pl1-f193.google.com with SMTP id q16so315472plr.10
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 17:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lzv7sY1flH0+P+bTRde+D/HgFmOOUcTmct5WYnIY1iE=;
        b=UZw/F1MlTuPlHpKe4kDgjY8F/v9Xiz+1gFoJAVS8UHhspGP2Fpw30FdQGna543kbZg
         NbdJ1yCDvKj06pyzxBU0LtWEiCOyPP2nEnN5BQp2LQPpQQh1psGtyt854LkbViLnC/lZ
         zz5LUJ5yIGZ2v/n8y29ac7682PdEVLzC0fdyMrtdayTHw7t725nH9/M9yyMuNfvE9asz
         LvvbKS5ncKH2sjpaV1y6oNpbpM55xotDt0IKntm3jKD+mR2Cbrs0sG1O55wRIIcJcdVc
         haJ/fBVgZw5PBDj5189st+r/ZpQMkoJcgE/UEqyhv/NtKX4ai4J9wrizbLIRKyjvs6vz
         8YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lzv7sY1flH0+P+bTRde+D/HgFmOOUcTmct5WYnIY1iE=;
        b=gg5hEpBEsUVWgk7zGyAEUsCV2YOsYgnzw8r7bXr5BZdh8k6Lm18ukWa8XfBbNgkHZ6
         TmQ8AVsbdY0OrHJ1syi36sv/l2BMGuNoLMN6LjC4qqiA8UDQJ422rA1LQ5DBLsM87WlS
         IiGY1lGpZVrAFI1Bqz+BaVHcEZ0b+SRCT0pWp9n9n3Bn3WFK+EzCdGPR9ToBsfsTry+j
         9nRUo0cC0dg00/vws+QMEcxnxCrwPsWWb3FZfMKvi2HyYCvKQwyyRS+PqI80FGmo/ShR
         eCeVWAf1lIwYCqNYiDz19a4T6mYfZPWn1tluGeUMgfFwX2/RsC6jIjKTEpnKZCGTSIEv
         irOg==
X-Gm-Message-State: APjAAAXsJ7F4CULlhST2zQ1Okuf1EkWnRWAJDmPpAzbmw2Mpn9/HAUx/
        1DXyAUYDay42pOJH5tl7cgtM8Q==
X-Google-Smtp-Source: APXvYqz1y2cw7lalEK+SC8etwGXhPJDXQAo5rWmg0AyCI1cAqs37h6s3jVRWoE17CI7K8C0/J8/9lQ==
X-Received: by 2002:a17:902:43:: with SMTP id 61mr6924104pla.88.1576114962763;
        Wed, 11 Dec 2019 17:42:42 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id p16sm4217996pgi.50.2019.12.11.17.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 17:42:42 -0800 (PST)
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
Subject: [PATCH v7 6/8] usb: dwc3: Rework resets initialization to be more flexible
Date:   Thu, 12 Dec 2019 01:42:31 +0000
Message-Id: <20191212014233.32799-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212014233.32799-1-john.stultz@linaro.org>
References: <20191212014233.32799-1-john.stultz@linaro.org>
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

