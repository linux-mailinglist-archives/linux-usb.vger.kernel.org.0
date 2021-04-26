Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28A536BB01
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 23:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbhDZVJw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 17:09:52 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37078 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238202AbhDZVJY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 17:09:24 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 00B1DC008D;
        Mon, 26 Apr 2021 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619471322; bh=U+KCMWvOYyfvNTcEHKxiR/AcmiwekWT202VPKh7xyaY=;
        h=Date:From:Subject:To:Cc:From;
        b=Ak+CpOeCZWLg0Ejb4jta8RxcsEJc+6dy7ovKXlTAPrmKb8sb8OvB19zS0dQ5/VHjz
         7t1iiw8NiJ5FBcLM2fqoKapESCgVQ+5DbI+0u2yikB8PSEjIdwpwONU8DkKXj53Fp8
         +mCcfYG14I/VMPwAS2Kjz25yaUMDyH9vIcGrr5K3uhNddRck4LJqTcCFhRyCftrONt
         6Xt/JgQuOPMD+lNzGWbL5iA47N1Zn9WGKfRZNgFz9pF7gU0lsybrnOBQMvR342xnzR
         vQ/EUycxsXEWCdhXlr9ZG8k9TGshGI7ossB4NvXHcLow8ey3u6uJ1z/laWzIJhp6Ez
         37gFWAQoHqBDg==
Received: from lab-vbox (unknown [10.205.139.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 86069A0096;
        Mon, 26 Apr 2021 21:08:40 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Mon, 26 Apr 2021 14:08:40 -0700
Date:   Mon, 26 Apr 2021 14:08:40 -0700
Message-Id: <f4c491f7614e623755fafe640b7e690e7c5634e2.1619471127.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: core: Add missing GHWPARAMS9 doc
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add missing documentation for struct dwc3_hwparams new field hwparams9
to avoid kernel doc build warning.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 16710380d3aa ("usb: dwc3: Capture new capability register GHWPARAMS9")
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index b1e875c58f20..3859d8cad3cb 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -850,6 +850,7 @@ struct dwc3_trb {
  * @hwparams6: GHWPARAMS6
  * @hwparams7: GHWPARAMS7
  * @hwparams8: GHWPARAMS8
+ * @hwparams9: GHWPARAMS9
  */
 struct dwc3_hwparams {
 	u32	hwparams0;

base-commit: caa93d9bd2d7ca7ffe5a23df9f003b81721c8e1b
-- 
2.28.0

