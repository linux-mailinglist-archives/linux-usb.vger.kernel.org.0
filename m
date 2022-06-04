Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE53453D4EB
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 04:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350236AbiFDCsT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 22:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbiFDCsR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 22:48:17 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5036F56FBB
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 19:48:17 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 18D514023B;
        Sat,  4 Jun 2022 02:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654310897; bh=4SShO/Lse3K6Iqf6rRt5m2mof0bGN092KpISmP3UyhE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GHUM1qxrUUQVbwC/s7mM9Buaa8u8f+cSoGvK+rmOppG5+AcU4DNftbPa8FRnhN93I
         qDWmtkOHyPew07g+1AoaGScyXOsVte7LxC/uwWuj9r5aj1RAnuCK1/4jhC3TRsR3wc
         b4+l7Oy6t7/axviI4ZeVbrruArhHIBHA1X/nGOEHAWgodwV9d6lFzP+2wCuuJKzkPW
         igNFHwh9kr6QWLBmrK70DWER82Rc1Dj3okXp+oR2a4svTX2vs+MSf2YqKuH389XH6w
         pxPY7y1Mj/lNR2T7D9S42wXc3grCzt/Zbt57m+M8m+MnuYaua0J2sJ9JcpGTUgLXB/
         njWb1pMn5keRQ==
Received: from te-lab15 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id F1468A008D;
        Sat,  4 Jun 2022 02:48:15 +0000 (UTC)
Received: by te-lab15 (sSMTP sendmail emulation); Fri, 03 Jun 2022 19:48:15 -0700
Date:   Fri, 03 Jun 2022 19:48:15 -0700
Message-Id: <3980819b8b7ca377896e0e3de93862f3057694e9.1654310542.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 2/4] usb: dwc3: host: Always set xhci-snps-quirks
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Always enable xhci-snps-quirks to use xhci-snps glue extension. The
xhci-snps extension can fine tune xhci driver to better handle Synopsys
DWC_usb3x IPs.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index f56c30cf151e..ce359862f9aa 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -66,7 +66,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[4];
+	struct property_entry	props[5];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -94,6 +94,8 @@ int dwc3_host_init(struct dwc3 *dwc)
 
 	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
 
+	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-snps-quirks");
+
 	if (dwc->usb3_lpm_capable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb3-lpm-capable");
 
-- 
2.28.0

