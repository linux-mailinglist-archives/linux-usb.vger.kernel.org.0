Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7190E2800
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 04:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436769AbfJXCPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 22:15:51 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:42370 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436605AbfJXCPu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 22:15:50 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A2F0AC0B5E;
        Thu, 24 Oct 2019 02:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571883350; bh=7xLxcdEgHbiLNDQ1pFvSRTSIsYs+h4+L9ave6PTVtXg=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Lxxsf6iXmQPbtRU3Mbi6UI3GYreTDWlHc8NkEY6MDHj3hoT/EJjEoNX+AtfoJGZrg
         hPdN6wX0cBaCOey5WE22U0jSQ4iUDLSTa5SgzevOmcJojXAyTnQRZ3oiaD4X6EMElR
         uve1EZ1jAtui7nyCXPk0xfcmftPV1+VaUyCR+3oWdFnhW3BGvS7IW4jtTDsCk/iEHr
         Fb7BYXqkEdu9++sFad2X1VWggUp0PIwDthyhThgP1/jl5s7fil6filS5oLiVMMSZof
         Y4OfeujZlw2HzSYtGPMwgUvLTjYqRJNLoM7TOAJ0ILsNsawLubFGB+s3y4M43L1ULm
         w5F+r/TCoE37g==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8B9CBA0064;
        Thu, 24 Oct 2019 02:15:49 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 23 Oct 2019 19:15:49 -0700
Date:   Wed, 23 Oct 2019 19:15:49 -0700
Message-Id: <d759de030cb07b5c0ec41f034972eae5dea8a838.1571882179.git.thinhn@synopsys.com>
In-Reply-To: <cover.1571882179.git.thinhn@synopsys.com>
References: <cover.1571882179.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 2/4] usb: dwc3: gadget: Set link state to RX_Detect on disconnect
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When DWC3 receives disconnect event, it needs to set the link state to
RX_Detect.

DWC_usb3 3.30a programming guide 4.1.7

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 85adc718808a..5856c8c96418 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2743,6 +2743,8 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
 {
 	int			reg;
 
+	dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RX_DET);
+
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_INITU1ENA;
 	reg &= ~DWC3_DCTL_INITU2ENA;
-- 
2.11.0

