Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7029388863
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 09:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241829AbhESHpt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 03:45:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12585 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241973AbhESHpq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 03:45:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621410267; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aSUipJnkhLkRJo0zPr9YpjfQrH0NwQqDUt2arQamcHI=; b=eSDA/nwqJN/9h+InMGSzuK1ycrd9d0zfosIVU3wGwpIU2UdYJp617vpL0oOdo44k593lpno7
 R4MPg+xpQsGhjKfSy/HwUd1wAFb+c+iqb1tnVnCDzPmZIYY6qp6plQU0NgYVacvaMNl9DaFZ
 rc4euYCToCaM+863xYyffTFdryQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60a4c1c65f788b52a5eec5f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 07:44:06
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AEDC2C4338A; Wed, 19 May 2021 07:44:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B3FD5C4338A;
        Wed, 19 May 2021 07:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3FD5C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v8 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
Date:   Wed, 19 May 2021 00:43:57 -0700
Message-Id: <1621410238-31395-5-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
References: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In order to take advantage of the TX fifo resizing logic, manually add
these properties to the DWC3 child node by default.  This will allow
the DWC3 gadget to resize the TX fifos for the IN endpoints, which
help with performance.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49e6ca9..44e0eaa1 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -645,6 +645,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
 	struct device		*dev = &pdev->dev;
+	struct property		*prop;
 	int			ret;
 
 	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
@@ -653,6 +654,14 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
+	if (prop) {
+		prop->name = "tx-fifo-resize";
+		ret = of_add_property(dwc3_np, prop);
+		if (ret < 0)
+			dev_info(dev, "unable to add tx-fifo-resize prop\n");
+	}
+
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

