Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9603C6A941A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Mar 2023 10:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjCCJ3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 04:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjCCJ3a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 04:29:30 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D135D758
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 01:29:07 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3236PIeY022309;
        Fri, 3 Mar 2023 09:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=nrlhM3i78s17zqmj3BPjZcGstleb700rbUf9g9EG2YI=;
 b=CpJ2TeDqePWiMfMKBbABlexjsgrdtf/OLeZU9dex5yp13XM5I6JhanDZIaLCol816rKD
 /l2Jg1CT3n6eSw+8EBLMtkyTQ5qwp4gCQduVCS5s1MXperiVXjVicAROqQY3Zd4s4Agw
 IurjoOhQPYPdbE00mclWkTym7Oq2pL8xNW9h1kCu8Yvsl1MqPt9mgFUW3hm+Y1FicTQy
 DnWdO+51EPCapwfesVincfuH4vnYjtct8zZrnCXU1hFfbI/BUGb0/g1zlOKbujolGUHo
 Ewxu9/imiLijK8CG290Ky1eZejISalrTPQzmvbhM6lU0Eq60YOOLHr1DNyaclvX79sgq LA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p33g59jvx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Mar 2023 09:28:47 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3239SkxL015930
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Mar 2023 09:28:46 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 3 Mar 2023 01:28:43 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [RFC PATCH 1/2] usb: urb: show pipe information of warning message in usb_submit_urb()
Date:   Fri, 3 Mar 2023 17:28:37 +0800
Message-ID: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iCOxjm8-jE8GOTr7Zca6v_U97tMm2fhZ
X-Proofpoint-ORIG-GUID: iCOxjm8-jE8GOTr7Zca6v_U97tMm2fhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_01,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=591 mlxscore=0 adultscore=0 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030083
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

it will show the urb information for debugging.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/core/urb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 9f3c540..b258203 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -376,7 +376,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 	if (!urb || !urb->complete)
 		return -EINVAL;
 	if (urb->hcpriv) {
-		WARN_ONCE(1, "URB %pK submitted while active\n", urb);
+		WARN_ONCE(1, "URB %pK pipe %x submitted while active\n", urb, urb->pipe);
 		return -EBUSY;
 	}
 
-- 
2.7.4

