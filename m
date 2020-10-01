Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E77527F6D7
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 02:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732230AbgJAAo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 20:44:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33818 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731339AbgJAAo2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 20:44:28 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 03E24408D3;
        Thu,  1 Oct 2020 00:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601513068; bh=Gp/V/Rxv1oGXxmEF9zjzSd06Qw/fgwbCaO7kJLELq6c=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=d5MFxWpON6xNdhxq/4/26G6B53lsxipAs2pT8pZKyrzVdhhL9+VFr7+jlvZMS5zQ6
         oGXFkZE+vAa7c6a9I4kzC15EUabLnVjLkOeNBKfr8/5UZljr2tSF8jEmtW9D5rUWOO
         Bwykw2WIW3c4JciZmiNjxR3F2SDd1O+Qco64gTkkLGgs0JLiWiozf+5Q1zd+cW+Dmr
         jCwUJWCBTdbL8bxOdQGoRH177nvTtGzZVZE7N4OP+aSYjdjvIFpFWcuGTNrApeWlM2
         vIqgVlLhe9+C0AwM6ydOwFeS2MoW7uLmT/DZyoyz5ayCbqrUswT2rWfk6PEah2hsEH
         LvzwdB+5QGYeA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5BB76A0099;
        Thu,  1 Oct 2020 00:44:26 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 30 Sep 2020 17:44:25 -0700
Date:   Wed, 30 Sep 2020 17:44:25 -0700
Message-Id: <91107f27d4d8bd3514eb2bafb46ac7905e276644.1601511883.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/4] usb: dwc3: gadget: Revise setting IOC when no TRB left
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To keep the setting of interrupt-on-completion (IOC) when out of TRBs
consistent and easier to read, the caller of dwc3_prepare_one_trb()
will determine if the TRB must have IOC bit set. This also reduces the
number of times we need to call dwc3_calc_trbs_left(). Note that we only
care about setting IOC from insufficient number of TRBs for SG and not
linear requests (because we don't need to split linear requests).

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0387b94b8f94..327cd556e8db 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1034,8 +1034,7 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 			trb->ctrl |= DWC3_TRB_CTRL_ISP_IMI;
 	}
 
-	if ((!no_interrupt && !chain) || must_interrupt ||
-			(dwc3_calc_trbs_left(dep) == 1))
+	if ((!no_interrupt && !chain) || must_interrupt)
 		trb->ctrl |= DWC3_TRB_CTRL_IOC;
 
 	if (chain)
@@ -1169,6 +1168,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		length -= sg_dma_len(s);
 
 	for_each_sg(sg, s, remaining, i) {
+		unsigned int num_trbs_left = dwc3_calc_trbs_left(dep);
 		unsigned int trb_length;
 		bool must_interrupt = false;
 		bool last_sg = false;
@@ -1187,7 +1187,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		if ((i == remaining - 1) || !length)
 			last_sg = true;
 
-		if (!dwc3_calc_trbs_left(dep))
+		if (!num_trbs_left)
 			break;
 
 		if (last_sg) {
@@ -1196,12 +1196,13 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		} else {
 			/*
 			 * Look ahead to check if we have enough TRBs for the
-			 * last SG entry. If not, set interrupt on this TRB to
-			 * resume preparing the last SG entry when more TRBs are
+			 * next SG entry. If not, set interrupt on this TRB to
+			 * resume preparing the next SG entry when more TRBs are
 			 * free.
 			 */
-			if (needs_extra_trb && dwc3_calc_trbs_left(dep) <= 2 &&
-					sg_dma_len(sg_next(s)) >= length)
+			if (num_trbs_left == 1 || (needs_extra_trb &&
+					num_trbs_left <= 2 &&
+					sg_dma_len(sg_next(s)) >= length))
 				must_interrupt = true;
 
 			dwc3_prepare_one_trb(dep, req, trb_length, 1, i, false,
@@ -1230,7 +1231,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 			break;
 		}
 
-		if (!dwc3_calc_trbs_left(dep) || must_interrupt)
+		if (must_interrupt)
 			break;
 	}
 
-- 
2.28.0

