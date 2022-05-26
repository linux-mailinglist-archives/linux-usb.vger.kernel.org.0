Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2004E5353BF
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 21:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348687AbiEZTFK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 15:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348717AbiEZTFC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 15:05:02 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A062DC8BD4
        for <linux-usb@vger.kernel.org>; Thu, 26 May 2022 12:05:01 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0A18A45FA9;
        Thu, 26 May 2022 19:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1653591901; bh=v+YkVDfunt7RcG5sGE6CyLCOk5R4jNbBcPj4YuV9JKA=;
        h=Date:From:Subject:To:Cc:From;
        b=dX7GOMV2BYYGD3JuJSj2L9HZnD8Z98kagUKg6g8ePlGyZdG13wfdvljyqKABvKMZP
         nqNAWWPXFssY3CDjKy0Q9X7yy2Jki1OcWZ/Edcx79AX9rX0xgpjkcDdqXg3WCN+g+S
         7a1HqhLzsoyE+iG7FuMwfKjFfe2A6c1ebXxxH26WTme5YcN0hw6QklA8fFSGY7FoT2
         eiVibvV4m5IQAmBHznR87Hb46wq7kk90EeSufSS/pU5w3SDCV324eMDlyBqT81NiWr
         FrgR1xRi6IJvP7V4zNH9C+pa1kFrS4UmrAkpkQc82Ip0A5FUCafSeMFd6OvZ/aVqjO
         8KUGUUd+fGIFw==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 253AAA0274;
        Thu, 26 May 2022 19:04:58 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Thu, 26 May 2022 12:04:58 -0700
Date:   Thu, 26 May 2022 12:04:58 -0700
Message-Id: <54b6e2974bccacbd644f9ba75d8929d09848ecc4.1653586398.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
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
 drivers/usb/dwc3/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index e027c0420dc3..6b5f6d0eb1dd 100644
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

base-commit: 97fa5887cf283bb75ffff5f6b2c0e71794c02400
-- 
2.28.0

