Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 827F6B9006
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 14:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfITMxm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 08:53:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51720 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfITMxm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 08:53:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9797E614DC; Fri, 20 Sep 2019 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568984021;
        bh=alsMFtQ1ru+kujgvoPfx+DQCs63Dcqg92tJoKE3Cbo4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jx6lrcKhAv4yL7g3bk4hjexkRoj5r5CSj8SDd5PCWn1atM4hthpyLl+m2JAPFHanC
         VYxalrUhzTiga745dIgLJa1rSFYsmCEjV5+7vIyb8LsxP3zWPnrsIYQwf8rBqae+rA
         N7fSZKIaroFa/DPIWIE5FcyZ8lW/IsOIEBZ4NVJw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA16A614DC;
        Fri, 20 Sep 2019 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568984020;
        bh=alsMFtQ1ru+kujgvoPfx+DQCs63Dcqg92tJoKE3Cbo4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZyHwSSyMlqAm29xkF3+MdZZQW3kTKln+gX9gptd/ztsMG1/dfq6X2Gn6xJRlb9B01
         e5N3UES+pkqIpjQEf2Rlt2P/zmJCOFNcco+WsTuBCldhQmVHtj5krfO2apu10L45az
         3mmQkAdXqxO1KMUhfiCTDcBkRZeYAdt5DejhMcrE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA16A614DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   cchiluve <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH V4 1/3] dt-bindings: Introduce interconnect properties for Qualcomm DWC3 driver
Date:   Fri, 20 Sep 2019 18:23:15 +0530
Message-Id: <1568983997-20004-2-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568983997-20004-1-git-send-email-cchiluve@codeaurora.org>
References: <1568983997-20004-1-git-send-email-cchiluve@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

Add documentation for the interconnects and interconnect-names
properties for USB as detailed by bindings/interconnect/interconnect.txt.

Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
index cb695aa..63c21c6 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
@@ -33,6 +33,16 @@ Optional clocks:
 
 Optional properties:
 - resets:		Phandle to reset control that resets core and wrapper.
+- interconnects:	Pairs of phandles and interconnect provider specifiers
+			to denote the edge source and destination ports of
+			the interconnect path. Please refer to
+			Documentation/devicetree/bindings/interconnect/
+			for more details.
+- interconnect-names:	List of interconnect path name strings sorted in the same
+			order as the interconnects property. Consumer drivers will use
+			interconnect-names to match interconnect paths with interconnect
+			specifiers. Please refer to Documentation/devicetree/bindings/
+			interconnect/ for more details.
 - interrupts:		specifies interrupts from controller wrapper used
 			to wakeup from low power/susepnd state.	Must contain
 			one or more entry for interrupt-names property
@@ -74,6 +84,9 @@ Example device nodes:
 			#size-cells = <1>;
 			ranges;
 
+			interconnects = <&qnoc MASTER_USB3_0 &qnoc SLAVE_EBI1>,
+					<&qnoc MASTER_APPSS_PROC &qnoc SLAVE_USB3_0>;
+			interconnect-names = "usb-ddr", "apps-usb";
 			interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
 			interrupt-names = "hs_phy_irq", "ss_phy_irq",
 				  "dm_hs_phy_irq", "dp_hs_phy_irq";
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

