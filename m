Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C13979A26E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 06:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbjIKEac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 00:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233441AbjIKEab (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 00:30:31 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E492114
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 21:30:22 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B4ARPN028709;
        Mon, 11 Sep 2023 04:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=blnruwchVzSqcGB3p/HxMlfMel6o5r+f6uJXG3O50SY=;
 b=iFXiZ3+MFG2c8QlN4HPw0Ar+oMSo3F7cFbC4JtFnq2L8HrhSx0nNpYHyeKRrFe2XLbFG
 5iH7EP5VKevCLXaDZxIVKf4HiQStNlRx3vHiyQm4eL8o1EsETzbf9IlbdDBZQ+vzPYyE
 XS+SyM2cfyxPlnCzts0xqhDgjDWmmvlBnX8QjZfF3rsISTIb2E4m0gq85+zRn4ecWMu0
 cxT/YQyZ92ffkE20J6kdOM5utaC+GsGYL0HD4NQVNlwj2O0isKdPxKDlHvHwkA54d0yW
 4bYzUDhFAieBd8xlt7+U99Z+WmyHv03MvPocEwzO9EiKJjAPosfEdz6WI+AqL5JZlDZg 0w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1u3yr283-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:54 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B4TrwD022043
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:53 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 21:29:46 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        "Cristian Birsan" <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, "Kevin Cernekee" <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        "Al Cooper" <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        "Vladimir Zapolskiy" <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        "Shuah Khan" <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 07/11] usb: cdns3: trace: reduce buffer usage of trace event
Date:   Mon, 11 Sep 2023 12:28:39 +0800
Message-ID: <20230911042843.2711-8-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
References: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fGi11yjBmp7z9T02qxTgFQsG_iE9y46_
X-Proofpoint-ORIG-GUID: fGi11yjBmp7z9T02qxTgFQsG_iE9y46_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=474 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Save u32 members into trace event ring buffer and parse it for possible
bit information.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/cdns3/cdns3-trace.h | 93 +++++++++++++++------------------
 1 file changed, 42 insertions(+), 51 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-trace.h b/drivers/usb/cdns3/cdns3-trace.h
index 40db89e3333c..391547546530 100644
--- a/drivers/usb/cdns3/cdns3-trace.h
+++ b/drivers/usb/cdns3/cdns3-trace.h
@@ -28,45 +28,45 @@ TRACE_EVENT(cdns3_halt,
 	TP_PROTO(struct cdns3_endpoint *ep_priv, u8 halt, u8 flush),
 	TP_ARGS(ep_priv, halt, flush),
 	TP_STRUCT__entry(
-		__string(name, ep_priv->name)
+		__field(u32, edw3)
 		__field(u8, halt)
 		__field(u8, flush)
 	),
 	TP_fast_assign(
-		__assign_str(name, ep_priv->name);
+		__entry->edw3 = ep_priv->endpoint.dw3;
 		__entry->halt = halt;
 		__entry->flush = flush;
 	),
 	TP_printk("Halt %s for %s: %s", __entry->flush ? " and flush" : "",
-		  __get_str(name), __entry->halt ? "set" : "cleared")
+		  USB_EP_NAME(__entry->edw3), __entry->halt ? "set" : "cleared")
 );
 
 TRACE_EVENT(cdns3_wa1,
 	TP_PROTO(struct cdns3_endpoint *ep_priv, char *msg),
 	TP_ARGS(ep_priv, msg),
 	TP_STRUCT__entry(
-		__string(ep_name, ep_priv->name)
+		__field(u32, edw3)
 		__string(msg, msg)
 	),
 	TP_fast_assign(
-		__assign_str(ep_name, ep_priv->name);
+		__entry->edw3 = ep_priv->endpoint.dw3;
 		__assign_str(msg, msg);
 	),
-	TP_printk("WA1: %s %s", __get_str(ep_name), __get_str(msg))
+	TP_printk("WA1: %s %s", USB_EP_NAME(__entry->edw3), __get_str(msg))
 );
 
 TRACE_EVENT(cdns3_wa2,
 	TP_PROTO(struct cdns3_endpoint *ep_priv, char *msg),
 	TP_ARGS(ep_priv, msg),
 	TP_STRUCT__entry(
-		__string(ep_name, ep_priv->name)
+		__field(u32, edw3)
 		__string(msg, msg)
 	),
 	TP_fast_assign(
-		__assign_str(ep_name, ep_priv->name);
+		__entry->edw3 = ep_priv->endpoint.dw3;
 		__assign_str(msg, msg);
 	),
-	TP_printk("WA2: %s %s", __get_str(ep_name), __get_str(msg))
+	TP_printk("WA2: %s %s", USB_EP_NAME(__entry->edw3), __get_str(msg))
 );
 
 DECLARE_EVENT_CLASS(cdns3_log_doorbell,
@@ -118,14 +118,14 @@ DECLARE_EVENT_CLASS(cdns3_log_epx_irq,
 	TP_PROTO(struct cdns3_device *priv_dev, struct cdns3_endpoint *priv_ep),
 	TP_ARGS(priv_dev, priv_ep),
 	TP_STRUCT__entry(
-		__string(ep_name, priv_ep->name)
+		__field(u32, edw3)
 		__field(u32, ep_sts)
 		__field(u32, ep_traddr)
 		__field(u32, ep_last_sid)
 		__field(u32, use_streams)
 	),
 	TP_fast_assign(
-		__assign_str(ep_name, priv_ep->name);
+		__entry->edw3 = priv_ep->endpoint.dw3;
 		__entry->ep_sts = readl(&priv_dev->regs->ep_sts);
 		__entry->ep_traddr = readl(&priv_dev->regs->ep_traddr);
 		__entry->ep_last_sid = priv_ep->last_stream_id;
@@ -133,7 +133,7 @@ DECLARE_EVENT_CLASS(cdns3_log_epx_irq,
 	),
 	TP_printk("%s, ep_traddr: %08x ep_last_sid: %08x use_streams: %d",
 		  cdns3_decode_epx_irq(__get_buf(CDNS3_MSG_MAX),
-				       __get_str(ep_name),
+				       USB_EP_NAME(__entry->edw3),
 				       __entry->ep_sts),
 		  __entry->ep_traddr,
 		  __entry->ep_last_sid,
@@ -199,47 +199,42 @@ DECLARE_EVENT_CLASS(cdns3_log_request,
 	TP_PROTO(struct cdns3_request *req),
 	TP_ARGS(req),
 	TP_STRUCT__entry(
-		__string(name, req->priv_ep->name)
+		__field(u32, edw3)
 		__field(struct cdns3_request *, req)
 		__field(void *, buf)
 		__field(unsigned int, actual)
 		__field(unsigned int, length)
 		__field(int, status)
-		__field(int, zero)
-		__field(int, short_not_ok)
-		__field(int, no_interrupt)
+		__field(u32, rdw1)
 		__field(int, start_trb)
 		__field(int, end_trb)
 		__field(int, flags)
 		__field(unsigned int, stream_id)
 	),
 	TP_fast_assign(
-		__assign_str(name, req->priv_ep->name);
+		__entry->edw3 = req->priv_ep->endpoint.dw3;
 		__entry->req = req;
 		__entry->buf = req->request.buf;
 		__entry->actual = req->request.actual;
 		__entry->length = req->request.length;
 		__entry->status = req->request.status;
-		__entry->zero = req->request.zero;
-		__entry->short_not_ok = req->request.short_not_ok;
-		__entry->no_interrupt = req->request.no_interrupt;
+		__entry->rdw1 = req->request.dw1;
 		__entry->start_trb = req->start_trb;
 		__entry->end_trb = req->end_trb;
 		__entry->flags = req->flags;
-		__entry->stream_id = req->request.stream_id;
 	),
 	TP_printk("%s: req: %p, req buff %p, length: %u/%u %s%s%s, status: %d,"
 		  " trb: [start:%d, end:%d], flags:%x SID: %u",
-		__get_str(name), __entry->req, __entry->buf, __entry->actual,
+		USB_EP_NAME(__entry->edw3), __entry->req, __entry->buf, __entry->actual,
 		__entry->length,
-		__entry->zero ? "Z" : "z",
-		__entry->short_not_ok ? "S" : "s",
-		__entry->no_interrupt ? "I" : "i",
+		USB_REQ_ZERO(__entry->rdw1) ? "Z" : "z",
+		USB_REQ_SHORT_NOT_OK(__entry->rdw1) ? "S" : "s",
+		USB_REQ_NO_INTERRUPT(__entry->rdw1) ? "I" : "i",
 		__entry->status,
 		__entry->start_trb,
 		__entry->end_trb,
 		__entry->flags,
-		__entry->stream_id
+		USB_REQ_STREAM_ID(__entry->rdw1)
 	)
 );
 
@@ -287,21 +282,21 @@ DECLARE_EVENT_CLASS(cdns3_stream_split_transfer_len,
 	TP_PROTO(struct cdns3_request *req),
 	TP_ARGS(req),
 	TP_STRUCT__entry(
-		__string(name, req->priv_ep->name)
+		__field(u32, edw3)
 		__field(struct cdns3_request *, req)
 		__field(unsigned int, length)
 		__field(unsigned int, actual)
 		__field(unsigned int, stream_id)
 	),
 	TP_fast_assign(
-		__assign_str(name, req->priv_ep->name);
+		__entry->edw3 = req->priv_ep->endpoint.dw3;
 		__entry->req = req;
 		__entry->actual = req->request.length;
 		__entry->length = req->request.actual;
 		__entry->stream_id = req->request.stream_id;
 	),
 	TP_printk("%s: req: %p,request length: %u actual length: %u  SID: %u",
-		  __get_str(name), __entry->req, __entry->length,
+		  USB_EP_NAME(__entry->edw3), __entry->req, __entry->length,
 		  __entry->actual, __entry->stream_id)
 );
 
@@ -320,7 +315,7 @@ DECLARE_EVENT_CLASS(cdns3_log_aligned_request,
 	TP_PROTO(struct cdns3_request *priv_req),
 	TP_ARGS(priv_req),
 	TP_STRUCT__entry(
-		__string(name, priv_req->priv_ep->name)
+		__field(u32, edw3)
 		__field(struct usb_request *, req)
 		__field(void *, buf)
 		__field(dma_addr_t, dma)
@@ -329,7 +324,7 @@ DECLARE_EVENT_CLASS(cdns3_log_aligned_request,
 		__field(u32, aligned_buf_size)
 	),
 	TP_fast_assign(
-		__assign_str(name, priv_req->priv_ep->name);
+		__entry->edw3 = priv_req->priv_ep->endpoint.dw3;
 		__entry->req = &priv_req->request;
 		__entry->buf = priv_req->request.buf;
 		__entry->dma = priv_req->request.dma;
@@ -338,7 +333,7 @@ DECLARE_EVENT_CLASS(cdns3_log_aligned_request,
 		__entry->aligned_buf_size = priv_req->aligned_buf->size;
 	),
 	TP_printk("%s: req: %p, req buf %p, dma %pad a_buf %p a_dma %pad, size %d",
-		__get_str(name), __entry->req, __entry->buf, &__entry->dma,
+		USB_EP_NAME(__entry->edw3), __entry->req, __entry->buf, &__entry->dma,
 		__entry->aligned_buf, &__entry->aligned_dma,
 		__entry->aligned_buf_size
 	)
@@ -358,19 +353,19 @@ DECLARE_EVENT_CLASS(cdns3_log_map_request,
 	TP_PROTO(struct cdns3_request *priv_req),
 	TP_ARGS(priv_req),
 	TP_STRUCT__entry(
-		__string(name, priv_req->priv_ep->name)
+		__field(u32, edw3)
 		__field(struct usb_request *, req)
 		__field(void *, buf)
 		__field(dma_addr_t, dma)
 	),
 	TP_fast_assign(
-		__assign_str(name, priv_req->priv_ep->name);
+		__entry->edw3 = priv_req->priv_ep->endpoint.dw3;
 		__entry->req = &priv_req->request;
 		__entry->buf = priv_req->request.buf;
 		__entry->dma = priv_req->request.dma;
 	),
 	TP_printk("%s: req: %p, req buf %p, dma %p",
-		  __get_str(name), __entry->req, __entry->buf, &__entry->dma
+		  USB_EP_NAME(__entry->edw3), __entry->req, __entry->buf, &__entry->dma
 	)
 );
 DEFINE_EVENT(cdns3_log_map_request, cdns3_map_request,
@@ -386,7 +381,7 @@ DECLARE_EVENT_CLASS(cdns3_log_trb,
 	TP_PROTO(struct cdns3_endpoint *priv_ep, struct cdns3_trb *trb),
 	TP_ARGS(priv_ep, trb),
 	TP_STRUCT__entry(
-		__string(name, priv_ep->name)
+		__field(u32, edw3)
 		__field(struct cdns3_trb *, trb)
 		__field(u32, buffer)
 		__field(u32, length)
@@ -395,7 +390,7 @@ DECLARE_EVENT_CLASS(cdns3_log_trb,
 		__field(unsigned int, last_stream_id)
 	),
 	TP_fast_assign(
-		__assign_str(name, priv_ep->name);
+		__entry->edw3 = priv_ep->endpoint.dw3;
 		__entry->trb = trb;
 		__entry->buffer = le32_to_cpu(trb->buffer);
 		__entry->length = le32_to_cpu(trb->length);
@@ -404,7 +399,7 @@ DECLARE_EVENT_CLASS(cdns3_log_trb,
 		__entry->last_stream_id = priv_ep->last_stream_id;
 	),
 	TP_printk("%s: trb %p, dma buf: 0x%08x, size: %ld, burst: %d ctrl: 0x%08x (%s%s%s%s%s%s%s) SID:%lu LAST_SID:%u",
-		__get_str(name), __entry->trb, __entry->buffer,
+		USB_EP_NAME(__entry->edw3), __entry->trb, __entry->buffer,
 		TRB_LEN(__entry->length),
 		(u8)TRB_BURST_LEN_GET(__entry->length),
 		__entry->control,
@@ -455,24 +450,20 @@ DECLARE_EVENT_CLASS(cdns3_log_ep,
 	TP_PROTO(struct cdns3_endpoint *priv_ep),
 	TP_ARGS(priv_ep),
 	TP_STRUCT__entry(
-		__string(name, priv_ep->name)
-		__field(unsigned int, maxpacket)
-		__field(unsigned int, maxpacket_limit)
-		__field(unsigned int, max_streams)
+		__field(u32, edw3)
+		__field(u32, edw1)
+		__field(u32, edw2)
 		__field(unsigned int, use_streams)
-		__field(unsigned int, maxburst)
 		__field(unsigned int, flags)
 		__field(unsigned int, dir)
 		__field(u8, enqueue)
 		__field(u8, dequeue)
 	),
 	TP_fast_assign(
-		__assign_str(name, priv_ep->name);
-		__entry->maxpacket = priv_ep->endpoint.maxpacket;
-		__entry->maxpacket_limit = priv_ep->endpoint.maxpacket_limit;
-		__entry->max_streams = priv_ep->endpoint.max_streams;
+		__entry->edw3 = priv_ep->endpoint.dw3;
+		__entry->edw2 = priv_ep->endpoint.dw2;
+		__entry->edw1 = priv_ep->endpoint.dw1;
 		__entry->use_streams = priv_ep->use_streams;
-		__entry->maxburst = priv_ep->endpoint.maxburst;
 		__entry->flags = priv_ep->flags;
 		__entry->dir = priv_ep->dir;
 		__entry->enqueue = priv_ep->enqueue;
@@ -480,10 +471,10 @@ DECLARE_EVENT_CLASS(cdns3_log_ep,
 	),
 	TP_printk("%s: mps: %d/%d. streams: %d, stream enable: %d, burst: %d, "
 		  "enq idx: %d, deq idx: %d, flags %s%s%s%s%s%s%s%s, dir: %s",
-		__get_str(name), __entry->maxpacket,
-		__entry->maxpacket_limit, __entry->max_streams,
+		USB_EP_NAME(__entry->edw3), USB_EP_MAXPACKET(__entry->edw1),
+		USB_EP_MAXPACKET_LIMIT(__entry->edw1), USB_EP_MAX_STREAMS(__entry->edw2),
 		__entry->use_streams,
-		__entry->maxburst, __entry->enqueue,
+		USB_EP_MAXBURST(__entry->edw2), __entry->enqueue,
 		__entry->dequeue,
 		__entry->flags & EP_ENABLED ? "EN | " : "",
 		__entry->flags & EP_STALLED ? "STALLED | " : "",
-- 
2.17.1

