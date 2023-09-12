Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6448679CEC0
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 12:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbjILKs0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 06:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233859AbjILKrs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 06:47:48 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8857173E
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:46:27 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C9wdId020214;
        Tue, 12 Sep 2023 10:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=l2Gi4XLu23N2P+068swpkNAoiq+ItS8NsKOZMJdYZRc=;
 b=Wy+Y78eZ3NeFj/295zH7IEBl9K7ZNiRMxs4MrHc0I5G5FcxnqO05Xh13iZj7qP9TAb3C
 K+tvIejpTNxwS8+xYN6B4oVdPq2us17+cPi2gxLjE9j+hg5TTW+8U05Ws7rEbPLVbqwu
 8j6SB4TYrOucriV+Ii2CUqh5WjpsIOnkouJ3yLNhY/qbQ6ig7Px5bBV9Euk5zLw6lIVi
 I+5Blp9Li9EHZcnmTJswREVHNQttxnLuUHR2Dim1hHfbxbaVEuzr0oqZy3m5j9aHiBvX
 vPe9yWbtW65bYVtF9etEEm+lrT9IQLZe6Ewh0kZoOONFbB6fnVBKVfsbYMy/LKAUcXhv CA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2ncp04wj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:48 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CAjlQ3022436
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:47 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 12 Sep 2023 03:45:40 -0700
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
Subject: [PATCH v3 05/10] usb: cdns3: cdnsp: reduce buffer usage of trace event
Date:   Tue, 12 Sep 2023 18:44:50 +0800
Message-ID: <20230912104455.7737-6-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lwakSkI4V_-cWEN9k1XnQAEW0X1iG0Fe
X-Proofpoint-ORIG-GUID: lwakSkI4V_-cWEN9k1XnQAEW0X1iG0Fe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=397 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120090
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Save u32 members into trace event ring buffer and parse it for possible
bit information.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: no change

 drivers/usb/cdns3/cdnsp-trace.h | 45 +++++++++++++++------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-trace.h b/drivers/usb/cdns3/cdnsp-trace.h
index 4b51011eb00b..b1ceb6755e6d 100644
--- a/drivers/usb/cdns3/cdnsp-trace.h
+++ b/drivers/usb/cdns3/cdnsp-trace.h
@@ -38,7 +38,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_ep,
 	TP_PROTO(struct cdnsp_ep *pep, u32 stream_id),
 	TP_ARGS(pep, stream_id),
 	TP_STRUCT__entry(
-		__string(name, pep->name)
+		__field(u32, edw3)
 		__field(unsigned int, state)
 		__field(u32, stream_id)
 		__field(u8, enabled)
@@ -48,7 +48,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_ep,
 		__field(u8, drbls_count)
 	),
 	TP_fast_assign(
-		__assign_str(name, pep->name);
+		__entry->edw3 = pep->endpoint.dw3;
 		__entry->state = pep->ep_state;
 		__entry->stream_id = stream_id;
 		__entry->enabled = pep->ep_state & EP_HAS_STREAMS;
@@ -59,7 +59,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_ep,
 	),
 	TP_printk("%s: SID: %08x, ep state: %x, stream: enabled: %d num %d "
 		  "tds %d, first prime: %d drbls %d",
-		  __get_str(name), __entry->stream_id, __entry->state,
+		  USB_EP_NAME(__entry->edw3), __entry->stream_id, __entry->state,
 		  __entry->enabled, __entry->num_streams, __entry->td_count,
 		  __entry->first_prime_det, __entry->drbls_count)
 );
@@ -296,21 +296,21 @@ DECLARE_EVENT_CLASS(cdnsp_log_bounce,
 		 dma_addr_t dma, unsigned int unalign),
 	TP_ARGS(preq, new_buf_len, offset, dma, unalign),
 	TP_STRUCT__entry(
-		__string(name, preq->pep->name)
+		__field(u32, edw3)
 		__field(u32, new_buf_len)
 		__field(u32, offset)
 		__field(dma_addr_t, dma)
 		__field(unsigned int, unalign)
 	),
 	TP_fast_assign(
-		__assign_str(name, preq->pep->name);
+		__entry->edw3 = preq->pep->endpoint.dw3;
 		__entry->new_buf_len = new_buf_len;
 		__entry->offset = offset;
 		__entry->dma = dma;
 		__entry->unalign = unalign;
 	),
 	TP_printk("%s buf len %d, offset %d, dma %pad, unalign %d",
-		  __get_str(name), __entry->new_buf_len,
+		  USB_EP_NAME(__entry->edw3), __entry->new_buf_len,
 		  __entry->offset, &__entry->dma, __entry->unalign
 	)
 );
@@ -452,7 +452,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_request,
 	TP_PROTO(struct cdnsp_request *req),
 	TP_ARGS(req),
 	TP_STRUCT__entry(
-		__string(name, req->pep->name)
+		__field(u32, edw3)
 		__field(struct usb_request *, request)
 		__field(struct cdnsp_request *, preq)
 		__field(void *, buf)
@@ -460,17 +460,14 @@ DECLARE_EVENT_CLASS(cdnsp_log_request,
 		__field(unsigned int, length)
 		__field(int, status)
 		__field(dma_addr_t, dma)
-		__field(unsigned int, stream_id)
-		__field(unsigned int, zero)
-		__field(unsigned int, short_not_ok)
-		__field(unsigned int, no_interrupt)
+		__field(u32, rdw1)
 		__field(struct scatterlist*, sg)
 		__field(unsigned int, num_sgs)
 		__field(unsigned int, num_mapped_sgs)
 
 	),
 	TP_fast_assign(
-		__assign_str(name, req->pep->name);
+		__entry->edw3 = req->pep->endpoint.dw3;
 		__entry->request = &req->request;
 		__entry->preq = req;
 		__entry->buf = req->request.buf;
@@ -478,10 +475,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_request,
 		__entry->length = req->request.length;
 		__entry->status = req->request.status;
 		__entry->dma = req->request.dma;
-		__entry->stream_id = req->request.stream_id;
-		__entry->zero = req->request.zero;
-		__entry->short_not_ok = req->request.short_not_ok;
-		__entry->no_interrupt = req->request.no_interrupt;
+		__entry->rdw1 = req->request.dw1;
 		__entry->sg = req->request.sg;
 		__entry->num_sgs = req->request.num_sgs;
 		__entry->num_mapped_sgs = req->request.num_mapped_sgs;
@@ -489,12 +483,12 @@ DECLARE_EVENT_CLASS(cdnsp_log_request,
 	TP_printk("%s; req U:%p/P:%p, req buf %p, length %u/%u, status %d, "
 		  "buf dma (%pad), SID %u, %s%s%s, sg %p, num_sg %d,"
 		  " num_m_sg %d",
-		  __get_str(name), __entry->request, __entry->preq,
+		  USB_EP_NAME(__entry->edw3), __entry->request, __entry->preq,
 		  __entry->buf, __entry->actual, __entry->length,
 		  __entry->status, &__entry->dma,
-		  __entry->stream_id, __entry->zero ? "Z" : "z",
-		  __entry->short_not_ok ? "S" : "s",
-		  __entry->no_interrupt ? "I" : "i",
+		  USB_REQ_STREAM_ID(__entry->rdw1), USB_REQ_ZERO(__entry->rdw1) ? "Z" : "z",
+		  USB_REQ_SHORT_NOT_OK(__entry->rdw1) ? "S" : "s",
+		  USB_REQ_NO_INTERRUPT(__entry->rdw1) ? "I" : "i",
 		  __entry->sg, __entry->num_sgs, __entry->num_mapped_sgs
 		)
 );
@@ -666,7 +660,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_td_info,
 	TP_PROTO(struct cdnsp_request *preq),
 	TP_ARGS(preq),
 	TP_STRUCT__entry(
-		__string(name, preq->pep->name)
+		__field(u32, edw3)
 		__field(struct usb_request *, request)
 		__field(struct cdnsp_request *, preq)
 		__field(union cdnsp_trb *, first_trb)
@@ -674,7 +668,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_td_info,
 		__field(dma_addr_t, trb_dma)
 	),
 	TP_fast_assign(
-		__assign_str(name, preq->pep->name);
+		__entry->edw3 = preq->pep->endpoint.dw3;
 		__entry->request = &preq->request;
 		__entry->preq = preq;
 		__entry->first_trb = preq->td.first_trb;
@@ -683,7 +677,7 @@ DECLARE_EVENT_CLASS(cdnsp_log_td_info,
 							 preq->td.first_trb)
 	),
 	TP_printk("%s req/preq:  %p/%p, first trb %p[vir]/%pad(dma), last trb %p",
-		  __get_str(name), __entry->request, __entry->preq,
+		  USB_EP_NAME(__entry->edw3), __entry->request, __entry->preq,
 		  __entry->first_trb, &__entry->trb_dma,
 		  __entry->last_trb
 		)
@@ -800,16 +794,17 @@ TRACE_EVENT(cdnsp_stream_number,
 	TP_PROTO(struct cdnsp_ep *pep, int num_stream_ctxs, int num_streams),
 	TP_ARGS(pep, num_stream_ctxs, num_streams),
 	TP_STRUCT__entry(
-		__string(name, pep->name)
+		__field(u32, edw3)
 		__field(int, num_stream_ctxs)
 		__field(int, num_streams)
 	),
 	TP_fast_assign(
+		__entry->edw3 = pep->endpoint.dw3;
 		__entry->num_stream_ctxs = num_stream_ctxs;
 		__entry->num_streams = num_streams;
 	),
 	TP_printk("%s Need %u stream ctx entries for %u stream IDs.",
-		  __get_str(name), __entry->num_stream_ctxs,
+		  USB_EP_NAME(__entry->edw3), __entry->num_stream_ctxs,
 		  __entry->num_streams)
 );
 
-- 
2.17.1

