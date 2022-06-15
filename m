Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD2A754BF12
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 03:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbiFOBHf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 21:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbiFOBHd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 21:07:33 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DE1B74
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 18:07:29 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3CB6CC0C91;
        Wed, 15 Jun 2022 01:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1655255248; bh=yCqhcatvyY2BgD4xMO8FRNplailMIXhWJRCZ/p2lFRM=;
        h=Date:From:Subject:To:Cc:From;
        b=M+uvGAOFL9hKUTW5E8VLjzlwBcTPUB7eiuQwJjNJH6y9MKrH2q5Fpyuklb8oZGJ7D
         qidh0x2Ia2xkPdnf4UKQNz8CO8Lsp/ij32COMSkqY/M+DqgURqVsl8W3kkItLjI3Il
         6E4JfGBwPnZ9ivRjyaoL3eWgW9+Ri6X+p6has4y971HC28Jjke35QjZfVseOS9q8JX
         eBshjRZZD1I3W6H5vCz0KBWak7nE3RHC6v90MbV/XGQuLJQsdPMSiwjqioKn5T/3rx
         gTy9fX3W4LA8Ev/pgOwKu5QFeChgN9Kc14mB/cbxeM0ZwZfqqR/7PDAoupt8q/A5mf
         ys5W5AxjbC9kw==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 24EA9A00A3;
        Wed, 15 Jun 2022 01:07:25 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Tue, 14 Jun 2022 18:07:25 -0700
Date:   Tue, 14 Jun 2022 18:07:25 -0700
Message-Id: <eb1df7ef954b5af093c0528982db52a41df18615.1655255152.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] Revert "usb: dwc3: Remove the checks of -ENOSYS"
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kushagra Verma <kushagra765@outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit df22ecc41b54def624735b83784857e708bd1502.

If CONFIG_GENERIC_PHY is not enabled, then the devm_phy_get() returns
-ENOSYS. Don't remove this check.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 2c12bbbcd55c..00548712db00 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1318,7 +1318,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 	dwc->usb2_generic_phy = devm_phy_get(dev, "usb2-phy");
 	if (IS_ERR(dwc->usb2_generic_phy)) {
 		ret = PTR_ERR(dwc->usb2_generic_phy);
-		if (ret == -ENODEV)
+		if (ret == -ENOSYS || ret == -ENODEV)
 			dwc->usb2_generic_phy = NULL;
 		else
 			return dev_err_probe(dev, ret, "no usb2 phy configured\n");
@@ -1327,7 +1327,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 	dwc->usb3_generic_phy = devm_phy_get(dev, "usb3-phy");
 	if (IS_ERR(dwc->usb3_generic_phy)) {
 		ret = PTR_ERR(dwc->usb3_generic_phy);
-		if (ret == -ENODEV)
+		if (ret == -ENOSYS || ret == -ENODEV)
 			dwc->usb3_generic_phy = NULL;
 		else
 			return dev_err_probe(dev, ret, "no usb3 phy configured\n");

base-commit: 235a6d80f021d9c3bb5652fb6b19d092a7339248
-- 
2.28.0

