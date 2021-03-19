Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A38F341860
	for <lists+linux-usb@lfdr.de>; Fri, 19 Mar 2021 10:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhCSJcC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Mar 2021 05:32:02 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24014 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCSJbm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Mar 2021 05:31:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616146302; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qH/QiKDy2853CDgw5vQS2UxH52lZuDk60WUM69UR8UA=; b=YkUNfOpMJZFVHPa3hUHkLnjPcCpqOQ5dF2WXtF8JpsCQGqV6tz1Y+o/IPTBqSwYxKRoBLXLC
 W47oSw2gGRHMF2oMPpBw4xgQJm8Yb1VqIxkzDqCAlPiw5wMHcP836MkLq/43D89Bd+WQV/gs
 rF+HwK307uY8XEnGYfzYbKp+g6I=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60546f7621031618f6aee1ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Mar 2021 09:31:34
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DECC0C4346A; Fri, 19 Mar 2021 09:31:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E8ADC43461;
        Fri, 19 Mar 2021 09:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E8ADC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 1/2] usb: dwc3: gadget: Avoid continuing preparing TRBs during teardown
Date:   Fri, 19 Mar 2021 02:31:24 -0700
Message-Id: <1616146285-19149-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616146285-19149-1-git-send-email-wcheng@codeaurora.org>
References: <1616146285-19149-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add checks similar to dwc3_gadget_ep_queue() before kicking off
transfers after getting an endpoint completion event.   Since cleaning
up completed requests will momentarily unlock dwc->lock, there is a
chance for a sequence like pullup disable to be executed.  This can
lead to preparing a TRB, which will be removed by the pullup disable
routine.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/gadget.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 4a337f3..6e14fdc 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2912,6 +2912,11 @@ static void dwc3_gadget_ep_cleanup_completed_requests(struct dwc3_ep *dep,
 static bool dwc3_gadget_ep_should_continue(struct dwc3_ep *dep)
 {
 	struct dwc3_request	*req;
+	struct dwc3		*dwc = dep->dwc;
+
+	if (!dep->endpoint.desc || !dwc->pullups_connected ||
+	    !dwc->connected)
+		return false;
 
 	if (!list_empty(&dep->pending_list))
 		return true;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

