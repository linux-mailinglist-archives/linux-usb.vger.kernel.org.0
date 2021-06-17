Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F433AAB76
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 07:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhFQF6P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 01:58:15 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47320 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhFQF6P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 01:58:15 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E2772C00E8;
        Thu, 17 Jun 2021 05:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1623909368; bh=7bKsjT/AWo/gLZNp/xg6H/v0/gJyh6RRBhzTuZih4+0=;
        h=Date:From:Subject:To:Cc:From;
        b=XaFesktEGO+dWMRWdoRJBBmuOHoPMsy8hnue7H1+3EKX5i6GhfSSp94oLR/O6mqGZ
         SxDVIhtkb1EvPTL/PhL1dbuhgD79zwL3/aasSZelBcKqCPDY+M2zCQ61xQmL7ucEtk
         IXCU3oNFHwIk7R6Dc6O0MLqZyr72gi2dex+HYphb4yfXvz/cwhxeQukNiANC8rcTev
         SsgPmu/8/3INqWX6eFTm+V1j+DaPEqy9d4DBzf8kOuG6fk++natS76LNqkyrfRSrJg
         oONK2BFeyhWTYjDOJKgu1b/9GLTm+lnqfjIO37Nxxh+k88opPUQA09FwLglnThwTMM
         EMOd1tBVO8HXA==
Received: from Armenia_lab (armenia_lab.internal.synopsys.com [10.116.75.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 09CCEA0060;
        Thu, 17 Jun 2021 05:56:03 +0000 (UTC)
Received: by Armenia_lab (sSMTP sendmail emulation); Wed, 16 Jun 2021 22:56:02 -0700
Date:   Wed, 16 Jun 2021 22:56:02 -0700
Message-Id: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc3: Fix debugfs creation flow
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

Fixes: 8562d5bfc0fc ("USB: dwc3: remove debugfs root dentry storage")
Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
---
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

