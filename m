Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7AA3AB0B8
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 11:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbhFQKBG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 06:01:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:31323 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbhFQKA7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 06:00:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623923932; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2LHgsP9c4Sin2+nziX6odnlML8co8g8QWj7JMVhPh6c=; b=xeRUg/lZvh1+KQmE8at1ypGuajZc/yUGQa3gIIj9/UAELUdG7BTY1nw0r8lUnaaSWldoDjrC
 N03+zP2fxEC2a1y4L+7dyfmwoVUbrPp1xGT/6ZOPFupsMPfV2AK1GeV0rLfGSaclqhUrlzpa
 UyHvo+V5I3JQavQ3ALUQ85Okrug=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60cb1cc4e570c05619045f03 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 09:58:28
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 134A4C43217; Thu, 17 Jun 2021 09:58:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA3F1C43143;
        Thu, 17 Jun 2021 09:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA3F1C43143
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v10 2/6] usb: gadget: configfs: Check USB configuration before adding
Date:   Thu, 17 Jun 2021 02:58:15 -0700
Message-Id: <1623923899-16759-3-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ensure that the USB gadget is able to support the configuration being
added based on the number of endpoints required from all interfaces.  This
is for accounting for any bandwidth or space limitations.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/gadget/configfs.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 15a607c..76b9983 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1374,6 +1374,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		struct usb_function *f;
 		struct usb_function *tmp;
 		struct gadget_config_name *cn;
+		unsigned long ep_map = 0;
 
 		if (gadget_is_otg(gadget))
 			c->descriptors = otg_desc;
@@ -1403,7 +1404,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 				list_add(&f->list, &cfg->func_list);
 				goto err_purge_funcs;
 			}
+			if (f->fs_descriptors) {
+				struct usb_descriptor_header **d;
+
+				d = f->fs_descriptors;
+				for (; *d; ++d) {
+					struct usb_endpoint_descriptor *ep;
+					int addr;
+
+					if ((*d)->bDescriptorType != USB_DT_ENDPOINT)
+						continue;
+
+					ep = (struct usb_endpoint_descriptor *)*d;
+					addr = ((ep->bEndpointAddress & 0x80) >> 3) |
+						(ep->bEndpointAddress & 0x0f);
+					set_bit(addr, &ep_map);
+				}
+			}
 		}
+		ret = usb_gadget_check_config(cdev->gadget, ep_map);
+		if (ret)
+			goto err_purge_funcs;
+
 		usb_ep_autoconfig_reset(cdev->gadget);
 	}
 	if (cdev->use_os_string) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

