Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C772564EE
	for <lists+linux-usb@lfdr.de>; Sat, 29 Aug 2020 07:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgH2F71 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Aug 2020 01:59:27 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50509 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726814AbgH2F7Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 29 Aug 2020 01:59:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598680764; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JBxLm8OMFKHoxpqehjgR8wTIrJyvPsHzMv6BSVJcvNw=; b=iFA+btGdHoPfDg8UlKEDDr0eesMVHfFeVNEcQfpmMvEfIIIIC6QMG3tY8JiM9WaJKQgXazYl
 HbnlEeTzsgSzjycovwBt8XHs/Kayo8bFFeR/Qim6BPerlnixm/f3vG03DoxDi5Gd/gAxmZD5
 fh7qElGb988wMImma+oXPeKBuuM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f49ee9d6a801be9b26ca310 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 29 Aug 2020 05:58:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9780EC43391; Sat, 29 Aug 2020 05:58:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D17CBC43387;
        Sat, 29 Aug 2020 05:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D17CBC43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [RFC v5 4/6] usb: gadget: configfs: Check USB configuration before adding
Date:   Fri, 28 Aug 2020 22:58:44 -0700
Message-Id: <20200829055846.19034-5-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200829055846.19034-1-wcheng@codeaurora.org>
References: <20200829055846.19034-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
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
index 56051bb97349..7c74c04b1d8c 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1361,6 +1361,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		struct usb_function *f;
 		struct usb_function *tmp;
 		struct gadget_config_name *cn;
+		unsigned long ep_map = 0;
 
 		if (gadget_is_otg(gadget))
 			c->descriptors = otg_desc;
@@ -1390,7 +1391,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 				list_add(&f->list, &cfg->func_list);
 				goto err_purge_funcs;
 			}
+			if (f->ss_descriptors) {
+				struct usb_descriptor_header **d;
+
+				d = f->ss_descriptors;
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

