Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDDC345521
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 02:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhCWBvC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 21:51:02 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49205 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhCWBu3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 21:50:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616464227; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=iqqyIy9tOoNipSpUDnFqIfdhP6wTcipwYtIVVT4KWEA=; b=sOORbp3YVx17EO0wUBA6pM0JIk+7i2fHRBoxhTwZ6Dt8OLirx2V0oKjpbQ/WaQ1btlvZ/57R
 BpVHJ+BJk3ZxpsAWsC8kciN6CfOwYqYVY53+NnoCz00m4fYdCb2qHXP1u/SQnHQyWl9PT1Yk
 Avbp+DTjFoZeky3wWuWCJAUvP74=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60594962c32ceb3a9121de50 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Mar 2021 01:50:26
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 481B5C43461; Tue, 23 Mar 2021 01:50:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D3F5C433C6;
        Tue, 23 Mar 2021 01:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D3F5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH] usb: gadget: Stall OS descriptor request for unsupported functions
Date:   Mon, 22 Mar 2021 18:50:17 -0700
Message-Id: <1616464217-2650-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

Hosts which request "OS descriptors" from gadgets do so during
the enumeration phase and before the configuration is set with
SET_CONFIGURATION. Composite driver supports OS descriptor
handling in composite_setup function. This requires to pass
signature field, vendor code, compatibleID and subCompatibleID
from user space.

For USB compositions that contain functions which don't implement os
descriptors, Windows is sending vendor specific requests for os
descriptors and composite driver handling this request with invalid
data. With this invalid info host resetting the bus and never
selecting the configuration and leading enumeration issue.

Fix this by bailing out from the OS descriptor setup request
handling if the functions does not have OS descriptors compatibleID.

Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/gadget/composite.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 72a9797..473edda6 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1945,6 +1945,12 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				buf[6] = w_index;
 				/* Number of ext compat interfaces */
 				count = count_ext_compat(os_desc_cfg);
+				/*
+				 * Bailout if device does not
+				 * have ext_compat interfaces.
+				 */
+				if (count == 0)
+					break;
 				buf[8] = count;
 				count *= 24; /* 24 B/ext compat desc */
 				count += 16; /* header */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

