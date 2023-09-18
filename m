Return-Path: <linux-usb+bounces-318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C07A4861
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 13:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FFF01C21140
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 11:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60EA1C695;
	Mon, 18 Sep 2023 11:28:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D050B38F8F
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 11:28:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EBA171C
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 04:26:21 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38IAUX61019139;
	Mon, 18 Sep 2023 11:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=vG3MOycD+ZTUyjbBirEcUduBOFBsZic3dakMOBshEXw=;
 b=KAEbh/8KsZcJenAqw0nAwRsYKvridjpBsRsdZWHu9D5CFN8GzEhSc+lMFlgB3gcmQkTy
 zIsRQScQSB/iKu5bL1oZPNRKpUJTzqcEOx4BLWJl2YmvDyzow9sBlQlLy4myV2rBc27d
 OgjW0eAg4WQv5U9NEFqAEEaq9RYTamxIQXXiFWxqwOjYqHJpQ0IQURhlzL7VS/ZlpRq4
 KWzkL07Ifg9dRiSAMnNT6sOACZl3kjJJyGkabNkzjlIkAOpfrN25Z8hSMQxU01CiDoh8
 bToMuQr+/gvF81F7QtR/Lb/nowvW4bxqbCBf9GXezM4BUhEMj753Se+FESf8yurNWyGd JA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6mv1r31w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:55 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IBPsst031896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:54 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 18 Sep 2023 04:25:52 -0700
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v7 4/4] usb: dwc3: trace: reduce buffer usage of trace event
Date: Mon, 18 Sep 2023 19:25:34 +0800
Message-ID: <20230918112534.2108-5-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
References: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: k0Qgd-L5rIPLhPup6ObmYWw2uf4q167A
X-Proofpoint-ORIG-GUID: k0Qgd-L5rIPLhPup6ObmYWw2uf4q167A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_02,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=559 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309180100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Save u32 members into trace event ring buffer and parse it for bit fields.

take below trace event class for explanation, save two u32 members and
parse it to generate ep name and other information.

old:
DECLARE_EVENT_CLASS(dwc3_log_request,
	TP_PROTO(struct dwc3_request *req),
	TP_ARGS(req),
	TP_STRUCT__entry(
		__string(name, req->dep->name)
		__field(struct dwc3_request *, req)
		__field(unsigned int, actual)
		__field(unsigned int, length)
		__field(int, status)
		__field(int, zero)
		__field(int, short_not_ok)
		__field(int, no_interrupt)
	),
	TP_fast_assign(
		__assign_str(name, req->dep->name);
		__entry->req = req;
		__entry->actual = req->request.actual;
		__entry->length = req->request.length;
		__entry->status = req->request.status;
		__entry->zero = req->request.zero;
		__entry->short_not_ok = req->request.short_not_ok;
		__entry->no_interrupt = req->request.no_interrupt;
	),
	TP_printk("%s: req %p length %u/%u %s%s%s ==> %d",
		__get_str(name), __entry->req, __entry->actual, __entry->length,
		__entry->zero ? "Z" : "z",
		__entry->short_not_ok ? "S" : "s",
		__entry->no_interrupt ? "i" : "I",
		__entry->status
	)
);

new:
DECLARE_EVENT_CLASS(dwc3_log_request,
	TP_PROTO(struct dwc3_request *req),
	TP_ARGS(req),
	TP_STRUCT__entry(
		__field(u32, edw3)
		__field(struct dwc3_request *, req)
		__field(unsigned int, actual)
		__field(unsigned int, length)
		__field(int, status)
		__field(u32, rdw1)
	),
	TP_fast_assign(
		__entry->edw3 = req->dep->endpoint.dw3;
		__entry->req = req;
		__entry->actual = req->request.actual;
		__entry->length = req->request.length;
		__entry->status = req->request.status;
		__entry->rdw1 = req->request.dw1;
	),
	TP_printk("%s: req %p length %u/%u %s ==> %d",
		usb_gadget_ep_name(__get_buf(USB_EP_MAX_NAME_LEN), __entry->edw3),
		__entry->req, __entry->actual, __entry->length,
		__print_flags(__entry->rdw1, ":", USB_REQ_FLAGS),
		__entry->status
	)
);

consider 32 bit ARCH,
for old definition, one trace entry size is:
4 (ring buffer event header ) + 8 (trace event header ) +
32 (trace class header) + 9 (ep string name) = 53 bytes.

for new definition, one trace entry size is:
4 (ring buffer event header ) + 8 (trace event header ) +
24 (trace class header)  = 36 bytes.

consider there is 1MB trace buffer space,
for old definition, it can save 19784 entries,
for new definition, it can save 29127 entries.

Use new common trace event macro in gadget.h for output stage.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/dwc3/trace.h | 63 ++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index d2997d17cfbe..1dbd56e98463 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -102,30 +102,25 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
 	TP_PROTO(struct dwc3_request *req),
 	TP_ARGS(req),
 	TP_STRUCT__entry(
-		__string(name, req->dep->name)
+		__field(u32, edw3)
 		__field(struct dwc3_request *, req)
 		__field(unsigned int, actual)
 		__field(unsigned int, length)
 		__field(int, status)
-		__field(int, zero)
-		__field(int, short_not_ok)
-		__field(int, no_interrupt)
+		__field(u32, rdw1)
 	),
 	TP_fast_assign(
-		__assign_str(name, req->dep->name);
+		__entry->edw3 = req->dep->endpoint.dw3;
 		__entry->req = req;
 		__entry->actual = req->request.actual;
 		__entry->length = req->request.length;
 		__entry->status = req->request.status;
-		__entry->zero = req->request.zero;
-		__entry->short_not_ok = req->request.short_not_ok;
-		__entry->no_interrupt = req->request.no_interrupt;
+		__entry->rdw1 = req->request.dw1;
 	),
-	TP_printk("%s: req %p length %u/%u %s%s%s ==> %d",
-		__get_str(name), __entry->req, __entry->actual, __entry->length,
-		__entry->zero ? "Z" : "z",
-		__entry->short_not_ok ? "S" : "s",
-		__entry->no_interrupt ? "i" : "I",
+	TP_printk("%s: req %p length %u/%u %s ==> %d",
+		usb_gadget_ep_name(__get_buf(USB_EP_MAX_NAME_LEN), __entry->edw3),
+		__entry->req, __entry->actual, __entry->length,
+		__print_flags(__entry->rdw1, ":", USB_REQ_FLAGS),
 		__entry->status
 	)
 );
@@ -185,7 +180,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		struct dwc3_gadget_ep_cmd_params *params, int cmd_status),
 	TP_ARGS(dep, cmd, params, cmd_status),
 	TP_STRUCT__entry(
-		__string(name, dep->name)
+		__field(u32, edw3)
 		__field(unsigned int, cmd)
 		__field(u32, param0)
 		__field(u32, param1)
@@ -193,7 +188,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__field(int, cmd_status)
 	),
 	TP_fast_assign(
-		__assign_str(name, dep->name);
+		__entry->edw3 = dep->endpoint.dw3;
 		__entry->cmd = cmd;
 		__entry->param0 = params->param0;
 		__entry->param1 = params->param1;
@@ -201,7 +196,8 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__entry->cmd_status = cmd_status;
 	),
 	TP_printk("%s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
-		__get_str(name), dwc3_gadget_ep_cmd_string(__entry->cmd),
+		usb_gadget_ep_name(__get_buf(USB_EP_MAX_NAME_LEN), __entry->edw3),
+		dwc3_gadget_ep_cmd_string(__entry->cmd),
 		__entry->cmd, __entry->param0,
 		__entry->param1, __entry->param2,
 		dwc3_ep_cmd_status_string(__entry->cmd_status)
@@ -218,7 +214,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 	TP_PROTO(struct dwc3_ep *dep, struct dwc3_trb *trb),
 	TP_ARGS(dep, trb),
 	TP_STRUCT__entry(
-		__string(name, dep->name)
+		__field(u32, edw3)
 		__field(struct dwc3_trb *, trb)
 		__field(u32, bpl)
 		__field(u32, bph)
@@ -229,7 +225,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__field(u32, dequeue)
 	),
 	TP_fast_assign(
-		__assign_str(name, dep->name);
+		__entry->edw3 = dep->endpoint.dw3;
 		__entry->trb = trb;
 		__entry->bpl = trb->bpl;
 		__entry->bph = trb->bph;
@@ -240,7 +236,8 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->dequeue = dep->trb_dequeue;
 	),
 	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
-		__get_str(name), __entry->trb, __entry->enqueue,
+		usb_gadget_ep_name(__get_buf(USB_EP_MAX_NAME_LEN), __entry->edw3),
+		__entry->trb, __entry->enqueue,
 		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
 		int pcm = ((__entry->size >> 24) & 3) + 1;
@@ -272,7 +269,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->ctrl & DWC3_TRB_CTRL_CSP ? 'S' : 's',
 		__entry->ctrl & DWC3_TRB_CTRL_ISP_IMI ? 'S' : 's',
 		__entry->ctrl & DWC3_TRB_CTRL_IOC ? 'C' : 'c',
-		  dwc3_trb_type_string(DWC3_TRBCTL_TYPE(__entry->ctrl))
+		dwc3_trb_type_string(DWC3_TRBCTL_TYPE(__entry->ctrl))
 	)
 );
 
@@ -290,32 +287,30 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
 	TP_PROTO(struct dwc3_ep *dep),
 	TP_ARGS(dep),
 	TP_STRUCT__entry(
-		__string(name, dep->name)
-		__field(unsigned int, maxpacket)
-		__field(unsigned int, maxpacket_limit)
-		__field(unsigned int, max_streams)
-		__field(unsigned int, maxburst)
+		__field(u32, edw3)
+		__field(u32, edw1)
+		__field(u32, edw2)
 		__field(unsigned int, flags)
 		__field(unsigned int, direction)
 		__field(u8, trb_enqueue)
 		__field(u8, trb_dequeue)
 	),
 	TP_fast_assign(
-		__assign_str(name, dep->name);
-		__entry->maxpacket = dep->endpoint.maxpacket;
-		__entry->maxpacket_limit = dep->endpoint.maxpacket_limit;
-		__entry->max_streams = dep->endpoint.max_streams;
-		__entry->maxburst = dep->endpoint.maxburst;
+		__entry->edw3 = dep->endpoint.dw3;
+		__entry->edw1 = dep->endpoint.dw1;
+		__entry->edw2 = dep->endpoint.dw2;
 		__entry->flags = dep->flags;
 		__entry->direction = dep->direction;
 		__entry->trb_enqueue = dep->trb_enqueue;
 		__entry->trb_dequeue = dep->trb_dequeue;
 	),
 	TP_printk("%s: mps %d/%d streams %d burst %d ring %d/%d flags %c:%c%c%c%c:%c",
-		__get_str(name), __entry->maxpacket,
-		__entry->maxpacket_limit, __entry->max_streams,
-		__entry->maxburst, __entry->trb_enqueue,
-		__entry->trb_dequeue,
+		usb_gadget_ep_name(__get_buf(USB_EP_MAX_NAME_LEN), __entry->edw3),
+		u32_get_bits(__entry->edw1, USB_EP_MAXPACKET),
+		u32_get_bits(__entry->edw1, USB_EP_MAXPACKET_LIMIT),
+		u32_get_bits(__entry->edw2, USB_EP_MAX_STREAMS),
+		u32_get_bits(__entry->edw2, USB_EP_MAXBURST),
+		__entry->trb_enqueue, __entry->trb_dequeue,
 		__entry->flags & DWC3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & DWC3_EP_STALL ? 'S' : 's',
 		__entry->flags & DWC3_EP_WEDGE ? 'W' : 'w',
-- 
2.17.1


