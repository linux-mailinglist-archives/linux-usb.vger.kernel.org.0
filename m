Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40273D98DA
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 00:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhG1W3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Jul 2021 18:29:02 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:34925 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbhG1W3C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Jul 2021 18:29:02 -0400
X-Greylist: delayed 570 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Jul 2021 18:29:01 EDT
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 360FA1F505;
        Thu, 29 Jul 2021 00:19:26 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: usb: dwc3-qcom: Add sdm660 compatible
Date:   Thu, 29 Jul 2021 00:19:21 +0200
Message-Id: <20210728221921.52068-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a new compatible for SDM660's DWC3.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 drivers/usb/dwc3/dwc3-qcom.c                         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 4e6451789806..e70afc40edb2 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
           - qcom,sc7280-dwc3
+          - qcom,sdm660-dwc3
           - qcom,sdm845-dwc3
           - qcom,sdx55-dwc3
           - qcom,sm4250-dwc3
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49e6ca94486d..c1ead38fa2a3 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -916,6 +916,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,dwc3" },
 	{ .compatible = "qcom,msm8996-dwc3" },
 	{ .compatible = "qcom,msm8998-dwc3" },
+	{ .compatible = "qcom,sdm660-dwc3" },
 	{ .compatible = "qcom,sdm845-dwc3" },
 	{ }
 };
-- 
2.32.0

