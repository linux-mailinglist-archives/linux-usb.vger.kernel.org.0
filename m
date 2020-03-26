Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9338E19384E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 07:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgCZGBY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 02:01:24 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:41548 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725775AbgCZGBX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 02:01:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585202483; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=RebUHKnAwQUQfOR7sYhC2NKNt76w5eJuItSeaLBWUpY=; b=SFcPvWvmwYAs2qEDt6+M1oIF4xYqPo0Ie5Kt56kuqm+bMfTus268QLnxF66KoRerg+U1lcoR
 iWExv3tYr5nHHscsMMyiNa0DG1+ObZsZ6gLo0HDM9cX/vQllSwB9zK4vgIA7vTz61zB0ls0v
 lSQXyIgrnBZSJ8RoODIO+nBpaOc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7c4510.7f03ef4bff10-smtp-out-n03;
 Thu, 26 Mar 2020 06:00:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6ACE3C433F2; Thu, 26 Mar 2020 06:00:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sallenki-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sallenki)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9BFCC433D2;
        Thu, 26 Mar 2020 06:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9BFCC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sallenki@codeaurora.org
From:   Sriharsha Allenki <sallenki@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     mgautam@codeaurora.org, jackp@codeaurora.org,
        Sriharsha Allenki <sallenki@codeaurora.org>
Subject: [PATCH] usb: gadget: f_fs: Fix use after free issue as part of queue failure
Date:   Thu, 26 Mar 2020 11:30:33 +0530
Message-Id: <20200326060033.14550-1-sallenki@codeaurora.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In AIO case, the request is freed up if ep_queue fails.
However, io_data->req still has the reference to this freed
request. In the case of this failure if there is aio_cancel
call on this io_data it will lead to an invalid dequeue
operation and a potential use after free issue.
Fix this by setting the io_data->req to NULL when the request
is freed as part of queue failure.

Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
---
 drivers/usb/gadget/function/f_fs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 571917677d35..767f30b86645 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1120,6 +1120,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 
 		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
 		if (unlikely(ret)) {
+			io_data->req = NULL;
 			usb_ep_free_request(ep->ep, req);
 			goto error_lock;
 		}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
