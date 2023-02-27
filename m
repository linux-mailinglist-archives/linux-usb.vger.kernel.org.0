Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F13D6A3924
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 03:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjB0C6U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 21:58:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjB0C6T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 21:58:19 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562A66A6F
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 18:58:17 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R0MZQJ025280;
        Mon, 27 Feb 2023 02:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=uz1TAFGPZ+QZtuGwxs64uU/hA20fzt/c3yWmNKfpoh4=;
 b=GiKcjrYTUEEFFMxlGmBAoRc53RnZjtEaijqR1YQk9ujPYTlfLkd7FgEPjhHSCkWCXMdt
 fpWTdM9izKKKV0iOV/Do2yY1izTUHVMTa++z1K1UCisP1wiQWRKFepYJZJrTQR9Ul4g8
 YXP7ntl4xzRWrShAenbJ6iXcXdTlmCLwYH9Ka9ujGN4W37OBOws8X4JYI4YE7SoktrPa
 MnY6qmD7HnVqL1VN6f0t2QQ2ij72gfGV43pRm4sgEKmOXS/aigRvRxesaoYMMSf/UGcA
 JJGMHc8QOQAFxp9/UkVzZTf2KoVsGr+gPG0kIwsnJYchYm8HbigmBk6vrGwdpMk7ZfvF aw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny9a0ujcu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:30:15 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31R2UEdJ032729
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:30:14 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Sun, 26 Feb 2023 18:30:11 -0800
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
Subject: [PATCH 2/4] usb: cdns3: change some trace event __dynamic_array() to __get_buf()
Date:   Mon, 27 Feb 2023 10:29:52 +0800
Message-ID: <1677464994-32409-2-git-send-email-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: vzFbmjbHVQXFUzvgB1iVbF7TtcqpEpcK
X-Proofpoint-GUID: vzFbmjbHVQXFUzvgB1iVbF7TtcqpEpcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=632 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 drivers/usb/cdns3/cdns3-trace.h | 12 ++++--------
 drivers/usb/cdns3/cdnsp-trace.h | 12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-trace.h b/drivers/usb/cdns3/cdns3-trace.h
index 9905718..40db89e 100644
--- a/drivers/usb/cdns3/cdns3-trace.h
+++ b/drivers/usb/cdns3/cdns3-trace.h
@@ -100,13 +100,12 @@ DECLARE_EVENT_CLASS(cdns3_log_usb_irq,
 	TP_STRUCT__entry(
 		__field(enum usb_device_speed, speed)
 		__field(u32, usb_ists)
-		__dynamic_array(char, str, CDNS3_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->speed = cdns3_get_speed(priv_dev);
 		__entry->usb_ists = usb_ists;
 	),
-	TP_printk("%s", cdns3_decode_usb_irq(__get_str(str), __entry->speed,
+	TP_printk("%s", cdns3_decode_usb_irq(__get_buf(CDNS3_MSG_MAX), __entry->speed,
 					     __entry->usb_ists))
 );
 
@@ -124,7 +123,6 @@ DECLARE_EVENT_CLASS(cdns3_log_epx_irq,
 		__field(u32, ep_traddr)
 		__field(u32, ep_last_sid)
 		__field(u32, use_streams)
-		__dynamic_array(char, str, CDNS3_MSG_MAX)
 	),
 	TP_fast_assign(
 		__assign_str(ep_name, priv_ep->name);
@@ -134,7 +132,7 @@ DECLARE_EVENT_CLASS(cdns3_log_epx_irq,
 		__entry->use_streams = priv_ep->use_streams;
 	),
 	TP_printk("%s, ep_traddr: %08x ep_last_sid: %08x use_streams: %d",
-		  cdns3_decode_epx_irq(__get_str(str),
+		  cdns3_decode_epx_irq(__get_buf(CDNS3_MSG_MAX),
 				       __get_str(ep_name),
 				       __entry->ep_sts),
 		  __entry->ep_traddr,
@@ -153,13 +151,12 @@ DECLARE_EVENT_CLASS(cdns3_log_ep0_irq,
 	TP_STRUCT__entry(
 		__field(int, ep_dir)
 		__field(u32, ep_sts)
-		__dynamic_array(char, str, CDNS3_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->ep_dir = priv_dev->selected_ep;
 		__entry->ep_sts = ep_sts;
 	),
-	TP_printk("%s", cdns3_decode_ep0_irq(__get_str(str),
+	TP_printk("%s", cdns3_decode_ep0_irq(__get_buf(CDNS3_MSG_MAX),
 					     __entry->ep_dir,
 					     __entry->ep_sts))
 );
@@ -178,7 +175,6 @@ DECLARE_EVENT_CLASS(cdns3_log_ctrl,
 		__field(u16, wValue)
 		__field(u16, wIndex)
 		__field(u16, wLength)
-		__dynamic_array(char, str, CDNS3_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->bRequestType = ctrl->bRequestType;
@@ -187,7 +183,7 @@ DECLARE_EVENT_CLASS(cdns3_log_ctrl,
 		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
 		__entry->wLength = le16_to_cpu(ctrl->wLength);
 	),
-	TP_printk("%s", usb_decode_ctrl(__get_str(str), CDNS3_MSG_MAX,
+	TP_printk("%s", usb_decode_ctrl(__get_buf(CDNS3_MSG_MAX), CDNS3_MSG_MAX,
 					__entry->bRequestType,
 					__entry->bRequest, __entry->wValue,
 					__entry->wIndex, __entry->wLength)
diff --git a/drivers/usb/cdns3/cdnsp-trace.h b/drivers/usb/cdns3/cdnsp-trace.h
index 5983dfb..4b51011 100644
--- a/drivers/usb/cdns3/cdnsp-trace.h
+++ b/drivers/usb/cdns3/cdnsp-trace.h
@@ -271,7 +271,6 @@ DECLARE_EVENT_CLASS(cdnsp_log_ctrl,
 		__field(u16, wValue)
 		__field(u16, wIndex)
 		__field(u16, wLength)
-		__dynamic_array(char, str, CDNSP_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->bRequestType = ctrl->bRequestType;
@@ -280,7 +279,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_ctrl,
 		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
 		__entry->wLength = le16_to_cpu(ctrl->wLength);
 	),
-	TP_printk("%s", usb_decode_ctrl(__get_str(str), CDNSP_MSG_MAX,
+	TP_printk("%s", usb_decode_ctrl(__get_buf(CDNSP_MSG_MAX), CDNSP_MSG_MAX,
 					__entry->bRequestType,
 					__entry->bRequest, __entry->wValue,
 					__entry->wIndex, __entry->wLength)
@@ -345,7 +344,6 @@ DECLARE_EVENT_CLASS(cdnsp_log_trb,
 		__field(u32, field3)
 		__field(union cdnsp_trb *, trb)
 		__field(dma_addr_t, trb_dma)
-		__dynamic_array(char, str, CDNSP_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->type = ring->type;
@@ -359,7 +357,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_trb,
 
 	),
 	TP_printk("%s: %s trb: %p(%pad)", cdnsp_ring_type_string(__entry->type),
-		  cdnsp_decode_trb(__get_str(str), CDNSP_MSG_MAX,
+		  cdnsp_decode_trb(__get_buf(CDNSP_MSG_MAX), CDNSP_MSG_MAX,
 				   __entry->field0, __entry->field1,
 				   __entry->field2, __entry->field3),
 				   __entry->trb, &__entry->trb_dma
@@ -544,7 +542,6 @@ DECLARE_EVENT_CLASS(cdnsp_log_ep_ctx,
 		__field(u32, info2)
 		__field(u64, deq)
 		__field(u32, tx_info)
-		__dynamic_array(char, str, CDNSP_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->info = le32_to_cpu(ctx->ep_info);
@@ -552,7 +549,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_ep_ctx,
 		__entry->deq = le64_to_cpu(ctx->deq);
 		__entry->tx_info = le32_to_cpu(ctx->tx_info);
 	),
-	TP_printk("%s", cdnsp_decode_ep_context(__get_str(str), CDNSP_MSG_MAX,
+	TP_printk("%s", cdnsp_decode_ep_context(__get_buf(CDNSP_MSG_MAX), CDNSP_MSG_MAX,
 						__entry->info, __entry->info2,
 						__entry->deq, __entry->tx_info)
 	)
@@ -777,7 +774,6 @@ DECLARE_EVENT_CLASS(cdnsp_log_portsc,
 		TP_STRUCT__entry(
 				__field(u32, portnum)
 				__field(u32, portsc)
-				__dynamic_array(char, str, CDNSP_MSG_MAX)
 				),
 		TP_fast_assign(
 				__entry->portnum = portnum;
@@ -785,7 +781,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_portsc,
 				),
 		TP_printk("port-%d: %s",
 			  __entry->portnum,
-			  cdnsp_decode_portsc(__get_str(str), CDNSP_MSG_MAX,
+			  cdnsp_decode_portsc(__get_buf(CDNSP_MSG_MAX), CDNSP_MSG_MAX,
 					      __entry->portsc)
 			)
 );
-- 
2.7.4

