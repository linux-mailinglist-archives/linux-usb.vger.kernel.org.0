Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2922910E649
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 08:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfLBHMG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 02:12:06 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:54644
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725914AbfLBHMG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 02:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575270725;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=3477CrG681lrfC7TA2/zTKr4w73EI6NRnLjMYutiB0Y=;
        b=Ou1hRc+kQL5ti5kfL99SkUzJ/4NWgFC8dWwHcUUJYVXbkuGgJfMAb5A4E+JsaT28
        7JjAYfkl1DRM2ZRHgMqAJbLOwvoYLFRlPOlcRvklxmiEFU4qHmlKG0/+bhuUf7Mrv31
        1/tBB6cYN88ak94m/X65jjTbjXNMnmg2q0niRi9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575270725;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=3477CrG681lrfC7TA2/zTKr4w73EI6NRnLjMYutiB0Y=;
        b=IzWFdp99nAiAybOFxzT6dZ+yCRTOca7/7LalpCIXHnVXY27oxj1xzX1LENvYsTSF
        E04a7bsuvBHugDAvwGOWLdgVEfn3zdw4g6FJEo4fDsx5ALYx6e0/41msmLbC+B/nQNb
        ja5cEq+8mC/vCAr4A70myk6Lup4+80OZewUhoMOg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3975BC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sallenki@codeaurora.org
From:   Sriharsha Allenki <sallenki@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     jackp@codeaurora.org, mgautam@codeaurora.org,
        Sriharsha Allenki <sallenki@codeaurora.org>
Subject: [PATCH] usb: dwc3: Do not process request if HWO is set for its TRB
Date:   Mon, 2 Dec 2019 07:12:05 +0000
Message-ID: <0101016ec573b5ae-2af3092c-f485-4087-b38f-915f5a21d8a4-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574946055-3788-1-git-send-email-sallenki@codeaurora.org>
References: <1574946055-3788-1-git-send-email-sallenki@codeaurora.org>
X-SES-Outgoing: 2019.12.02-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the HWO bit is set for the TRB (or the first TRB if scatter-gather
is used) of a request, it implies that core is still processing it.
In that case do not reclaim that TRB and do not giveback the
request to the function driver, else it will result in a SMMU
translation fault when core tries to access the buffer
corresponding to this TRB.

Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
---
 drivers/usb/dwc3/gadget.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a9aba71..4a2c5fc 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2476,6 +2476,14 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 {
 	int ret;
 
+	/*
+	 * If the HWO is set, it implies the TRB is still being
+	 * processed by the core. Hence do not reclaim it until
+	 * it is processed by the core.
+	 */
+	if (req->trb->ctrl & DWC3_TRB_CTRL_HWO)
+		return 1;
+
 	if (req->num_pending_sgs)
 		ret = dwc3_gadget_ep_reclaim_trb_sg(dep, req, event,
 				status);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

