Return-Path: <linux-usb+bounces-3097-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CC67F300C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 15:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 188C028274E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 14:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E590E54F84;
	Tue, 21 Nov 2023 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fyJMavU9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B535B9A;
	Tue, 21 Nov 2023 06:00:37 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALDxTvE003796;
	Tue, 21 Nov 2023 14:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=wZWK4HHl5K/RbV8IOMstnMkJHrhsT6sum4v536nDEYU=;
 b=fyJMavU9twOxBV4sdflsw2E8E9Q2xF59UztXG6wYT6UiKsUxWJ8T7kGbV+/K24ATHWxS
 UmhNs/w6jegKsIEVJnwVE9u9LKglBeKgLkjB8u1Pws5/DHz3pah8sgjZyW9doTFEIC4T
 x44Z3tXsmAMBlSX59slcwaqaz7NXMmQnEc2q+yDobRgHQfTJoL0V8hnAYAPp1mNu5xlq
 0CGzqmfI0iUsS2tzuN6/UVkjtfUVa+clZWzdT0/4rbv370qquN6J6TxK6pjoB+TOzCtB
 ZS+riP0SF6xsoj8tyEuL9IpxAeoV0zm4j8DGvHvFpWrL0rUtZmH5Sd61lQyenOaO07XF wQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugk9p9vk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 14:00:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALE0VxX010666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 14:00:31 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 06:00:28 -0800
From: Prashanth K <quic_prashk@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Prashanth K <quic_prashk@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH] usb: dwc3: core: Add support for XHCI_SG_TRB_CACHE_SIZE_QUIRK
Date: Tue, 21 Nov 2023 19:29:36 +0530
Message-ID: <20231121135936.1669167-1-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z9ZWNIVSetwzOy6-QSt1Qc2bcTsw0Vu8
X-Proofpoint-ORIG-GUID: Z9ZWNIVSetwzOy6-QSt1Qc2bcTsw0Vu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_05,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311210109

Upstream commit bac1ec551434 ("usb: xhci: Set quirk for
XHCI_SG_TRB_CACHE_SIZE_QUIRK") introduced a new quirk in XHCI
which fixes XHC timeout, which was seen on synopsys XHCs while
using SG buffers. But the support for this quirk isn't present
in the DWC3 layer.

We will encounter this XHCI timeout/hung issue if we run iperf
loopback tests using RTL8156 ethernet adaptor on DWC3 targets
with scatter-gather enabled. This gets resolved after enabling
the XHCI_SG_TRB_CACHE_SIZE_QUIRK. This patch enables it using
the xhci_priv_data since its needed for DWC3 controller.

In Synopsys DWC3 databook,
Table 9-3: xHCI Debug Capability Limitations
Chained TRBs greater than TRB cache size: The debug capability
driver must not create a multi-TRB TD that describes smaller
than a 1K packet that spreads across 8 or more TRBs on either
the IN TR or the OUT TR

More information about this XHCI quirk is mentioned on the
following thread.
https://lore.kernel.org/all/20201208092912.1773650-3-mathias.nyman@linux.intel.com/

Cc: <stable@vger.kernel.org> # 5.11
Fixes: bac1ec551434 ("usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK")
Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
---
 drivers/usb/dwc3/host.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 61f57fe5bb78..ee3b667a88b2 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
+#include "../host/xhci-plat.h"
 #include "core.h"
 
 static void dwc3_host_fill_xhci_irq_res(struct dwc3 *dwc,
@@ -63,6 +64,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 {
 	struct property_entry	props[4];
 	struct platform_device	*xhci;
+	struct xhci_plat_priv   dwc3_xhci_plat_priv;
 	int			ret, irq;
 	int			prop_idx = 0;
 
@@ -87,6 +89,14 @@ int dwc3_host_init(struct dwc3 *dwc)
 		goto err;
 	}
 
+	memset(&dwc3_xhci_plat_priv, 0, sizeof(struct xhci_plat_priv));
+
+	dwc3_xhci_plat_priv.quirks |= XHCI_SG_TRB_CACHE_SIZE_QUIRK;
+	ret = platform_device_add_data(xhci, &dwc3_xhci_plat_priv,
+					sizeof(dwc3_xhci_plat_priv));
+	if (ret)
+		goto err;
+
 	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
 
 	if (dwc->usb3_lpm_capable)
-- 
2.25.1


