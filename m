Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2007423062
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 11:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732187AbfETJcV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 05:32:21 -0400
Received: from condef-09.nifty.com ([202.248.20.74]:62514 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730376AbfETJcV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 05:32:21 -0400
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-09.nifty.com with ESMTP id x4K9TgHb020712
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2019 18:29:42 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x4K9T4UJ030614;
        Mon, 20 May 2019 18:29:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x4K9T4UJ030614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558344545;
        bh=7zNhByx278yRPPSei/tiEqUup3t3T64vzIvnm89UL8A=;
        h=From:To:Cc:Subject:Date:From;
        b=w2SjOATdXkW9Tf4JJCsQMIRmdAeKSbp4HXC08a/3RWMYotNOM4k5quOwB52AUKAkd
         W8h4pFo/7KHAR9mE0qNQhVu79YDzV0wIdr62Z+kqv3FaA8x1Oz5e66PRiWPqN+u5pT
         TaTkfIGdtQY/C/9jCaA71In1oO3vGZy6gkWIRT4wuyS43R/1hLHXJruHUQXkptCCMu
         DjNXOi1Nbhr3LXaYt0SGjSn6iUf22Pg6EXy1o190unxDgHcLUlQgME6j9BrBOgV0V4
         CbDshgde9vjjfZy1BgCKZHv38R8FpGst3YwzUBZsNm0RvVaE9u6G6O1UvF3cD/ob1h
         cnO/Cg8ISAz7g==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: move core validatation after clock enable and reset deassert
Date:   Mon, 20 May 2019 18:28:56 +0900
Message-Id: <20190520092856.26307-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit b873e2d0ea1e ("usb: dwc3: Do core validation early on
probe"), the DWC3 USB3 does not work for Socionext UniPhier platform.

It moved dwc3_core_is_valid() really early, where no clock is enabled,
no reset is deasserted. Any attempt to register access causes the
system stall on my platform.

Move it after clk_bulk_enable(), and still before dwc3_get_dr_mode().

Fixes: b873e2d0ea1e ("usb: dwc3: Do core validation early on probe")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/usb/dwc3/core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 4aff1d8dbc4f..93b96e6abddb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1423,11 +1423,6 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc->regs	= regs;
 	dwc->regs_size	= resource_size(&dwc_res);
 
-	if (!dwc3_core_is_valid(dwc)) {
-		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
-		return -ENODEV;
-	}
-
 	dwc3_get_properties(dwc);
 
 	dwc->reset = devm_reset_control_get_optional_shared(dev, NULL);
@@ -1460,6 +1455,12 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (ret)
 		goto unprepare_clks;
 
+	if (!dwc3_core_is_valid(dwc)) {
+		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
+		ret = -ENODEV;
+		goto disable_clks;
+	}
+
 	platform_set_drvdata(pdev, dwc);
 	dwc3_cache_hwparams(dwc);
 
@@ -1524,7 +1525,7 @@ static int dwc3_probe(struct platform_device *pdev)
 err1:
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
+disable_clks:
 	clk_bulk_disable(dwc->num_clks, dwc->clks);
 unprepare_clks:
 	clk_bulk_unprepare(dwc->num_clks, dwc->clks);
-- 
2.17.1

