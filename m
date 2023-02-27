Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713F06A38FE
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 03:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjB0CrH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 21:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjB0CrE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 21:47:04 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC159FF38
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 18:46:44 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R1IQLq027322;
        Mon, 27 Feb 2023 02:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=56PyRZCn44LGsirY2GJJc8lDOvRgeLd7j7RHndOYmBw=;
 b=fyfKJc7RrdVikAZhtGuAiwviGlPGLI2gDtjF+ui1mVeaQYP7XsF1sFUHabvikKt897yr
 cNyU8a1O7jmZFN7huomKc+2yU5l5xwa3ljdxop9S4rAuUxJcnmvpBujZOyqf11XFPIEa
 j02jMv37LmMpKeTrf+wym8q6VjW6t32IPVZdfeBqQA/gEhs1EB3jFCg4BSXR+0+QvBDR
 3JBsidJW9aftboePSqNMN/gs3Qk4AdWnDYTKRESqKeqXBVt3r5bT7MhzlAXu1aUU1dso
 A+GLrvqHbKRX7fERoYsFfuatWZ5cP3eDas9pG/IKUUo13+qlGER995+kjnTBDd8bni3Q UA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny81qbpst-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:30:18 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31R2UI1P027079
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:30:18 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Sun, 26 Feb 2023 18:30:14 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        "Pawel Laszczak" <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        "Aswath Govindraju" <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 3/4] usb: dwc3: change some trace event __dynamic_array() to __get_buf()
Date:   Mon, 27 Feb 2023 10:29:53 +0800
Message-ID: <1677464994-32409-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1677464994-32409-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1677464994-32409-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5eNxm33RdVS4IW_MhTz6wtIjlgCqajxh
X-Proofpoint-GUID: 5eNxm33RdVS4IW_MhTz6wtIjlgCqajxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=594 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270017
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

some __dynamic_array() buffer will only used at trace event output time,
change to __get_buf() which will allocate tempary trace seq buffer for
output purpose.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/dwc3/trace.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index 1975aec..d2997d1 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -54,14 +54,13 @@ DECLARE_EVENT_CLASS(dwc3_log_event,
 	TP_STRUCT__entry(
 		__field(u32, event)
 		__field(u32, ep0state)
-		__dynamic_array(char, str, DWC3_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->event = event;
 		__entry->ep0state = dwc->ep0state;
 	),
 	TP_printk("event (%08x): %s", __entry->event,
-			dwc3_decode_event(__get_str(str), DWC3_MSG_MAX,
+			dwc3_decode_event(__get_buf(DWC3_MSG_MAX), DWC3_MSG_MAX,
 					__entry->event, __entry->ep0state))
 );
 
@@ -79,7 +78,6 @@ DECLARE_EVENT_CLASS(dwc3_log_ctrl,
 		__field(__u16, wValue)
 		__field(__u16, wIndex)
 		__field(__u16, wLength)
-		__dynamic_array(char, str, DWC3_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->bRequestType = ctrl->bRequestType;
@@ -88,7 +86,7 @@ DECLARE_EVENT_CLASS(dwc3_log_ctrl,
 		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
 		__entry->wLength = le16_to_cpu(ctrl->wLength);
 	),
-	TP_printk("%s", usb_decode_ctrl(__get_str(str), DWC3_MSG_MAX,
+	TP_printk("%s", usb_decode_ctrl(__get_buf(DWC3_MSG_MAX), DWC3_MSG_MAX,
 					__entry->bRequestType,
 					__entry->bRequest, __entry->wValue,
 					__entry->wIndex, __entry->wLength)
-- 
2.7.4

