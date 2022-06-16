Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D6254D60A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 02:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241049AbiFPAYh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 20:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239840AbiFPAYg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 20:24:36 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEC61F2E7
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 17:24:35 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BD2464647F;
        Thu, 16 Jun 2022 00:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1655339075; bh=BSpn4PGataqPLRQKGZ00towh1mtTIIISAiSsRGDdt8s=;
        h=Date:From:Subject:To:Cc:From;
        b=eQOxndGrsrs5dg7fO1VCcOez1xfKB8FFXxw41Q9Pr+qQ7g9L6BbQxTUbWG63fpH3O
         qdXy5raRm5lf5F2Q8w01T5SserlVcREo6oAb0rUP8xrVUod3N849jQ6StktAKRCVHf
         B5Bm0Ory0163mPq3Yz13BCe1HHc//hFXmOvL3iq5Hs0zuFP70OQ5KjAatC9Ej4mKGN
         hta5vLrS+p+QneWN7wCJd1g4c2YSfY4ENgCmxgdo7GeTjYpWCTpjK6dllF1J6EM7aS
         +iv+rIB2jN4ioaRDH0bvyKOVTQyiqn+hHjGa7JX69joa4JMNcYudFKXbYWMIN+tb21
         MrDXFT1Ye3ODg==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 0E628A006B;
        Thu, 16 Jun 2022 00:24:32 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Wed, 15 Jun 2022 17:24:32 -0700
Date:   Wed, 15 Jun 2022 17:24:32 -0700
Message-Id: <9df529fde6e55f5508321b6bc26e92848044ef2b.1655338967.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2] usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
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

Synopsys IP DWC_usb32 and DWC_usb31 version 1.90a and above deprecated
GCTL.CORESOFTRESET. The DRD mode switching flow is updated to remove the
GCTL soft reset. Add version checks to prevent using deprecated setting
in mode switching flow.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - Rebase on Greg's usb-testing branch.

 drivers/usb/dwc3/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 2c12bbbcd55c..91278d2a72b8 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -159,7 +159,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 	}
 
 	/* For DRD host or device mode only */
-	if (dwc->desired_dr_role != DWC3_GCTL_PRTCAP_OTG) {
+	if ((DWC3_IP_IS(DWC3) || DWC3_VER_IS_PRIOR(DWC31, 190A)) &&
+	    dwc->desired_dr_role != DWC3_GCTL_PRTCAP_OTG) {
 		reg = dwc3_readl(dwc->regs, DWC3_GCTL);
 		reg |= DWC3_GCTL_CORESOFTRESET;
 		dwc3_writel(dwc->regs, DWC3_GCTL, reg);

base-commit: 235a6d80f021d9c3bb5652fb6b19d092a7339248
-- 
2.28.0

