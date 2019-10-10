Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC15D221C
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 09:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733093AbfJJHuP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 03:50:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:47031 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfJJHuO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 03:50:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so3328991pfg.13
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BMwVxKJ5pjT6AAme6CzPathy+GO4sDWlKBre4oI24yA=;
        b=RFG6HwCYSDramAhQi1uVRJXiRCVoJbWbPFfqpgOBrr+ONoYndjuqcaaKVXq5mGam8b
         NZtTefp9ssgMDcOeS44tvnd/S01DBUC/puqu1Pc1WrhMLPuHRw/wlomndD3BsbpSaPGb
         gHUbAX/+u3EKiwTIyQl/RS16LhLTepVBNK6XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BMwVxKJ5pjT6AAme6CzPathy+GO4sDWlKBre4oI24yA=;
        b=YNDqX3HFuAMXIQW4mtd+unyxCUFOScd+Pyok9TH+6jcqMSW/qTW793q9GEhnaVRIVb
         DH/cFzyvcNmqraIE+oKzjpLhaNWNfEWex5QDp2l05FdV5bmojs0LQrhdam+ngvjFeGBr
         X+qJRPB528X5BLd1CrIrrWnGF7a2/CUD4e27bw/eHITqPuWSjeZcJElSS993y/vUvwuS
         9rgz2NyOlA9Qsx+6fzetecUEFh2RkKMxjYo11N9QdhLKQ8mANlqbR1kTT1kuCVVYmCJj
         HMS785OoaPrhspV8M/SpdVzlFvqNFpmt94zrxFn75ak8HLS+IFfE0zlggLJAh4OKfp7P
         SeEw==
X-Gm-Message-State: APjAAAVqcK2UuYraYxKIAxSRDFg5t0XzY0KHgwfrsdRE6iKRuCv2Z63C
        gmk7nSIN9LnH3tdz5Zz+F6ZNt+EsLQl46Q==
X-Google-Smtp-Source: APXvYqyImi2kgnGChUg2KfgfL+4s6k7vSPd2oI6xHbrOyAm/ZcqmRMonHqTVcAChWDBQgIDHwV/S+w==
X-Received: by 2002:a63:4e09:: with SMTP id c9mr9163082pgb.98.1570693812256;
        Thu, 10 Oct 2019 00:50:12 -0700 (PDT)
Received: from tfiga.tok.corp.google.com ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
        by smtp.gmail.com with ESMTPSA id 22sm4812489pfj.139.2019.10.10.00.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 00:50:11 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list),
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Changqi Hu <Changqi.Hu@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Shik Chen <shik@chromium.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
Date:   Thu, 10 Oct 2019 16:50:04 +0900
Message-Id: <20191010075004.192818-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

MediaTek XHCI host controller does not support 64-bit addressing despite
the AC64 bit of HCCPARAMS1 register being set. The platform-specific
glue sets the DMA mask to 32 bits on its own, but it has no effect,
because xhci_gen_setup() overrides it according to hardware
capabilities.

Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
32-bit DMA mask instead.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/usb/host/xhci-mtk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index b18a6baef204a..4d101d52cc11b 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 	if (mtk->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
+	/*
+	 * MTK host controller does not support 64-bit addressing, despite
+	 * having the AC64 bit of the HCCPARAMS1 register set.
+	 */
+	xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
 }
 
 /* called during probe() after chip reset completes */
@@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
-	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
-	if (ret)
-		goto disable_clk;
-
 	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd) {
 		ret = -ENOMEM;
-- 
2.23.0.581.g78d2f28ef7-goog

