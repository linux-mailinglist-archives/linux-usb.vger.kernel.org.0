Return-Path: <linux-usb+bounces-4592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3B81EDB9
	for <lists+linux-usb@lfdr.de>; Wed, 27 Dec 2023 10:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFDB41C223C2
	for <lists+linux-usb@lfdr.de>; Wed, 27 Dec 2023 09:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB5F286AC;
	Wed, 27 Dec 2023 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g9zIrDMm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E874019BA7;
	Wed, 27 Dec 2023 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR6RQ6b011665;
	Wed, 27 Dec 2023 09:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=YR1Gh/0yKh6EdRMgwVOOBkNHjVNqBi6KNlMRS30rPO8=; b=g9
	zIrDMmQ/HlNg5ouXdX6rBz8sZ6V1Gg3b2PAOL16QnSDHL3MY0zAc48/k3Yk1VjVM
	n4IP0PaRnFNqTbqIqfrX/eqadhh9e3TiG22ARRWmmHk3T8C2+DK1NoWo+6y9Heck
	HfXNdP1VHG+Nxx5sTldPCqdwzLYBTorsz1h5n05aZGWFr3NjVvhdou5I7gsml1Cu
	jvQmIDWC+IBTSt9X7FmfMUPqXG0VpUA0Ll1vUGppNE9y7scxQerxVFQ3RcFZgDE2
	hDvmpOszugnp+BTgd/LEW96hLOTewZ8DQUVTeQ7IfFO9VLwOeKPYf7VTn3GVv7UN
	yWPfsH5zE/qWQtbWQJuA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v8d450eqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2023 09:20:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BR9KII4017059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2023 09:20:18 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 27 Dec 2023 01:20:13 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, "Andy
 Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Thinh
 Nguyen" <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Conor
 Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>
Subject: [PATCH v6 1/2] dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding
Date: Wed, 27 Dec 2023 14:49:50 +0530
Message-ID: <20231227091951.685-2-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231227091951.685-1-quic_kriskura@quicinc.com>
References: <20231227091951.685-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rDd5-qWVZtuEjcNepW7v8-XlZbX8ecOZ
X-Proofpoint-GUID: rDd5-qWVZtuEjcNepW7v8-XlZbX8ecOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312270068

The high speed related interrupts present on QC targets are as follows:

1. dp/dm irq's
These IRQ's directly reflect changes on the DP/DM pads of the SoC. These
are used as wakeup interrupts only on SoCs with non-QUSB2 targets with
exception of SDM670/SDM845/SM6350.

2. qusb2_phy irq
SoCs with QUSB2 PHY do not have separate DP/DM IRQs and expose only a
single IRQ whose behavior can be modified by the QUSB2PHY_INTR_CTRL
register. The required DPSE/DMSE configuration is done in
QUSB2PHY_INTR_CTRL register of phy address space.

3. hs_phy_irq
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

Classify SoC's into four groups based on whether qusb2_phy interrupt
or {dp/dm}_hs_phy_irq is used for wakeup in high speed and whether the
SoCs have hs_phy_irq present in them or not. The ss_phy_irq is optional
interrupt because there are mutliple SoC's which either support only High
Speed or there are multiple controllers within same Soc and the secondary
controller is High Speed only capable.

This breaks ABI on targets running older kernels, but since the interrupt
definitions are given wrong on many targets and to establish proper rules
for usage of DWC3 interrupts on Qualcomm platforms, DT binding update is
necessary. The bindings put pwr_event as the first interrupt and ss_phy as
the last. Since all SoCs have the pwr_event (HS) interrupt, but not all
controllers have the SS PHY interrupt, this would prevent, to some extent,
expressing that the SS PHY is optional by keeping it last in the binding
schema and making sure that minItems = maxItems - 1.

No new targets have been added to schema. Only the existing ones have been
re-ordered.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 .../devicetree/bindings/usb/qcom,dwc3.yaml    | 141 ++++++++----------
 1 file changed, 61 insertions(+), 80 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 473c4bfaf8a2..8242e22fde36 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -99,12 +99,29 @@ properties:
       - const: apps-usb
 
   interrupts:
-    minItems: 1
-    maxItems: 4
+    description: |
+      Different types of interrupts are used based on HS PHY used on target:
+        - pwr_event: Used for wakeup based on other power events.
+        - hs_phY_irq: Apart from DP/DM/QUSB2 PHY interrupts, there is
+                       hs_phy_irq which is not triggered by default and its
+                       functionality is mutually exclusive to that of
+                       {dp/dm}_hs_phy_irq and qusb2_phy_irq.
+        - qusb2_phy: SoCs with QUSB2 PHY do not have separate DP/DM IRQs and
+                      expose only a single IRQ whose behavior can be modified
+                      by the QUSB2PHY_INTR_CTRL register. The required DPSE/
+                      DMSE configuration is done in QUSB2PHY_INTR_CTRL register
+                      of PHY address space.
+        - {dp/dm}_hs_phy_irq: These IRQ's directly reflect changes on the DP/
+                               DM pads of the SoC. These are used for wakeup
+                               only on SoCs with non-QUSB2 targets with
+                               exception of SDM670/SDM845/SM6350.
+        - ss_phy_irq: Used for remote wakeup in Super Speed mode of operation.
+    minItems: 2
+    maxItems: 5
 
   interrupt-names:
-    minItems: 1
-    maxItems: 4
+    minItems: 2
+    maxItems: 5
 
   qcom,select-utmi-as-pipe-clk:
     description:
@@ -361,60 +378,20 @@ allOf:
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
-    then:
-      properties:
-        interrupts:
-          items:
-            - description: The interrupt that is asserted
-                when a wakeup event is received on USB2 bus.
-            - description: The interrupt that is asserted
-                when a wakeup event is received on USB3 bus.
-            - description: Wakeup event on DM line.
-            - description: Wakeup event on DP line.
-        interrupt-names:
-          items:
-            - const: hs_phy_irq
-            - const: ss_phy_irq
-            - const: dm_hs_phy_irq
-            - const: dp_hs_phy_irq
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,msm8953-dwc3
-              - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
-              - qcom,sm6115-dwc3
-              - qcom,sm6125-dwc3
     then:
       properties:
         interrupts:
-          maxItems: 2
+          minItems: 2
+          maxItems: 3
         interrupt-names:
           items:
-            - const: hs_phy_irq
+            - const: pwr_event
+            - const: qusb2_phy
             - const: ss_phy_irq
 
   - if:
@@ -422,37 +399,21 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq5018-dwc3
-              - qcom,ipq5332-dwc3
+              - qcom,msm8996-dwc3
+              - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
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
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
     then:
       properties:
         interrupts:
           minItems: 3
           maxItems: 4
         interrupt-names:
-          minItems: 3
           items:
+            - const: pwr_event
+            - const: qusb2_phy
             - const: hs_phy_irq
-            - const: dp_hs_phy_irq
-            - const: dm_hs_phy_irq
             - const: ss_phy_irq
 
   - if:
@@ -460,7 +421,7 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sc8280xp-dwc3
+              - qcom,ipq5332-dwc3
               - qcom,x1e80100-dwc3
     then:
       properties:
@@ -478,16 +439,35 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq4019-dwc3
+              - qcom,ipq8064-dwc3
+              - qcom,msm8994-dwc3
               - qcom,sa8775p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sc8280xp-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm4250-dwc3
+              - qcom,sm6350-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8350-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
     then:
       properties:
         interrupts:
-          minItems: 3
-          maxItems: 4
+          minItems: 4
+          maxItems: 5
         interrupt-names:
-          minItems: 3
           items:
             - const: pwr_event
+            - const: hs_phy_irq
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
             - const: ss_phy_irq
@@ -525,12 +505,13 @@ examples:
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


