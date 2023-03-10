Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A6E6B4D38
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 17:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjCJQhq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 11:37:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjCJQhR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 11:37:17 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CBE28E51;
        Fri, 10 Mar 2023 08:35:17 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32AEnNlo007460;
        Fri, 10 Mar 2023 16:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=GD0GBOWSy1Lo2I8vj4R9ejMOUZ8Vuu12h4M1yNOA7yE=;
 b=NqdkcLbbc/ZA/q4u/x66g+nFwj6LFSE239bLEbNOm2kI1rGdpl6JcZx8tFfDJSaoXUWJ
 JVz/97Vy834EeVVxUUCEmTHbQhPGFbXLnrsjY/h6O90TwgTww22qMYCiEt9YlqNDUJef
 pAjS4eslFFz87tSlD8k6HwZDD23IKBfXgooLNIkxz3eavQA8ENgzIBiYFgg4tmGBbi/n
 6BIo3HpSA+on/YXu5SSVQeyg0XEveUGgyGSmeNzrW9Ew0FQNiqDyLAtsxRA1CW1S5DAW
 k3AWvdMGzv3rBI0673rO0NkLvCvHhrFIy2rCbmwcIy6k9gH+Zx+39U2lz7SGe/XpRy+f 1Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p7nh2jnwk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Mar 2023 16:34:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32AGYm1K028637
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Mar 2023 16:34:48 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 10 Mar 2023 08:34:42 -0800
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
        <quic_harshq@quicinc.com>, <ahalaney@redhat.com>,
        <quic_shazhuss@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 2/8] usb: dwc3: core: Access XHCI address space temporarily to read port info
Date:   Fri, 10 Mar 2023 22:04:14 +0530
Message-ID: <20230310163420.7582-3-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310163420.7582-1-quic_kriskura@quicinc.com>
References: <20230310163420.7582-1-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D5dALmr9OtVz3LG7-Fpkrf89ZAqV6PKE
X-Proofpoint-GUID: D5dALmr9OtVz3LG7-Fpkrf89ZAqV6PKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_07,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100129
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently host-only capable DWC3 controllers support Multiport. Temporarily
map XHCI address space for host-only controllers and parse XHCI Extended
Capabilities registers to read number of physical usb ports connected to the
multiport controller (presuming each port is at least HS capable) and extract
info on how many of these ports are Super Speed capable.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 drivers/usb/dwc3/core.c | 75 +++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  9 +++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 476b63618511..076c0f8a4441 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -37,6 +37,7 @@
 #include "core.h"
 #include "gadget.h"
 #include "io.h"
+#include "../host/xhci.h"
 
 #include "debug.h"
 
@@ -1750,6 +1751,65 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 	return edev;
 }
 
+static int dwc3_read_port_info(struct dwc3 *dwc, struct resource *res)
+{
+	void __iomem		*regs;
+	struct resource         dwc_res;
+	u32			offset;
+	u32			temp;
+	u8			major_revision;
+	int			ret = 0;
+
+	/*
+	 * Remap xHCI address space to access XHCI ext cap regs,
+	 * since it is needed to get port info.
+	 */
+	dwc_res = *res;
+	dwc_res.start += 0;
+	dwc_res.end = dwc->xhci_resources[0].start +
+				DWC3_XHCI_REGS_END;
+
+	regs = ioremap(dwc_res.start, resource_size(&dwc_res));
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	offset = xhci_find_next_ext_cap(regs, 0,
+					XHCI_EXT_CAPS_PROTOCOL);
+	while (offset) {
+		temp = readl(regs + offset);
+		major_revision = XHCI_EXT_PORT_MAJOR(temp);
+
+		temp = readl(regs + offset + 0x08);
+		if (major_revision == 0x03) {
+			dwc->num_ss_ports += XHCI_EXT_PORT_COUNT(temp);
+		} else if (major_revision <= 0x02) {
+			dwc->num_ports += XHCI_EXT_PORT_COUNT(temp);
+		} else {
+			dev_err(dwc->dev, "port revision seems wrong\n");
+			ret = -EINVAL;
+			goto unmap_reg;
+		}
+
+		offset = xhci_find_next_ext_cap(regs, offset,
+						XHCI_EXT_CAPS_PROTOCOL);
+	}
+
+	temp = readl(regs + DWC3_XHCI_HCSPARAMS1);
+	if (HCS_MAX_PORTS(temp) != (dwc->num_ss_ports + dwc->num_ports)) {
+		dev_err(dwc->dev, "inconsistency in port info\n");
+		ret = -EINVAL;
+		goto unmap_reg;
+	}
+
+	dev_info(dwc->dev,
+		"num-ports: %d ss-capable: %d\n", dwc->num_ports, dwc->num_ss_ports);
+
+unmap_reg:
+	iounmap(regs);
+	return ret;
+}
+
 static int dwc3_probe(struct platform_device *pdev)
 {
 	struct device		*dev = &pdev->dev;
@@ -1757,6 +1817,7 @@ static int dwc3_probe(struct platform_device *pdev)
 	struct dwc3		*dwc;
 
 	int			ret;
+	unsigned int		hw_mode;
 
 	void __iomem		*regs;
 
@@ -1880,6 +1941,20 @@ static int dwc3_probe(struct platform_device *pdev)
 			goto disable_clks;
 	}
 
+	/*
+	 * Currently DWC3 controllers that are host-only capable
+	 * support Multiport.
+	 */
+	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
+	if (hw_mode == DWC3_GHWPARAMS0_MODE_HOST) {
+		ret = dwc3_read_port_info(dwc, res);
+		if (ret)
+			goto disable_clks;
+	} else {
+		dwc->num_ports = 1;
+		dwc->num_ss_ports = 1;
+	}
+
 	spin_lock_init(&dwc->lock);
 	mutex_init(&dwc->mutex);
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 582ebd9cf9c2..74386d6a0277 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -35,6 +35,9 @@
 
 #define DWC3_MSG_MAX	500
 
+/* XHCI Reg constants */
+#define DWC3_XHCI_HCSPARAMS1	0x04
+
 /* Global constants */
 #define DWC3_PULL_UP_TIMEOUT	500	/* ms */
 #define DWC3_BOUNCE_SIZE	1024	/* size of a superspeed bulk */
@@ -1023,6 +1026,10 @@ struct dwc3_scratchpad_array {
  * @usb_psy: pointer to power supply interface.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
+ * @num_ports: Indicates the number of physical USB ports present on HW
+ *		presuming each port is at least HS capable
+ * @num_ss_ports: Indicates the number of USB ports present on HW that are
+ *		SS Capable
  * @usb2_generic_phy: pointer to USB2 PHY
  * @usb3_generic_phy: pointer to USB3 PHY
  * @phys_ready: flag to indicate that PHYs are ready
@@ -1158,6 +1165,8 @@ struct dwc3 {
 	struct usb_phy		*usb2_phy;
 	struct usb_phy		*usb3_phy;
 
+	u32			num_ports;
+	u32			num_ss_ports;
 	struct phy		*usb2_generic_phy;
 	struct phy		*usb3_generic_phy;
 
-- 
2.39.0

