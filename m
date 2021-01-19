Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18A62FC34E
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 23:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbhASWXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 17:23:34 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:32675 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731375AbhASRqa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Jan 2021 12:46:30 -0500
X-Greylist: delayed 394 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Jan 2021 12:46:29 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611078329; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=L0vFdFdhSXmndQrwYXuvFainDV9NH9XIG05iM/Zdhg8=; b=UJJobJMflGF1rKcuJrFDGXXVKNbqQZXn622SaS56eg1T2OghZcxQsXbiBRhFrzHz7E/DYDwl
 UC4nUXUCCw2vm8BaordFqBqIRcoeFskrYytLyO7VimRkZwnivDR0kyiP86AmL/YrMG/zExIC
 81gofQSEaJzMAD7WKjQLX2ptNas=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6007193502b2f1cb1a797d58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Jan 2021 17:39:01
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2471C43462; Tue, 19 Jan 2021 17:39:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B93EC433C6;
        Tue, 19 Jan 2021 17:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B93EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v3] dt-bindings: usb: qcom,dwc3: Add bindings for SM8150, SM8250, SM8350
Date:   Tue, 19 Jan 2021 09:37:48 -0800
Message-Id: <20210119173748.6729-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add compatible strings for the USB DWC3 controller on QCOM SM8150,
SM8250 and SM8350 SoCs.

Note the SM8150 & SM8250 compatibles are already being used in the
dts but was missing from the documentation.

Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
v3: Resend of #4/4 of https://lore.kernel.org/linux-usb/20210115174723.7424-1-jackp@codeaurora.org
    added Felipe's Ack & rebased on gregkh/usb-testing

 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index dd1d8bcd9254..c3cbd1fa9944 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -18,6 +18,9 @@ properties:
           - qcom,sc7180-dwc3
           - qcom,sdm845-dwc3
           - qcom,sdx55-dwc3
+          - qcom,sm8150-dwc3
+          - qcom,sm8250-dwc3
+          - qcom,sm8350-dwc3
       - const: qcom,dwc3
 
   reg:
-- 
2.24.0

