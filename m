Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 200CD53D4EC
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 04:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350247AbiFDCsZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 22:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350184AbiFDCsY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 22:48:24 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944DA56FA6
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 19:48:23 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4A3B9C06ED;
        Sat,  4 Jun 2022 02:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654310903; bh=+yAZBCZ2Atg2eL0GnW1+jtZa2BPfTK3DmRPZGSGEvXU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=BmNhXcuaRYZyiEBcjUNXWZKHGobTvzxL5+T1kt630WXuTsBUDK7bcS02oy6BNCe4v
         uEqhiarFRBJV7TMGBmnk85HFYaJHBAkxLypqPEgF9ZrtY9QTwfE8ozAd2ivo2yQZi8
         WSbyv+CgArzVEbry8hDfGyIl+ER0yRLrki7KkXsDNqpb1Ku+qVH2s7/ylyjYygUGKH
         4qK/P8O0lAf+jHfgOppZhkKUXf2qoVmFGB+qx3kYSNO0N2+OuD5joOWUn5Hzo4neSt
         rVMyJAJoi7qfpNTNkhnwK5yUiWW/pmfZ3XQDfgJf+K7zmXSeyKdfLFCUCUqZXQpHM4
         bQxLctRgMa9hw==
Received: from te-lab15 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1537FA0085;
        Sat,  4 Jun 2022 02:48:22 +0000 (UTC)
Received: by te-lab15 (sSMTP sendmail emulation); Fri, 03 Jun 2022 19:48:22 -0700
Date:   Fri, 03 Jun 2022 19:48:22 -0700
Message-Id: <c940dbc673f7937453257cf5af961dd73b216ba0.1654310542.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 3/4] usb: dwc3: core: Share global register access with xhci driver
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the dwc3 driver create a xhci platform device and pass its control
to the xhci driver, allow it to also have access to dwc3 global
registers. The xhci-snps needs access to the global register parameters
to handle some quirks.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index e027c0420dc3..b19b7b540182 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1697,7 +1697,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc->xhci_resources[0].start = res->start;
 	dwc->xhci_resources[0].end = dwc->xhci_resources[0].start +
-					DWC3_XHCI_REGS_END;
+					DWC3_GLOBALS_REGS_END;
 	dwc->xhci_resources[0].flags = res->flags;
 	dwc->xhci_resources[0].name = res->name;
 
@@ -1708,7 +1708,7 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc_res = *res;
 	dwc_res.start += DWC3_GLOBALS_REGS_START;
 
-	regs = devm_ioremap_resource(dev, &dwc_res);
+	regs = devm_ioremap(dev, dwc_res.start, resource_size(&dwc_res));
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-- 
2.28.0

