Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720D55AF0B3
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 18:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbiIFQjU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Sep 2022 12:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbiIFQi2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Sep 2022 12:38:28 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4141CC54;
        Tue,  6 Sep 2022 09:16:25 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286AnPfv020936;
        Tue, 6 Sep 2022 16:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Q9sYSqYSgS5qH4/v1WiCPBXj8mZyzbwietEuvjrJlWA=;
 b=WhG+5qqKGPLWpkAEVS3Ogf4e0Ck2th+3Wt5c77dm47KN4w7gQbz7I7FqWgzTCTI0N9wh
 +SHwcqyUXOECjFMO9lSFWzLP+XaBIvIrovNFf8B7s5AdIgddg8L+dtvr5Sp1UkBF3nUD
 tL6/s37KWdUmZ7pQp6v1sai3FPlwYzQuShZYJ2yJfZioOGKA9gNY68rdv/c/+/UDB+yE
 v79lbS9Rb/LP2dUPmCfSIqW2A2l1lOPXC+dUtM08ap6tDUNTZ7yy4G8Osr6OR1ofyc1p
 tyMfRLzcoMiBdXrCuz+uBrbWx7HcWotU7zAaGpPAa5/KePZad/0Y2vcT9nmapIa7I1pG vA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jdtw9b1ms-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 16:15:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 286GFpqI009371
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 6 Sep 2022 16:15:51 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 6 Sep 2022 09:15:44 -0700
From:   Krishna Kurapati <quic_kriskura@quicinc.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
CC:     <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>, <quic_vpulyala@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v13 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy override params bindings
Date:   Tue, 6 Sep 2022 21:45:31 +0530
Message-ID: <1662480933-12326-2-git-send-email-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1662480933-12326-1-git-send-email-quic_kriskura@quicinc.com>
References: <1662480933-12326-1-git-send-email-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L-2MhGu5H7CwgBrVZ3SzCF7qxpOSoGOc
X-Proofpoint-ORIG-GUID: L-2MhGu5H7CwgBrVZ3SzCF7qxpOSoGOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_08,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=933 mlxscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060075
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>

Add device tree bindings for SNPS phy tuning parameters.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index f2aeffd..68e7096 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -54,6 +54,94 @@ properties:
   vdda33-supply:
     description: phandle to the regulator 3.3V supply node.
 
+  qcom,hs-disconnect-bp:
+    description:
+      This adjusts the voltage level for the threshold used to
+      detect a disconnect event at the host.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+    minimum: -272
+    maximum: 2156
+
+  qcom,squelch-detector-bp:
+    description:
+      This adjusts the voltage level for the threshold used to
+      detect valid high-speed data.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+    minimum: -2090
+    maximum: 1590
+
+  qcom,hs-amplitude-bp:
+    description:
+      This adjusts the high-speed DC level voltage.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+    minimum: -660
+    maximum: 2670
+
+  qcom,pre-emphasis-duration-bp:
+    description:
+      This signal controls the duration for which the
+      HS pre-emphasis current is sourced onto DP<#> or DM<#>.
+      The HS Transmitter pre-emphasis duration is defined in terms of
+      unit amounts. One unit of pre-emphasis duration is approximately
+      650 ps and is defined as 1X pre-emphasis duration.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+    minimum: 10000
+    maximum: 20000
+
+  qcom,pre-emphasis-amplitude-bp:
+    description:
+      This signal controls the amount of current sourced to
+      DP<#> and DM<#> after a J-to-K or K-to-J transition.
+      The HS Transmitter pre-emphasis current is defined in terms of unit
+      amounts. One unit amount is approximately 2 mA and is defined as
+      1X pre-emphasis current.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+    minimum: 10000
+    maximum: 40000
+
+  qcom,hs-rise-fall-time-bp:
+    description:
+      This adjusts the rise/fall times of the high-speed waveform.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+    minimum: -4100
+    maximum: 5430
+
+  qcom,hs-crossover-voltage-microvolt:
+    description:
+      This adjusts the voltage at which the DP<#> and DM<#>
+      signals cross while transmitting in HS mode.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+    minimum: -31000
+    maximum: 28000
+
+  qcom,hs-output-impedance-micro-ohms:
+    description:
+      In some applications, there can be significant series resistance
+      on the D+ and D- paths between the transceiver and cable. This adjusts
+      the driver source impedance to compensate for added series
+      resistance on the USB. The hardware accepts only discrete values. The
+      value closest to the provided input will be chosen as the override value
+      for this param.
+    minimum: -2300000
+    maximum: 6100000
+
+  qcom,ls-fs-output-impedance-bp:
+    description:
+      This adjusts the low- and full-speed single-ended source
+      impedance while driving high. The following adjustment values are based
+      on nominal process, voltage, and temperature.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+    minimum: -1053
+    maximum: 1310
+
 required:
   - compatible
   - reg
-- 
2.7.4

