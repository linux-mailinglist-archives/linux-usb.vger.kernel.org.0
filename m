Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52730737A45
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 06:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjFUEiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 00:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjFUEiG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 00:38:06 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5132D19B0;
        Tue, 20 Jun 2023 21:37:46 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L2RTEt012783;
        Wed, 21 Jun 2023 04:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=SuTZ0i5LCDP/+sFCgTj/7QgjMLIAsGT0wHWMWcFD/6g=;
 b=b62JSsoYjuxFBNcb2H+Opn9gzeIYaQAVzffQ4amcdN7AuYmHKx5lPP4QCulORPumYHtQ
 AlHWBFc1Z3gS8KXmWoDihLf5+j8rVJr1UW3rY7fN7KYiSjhiRHmUFxYNC5YRVseUomOw
 LiRMeKRFh8VXENQw49/JoXTA9dMy8SWtmNOMM1n90v0Rla4nxCJdvn/caDAfJAJOxHLc
 M00ZJYgSZ5ey7hwsGji3FNPrn1Z3nyLhr4wFPOPzQvFfGCP1V8Vd89bYCFINM45IwftB
 0aVdnEYghxsJUYMjqxr3GqrBvwP+4IPkMX3+3PikkU3AC58EkKJZ+YLPVvJFAwayl5ka zA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rbqkh097h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Jun 2023 04:37:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35L4bQn5008131
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Jun 2023 04:37:26 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 20 Jun 2023 21:37:19 -0700
From:   Krishna Kurapati <quic_kriskura@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Andy Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, <quic_harshq@quicinc.com>,
        <ahalaney@redhat.com>, <quic_shazhuss@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v9 06/10] usb: dwc3: qcom: Add support to read IRQ's related to multiport
Date:   Wed, 21 Jun 2023 10:06:24 +0530
Message-ID: <20230621043628.21485-7-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230621043628.21485-1-quic_kriskura@quicinc.com>
References: <20230621043628.21485-1-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HDkK4911H5kz9TN4EX080gVWQhcpkU3Y
X-Proofpoint-GUID: HDkK4911H5kz9TN4EX080gVWQhcpkU3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_03,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=761
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306210039
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support to read Multiport IRQ's related to quad port controller
of SA8295 Device.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 108 +++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 3de43df6bbe8..3ab48a6925fe 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -74,9 +74,9 @@ struct dwc3_qcom {
 	struct reset_control	*resets;
 
 	int			hs_phy_irq;
-	int			dp_hs_phy_irq;
-	int			dm_hs_phy_irq;
-	int			ss_phy_irq;
+	int			dp_hs_phy_irq[4];
+	int			dm_hs_phy_irq[4];
+	int			ss_phy_irq[2];
 	enum usb_device_speed	usb2_speed;
 
 	struct extcon_dev	*edev;
@@ -375,16 +375,16 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
 
 	if (qcom->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq[0]);
 	} else if ((qcom->usb2_speed == USB_SPEED_HIGH) ||
 			(qcom->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq[0]);
 	} else {
-		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
-		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq[0]);
+		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq[0]);
 	}
 
-	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
+	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq[0]);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -401,20 +401,20 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	 */
 
 	if (qcom->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq,
+		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq[0],
 						IRQ_TYPE_EDGE_FALLING);
 	} else if ((qcom->usb2_speed == USB_SPEED_HIGH) ||
 			(qcom->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq,
+		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq[0],
 						IRQ_TYPE_EDGE_FALLING);
 	} else {
-		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq,
+		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq[0],
 						IRQ_TYPE_EDGE_RISING);
-		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq,
+		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq[0],
 						IRQ_TYPE_EDGE_RISING);
 	}
 
-	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq, 0);
+	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq[0], 0);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -535,6 +535,80 @@ static int dwc3_qcom_get_irq(struct platform_device *pdev,
 	return ret;
 }
 
+static int dwc3_qcom_setup_mp_irq(struct platform_device *pdev)
+{
+	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	char irq_name[15];
+	int irq;
+	int ret;
+	int i;
+
+	for (i = 0; i < 4; i++) {
+		if (qcom->dp_hs_phy_irq[i])
+			continue;
+
+		sprintf(irq_name, "dp%d_hs_phy_irq", i+1);
+		irq = dwc3_qcom_get_irq(pdev, irq_name, -1);
+		if (irq > 0) {
+			irq_set_status_flags(irq, IRQ_NOAUTOEN);
+			ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
+					qcom_dwc3_resume_irq,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					irq_name, qcom);
+			if (ret) {
+				dev_err(qcom->dev, "%s failed: %d\n", irq_name, ret);
+				return ret;
+			}
+		}
+
+		qcom->dp_hs_phy_irq[i] = irq;
+	}
+
+	for (i = 0; i < 4; i++) {
+		if (qcom->dm_hs_phy_irq[i])
+			continue;
+
+		sprintf(irq_name, "dm%d_hs_phy_irq", i+1);
+		irq = dwc3_qcom_get_irq(pdev, irq_name, -1);
+		if (irq > 0) {
+			irq_set_status_flags(irq, IRQ_NOAUTOEN);
+			ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
+					qcom_dwc3_resume_irq,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					irq_name, qcom);
+			if (ret) {
+				dev_err(qcom->dev, "%s failed: %d\n", irq_name, ret);
+				return ret;
+			}
+		}
+
+		qcom->dm_hs_phy_irq[i] = irq;
+	}
+
+	for (i = 0; i < 2; i++) {
+		if (qcom->ss_phy_irq[i])
+			continue;
+
+		sprintf(irq_name, "ss%d_phy_irq", i+1);
+		irq = dwc3_qcom_get_irq(pdev, irq_name, -1);
+		if (irq > 0) {
+			irq_set_status_flags(irq, IRQ_NOAUTOEN);
+			ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
+					qcom_dwc3_resume_irq,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					irq_name, qcom);
+			if (ret) {
+				dev_err(qcom->dev, "%s failed: %d\n", irq_name, ret);
+				return ret;
+			}
+		}
+
+		qcom->ss_phy_irq[i] = irq;
+	}
+
+	return 0;
+}
+
 static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 {
 	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
@@ -570,7 +644,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 			dev_err(qcom->dev, "dp_hs_phy_irq failed: %d\n", ret);
 			return ret;
 		}
-		qcom->dp_hs_phy_irq = irq;
+		qcom->dp_hs_phy_irq[0] = irq;
 	}
 
 	irq = dwc3_qcom_get_irq(pdev, "dm_hs_phy_irq",
@@ -585,7 +659,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 			dev_err(qcom->dev, "dm_hs_phy_irq failed: %d\n", ret);
 			return ret;
 		}
-		qcom->dm_hs_phy_irq = irq;
+		qcom->dm_hs_phy_irq[0] = irq;
 	}
 
 	irq = dwc3_qcom_get_irq(pdev, "ss_phy_irq",
@@ -600,10 +674,10 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 			dev_err(qcom->dev, "ss_phy_irq failed: %d\n", ret);
 			return ret;
 		}
-		qcom->ss_phy_irq = irq;
+		qcom->ss_phy_irq[0] = irq;
 	}
 
-	return 0;
+	return dwc3_qcom_setup_mp_irq(pdev);;
 }
 
 static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
-- 
2.40.0

