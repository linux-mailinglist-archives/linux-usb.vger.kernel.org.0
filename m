Return-Path: <linux-usb+bounces-1082-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E8E7B85FE
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 18:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by am.mirrors.kernel.org (Postfix) with ESMTP id 676D81F22B89
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 16:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF2B1C69F;
	Wed,  4 Oct 2023 16:59:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0DB1B280
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 16:59:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635A0C0;
	Wed,  4 Oct 2023 09:59:49 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394F9Khj024467;
	Wed, 4 Oct 2023 16:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=kDbWc4nPrDPUhQfmBw9M6AX7z88/FkA6DUIrexSfINM=;
 b=R6LXsOZK0swkei79orOrlnrAuVpshr2LxjQz29biKy5AMXcrTacrHnH7Jr6C1vUVla6b
 30591Cfw5FqLepaU/V7JT5/PFrquIhJvh1c5ytQ0P9pTuM1uIUFxui9NNQvUE222yBia
 dekq7rxHbAQ8FvxTwIO5tq0W4inryGetgaEHi+Xo14u9Nlubi7Llon9a8dX9N6v5h004
 WVRaccXYqDomm21NRnTFpz27LYY/1AlBylEq7BVXPYQFfiLQ8EStOXTgvw0aZxaEIgdN
 gp5A2r1hI1vNauFf97yRmkPJpx+85PGnkmjDo7944RVxEKiAQeX11qaA3MRgFf7k37gQ Kw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3th2gq1kjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 16:59:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 394GxZNA005964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 16:59:35 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 4 Oct 2023 09:59:32 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_wcheng@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v12 0/3] Add multiport support for DWC3 controllers
Date: Wed, 4 Oct 2023 22:29:19 +0530
Message-ID: <20231004165922.25642-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5n6QE46MHsbO736jwSf0Ujto0EfzSe2L
X-Proofpoint-ORIG-GUID: 5n6QE46MHsbO736jwSf0Ujto0EfzSe2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_08,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=991 mlxscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040123
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This series is a set of picked up acks and split from larger series [1]
The series is rebased on top of:
Repo: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
Branch: usb-testing
commit 03cf2af41b37 ("Revert "phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY support"")

The patches present in series have been reviewed and acked by respective
maintainers. They dont break any existing implementation and is just a
subset of merge ready multiport code. The rest of the patches will be
rebased on top of the usb branch once this series is merged.

[1]: https://patchwork.kernel.org/project/linux-usb/cover/20230828133033.11988-1-quic_kriskura@quicinc.com/

Krishna Kurapati (3):
  usb: dwc3: core: Access XHCI address space temporarily to read port
    info
  usb: dwc3: core: Skip setting event buffers for host only controllers
  usb: dwc3: qcom: Add helper function to request threaded IRQ

 drivers/usb/dwc3/core.c      | 74 ++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h      |  5 +++
 drivers/usb/dwc3/dwc3-qcom.c | 59 +++++++++++++---------------
 3 files changed, 105 insertions(+), 33 deletions(-)

-- 
2.42.0


