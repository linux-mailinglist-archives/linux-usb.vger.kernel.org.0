Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC994211F66
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 11:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgGBJFk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 05:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgGBJFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 05:05:40 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FC4C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 02:05:40 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id j4so11069389plk.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TZbrN1QKRJsubIaR01sjzTzcxQbWVstB3/I4RCr7c5k=;
        b=cCSDX1z1wpYxMxQl4PyU/Q9CcB9TMy5de6pzAZlU0xhDGa7sD0BZNA48AhZ2Bifveu
         7syUXReRqPxPkeIPXhK1JeutazwVnjHms6IvRgwmDcNPAP4a874ph5QaU5Yug983KvlZ
         9yT5VTbnnUBsB/7XK2ZLK5QA+wPQrCysnQgf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TZbrN1QKRJsubIaR01sjzTzcxQbWVstB3/I4RCr7c5k=;
        b=lgsX/3sw6AYjMBNl6cwkbxhv39+0L/qt6aVB9k+Uy4gj1GuitLOxlFYjK/eGQBg/xX
         QDHdvC+vFHGzIHI+ATBXtEZcFduYRR1Pl7R0Aee+9G3/KhXxJoJxNSqgNBkrwYtr9Kjz
         LDR+plZJ4kiw04NN2VoQEcFPySC0ZHnzu+2qHJMUOQfq8VjjXc6ayEuUYNG/4uMFfXmH
         FY1gWt2K6T6LvhDCU4Z7B+ehTfcTFF0PwDieMxdvLviqPWngKI7MLhnNRAFQUse2G8iS
         VJBp/2Kaz0wFG+AH3SWiGBX6K0MQfx48N3xOlJ9e9n+3Wfqsp9ot+vNT52EBtQSDO3V7
         yoow==
X-Gm-Message-State: AOAM530wINKOCQHEqlYsXpuRsyK5glYaMpeI/cNi4JLUEnHa8F+BM7Ov
        8OdGhjV4XSfV8SKu+a7BZy3VKg==
X-Google-Smtp-Source: ABdhPJy1aBjYx68MVNif/BfPYEJqibBDaNhVhiyYG249qupxIbKkH1jcmFMuIABnhnoOLkSF/Jl9oA==
X-Received: by 2002:a17:902:c206:: with SMTP id 6mr12167247pll.268.1593680739615;
        Thu, 02 Jul 2020 02:05:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:a961:9b2e:1b93:8ca7])
        by smtp.gmail.com with ESMTPSA id n19sm8308691pgb.0.2020.07.02.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 02:05:38 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        mylene.josserand@collabora.com
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        William Wu <william.wu@rock-chips.com>
Subject: [PATCH] usb: host: ohci-platform: Disable ohci for rk3288
Date:   Thu,  2 Jul 2020 14:35:04 +0530
Message-Id: <20200702090504.36670-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

rk3288 has usb host0 ohci controller but doesn't actually work 
on real hardware but it works with new revision chip rk3288w.

So, disable ohci for rk3288.

For rk3288w chips the compatible update code is handled by bootloader.

Cc: William Wu <william.wu@rock-chips.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Note:
- U-Boot patch for compatible update
https://patchwork.ozlabs.org/project/uboot/patch/20200702084820.35942-1-jagan@amarulasolutions.com/

 drivers/usb/host/ohci-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 7addfc2cbadc..24655ed6a7e0 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -96,7 +96,7 @@ static int ohci_platform_probe(struct platform_device *dev)
 	struct ohci_hcd *ohci;
 	int err, irq, clk = 0;
 
-	if (usb_disabled())
+	if (usb_disabled() || of_machine_is_compatible("rockchip,rk3288"))
 		return -ENODEV;
 
 	/*
-- 
2.25.1

