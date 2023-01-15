Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB1266B0C4
	for <lists+linux-usb@lfdr.de>; Sun, 15 Jan 2023 12:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbjAOLmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Jan 2023 06:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbjAOLmh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Jan 2023 06:42:37 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E5E10AB4;
        Sun, 15 Jan 2023 03:42:27 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30FBfYoR031326;
        Sun, 15 Jan 2023 11:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=PNdGxiik0YwLZud8eZQUu8pnCZrUdYV3P2gpgyxIOvY=;
 b=khz1mQiA5TmjbACNUrtVeoo95LDICa6w70nyKW5qKLfa0I/qNwZ3WT0RbjKh1EmxDWtF
 AaXpN6F86GSQULFSb0PVa3VqTMffw6U3RxTX62M4G3MBGZHTkJsd1HQcpV1y5cjh71O8
 r8iAhXTRbel26m7QaKG6sti+ChU/xUGpsOIrHyX6TonEEOFMLfQARBcz6RjR3I60bVNA
 gAuTEtiCooCryOtMIH6tCH+KGlscCDwpYtt/g/wRCPkd0/WDHLjEaYQ8la5uEfeHQ9Mb
 Pxs1psdBZOSOEDdngYd6HPdyR72pQIpkboRwNEWM2SWEH+zIUgMYyCZYIsELXjj9wq55 hw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n3hrwa37u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 15 Jan 2023 11:42:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30FBgJDS020044
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 15 Jan 2023 11:42:19 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 15 Jan 2023 03:42:13 -0800
From:   Krishna Kurapati <quic_kriskura@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Andy Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>,
        <quic_wcheng@quicinc.com>, <quic_jackp@quicinc.com>,
        <quic_harshq@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [RFC v4 3/5] usb: dwc3: core: Do not setup event buffers for host only controllers
Date:   Sun, 15 Jan 2023 17:11:44 +0530
Message-ID: <20230115114146.12628-4-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115114146.12628-1-quic_kriskura@quicinc.com>
References: <20230115114146.12628-1-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WWQlkn-AY0E0G02pHc3SH2SVn9z-uuQ9
X-Proofpoint-ORIG-GUID: WWQlkn-AY0E0G02pHc3SH2SVn9z-uuQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 mlxlogscore=724
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301150089
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Multiport controllers being host-only capable do not have GEVNTADDR
HI/LO, SIZE, COUNT reigsters present. Accsesing them to setup event
buffers during core_init can cause an SMMU Fault. Avoid event buffers
setup if the GHWPARAMS0 tells that the controller is host-only.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 drivers/usb/dwc3/core.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7e0a9a598dfd..f61ebddaecc0 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -871,9 +871,12 @@ static void dwc3_clk_disable(struct dwc3 *dwc)
 
 static void dwc3_core_exit(struct dwc3 *dwc)
 {
-	int i;
+	int		i;
+	unsigned int	hw_mode;
 
-	dwc3_event_buffers_cleanup(dwc);
+	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
+	if (hw_mode != DWC3_GHWPARAMS0_MODE_HOST)
+		dwc3_event_buffers_cleanup(dwc);
 
 	usb_phy_set_suspend(dwc->usb2_phy, 1);
 	usb_phy_set_suspend(dwc->usb3_phy, 1);
@@ -1246,10 +1249,12 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		}
 	}
 
-	ret = dwc3_event_buffers_setup(dwc);
-	if (ret) {
-		dev_err(dwc->dev, "failed to setup event buffers\n");
-		goto err4;
+	if (hw_mode != DWC3_GHWPARAMS0_MODE_HOST) {
+		ret = dwc3_event_buffers_setup(dwc);
+		if (ret) {
+			dev_err(dwc->dev, "failed to setup event buffers\n");
+			goto err4;
+		}
 	}
 
 	/*
@@ -1886,7 +1891,7 @@ static int dwc3_probe(struct platform_device *pdev)
 	struct resource		*res, dwc_res;
 	struct dwc3		*dwc;
 	int			ret, i;
-
+	unsigned int		hw_mode;
 	void __iomem		*regs;
 
 	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
@@ -2063,7 +2068,9 @@ static int dwc3_probe(struct platform_device *pdev)
 err5:
 	dwc3_debugfs_exit(dwc);
 
-	dwc3_event_buffers_cleanup(dwc);
+	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
+	if (hw_mode != DWC3_GHWPARAMS0_MODE_HOST)
+		dwc3_event_buffers_cleanup(dwc);
 
 	usb_phy_set_suspend(dwc->usb2_phy, 1);
 	usb_phy_set_suspend(dwc->usb3_phy, 1);
-- 
2.39.0

