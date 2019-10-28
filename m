Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB7B4E7C05
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 23:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733172AbfJ1V7v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 17:59:51 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34474 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390333AbfJ1V7b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 17:59:31 -0400
Received: by mail-pg1-f196.google.com with SMTP id e4so3609980pgs.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7OkAbKqeK5UAQaAqjCwbs8uW675j/BSDdsRWiE3W8aU=;
        b=Ai1HB2gk9lrqHztEC4ZHzPtyWt6AhILNoXDJsOU4uocb3Mo/r7ybCc2lWBLviVG2N4
         2WfVuv1aWQtHng83gZz0etX1FhVI9HBvVDGvYj4oHX7GLNHq6c7IqOVFfFmlsEJ3u6V2
         01kHeUfxJOkJsRUMTL7H/2IMUmPIRLQyYYkYzgYMM7GYjCFqWaEsAfxq9yg2r0HLw5gx
         d+dlFHHWxtXtR7TBChXd90oVqVYIHxOgcRJyOiw3zfcoappJREjdXKXhbPPe700BWOHl
         vKLkbx8vDz8s5mBsPYA/b56+OkDHPAHSKuWohftBaNZf+cnRCSNHOkBwDpEWHEe2MWd3
         zEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7OkAbKqeK5UAQaAqjCwbs8uW675j/BSDdsRWiE3W8aU=;
        b=qS7WaPYCcqQJ7LroNe4iN3SSu3VSzWE/IW4pLzjXY5kkfVS4YBH4Q+ORhtUKHDfgzi
         t1JqEnPiJarhxwFVwoBzS5d/bZkAHfw6hJHwyQaEi+LWbZG16xO/ax4uO5QXawbLXxGE
         ZvAbH70wp+aMFshkjpyxtW1WRizNiJu28vnS+B9bDh/KLpC2YHvdB1reXgFy9qiWgI3t
         sKYa87JVdImuSWYuhg6Ra9UN0i3AMzgetxVO0L3A1rVKqOG/wEDd3YnL/wSNBDR+duNo
         k8o6IyUuxfNmCBbKb592ul8CjyDWqHNKlsLVT/xaiNmg5DSAuYrd/3+cvnEEYO40+lDm
         hCOw==
X-Gm-Message-State: APjAAAWpNsJO5iRvWJuCrAGw/Uj1dexRYLw9IzrGx1WfbOwuYEngA5Y6
        zpeZkNpi8RKTBlfcSvxGmHGCGw==
X-Google-Smtp-Source: APXvYqxHxifqq5Xfv4B4vIzQhfZKh/YWkRZppo1k5WzU2a3NOH7qey4U6MAmtNictRTF7mgCEmNVYg==
X-Received: by 2002:a17:90a:a406:: with SMTP id y6mr1962404pjp.106.1572299970594;
        Mon, 28 Oct 2019 14:59:30 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net. [67.170.172.113])
        by smtp.gmail.com with ESMTPSA id f12sm10880612pfn.152.2019.10.28.14.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:59:30 -0700 (PDT)
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
Subject: [PATCH v4 6/9] usb: dwc3: Rework resets initialization to be more flexible
Date:   Mon, 28 Oct 2019 21:59:16 +0000
Message-Id: <20191028215919.83697-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028215919.83697-1-john.stultz@linaro.org>
References: <20191028215919.83697-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3 core binding specifies one reset.

However some variants of the hardware my not have more.

So this patch reworks the reading of the resets to fetch all the
resets specified in the dts together.

This patch was reccomended by Rob Herring <robh@kernel.org>
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
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Rework dwc3 core rather then adding another dwc-of-simple
    binding.
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 4d4f1836b62c..ef52ffa5d6cb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1442,7 +1442,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc3_get_properties(dwc);
 
-	dwc->reset = devm_reset_control_get_optional_shared(dev, NULL);
+	dwc->reset = devm_reset_control_array_get(dev, true, true);
 	if (IS_ERR(dwc->reset))
 		return PTR_ERR(dwc->reset);
 
-- 
2.17.1

