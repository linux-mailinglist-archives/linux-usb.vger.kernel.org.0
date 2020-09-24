Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53535276BB1
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 10:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbgIXIWD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 04:22:03 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40390 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727279AbgIXIWD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:22:03 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0106B402F6;
        Thu, 24 Sep 2020 08:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600935723; bh=0GekWrqSOZaGKm3e1vDH+zdSTIClRyA8pjVIm08Ryfk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=gvb/XJlSwdnsl+vlUomHuVIx+RqGukTF+3SgEvKULTeEv8iUtETgU44iMAZWVNrNP
         P6OvyLABHgwxcxHdW67x4LnROwG7jguzaJ5sb1+OxdiG5qCpNJbVfJFkVJ5NG0v9fb
         bTPg86OJjwzpjMyb7+eWhwEhOL+t3axH0q6fPUvB4PFC+3MMpoIcQVwLunvI8c0VEq
         GpStKCBLciLu/p3XGANDtvcpT1SOPEVAGrNk2S4dfWSuRkUQGAsdA7ud6P5mw++pPK
         JN1z8YBVUjOnc0iQQHQRZRKxFKCxz3BbuZ7IAi3wzCSpT8dB3E9PoTHlQhdpU8vATZ
         KF3lt8/M0t5EA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id DFD1CA01F1;
        Thu, 24 Sep 2020 08:22:01 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 01:22:01 -0700
Date:   Thu, 24 Sep 2020 01:22:01 -0700
Message-Id: <bbc364093decd1806a021f0548313ec103230a39.1600935293.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
References: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 08/10] usb: dwc3: gadget: Set IOC if not enough for extra TRBs
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If we run out of TRBs because we need extra TRBs, make sure to set the
IOC bit for the previously prepared TRB to get completion notification
to free up TRBs to resume later.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f43421246f89..840d6e49f668 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1197,7 +1197,27 @@ static int dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 			break;
 	}
 
+	return req->num_trbs - num_trbs;
+
 out:
+	/*
+	 * If we run out of TRBs for MPS alignment setup, then set IOC on the
+	 * previous TRB to get notified for TRB completion to resume when more
+	 * TRBs are available.
+	 *
+	 * Note: normally we shouldn't update the TRB after the HWO bit is set.
+	 * However, the controller doesn't update its internal cache to handle
+	 * the newly prepared TRBs until UPDATE_TRANSFER or START_TRANSFER
+	 * command is executed. At this point, it doesn't happen yet, so we
+	 * should be fine modifying it here.
+	 */
+	if (i) {
+		struct dwc3_trb	*trb;
+
+		trb = dwc3_ep_prev_trb(dep, dep->trb_enqueue);
+		trb->ctrl |= DWC3_TRB_CTRL_IOC;
+	}
+
 	return req->num_trbs - num_trbs;
 }
 
-- 
2.28.0

