Return-Path: <linux-usb+bounces-3963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54980C919
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 13:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1507BB20FA9
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 12:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B4E3985D;
	Mon, 11 Dec 2023 12:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cJrhGm0m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AFFA9;
	Mon, 11 Dec 2023 04:11:46 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBC97TA008390;
	Mon, 11 Dec 2023 12:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=jfSzZRJ
	apzDvSXGI50ehotgDMLNecCaroJgqyOMV6Qs=; b=cJrhGm0mEvhEk5qS41PdNTg
	nXIUv/ZYFb+7KLlax1mrMhE5qTjLirn17jvtLAYbgUHw1tXcMTOsyw3vlxy2nVPJ
	m/d3JXsGjSUj7yZOT6DDkUL4hyJ9jmckk1Hf3Dx6jldMxlTT+L/lIljdseG167Cs
	LP4JICAPLOicwO2WEZzUsn2ME5jtrCuQQA0qmbTdQ/V6kKageBmTqwIIVBPTcr96
	HPFd5EScqYhigR4Xm966wZzDde9Xb1Z541LiYoqIEQBYpIWhIyLns7uF3m9MdynK
	JrRJhxGsZ82M4OzP0oGuNrJKrSWHovh/mhL3WJWNR951G9Q4+3fYQoZSMNsyc+g=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux25xg053-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 12:11:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBCBcVI011749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 12:11:38 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 04:11:33 -0800
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
        Johan Hovold <johan@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>
Subject: [PATCH v3 0/2] Refine USB interrupt vectors on Qualcomm platforms
Date: Mon, 11 Dec 2023 17:41:22 +0530
Message-ID: <20231211121124.4194-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.42.0
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
X-Proofpoint-ORIG-GUID: x_vb-P2GzOmAT0sLOJMFL79WA-rBgnxf
X-Proofpoint-GUID: x_vb-P2GzOmAT0sLOJMFL79WA-rBgnxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 lowpriorityscore=0
 mlxlogscore=894 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110098

Qualcomm targets define the following interrupts for usb wakeup:
{dp/dm}_hs_phy_irq, hs_phy_irq, pwr_event, ss_phy_irq.

But QUSB2 Phy based targets have another interrupt which gets triggered
in response to J/K states on dp/dm pads. Its functionality is replaced
by dp/dm interrupts on Femto/m31/eusb2 phy based targets for wakeup
purposes. Exceptions are some targets like SDM845/SDM670/SM6350 where
dp/dm irq's are used although they are qusb2 phy targets.

Currently in QUSB2 Phy based DT's, te qusb2_phy interrupt is named and
used as "hs_phy_irq" when in fact it is a different interrupt (used by
HW validation folks for debug purposes and not used on any downstream
target qusb/non-qusb).

On some non-QUSB2 targets (like sm8450/sm8550), the pwr_event IRQ was
named as hs_phy_irq and actual pwr_event_irq was skipped.

This series tries to address the discrepancies in the interrupt numbering
adding the missing interrupts and correcting the existing ones.

This series has been compared with downstream counter part and hw specifics
to ensure the numbering is right. Since there is not functionality change
the code has been only compile tested.

Changes in v3:
Separated out the DT changes and pushed only bindings and driver update.
Modified order of irq descriptions to match them with permutations defined.
Fixed nitpicks mentioned by reviewers in v2.

Changes in v2:
Removed additional compatibles added for different targets in v1.
Specified permuations of interrupts possible for QC targets and regrouped
interrupts for most of the DT's.

Link to v2:
https://lore.kernel.org/all/20231204100950.28712-1-quic_kriskura@quicinc.com/

Link to v1: (providing patchwork link since threading was broken in v1)
https://patchwork.kernel.org/project/linux-arm-msm/cover/20231122191259.3021-1-quic_kriskura@quicinc.com/

Krishna Kurapati (2):
  dt-bindings: usb: dwc3: Clean up hs_phy_irq in bindings
  usb: dwc3: qcom: Rename hs_phy_irq to qusb2_phy_irq

 .../devicetree/bindings/usb/qcom,dwc3.yaml    | 138 ++++++++----------
 drivers/usb/dwc3/dwc3-qcom.c                  |  22 +--
 2 files changed, 70 insertions(+), 90 deletions(-)

-- 
2.42.0


