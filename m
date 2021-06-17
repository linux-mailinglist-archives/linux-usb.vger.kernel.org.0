Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EE93ABA0B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 18:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhFQQ5i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 12:57:38 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57700 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231184AbhFQQ5i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 12:57:38 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6873C401D4;
        Thu, 17 Jun 2021 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1623948929; bh=UOoyjNGmt7taL4KVKwpW7VAOzg2gwFrwTzuy+ttx6rM=;
        h=Date:From:Subject:To:Cc:From;
        b=WIpZN8jFLYr3ihoWBmzX624uveP1Xw2FRHhvKOdfRUqSUarKcj325zSnu5MR/DJTt
         Tj+E43Na9+3FVnpick2kX/PrfbTh4ran413in5PI0tsFI8NQJ7VC5aD1hTCvfBPg86
         uz3MkwSxV1AoBTx6wANUPDu3oSz+a089sfyt2rKgYTHkK+fpIJkf4X6gcB3u+X61Em
         sdIs+7XCk7Wy4zfljBkXC2T7q9xmt/x5n0u+1ABRG9JBORP9AGBG+UtnPq+yQFni/K
         Jm0UQ34xJx/kbxVhqlcAGc6RRywzIaAaWIfiFMnf+M/ztcEvqF8gGaxy2/4WSsBsmm
         vqfMz86dFS4uw==
Received: from Armenia_lab (armenia_lab.internal.synopsys.com [10.116.75.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 358DAA005D;
        Thu, 17 Jun 2021 16:55:26 +0000 (UTC)
Received: by Armenia_lab (sSMTP sendmail emulation); Thu, 17 Jun 2021 09:55:24 -0700
Date:   Thu, 17 Jun 2021 09:55:24 -0700
Message-Id: <01fafb5b2d8335e98e6eadbac61fc796bdf3ec1a.1623948457.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v2] usb: dwc3: Fix debugfs creation flow
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Peter Chen <peter.chen@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Creation EP's debugfs called earlier than debugfs folder for dwc3
device created. As result EP's debugfs are created in '/sys/kernel/debug'
instead of '/sys/kernel/debug/usb/dwc3.1.auto'.

Moved dwc3_debugfs_init() function call before calling
dwc3_core_init_mode() to allow create dwc3 debugfs parent before
creating EP's debugfs's.

Fixes: 8d396bb0a5b6 ("usb: dwc3: debugfs: Add and remove endpoint dirs
dynamically")
Reviewed-by: Jack Pham <jackp@codeaurora.org>
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 Changes in v2:
 - Changed Fixes: tag.

 drivers/usb/dwc3/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index e0a8e796c158..ba74ad7f6995 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1620,17 +1620,18 @@ static int dwc3_probe(struct platform_device *pdev)
 	}
 
 	dwc3_check_params(dwc);
+	dwc3_debugfs_init(dwc);
 
 	ret = dwc3_core_init_mode(dwc);
 	if (ret)
 		goto err5;
 
-	dwc3_debugfs_init(dwc);
 	pm_runtime_put(dev);
 
 	return 0;
 
 err5:
+	dwc3_debugfs_exit(dwc);
 	dwc3_event_buffers_cleanup(dwc);
 
 	usb_phy_shutdown(dwc->usb2_phy);

base-commit: 1da8116eb0c5dfc05cfb89896239badb18c4daf3
-- 
2.11.0

