Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2264F404707
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 10:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhIII3H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 04:29:07 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39923 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhIII3H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 04:29:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631176078; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZO46Pxm+SLs6jgQXRcqd7WXt2DMMoGjP8dztaIupwi0=; b=huxWyr/6JO5kbiu3Y9eldqp/zk8r41E6MJR0fRFq9RV245mHrVUste2eSNvJeMs5AhQfIL3g
 DPr8HWoWU8nBHMjuQOxtG8mXqIWTQu1PWbsBwirD71ktoX3ACeZQedbcHGEkZqOqJf64CmNk
 xBmaA8IikBZxsm2QdGJ+hGZnF3g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6139c58de34848cb6a1cb1a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 08:27:57
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 631E9C43460; Thu,  9 Sep 2021 08:27:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EA1CC4338F;
        Thu,  9 Sep 2021 08:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7EA1CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v2 2/2] usb: gadget: f_uac2: Populate SS descriptors' wBytesPerInterval
Date:   Thu,  9 Sep 2021 01:26:51 -0700
Message-Id: <20210909082651.11912-3-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210909082651.11912-1-jackp@codeaurora.org>
References: <20210909082651.11912-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For Isochronous endpoints, the SS companion descriptor's
wBytesPerInterval field is required to reserve bus time in order
to transmit the required payload during the service interval.
If left at 0, the UAC2 function is unable to transact data on its
playback or capture endpoints in SuperSpeed mode.

Since f_uac2 currently does not support any bursting this value can
be exactly equal to the calculated wMaxPacketSize.

Tested with Windows 10 as a host.

Fixes: f8cb3d556be3 ("usb: f_uac2: adds support for SS and SSP")
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
v2: New patch

 drivers/usb/gadget/function/f_uac2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index d89c1ebb07f4..33d60b926bae 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1178,6 +1178,9 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->out_ep_maxpsize = max_t(u16, agdev->out_ep_maxpsize,
 				le16_to_cpu(ss_epout_desc.wMaxPacketSize));
 
+	ss_epin_desc_comp->wBytesPerInterval = ss_epin_desc->wMaxPacketSize;
+	ss_epout_desc_comp->wBytesPerInterval = ss_epout_desc->wMaxPacketSize;
+
 	// HS and SS endpoint addresses are copied from autoconfigured FS descriptors
 	hs_ep_int_desc.bEndpointAddress = fs_ep_int_desc.bEndpointAddress;
 	hs_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
-- 
2.24.0

