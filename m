Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB9965FDD7
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 10:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjAFJ01 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 04:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234357AbjAFJZ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 04:25:27 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC00718AE
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 01:21:54 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3066wpRT009092;
        Fri, 6 Jan 2023 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=2zs1HMyomH7YQyQkfBqJIPYor/N1DlZlC/oMp+ELf6E=;
 b=ITsClKrKAIUc+gjDBFTZaKSa4Si1goFTdxLmwdWIOePmpvn+Q5H3Nx+v8fc6WNch0JBW
 Srx60JUW6fiS84w93LHr1Ufmcs6m9CJHGuyH8JiIXkAqj4SvfGJePdhSYmy96G7IeYXx
 z1NuUJf78wUpeuWqBU8DQBm7o5eLTV4aWcusvpST5ZE1so4+EjQ9w1dwEv6VOrohetlh
 rsYrZDXdsUW/xZ62Bv9Zj69w/PfMJV/yGsBtHBj0Qrw0rYHyEEyYTXHBmCNlo8Wkf/Ab
 qgi8eYDG7YQUW3BsG6fy/OHm7kRr02b47zteSfn3gWH0BV+4Wlga1nzmbm1msQMlFumO zw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwuuutq99-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Jan 2023 09:21:46 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3069Ljeg025254
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 6 Jan 2023 09:21:45 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 6 Jan 2023 01:21:43 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 3/3] usb: dwc3: remove base parameter of event class dwc3_log_io
Date:   Fri, 6 Jan 2023 17:21:35 +0800
Message-ID: <1672996895-22762-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c3zQCdEfLYz7ggl_g3gsGPcjVxFzgvmz
X-Proofpoint-ORIG-GUID: c3zQCdEfLYz7ggl_g3gsGPcjVxFzgvmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 mlxlogscore=718 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301060073
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when trace register read/write operation, it is not necessary to show
virtual address cacaulate from base and offset.

remove the base register value, it will save trace buffer.
it is enough only save and show the offset.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/dwc3/io.h    |  4 ++--
 drivers/usb/dwc3/trace.h | 17 +++++++----------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
index d24513e..fcb5726 100644
--- a/drivers/usb/dwc3/io.h
+++ b/drivers/usb/dwc3/io.h
@@ -32,7 +32,7 @@ static inline u32 dwc3_readl(void __iomem *base, u32 offset)
 	 * documentation, so we revert it back to the proper addresses, the
 	 * same way they are described on SNPS documentation
 	 */
-	trace_dwc3_readl(base, offset, value);
+	trace_dwc3_readl(offset, value);
 
 	return value;
 }
@@ -61,7 +61,7 @@ static inline void dwc3_writel(void __iomem *base, u32 offset, u32 value)
 	 * documentation, so we revert it back to the proper addresses, the
 	 * same way they are described on SNPS documentation
 	 */
-	trace_dwc3_writel(base, offset, value);
+	trace_dwc3_writel(offset, value);
 }
 
 #endif /* __DRIVERS_USB_DWC3_IO_H */
diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index 1975aec..536b9a1 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -20,32 +20,29 @@
 #include "debug.h"
 
 DECLARE_EVENT_CLASS(dwc3_log_io,
-	TP_PROTO(void *base, u32 offset, u32 value),
-	TP_ARGS(base, offset, value),
+	TP_PROTO(u32 offset, u32 value),
+	TP_ARGS(offset, value),
 	TP_STRUCT__entry(
-		__field(void *, base)
 		__field(u32, offset)
 		__field(u32, value)
 	),
 	TP_fast_assign(
-		__entry->base = base;
 		__entry->offset = offset;
 		__entry->value = value;
 	),
-	TP_printk("addr %p offset %04x value %08x",
-		__entry->base + __entry->offset,
+	TP_printk("offset %04x value %08x",
 		__entry->offset,
 		__entry->value)
 );
 
 DEFINE_EVENT(dwc3_log_io, dwc3_readl,
-	TP_PROTO(void __iomem *base, u32 offset, u32 value),
-	TP_ARGS(base, offset, value)
+	TP_PROTO(u32 offset, u32 value),
+	TP_ARGS(offset, value)
 );
 
 DEFINE_EVENT(dwc3_log_io, dwc3_writel,
-	TP_PROTO(void __iomem *base, u32 offset, u32 value),
-	TP_ARGS(base, offset, value)
+	TP_PROTO(u32 offset, u32 value),
+	TP_ARGS(offset, value)
 );
 
 DECLARE_EVENT_CLASS(dwc3_log_event,
-- 
2.7.4

