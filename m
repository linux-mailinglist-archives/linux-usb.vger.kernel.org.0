Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEBE43278C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 21:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhJRT3G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 15:29:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55631 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhJRT3F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 15:29:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634585214; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=MqCoBymOpj4mTjFi46DnD69+dpPudEakQsa4njd6B0g=; b=OBgFaQl4+PQ8hZfFekXr15M54Hdv7Qtl4o0ff3U4A/jyBmTJFKtdfRj5GXA+Dih2e8J3C4di
 erDQpUJ8v/xoGQBMW5Z3K5nrKcsuZHbYwWQpE9S8d9s0SeYdoVqz+DvIx/NaCABr53GDVICR
 oPw6yr9pLQQ8wWCVGfScwmNYs4E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 616dca7c8ea00a941fd94a04 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 19:26:52
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 05C1BC43618; Mon, 18 Oct 2021 19:26:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 333FDC43460;
        Mon, 18 Oct 2021 19:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 333FDC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v2] usb: dwc3: gadget: Change to dev_dbg() when queuing to inactive gadget/ep
Date:   Mon, 18 Oct 2021 12:26:47 -0700
Message-Id: <20211018192647.32121-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since function drivers will still be active until dwc3_disconnect_gadget()
is called, some applications will continue to queue packets to DWC3
gadget.  This can lead to a flood of messages regarding failed ep queue,
as the endpoint is in the process of being disabled.  Change the log
level to debug, so that it can be enabled when debugging issues.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
Changes from v1:
 - Modified dev_err() to dev_dbg()

 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 4845682a0408..0d32e97f11cd 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1813,7 +1813,7 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 	struct dwc3		*dwc = dep->dwc;
 
 	if (!dep->endpoint.desc || !dwc->pullups_connected || !dwc->connected) {
-		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
+		dev_dbg(dwc->dev, "%s: can't queue to disabled endpoint\n",
 				dep->name);
 		return -ESHUTDOWN;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

