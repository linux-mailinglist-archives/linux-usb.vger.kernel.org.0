Return-Path: <linux-usb+bounces-3640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8882802FB5
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B4ACB20B74
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933731EB4F;
	Mon,  4 Dec 2023 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mOJ0yTBg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6077FFF;
	Mon,  4 Dec 2023 02:10:38 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4521mf019707;
	Mon, 4 Dec 2023 10:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rZii8vYiTK1zMlcOJLRE+IfYScSynbGAIpe54wACWEE=;
 b=mOJ0yTBgNJUTLPN446tlL/r+SBQ3mtSCPYTS01FZKsKG8LsKgyzZqudbjkgdYJDsCejl
 q7Zfk5810EiVGFlFa+mfIezqOUI9gDt2960hSMdMU8D7AdwMj6/1iIsFxzLRAIqZv5y8
 ktZ+QjlhnIirgkzTNOANH32lsKwCKRFqhQVixAGcOooT/AjUCPFPGBxVqJCRAA1JlOo9
 d/12AHFtEvoHnTqgnkknXT9ym7NEX4f+Q1DQ6WjXJ06BjQlC3CniMkGxie4dI0e06Nri
 iGWv0fKYZmjn8VhXqrkg2cs0MxW7msKNlMe64bNmSPMayizHLpBk+es/wodnrbGdwgKo /Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqsxw3vmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 10:10:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4AABFs027359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 10:10:11 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Dec 2023 02:10:05 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>
Subject: [PATCH v2 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in bindings
Date: Mon, 4 Dec 2023 15:39:45 +0530
Message-ID: <20231204100950.28712-2-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204100950.28712-1-quic_kriskura@quicinc.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VK0JBAltrepatYbq6tOmgMv0afBmt3OH
X-Proofpoint-GUID: VK0JBAltrepatYbq6tOmgMv0afBmt3OH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 malwarescore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040076

The high speed related interrupts present on QC targets are as follows:

dp/dm irq's
These IRQ's directly reflect changes on the DP/DM pads of the SoC. These
are used as wakeup interrupts only on SoCs with non-QUSB2 targets with
exception of SDM670/SDM845/SM6350.

qusb2_phy irq
SoCs with QUSB2 PHY do not have separate DP/DM IRQs and expose only a
single IRQ whose behavior can be modified by the QUSB2PHY_INTR_CTRL
register. The required DPSE/DMSE configuration is done in
QUSB2PHY_INTR_CTRL register of phy address space.

hs_phy_irq
This is completely different from the above two and is present on all
targets with exception of a few IPQ ones. The interrupt is not enabled by
default and its functionality is mutually exclusive of qusb2_phy on QUSB
targets and DP/DM on femto phy targets.

The DTs of several QUSB2 PHY based SoCs incorrectly define "hs_phy_irq"
when they should have been "qusb2_phy_irq". On Femto phy targets, the
"hs_phy_irq" mentioned is either the actual "hs_phy_irq" or "pwr_event",
neither of which would never be triggered directly are non-functional
currently. The implementation tries to clean up this issue by addressing
the discrepencies involved and fixing the hs_phy_irq's in respective DT's.

Classify interrupts based on whether qusb2_phy interrupt is used or
{dp/dm}_hs_phy_irq is used and whether hs_phy_irq is present or not.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 .../devicetree/bindings/usb/qcom,dwc3.yaml    | 147 +++++++-----------
 1 file changed, 58 insertions(+), 89 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 3ec62027f663..94deef765ec3 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -98,12 +98,30 @@ properties:
       - const: apps-usb
 
   interrupts:
-    minItems: 1
-    maxItems: 4
+    description: |
+      Different types of interrupts are used based on HS phy used on target::
+        - qusb2_phy:: SoCs with QUSB2 PHY do not have separate DP/DM IRQs and
+                      expose only a single IRQ whose behavior can be modified
+                      by the QUSB2PHY_INTR_CTRL register. The required DPSE/
+                      DMSE configuration is done in QUSB2PHY_INTR_CTRL register
+                      of phy address space.
+        - {dp/dm}_hs_phy_irq:: These IRQ's directly reflect changes on the DP/
+                               DM pads of the SoC. These are used for wakeup
+                               only on SoCs with non-QUSBb2 targets with
+                               exception of SDM670/SDM845/SM6350.
+        - ss_phy_irq:: When in super speed mode of operation, interrupts are
+                       received when a wakeup event is received on ss_phy_irq.
+        - hs_phY_irq:: Apart from DP/DM/QUSB2 Phy interrupts, there is
+                       hs_phy_irq which is not triggered by default and its
+                       functionality is mutually exclusive to that of
+                       {dp/dm}_hs_phy_irq and qusb2_phy_irq.
+        - pwr_event:: Used for wakeup based on other power events.
+    minItems: 2
+    maxItems: 5
 
   interrupt-names:
-    minItems: 1
-    maxItems: 4
+    minItems: 2
+    maxItems: 5
 
   qcom,select-utmi-as-pipe-clk:
     description:
@@ -359,116 +377,54 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq4019-dwc3
+              - qcom,ipq5018-dwc3
               - qcom,ipq6018-dwc3
-              - qcom,ipq8064-dwc3
               - qcom,ipq8074-dwc3
-              - qcom,msm8994-dwc3
-              - qcom,qcs404-dwc3
-              - qcom,sc7180-dwc3
-              - qcom,sdm670-dwc3
-              - qcom,sdm845-dwc3
-              - qcom,sdx55-dwc3
-              - qcom,sdx65-dwc3
-              - qcom,sdx75-dwc3
-              - qcom,sm4250-dwc3
-              - qcom,sm6350-dwc3
-              - qcom,sm8150-dwc3
-              - qcom,sm8250-dwc3
-              - qcom,sm8350-dwc3
-              - qcom,sm8450-dwc3
-              - qcom,sm8550-dwc3
-              - qcom,sm8650-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8998-dwc3
+              - qcom,qcm2290-dwc3
     then:
       properties:
-        interrupts:
-          items:
-            - description: The interrupt that is asserted
-                when a wakeup event is received on USB2 bus.
-            - description: The interrupt that is asserted
-                when a wakeup event is received on USB3 bus.
-            - description: Wakeup event on DM line.
-            - description: Wakeup event on DP line.
         interrupt-names:
           items:
-            - const: hs_phy_irq
-            - const: ss_phy_irq
-            - const: dm_hs_phy_irq
-            - const: dp_hs_phy_irq
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: ss_phy_irq (optional)
 
   - if:
       properties:
         compatible:
           contains:
             enum:
-              - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
-              - qcom,msm8998-dwc3
+              - qcom,qcs404-dwc3
+              - qcom,sdm660-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
     then:
       properties:
-        interrupts:
-          maxItems: 2
         interrupt-names:
           items:
+            - const: pwr_event
             - const: hs_phy_irq
-            - const: ss_phy_irq
+            - const: qusb2_phy
+            - const: ss_phy_irq (optional)
 
   - if:
       properties:
         compatible:
           contains:
             enum:
-              - qcom,ipq5018-dwc3
               - qcom,ipq5332-dwc3
-              - qcom,sdm660-dwc3
-    then:
-      properties:
-        interrupts:
-          minItems: 1
-          maxItems: 2
-        interrupt-names:
-          minItems: 1
-          items:
-            - const: hs_phy_irq
-            - const: ss_phy_irq
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc7280-dwc3
-    then:
-      properties:
-        interrupts:
-          minItems: 3
-          maxItems: 4
-        interrupt-names:
-          minItems: 3
-          items:
-            - const: hs_phy_irq
-            - const: dp_hs_phy_irq
-            - const: dm_hs_phy_irq
-            - const: ss_phy_irq
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,sc8280xp-dwc3
     then:
       properties:
-        interrupts:
-          maxItems: 4
         interrupt-names:
           items:
             - const: pwr_event
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
-            - const: ss_phy_irq
+            - const: ss_phy_irq (optional)
 
   - if:
       properties:
@@ -476,18 +432,30 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm6350-dwc3
+              - qcom,sm6375-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8350-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
     then:
       properties:
-        interrupts:
-          minItems: 3
-          maxItems: 4
         interrupt-names:
-          minItems: 3
           items:
             - const: pwr_event
+            - const: hs_phy_irq
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
-            - const: ss_phy_irq
+            - const: ss_phy_irq (optional)
 
 additionalProperties: false
 
@@ -522,12 +490,13 @@ examples:
                           <&gcc GCC_USB30_PRIM_MASTER_CLK>;
             assigned-clock-rates = <19200000>, <150000000>;
 
-            interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+            interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>,
                          <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
-                         <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>;
-            interrupt-names = "hs_phy_irq", "ss_phy_irq",
-                          "dm_hs_phy_irq", "dp_hs_phy_irq";
+                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pwr_event", "hs_phy_irq",
+                          "dp_hs_phy_irq", "dm_hs_phy_irq", "ss_phy_irq";
 
             power-domains = <&gcc USB30_PRIM_GDSC>;
 
-- 
2.42.0


