Return-Path: <linux-usb+bounces-1710-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51E7CB8EC
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 05:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48FA01C20B4E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 03:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C241E8F4D;
	Tue, 17 Oct 2023 03:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lDTmy3l1"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F850881F;
	Tue, 17 Oct 2023 03:11:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D30A2;
	Mon, 16 Oct 2023 20:11:38 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39H2Nquv006762;
	Tue, 17 Oct 2023 03:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=MNXGvEf10653/N5xIcrOGLC+C8zGJJyFACJRaJYfGEg=;
 b=lDTmy3l1ZkO7YhJp0snBNhdIEP4vsaMXVgeREFuDU262uLdPs/cRS8QZqfZXJpEvHWQL
 Nh7Xge1pIJSN9KBVMKskUdyEADP5rnnn3ibK96pdUtGvz1ZrcWnCH4ZWmnwKIBISZEdz
 +uw95PEfiLEMCjfLTuweVC4KgBRcJp/ofCHC4qYKy3wi8Z63WCsfb+MxR0npogejIcSM
 /eCSGvuMpdE9xSZqKsqPw4FL08lrWRRd5cz8W8sy+DfKLIrdufhYjaGuA6zuLmq9V6AW
 avvuG8Lg6GIZspoo6uF+IiPWU8olDdIoadDV8FZepnpguTPsihziu1/4rTbHm/Xybw17 SA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsb3xrsw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 03:11:28 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39H3BSth019798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 03:11:28 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 16 Oct 2023 20:11:27 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Mon, 16 Oct 2023 20:11:13 -0700
Subject: [PATCH 05/12] usb: dwc3: Override end of dwc3 memory resource
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231016-dwc3-refactor-v1-5-ab4a84165470@quicinc.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
In-Reply-To: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Johan Hovold
	<johan@kernel.org>,
        Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        "Bjorn Andersson" <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697512286; l=1343;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=4ByQtscgIuXobW3tBd9iMIYEH2Ce3Mpl6PM5qI/h1Fg=;
 b=odaXcdLrYaKv51u0qAhLm78Ut1bJ+G0V3B+ARYE8welkw9Da8z8T4eJfsrHrlFo2Fs/aRdzgcMJY
 UMU68UMVDlfYn9vt75FVCggmloTni90PP9Xe8XLQQFTe72rjyhqy
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: enENIzW7x6Fd0viYhxdVr8kLZYBCoKma
X-Proofpoint-ORIG-GUID: enENIzW7x6Fd0viYhxdVr8kLZYBCoKma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxlogscore=956 malwarescore=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310170026
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

In the case that the dwc3 core driver is instantiated from the same
memory resource information as the glue driver, the dwc_res memory
region will overlap with the memory region already mapped by the glue.

As the DWC3 core driver already does math on the passed memory region to
exclude the XHCI region, also adjust the end address, to avoid having to
pass an adjusted region from the glue explicitly.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/usb/dwc3/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 71e376bebb16..5d86b803fab0 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1908,6 +1908,7 @@ struct dwc3 *dwc3_probe(struct platform_device *pdev)
 	 */
 	dwc_res = *res;
 	dwc_res.start += DWC3_GLOBALS_REGS_START;
+	dwc_res.end = res->start + DWC3_OTG_REGS_END;
 
 	if (dev->of_node) {
 		struct device_node *parent = of_get_parent(dev->of_node);
@@ -1915,6 +1916,7 @@ struct dwc3 *dwc3_probe(struct platform_device *pdev)
 		if (of_device_is_compatible(parent, "realtek,rtd-dwc3")) {
 			dwc_res.start -= DWC3_GLOBALS_REGS_START;
 			dwc_res.start += DWC3_RTK_RTD_GLOBALS_REGS_START;
+			dwc_res.end = dwc_res.start + DWC3_OTG_REGS_END;
 		}
 
 		of_node_put(parent);

-- 
2.25.1


