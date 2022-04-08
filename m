Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56AE4F9D27
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 20:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiDHSq5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 14:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238986AbiDHSqg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 14:46:36 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DCD1D59D2
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 11:44:04 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id x16so9066493pfa.10
        for <linux-usb@vger.kernel.org>; Fri, 08 Apr 2022 11:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bnZPItrf/OuYXtsSpA6GbFrZ9ruz5AGfVA3JhHbTYg=;
        b=PP6PYy7y7MFUeH857olAI/cYmO3NiifPtKjjkkECaRFx7D3/0FXZPooBLilzlJHeG3
         axfuukjVUfOTFbexucHgTpc5tBTdbVWmgunrizZcNj4gAT2SAztSVzPjIIFmkcMkLWEc
         ixtkGJmFWmb4lI2sMZKG5savEb98lmH/BLzDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bnZPItrf/OuYXtsSpA6GbFrZ9ruz5AGfVA3JhHbTYg=;
        b=vG7V7dKRolKcQPFTlyAAyZUDPaydIZvno6QVERbya5synJ4DTphijfHJL+w7eb4kgI
         dWDKyA4Lcf86QrqkhQ2dX3ddrEVH3CTQMrYO9bDz9WvtGhxNOC/T9Ro3eewipFAxNHrO
         M1ndprLk6WFRbRYlGp8e6IQoLMXVZPzvqU3J/CM+08f5TLpg7PmbzDDs8vpJmzR9ygAR
         sQJuTvWju2MrMU3ruef7anrVPufI4nXud6z3S0vXN58h0RVakUUL7kFdlezl6dbShbBa
         zZ2vdzS4PmoQYyc8i/eBtiC/5+i2IVyTJExi2rpJgjDgnUArSr7yzN5aI9sEwMu+V+t3
         IaRw==
X-Gm-Message-State: AOAM532iDK3OKq47F/3bBiQhXqr268bB7FAZuyEJx8Kpwj9YxMRCodwV
        AwStKkAZblZ1r1Zw+eyc76G0gw==
X-Google-Smtp-Source: ABdhPJzFkSSvLnmJ6PzGHU7tPTd1JjbOIusNY69XQd1OyZCCzYlZpEH5H+mbOPxzcPk0K+M4puupqA==
X-Received: by 2002:a63:2f03:0:b0:398:b2fc:250c with SMTP id v3-20020a632f03000000b00398b2fc250cmr16464042pgv.75.1649443388591;
        Fri, 08 Apr 2022 11:43:08 -0700 (PDT)
Received: from evgreen-glaptop.lan ([98.47.98.87])
        by smtp.gmail.com with ESMTPSA id w129-20020a628287000000b004fdc453b49asm26882487pfd.39.2022.04.08.11.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 11:43:08 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rajat Jain <rajatja@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Evan Green <evgreen@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] xhci: Enable runtime PM on second Alderlake controller
Date:   Fri,  8 Apr 2022 11:42:50 -0700
Message-Id: <20220408114225.1.Ibcff6b86ed4eacfe4c4bc89c90e18416f3900a3e@changeid>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alderlake has two XHCI controllers with PCI IDs 0x461e and 0x51ed. We
had previously added the quirk to default enable runtime PM for 0x461e,
now add it for 0x51ed as well.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Someone at Intel can correct me on the proper name for this define.
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5c351970cdf1ce..d7e0e6ebf0800e 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -59,6 +59,7 @@
 #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
 #define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_XHCI		0x461e
+#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI	0x51ed
 
 #define PCI_DEVICE_ID_AMD_RENOIR_XHCI			0x1639
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
@@ -266,7 +267,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_XHCI))
+	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI))
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
-- 
2.31.0

