Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87C275AF0C2
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 18:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbiIFQoQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Sep 2022 12:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233926AbiIFQnN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Sep 2022 12:43:13 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEC190819;
        Tue,  6 Sep 2022 09:21:06 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286AkdmJ025337;
        Tue, 6 Sep 2022 16:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=kfJX+M3scL7IHo5EN9K4rObjASXUCJrfvhxRIb3Y6l4=;
 b=dFkU0mF2LAKfMh738pWVZH8+GPSd2Zk7KAkv//Pd5JRDXxuQwerh2LUJ/O1Cp5blT73L
 KfkAFU/ert42823Wu5l6PHqgp+1HoP9T8f1TZxiB5wAHnCIE7r/Rru9YuVeLW5vaXdxa
 MfigANXlS84oDEnXGLokDiWipaXK3T4cUxOiXXmv8rxwBnnyn0aaMUlHrbsmbOCX7TAG
 Wa++EUjCIIWqFM7797dnEdbpJb46ROlv4vA1JsbK8UCcxoeliAm2h5VCilUA4aj8uFoE
 n/Orxb0uOPNyRLoywyRgD//Bwk5P+61qdMA5ME9IDhGFmgThHYIZxIeVDPv057nkZg7f QA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jdusrjrkd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 16:20:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 286GFikY006956
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 6 Sep 2022 16:15:44 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 6 Sep 2022 09:15:37 -0700
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
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v13 0/3] Add QCOM SNPS PHY overriding params support
Date:   Tue, 6 Sep 2022 21:45:30 +0530
Message-ID: <1662480933-12326-1-git-send-email-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YQ_e0Sm582OGCU2jDQ99eP0L736jiznN
X-Proofpoint-ORIG-GUID: YQ_e0Sm582OGCU2jDQ99eP0L736jiznN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=554 malwarescore=0 suspectscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060076
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added support for overriding tuning parameters in QCOM SNPS PHY
from device tree. This parameter tuning is required to tune the
hs signal on dp/dm lines for electrical compliance to be successful.

Changes in v13:
Fixed NULL pointer check in driver code.

Changes in v12:
Fixed nitpicks in driver code.

Changes in v11:
Made changes to logs added in phy driver.
Fixed nitpicks in code.

Changes in v10:
Fixed patch headers.

changes in v9:
Fixed nitpick in driver code.

changes in v8:
Fixed nitpick in driver code.

changes in v7:
Fixed nitpick in driver code and dtsi file.

changes in v6:
Fixed errors in dt-bindings.
Fixed nitpick in driver code.

changes in v5:
Fixed nitpicks in code.
Added minimum and maximum for each parameter added in dt-bindings.
Added proper suffixes to each parameter as per dtschema.

changes in v4:
Fixed nitpicks in code.
Initial compliance test results showed overshoot in the middle of eye
diagram. The current dt values were put in place to correct it and fix
overshoot issue.

changes in v3:
Added support for phy tuning parameters to be represented in bps and
corresponding register values to be written are obtained by traversing
through data map declared in the driver.

changes in v2:
Reading the individual fields in each overriding register from
device tree.

Krishna Kurapati (2):
  phy: qcom-snps: Add support for overriding phy tuning parameters
  arm64: dts: qcom: sc7280: Update SNPS Phy params for SC7280 IDP device

Sandeep Maheswaram (1):
  dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy override params
    bindings

 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |  88 +++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   6 +
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 255 ++++++++++++++++++++-
 3 files changed, 347 insertions(+), 2 deletions(-)

-- 
2.7.4

