Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CFA27BDDB
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 09:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbgI2HS4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 03:18:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47910 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbgI2HS4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 03:18:56 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E1AFC0091;
        Tue, 29 Sep 2020 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601363936; bh=d3jsaILXM28G6lNAkdW3G+7HEG2x9rrDv827C+l643I=;
        h=Date:From:Subject:To:Cc:From;
        b=Xt7ckLsSddLep0O6xUr5pr7qiK9a/VkJWOUrF12T6nTQPCNcq6kD+/KCKjY7mTrkr
         +fHdKXiG83VwocrJeHU6iaEnHDrrzfht6KB3LG3zWokRJ/HfCTuehWSOedniqmM1cw
         L/kLleJmxm1yZCf7YqTuv1SD+D2o86nl+SmvwXB2lhteJvsCxLMcYnH8pGGkyAcLce
         JBunktDqKAVzVxgllOMkkffLUhY5p0Jzj6edLSfpLpcfhS4J1F8oD9yTHG2ZsD07tb
         c6larlRrlAxp2TkuqrKCwwE339eEnb6U/pNgLIUyVcQZHWamb/7UpfqXxC8WNtm3Am
         WKQVc0fyGTGTg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id BA848A01F1;
        Tue, 29 Sep 2020 07:18:53 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 29 Sep 2020 00:18:48 -0700
Date:   Tue, 29 Sep 2020 00:18:48 -0700
Message-Id: <a8f3290b7423ffcfeff00bd581e46f1b4e73ce92.1601363764.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2] usb: dwc3: gadget: Allow restarting a transfer
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's possible that there's no new TRBs prepared when kicking a transfer.
This happens when we need to stop and restart a transfer such as in the
case of reinitiating a stream or retrying isoc transfer. For streams,
sometime host may reject a stream and the device may need to reinitiate
that stream by stopping and restarting a transfer. In this case, all the
TRBs may have already been prepared. Allow the function
__dwc3_gadget_kick_transfer() to go through even though there's no new
TRB.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v2:
- Add a note inline
- Revise commit message

 drivers/usb/dwc3/gadget.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 359824c871cd..76c383eecfd3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1326,8 +1326,13 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 	int				ret;
 	u32				cmd;
 
+	/*
+	 * Note that it's normal to have no new TRBs prepared (i.e. ret == 0).
+	 * This happens when we need to stop and restart a transfer such as in
+	 * the case of reinitiating a stream or retrying an isoc transfer.
+	 */
 	ret = dwc3_prepare_trbs(dep);
-	if (ret <= 0)
+	if (ret < 0)
 		return ret;
 
 	starting = !(dep->flags & DWC3_EP_TRANSFER_STARTED);

base-commit: 9c732b42aa881424b2b918e0f08f1c6f017061d3
-- 
2.28.0

