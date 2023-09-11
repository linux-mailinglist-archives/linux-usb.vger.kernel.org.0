Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F01E79A272
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 06:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbjIKEay (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 00:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbjIKEax (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 00:30:53 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023E61B8
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 21:30:47 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B30Bgs003697;
        Mon, 11 Sep 2023 04:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=uL7MgyLPZFAv135B6ZvdmmWkCEIUfI9QS85TJy6OYtw=;
 b=Vf7e9nV+Q7D3NGVgnhVmFXw1rpQyGyrQGMiKeuqO2p5yYbhjIwurnLlinYC3F9MxxFRO
 SO6v0l7jQyCSTN7/blaNmTohz+NFvPi1fcv0KL4i5IxdnGrqOwd4s5PD/93RYMWha7GF
 GWUc95iBEKa+lzcFdmMvDUrFPMzIOPyMLToCwGNHkN7nHhSihzXmbiga6rVDqh8kbZKG
 8qJqtb1zd9SvNhMnkORql6gdLLQRgsPZUHWtbbwTpoeJ7lxMXd/xzXXEiQ5O3O6GtiNO
 CO2iPFnwtyLgGZ74nYnjv/QL/HrHurAYbw72ddbZ5dr65sxrp0bnPgEF3sJ+95osPbDb Rw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0hfqjms2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:30:08 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B4U7xf008230
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:30:07 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 21:30:00 -0700
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
Subject: [PATCH 09/11] usb: cdns2: trace: reduce buffer usage of trace event
Date:   Mon, 11 Sep 2023 12:28:41 +0800
Message-ID: <20230911042843.2711-10-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: fcIbC-TZeMSapnmOnVx7SbzlsAPo2VFd
X-Proofpoint-GUID: fcIbC-TZeMSapnmOnVx7SbzlsAPo2VFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=552 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Save u32 members into trace event ring buffer and parse it for possible
bit information.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/udc/cdns2/cdns2-trace.h | 77 ++++++++++------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-trace.h b/drivers/usb/gadget/udc/cdns2/cdns2-trace.h
index 61f241634ea5..23d15597dbaa 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-trace.h
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-trace.h
@@ -98,46 +98,45 @@ TRACE_EVENT(cdns2_ep_halt,
 	TP_PROTO(struct cdns2_endpoint *ep_priv, u8 halt, u8 flush),
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
 
 TRACE_EVENT(cdns2_wa1,
 	TP_PROTO(struct cdns2_endpoint *ep_priv, char *msg),
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
 
 DECLARE_EVENT_CLASS(cdns2_log_doorbell,
 	TP_PROTO(struct cdns2_endpoint *pep, u32 ep_trbaddr),
 	TP_ARGS(pep, ep_trbaddr),
 	TP_STRUCT__entry(
-		__string(name, pep->num ? pep->name :
-				(pep->dir ? "ep0in" : "ep0out"))
+		__field(u32, edw3)
 		__field(u32, ep_trbaddr)
 	),
 	TP_fast_assign(
-		__assign_str(name, pep->name);
+		__entry->edw3 = pep->endpoint.dw3;
 		__entry->ep_trbaddr = ep_trbaddr;
 	),
-	TP_printk("%s, ep_trbaddr %08x", __get_str(name),
+	TP_printk("%s, ep_trbaddr %08x", USB_EP_NAME(__entry->edw3),
 		  __entry->ep_trbaddr)
 );
 
@@ -190,20 +189,20 @@ DECLARE_EVENT_CLASS(cdns2_log_epx_irq,
 	TP_PROTO(struct cdns2_device *pdev, struct cdns2_endpoint *pep),
 	TP_ARGS(pdev, pep),
 	TP_STRUCT__entry(
-		__string(ep_name, pep->name)
+		__field(u32, edw3)
 		__field(u32, ep_sts)
 		__field(u32, ep_ists)
 		__field(u32, ep_traddr)
 	),
 	TP_fast_assign(
-		__assign_str(ep_name, pep->name);
+		__entry->edw3 = pep->endpoint.dw3;
 		__entry->ep_sts = readl(&pdev->adma_regs->ep_sts);
 		__entry->ep_ists = readl(&pdev->adma_regs->ep_ists);
 		__entry->ep_traddr = readl(&pdev->adma_regs->ep_traddr);
 	),
 	TP_printk("%s, ep_traddr: %08x",
 		  cdns2_decode_epx_irq(__get_buf(CDNS2_MSG_MAX), CDNS2_MSG_MAX,
-				       __get_str(ep_name),
+				       USB_EP_NAME(__entry->edw3),
 				       __entry->ep_ists, __entry->ep_sts),
 		  __entry->ep_traddr)
 );
@@ -270,7 +269,7 @@ DECLARE_EVENT_CLASS(cdns2_log_request,
 	TP_PROTO(struct cdns2_request *preq),
 	TP_ARGS(preq),
 	TP_STRUCT__entry(
-		__string(name, preq->pep->name)
+		__field(u32, edw3)
 		__field(struct usb_request *, request)
 		__field(struct cdns2_request *, preq)
 		__field(void *, buf)
@@ -278,9 +277,7 @@ DECLARE_EVENT_CLASS(cdns2_log_request,
 		__field(unsigned int, length)
 		__field(int, status)
 		__field(dma_addr_t, dma)
-		__field(int, zero)
-		__field(int, short_not_ok)
-		__field(int, no_interrupt)
+		__field(u32, rdw1)
 		__field(struct scatterlist*, sg)
 		__field(unsigned int, num_sgs)
 		__field(unsigned int, num_mapped_sgs)
@@ -288,7 +285,7 @@ DECLARE_EVENT_CLASS(cdns2_log_request,
 		__field(int, end_trb)
 	),
 	TP_fast_assign(
-		__assign_str(name, preq->pep->name);
+		__entry->edw3 = preq->pep->endpoint.dw3;
 		__entry->request = &preq->request;
 		__entry->preq = preq;
 		__entry->buf = preq->request.buf;
@@ -296,9 +293,7 @@ DECLARE_EVENT_CLASS(cdns2_log_request,
 		__entry->length = preq->request.length;
 		__entry->status = preq->request.status;
 		__entry->dma = preq->request.dma;
-		__entry->zero = preq->request.zero;
-		__entry->short_not_ok = preq->request.short_not_ok;
-		__entry->no_interrupt = preq->request.no_interrupt;
+		__entry->rdw1 = preq->request.dw1;
 		__entry->sg = preq->request.sg;
 		__entry->num_sgs = preq->request.num_sgs;
 		__entry->num_mapped_sgs = preq->request.num_mapped_sgs;
@@ -308,12 +303,12 @@ DECLARE_EVENT_CLASS(cdns2_log_request,
 	TP_printk("%s: req: %p, preq: %p, req buf: %p, length: %u/%u, status: %d,"
 		  "buf dma: (%pad), %s%s%s, sg: %p, num_sgs: %d, num_m_sgs: %d,"
 		  "trb: [start: %d, end: %d]",
-		  __get_str(name), __entry->request, __entry->preq,
+		  USB_EP_NAME(__entry->edw3), __entry->request, __entry->preq,
 		  __entry->buf, __entry->actual, __entry->length,
 		  __entry->status, &__entry->dma,
-		  __entry->zero ? "Z" : "z",
-		  __entry->short_not_ok ? "S" : "s",
-		  __entry->no_interrupt ? "I" : "i",
+		  USB_REQ_ZERO(__entry->rdw1) ? "Z" : "z",
+		  USB_REQ_SHORT_NOT_OK(__entry->rdw1) ? "S" : "s",
+		  USB_REQ_NO_INTERRUPT(__entry->rdw1) ? "I" : "i",
 		  __entry->sg, __entry->num_sgs, __entry->num_mapped_sgs,
 		  __entry->start_trb,
 		  __entry->end_trb
@@ -374,19 +369,19 @@ DECLARE_EVENT_CLASS(cdns2_log_map_request,
 	TP_PROTO(struct cdns2_request *priv_req),
 	TP_ARGS(priv_req),
 	TP_STRUCT__entry(
-		__string(name, priv_req->pep->name)
+		__field(u32, edw3)
 		__field(struct usb_request *, req)
 		__field(void *, buf)
 		__field(dma_addr_t, dma)
 	),
 	TP_fast_assign(
-		__assign_str(name, priv_req->pep->name);
+		__entry->edw3 = priv_req->pep->endpoint.dw3;
 		__entry->req = &priv_req->request;
 		__entry->buf = priv_req->request.buf;
 		__entry->dma = priv_req->request.dma;
 	),
 	TP_printk("%s: req: %p, req buf %p, dma %p",
-		  __get_str(name), __entry->req, __entry->buf, &__entry->dma
+		  USB_EP_NAME(__entry->edw3), __entry->req, __entry->buf, &__entry->dma
 	)
 );
 
@@ -403,7 +398,7 @@ DECLARE_EVENT_CLASS(cdns2_log_trb,
 	TP_PROTO(struct cdns2_endpoint *pep, struct cdns2_trb *trb),
 	TP_ARGS(pep, trb),
 	TP_STRUCT__entry(
-		__string(name, pep->name)
+		__field(u32, edw3)
 		__field(struct cdns2_trb *, trb)
 		__field(u32, buffer)
 		__field(u32, length)
@@ -411,7 +406,7 @@ DECLARE_EVENT_CLASS(cdns2_log_trb,
 		__field(u32, type)
 	),
 	TP_fast_assign(
-		__assign_str(name, pep->name);
+		__entry->edw3 = pep->endpoint.dw3;
 		__entry->trb = trb;
 		__entry->buffer = le32_to_cpu(trb->buffer);
 		__entry->length = le32_to_cpu(trb->length);
@@ -419,7 +414,7 @@ DECLARE_EVENT_CLASS(cdns2_log_trb,
 		__entry->type = usb_endpoint_type(pep->endpoint.desc);
 	),
 	TP_printk("%s: trb V: %p, dma buf: P: 0x%08x, %s",
-		 __get_str(name), __entry->trb, __entry->buffer,
+		 USB_EP_NAME(__entry->edw3), __entry->trb, __entry->buffer,
 		 cdns2_decode_trb(__get_buf(CDNS2_MSG_MAX), CDNS2_MSG_MAX,
 				  __entry->control, __entry->length,
 				  __entry->buffer))
@@ -467,18 +462,16 @@ DECLARE_EVENT_CLASS(cdns2_log_ep,
 	TP_PROTO(struct cdns2_endpoint *pep),
 	TP_ARGS(pep),
 	TP_STRUCT__entry(
-		__string(name, pep->name)
-		__field(unsigned int, maxpacket)
-		__field(unsigned int, maxpacket_limit)
+		__field(u32, edw3)
+		__field(u32, edw1)
 		__field(unsigned int, flags)
 		__field(unsigned int, dir)
 		__field(u8, enqueue)
 		__field(u8, dequeue)
 	),
 	TP_fast_assign(
-		__assign_str(name, pep->name);
-		__entry->maxpacket = pep->endpoint.maxpacket;
-		__entry->maxpacket_limit = pep->endpoint.maxpacket_limit;
+		__entry->edw3 = pep->endpoint.dw3;
+		__entry->edw1 = pep->endpoint.dw1;
 		__entry->flags = pep->ep_state;
 		__entry->dir = pep->dir;
 		__entry->enqueue = pep->ring.enqueue;
@@ -486,8 +479,8 @@ DECLARE_EVENT_CLASS(cdns2_log_ep,
 	),
 	TP_printk("%s: mps: %d/%d, enq idx: %d, deq idx: %d, "
 		  "flags: %s%s%s%s, dir: %s",
-		__get_str(name), __entry->maxpacket,
-		__entry->maxpacket_limit, __entry->enqueue,
+		USB_EP_NAME(__entry->edw3), USB_EP_MAXPACKET(__entry->edw1),
+		USB_EP_MAXPACKET_LIMIT(__entry->edw1), __entry->enqueue,
 		__entry->dequeue,
 		__entry->flags & EP_ENABLED ? "EN | " : "",
 		__entry->flags & EP_STALLED ? "STALLED | " : "",
@@ -559,7 +552,7 @@ DECLARE_EVENT_CLASS(cdns2_log_epx_reg_config,
 	TP_PROTO(struct cdns2_device *pdev, struct cdns2_endpoint *pep),
 	TP_ARGS(pdev, pep),
 	TP_STRUCT__entry(
-		__string(ep_name, pep->name)
+		__field(u32, edw3)
 		__field(u8, burst_size)
 		__field(__le16, maxpack_reg)
 		__field(__u8, con_reg)
@@ -568,7 +561,7 @@ DECLARE_EVENT_CLASS(cdns2_log_epx_reg_config,
 		__field(u32, ep_cfg_reg)
 	),
 	TP_fast_assign(
-		__assign_str(ep_name, pep->name);
+		__entry->edw3 = pep->endpoint.dw3;
 		__entry->burst_size = pep->trb_burst_size;
 		__entry->maxpack_reg = pep->dir ? readw(&pdev->epx_regs->txmaxpack[pep->num - 1]) :
 						  readw(&pdev->epx_regs->rxmaxpack[pep->num - 1]);
@@ -581,7 +574,7 @@ DECLARE_EVENT_CLASS(cdns2_log_epx_reg_config,
 
 	TP_printk("%s, maxpack: %d, con: %02x, dma_ep_sel: %08x, dma_ep_sts_en: %08x"
 		  " dma_ep_cfg %08x",
-		  __get_str(ep_name), __entry->maxpack_reg, __entry->con_reg,
+		 USB_EP_NAME(__entry->edw3), __entry->maxpack_reg, __entry->con_reg,
 		  __entry->ep_sel_reg, __entry->ep_sts_en_reg,
 		  __entry->ep_cfg_reg
 	)
-- 
2.17.1

