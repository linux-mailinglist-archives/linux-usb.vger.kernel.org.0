Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECEDA3E02D9
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 16:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238645AbhHDOMb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 10:12:31 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:32779 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238412AbhHDOMa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Aug 2021 10:12:30 -0400
X-Greylist: delayed 351 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Aug 2021 10:12:30 EDT
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 5C530440EBB;
        Wed,  4 Aug 2021 17:06:06 +0300 (IDT)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Baruch Siach <baruch@tkos.co.il>,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 5/6] dt-bindings: usb: qcom,dwc3: add binding for IPQ6018
Date:   Wed,  4 Aug 2021 17:05:09 +0300
Message-Id: <24ce7c1258790b35a08e14a1e79a9447c3fed354.1628085910.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add compatible string for Qualcomm IPQ6018 SoC.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 4e6451789806..55ed4b4c7f51 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,ipq6018-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
-- 
2.30.2

