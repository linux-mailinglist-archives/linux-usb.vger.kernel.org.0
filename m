Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C115A462ABC
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 03:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbhK3C4c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 21:56:32 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53344 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231958AbhK3C4b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Nov 2021 21:56:31 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 21116C16A2;
        Tue, 30 Nov 2021 02:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638240792; bh=wiEtpY1EOGrwsSJf9ytfWCxgx3TNckIpR3KfWxKjq2c=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=S7xhHH1uj55S1Ayx261tofE5T3+L3MwiQhIBFaH9j0fH6G0xkikU3JRr4DkOWc9zE
         bb5hKAobOeND3fa054APnaeTLPoKjzPU8OkrZ1Vs2bWnG0IiOnBFOkZOM6DkG53rD8
         gZagdW3KiVbRzOAAWE7g4Eu1WIBxmrZvVOB9EO0fUyKW3kWKUkyX2wRfzrAIMYdkSv
         YjAp0ywGXXiJttgtZ0T2HfRiY6gs6QEOknW69zIlV5SpTVK+liceW2a3UNMyxgbDYx
         0T3J5Pc7PsPPFJ4XrigDw/ifCfNF/CG3Vkofdf3lJRLNviKPWRxMHd4p1uF6jAdO8V
         gbTfMdSGy8bEg==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 46B6EA005F;
        Tue, 30 Nov 2021 02:53:09 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Mon, 29 Nov 2021 18:53:09 -0800
Date:   Mon, 29 Nov 2021 18:53:09 -0800
Message-Id: <3dc31cf11581ae3ee82d9202dda3fc17d897d786.1638240306.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1638240306.git.Thinh.Nguyen@synopsys.com>
References: <cover.1638240306.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/3] usb: dwc3: gadget: Skip checking Update Transfer status
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If we're not setting CMDACT (from "No Response" Update Transfer
command), then there's no point in checking for the command status. So
skip it. This can reduce a register read delay and improve performance.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 7e3db00e9759..00b3f19c4d3e 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -357,6 +357,12 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		cmd |= DWC3_DEPCMD_CMDACT;
 
 	dwc3_writel(dep->regs, DWC3_DEPCMD, cmd);
+
+	if (!(cmd & DWC3_DEPCMD_CMDACT)) {
+		ret = 0;
+		goto skip_status;
+	}
+
 	do {
 		reg = dwc3_readl(dep->regs, DWC3_DEPCMD);
 		if (!(reg & DWC3_DEPCMD_CMDACT)) {
@@ -398,6 +404,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		cmd_status = -ETIMEDOUT;
 	}
 
+skip_status:
 	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
 
 	if (DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_STARTTRANSFER) {
-- 
2.28.0

