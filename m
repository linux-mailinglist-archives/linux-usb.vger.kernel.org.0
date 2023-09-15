Return-Path: <linux-usb+bounces-117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC097A156C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 07:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CBED2824CA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 05:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A101C613D;
	Fri, 15 Sep 2023 05:27:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE273611C
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 05:27:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B17272E
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 22:27:41 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F3GFus008126;
	Fri, 15 Sep 2023 05:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=bS2z7S/DxBLL58CO6wnpjleM5N4ov9wpCfpeh6rV7Lc=;
 b=O63akEuL7dKy0p5v211Xxfhw58Ka3I7yIybtEj9cUgG9CgMWGPMiyn0orJLCNNmkDbdt
 Npbp8hy/pC2fxT3ETesjU0SzIb6mvYhxNr/i5ULg7y3sOr8KahxTqiDgENuIekqKmPhb
 CmZMHSd3qLEmaWhlm0jC62So/bNELzfF7NQcHuPL/put0Z3woaQ/Ci8YOk7nh2QW0JT3
 KaZfV3dEC2wFNyKjnGScWM7aZZ9u8ulvCIKpHV6ExCxlHyU+uk2R/Lj2V3mJo6b3dpSR
 ye8G899KhWuTLv8PVchHgmBB8u7x/Db/Gkp4FRq4DvhfhxBRDPZsQoBjh8EoCo+nTleE Bw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4f6v08ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:27:34 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F5RX4b029107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:27:33 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 14 Sep 2023 22:27:31 -0700
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v6 /3] usb: dwc3: trace: reduce buffer usage of trace event
Date: Fri, 15 Sep 2023 13:27:16 +0800
Message-ID: <20230915052716.28540-4-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230915052716.28540-1-quic_linyyuan@quicinc.com>
References: <20230915052716.28540-1-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 27YyJcSj2qyguOSEPS59QV7ri-YimbCn
X-Proofpoint-ORIG-GUID: 27YyJcSj2qyguOSEPS59QV7ri-YimbCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=549 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150048
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Save u32 members in __le32 format into trace event ring buffer and parse
it for possible bit fields.

Use new common trace event macro in gadget.h for output stage.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/dwc3/trace.h | 63 ++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index d2997d17cfbe..8df2d3ec5db6 100644
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
+		__entry->edw3 = cpu_to_le32(req->dep->endpoint.dw3);
 		__entry->req = req;
 		__entry->actual = req->request.actual;
 		__entry->length = req->request.length;
 		__entry->status = req->request.status;
-		__entry->zero = req->request.zero;
-		__entry->short_not_ok = req->request.short_not_ok;
-		__entry->no_interrupt = req->request.no_interrupt;
+		__entry->rdw1 = cpu_to_le32(req->request.dw1);
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
+		__entry->edw3 = cpu_to_le32(dep->endpoint.dw3);
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
+		__entry->edw3 = cpu_to_le32(dep->endpoint.dw3);
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
+		__entry->edw3 = cpu_to_le32(dep->endpoint.dw3);
+		__entry->edw1 = cpu_to_le32(dep->endpoint.dw1);
+		__entry->edw2 = cpu_to_le32(dep->endpoint.dw2);
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


