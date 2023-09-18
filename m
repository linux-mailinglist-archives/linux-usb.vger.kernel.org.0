Return-Path: <linux-usb+bounces-316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F77A485C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 13:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6CE11C20FBB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 11:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853741C686;
	Mon, 18 Sep 2023 11:27:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A938F8F
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 11:27:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC8B10F5
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 04:26:12 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38IAis3A019863;
	Mon, 18 Sep 2023 11:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=/qKkcNZTBjHGs6cJHvnyefZU9BOQTyadpw0YmXQe/bc=;
 b=mXNZZwqVpQUoo2RaDX3va/m4OTDPIiqw61Oj/pj/UdzC1fe8V+Dis1wBuhdhtJrkX7zp
 LWqxkhjzCU/Woqm/VIwdiz+ab6tx5qoW2LGVb4/XhotS7o4/k3R4RZLKmz317gnHNGXP
 6Uhw9IP4aYdAmyve1xi6yUIY9K/fSNoXOHug2gT9oVwKLLL4H+c/TuPJ8I1Q3OFjMgyG
 +jpxJ+ptz/3/WTarsoxNJ3FIypW8XQil6wUHVJArga1wdz14Jn6dXS4SKuT3v03f4SJ8
 za//nMKoKdk2JJKqCmHK3G2mz2BCcBDDsApbAqBe7v+JQVd93jSyzcNLAslt+tJhOro7 gw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t55hu2yqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:53 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IBPqXq031876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:52 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 18 Sep 2023 04:25:50 -0700
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v7 3/4] usb: udc: trace: reduce buffer usage of trace event
Date: Mon, 18 Sep 2023 19:25:33 +0800
Message-ID: <20230918112534.2108-4-quic_linyyuan@quicinc.com>
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
X-Proofpoint-GUID: dwTikKOOA6GLw7zryoy0JcWNbELKI-4b
X-Proofpoint-ORIG-GUID: dwTikKOOA6GLw7zryoy0JcWNbELKI-4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_02,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=620 malwarescore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Save u32 members into trace event ring buffer and parse it for bit fields.

take below trace event class for explanation, save two u32 members and
parse it to generate ep name and other information.

old:
DECLARE_EVENT_CLASS(udc_log_req,
	TP_PROTO(struct usb_ep *ep, struct usb_request *req, int ret),
	TP_ARGS(ep, req, ret),
	TP_STRUCT__entry(
		__string(name, ep->name)
		__field(unsigned, length)
		__field(unsigned, actual)
		__field(unsigned, num_sgs)
		__field(unsigned, num_mapped_sgs)
		__field(unsigned, stream_id)
		__field(unsigned, no_interrupt)
		__field(unsigned, zero)
		__field(unsigned, short_not_ok)
		__field(int, status)
		__field(int, ret)
		__field(struct usb_request *, req)
	),
	TP_fast_assign(
		__assign_str(name, ep->name);
		__entry->length = req->length;
		__entry->actual = req->actual;
		__entry->num_sgs = req->num_sgs;
		__entry->num_mapped_sgs = req->num_mapped_sgs;
		__entry->stream_id = req->stream_id;
		__entry->no_interrupt = req->no_interrupt;
		__entry->zero = req->zero;
		__entry->short_not_ok = req->short_not_ok;
		__entry->status = req->status;
		__entry->ret = ret;
		__entry->req = req;
	),
	...
);

new:
DECLARE_EVENT_CLASS(udc_log_req,
	TP_PROTO(struct usb_ep *ep, struct usb_request *req, int ret),
	TP_ARGS(ep, req, ret),
	TP_STRUCT__entry(
		__field(u32, edw3)
		__field(unsigned, length)
		__field(unsigned, actual)
		__field(unsigned, num_sgs)
		__field(unsigned, num_mapped_sgs)
		__field(u32, rdw1)
		__field(int, status)
		__field(int, ret)
		__field(struct usb_request *, req)
	),
	TP_fast_assign(
		__entry->edw3 = ep->dw3;
		__entry->length = req->length;
		__entry->actual = req->actual;
		__entry->num_sgs = req->num_sgs;
		__entry->num_mapped_sgs = req->num_mapped_sgs;
		__entry->rdw1 = req->dw1;
		__entry->status = req->status;
		__entry->ret = ret;
		__entry->req = req;
	),
	...
);

consider 32 bit ARCH,
for old definition, one trace entry size is:
4 (ring buffer event header ) + 8 (trace event header ) +
48 (trace class header) + 9 (ep string name) = 69 bytes.

for new definition, one trace entry size is:
4 (ring buffer event header ) + 8 (trace event header ) +
36 (trace class header)  = 48 bytes.

consider there is 1MB trace buffer space,
for old definition, it can save 15196 entries,
for new definition, it can save 21845 entries.

Use new common trace event macro in gadget.h for output stage.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/udc/trace.h | 114 +++++++++------------------------
 1 file changed, 30 insertions(+), 84 deletions(-)

diff --git a/drivers/usb/gadget/udc/trace.h b/drivers/usb/gadget/udc/trace.h
index a5ed26fbc2da..690810b66260 100644
--- a/drivers/usb/gadget/udc/trace.h
+++ b/drivers/usb/gadget/udc/trace.h
@@ -25,20 +25,7 @@ DECLARE_EVENT_CLASS(udc_log_gadget,
 		__field(enum usb_device_speed, max_speed)
 		__field(enum usb_device_state, state)
 		__field(unsigned, mA)
-		__field(unsigned, sg_supported)
-		__field(unsigned, is_otg)
-		__field(unsigned, is_a_peripheral)
-		__field(unsigned, b_hnp_enable)
-		__field(unsigned, a_hnp_support)
-		__field(unsigned, hnp_polling_support)
-		__field(unsigned, host_request_flag)
-		__field(unsigned, quirk_ep_out_aligned_size)
-		__field(unsigned, quirk_altset_not_supp)
-		__field(unsigned, quirk_stall_not_supp)
-		__field(unsigned, quirk_zlp_not_supp)
-		__field(unsigned, is_selfpowered)
-		__field(unsigned, deactivated)
-		__field(unsigned, connected)
+		__field(u32, gdw1)
 		__field(int, ret)
 	),
 	TP_fast_assign(
@@ -46,38 +33,12 @@ DECLARE_EVENT_CLASS(udc_log_gadget,
 		__entry->max_speed = g->max_speed;
 		__entry->state = g->state;
 		__entry->mA = g->mA;
-		__entry->sg_supported = g->sg_supported;
-		__entry->is_otg = g->is_otg;
-		__entry->is_a_peripheral = g->is_a_peripheral;
-		__entry->b_hnp_enable = g->b_hnp_enable;
-		__entry->a_hnp_support = g->a_hnp_support;
-		__entry->hnp_polling_support = g->hnp_polling_support;
-		__entry->host_request_flag = g->host_request_flag;
-		__entry->quirk_ep_out_aligned_size = g->quirk_ep_out_aligned_size;
-		__entry->quirk_altset_not_supp = g->quirk_altset_not_supp;
-		__entry->quirk_stall_not_supp = g->quirk_stall_not_supp;
-		__entry->quirk_zlp_not_supp = g->quirk_zlp_not_supp;
-		__entry->is_selfpowered = g->is_selfpowered;
-		__entry->deactivated = g->deactivated;
-		__entry->connected = g->connected;
+		__entry->gdw1 = g->dw1;
 		__entry->ret = ret;
 	),
-	TP_printk("speed %d/%d state %d %dmA [%s%s%s%s%s%s%s%s%s%s%s%s%s%s] --> %d",
+	TP_printk("speed %d/%d state %d %dmA [%s] --> %d",
 		__entry->speed, __entry->max_speed, __entry->state, __entry->mA,
-		__entry->sg_supported ? "sg:" : "",
-		__entry->is_otg ? "OTG:" : "",
-		__entry->is_a_peripheral ? "a_peripheral:" : "",
-		__entry->b_hnp_enable ? "b_hnp:" : "",
-		__entry->a_hnp_support ? "a_hnp:" : "",
-		__entry->hnp_polling_support ? "hnp_poll:" : "",
-		__entry->host_request_flag ? "hostreq:" : "",
-		__entry->quirk_ep_out_aligned_size ? "out_aligned:" : "",
-		__entry->quirk_altset_not_supp ? "no_altset:" : "",
-		__entry->quirk_stall_not_supp ? "no_stall:" : "",
-		__entry->quirk_zlp_not_supp ? "no_zlp" : "",
-		__entry->is_selfpowered ? "self-powered:" : "bus-powered:",
-		__entry->deactivated ? "deactivated:" : "activated:",
-		__entry->connected ? "connected" : "disconnected",
+		__print_flags(__entry->gdw1, ":", USB_GADGET_FLAGS),
 		__entry->ret)
 );
 
@@ -145,34 +106,26 @@ DECLARE_EVENT_CLASS(udc_log_ep,
 	TP_PROTO(struct usb_ep *ep, int ret),
 	TP_ARGS(ep, ret),
 	TP_STRUCT__entry(
-		__string(name, ep->name)
-		__field(unsigned, maxpacket)
-		__field(unsigned, maxpacket_limit)
-		__field(unsigned, max_streams)
-		__field(unsigned, mult)
-		__field(unsigned, maxburst)
-		__field(u8, address)
-		__field(bool, claimed)
-		__field(bool, enabled)
+		__field(u32, edw3)
+		__field(u32, edw1)
+		__field(u32, edw2)
 		__field(int, ret)
 	),
 	TP_fast_assign(
-		__assign_str(name, ep->name);
-		__entry->maxpacket = ep->maxpacket;
-		__entry->maxpacket_limit = ep->maxpacket_limit;
-		__entry->max_streams = ep->max_streams;
-		__entry->mult = ep->mult;
-		__entry->maxburst = ep->maxburst;
-		__entry->address = ep->address,
-		__entry->claimed = ep->claimed;
-		__entry->enabled = ep->enabled;
+		__entry->edw3 = ep->dw3;
+		__entry->edw1 = ep->dw1;
+		__entry->edw2 = ep->dw2;
 		__entry->ret = ret;
 	),
-	TP_printk("%s: mps %d/%d streams %d mult %d burst %d addr %02x %s%s --> %d",
-		__get_str(name), __entry->maxpacket, __entry->maxpacket_limit,
-		__entry->max_streams, __entry->mult, __entry->maxburst,
-		__entry->address, __entry->claimed ? "claimed:" : "released:",
-		__entry->enabled ? "enabled" : "disabled", ret)
+	TP_printk("%s: mps %d/%d streams %d mult %d burst %d addr %02x %s --> %d",
+		usb_gadget_ep_name(__get_buf(USB_EP_MAX_NAME_LEN), __entry->edw3),
+		u32_get_bits(__entry->edw1, USB_EP_MAXPACKET),
+		u32_get_bits(__entry->edw1, USB_EP_MAXPACKET_LIMIT),
+		u32_get_bits(__entry->edw2, USB_EP_MAX_STREAMS),
+		u32_get_bits(__entry->edw2, USB_EP_MULT),
+		u32_get_bits(__entry->edw2, USB_EP_MAXBURST),
+		u32_get_bits(__entry->edw3, USB_EP_ADDRESS),
+		__print_flags(__entry->edw3, ":", USB_EP_FLAGS), ret)
 );
 
 DEFINE_EVENT(udc_log_ep, usb_ep_set_maxpacket_limit,
@@ -219,41 +172,34 @@ DECLARE_EVENT_CLASS(udc_log_req,
 	TP_PROTO(struct usb_ep *ep, struct usb_request *req, int ret),
 	TP_ARGS(ep, req, ret),
 	TP_STRUCT__entry(
-		__string(name, ep->name)
+		__field(u32, edw3)
 		__field(unsigned, length)
 		__field(unsigned, actual)
 		__field(unsigned, num_sgs)
 		__field(unsigned, num_mapped_sgs)
-		__field(unsigned, stream_id)
-		__field(unsigned, no_interrupt)
-		__field(unsigned, zero)
-		__field(unsigned, short_not_ok)
+		__field(u32, rdw1)
 		__field(int, status)
 		__field(int, ret)
 		__field(struct usb_request *, req)
 	),
 	TP_fast_assign(
-		__assign_str(name, ep->name);
+		__entry->edw3 = ep->dw3;
 		__entry->length = req->length;
 		__entry->actual = req->actual;
 		__entry->num_sgs = req->num_sgs;
 		__entry->num_mapped_sgs = req->num_mapped_sgs;
-		__entry->stream_id = req->stream_id;
-		__entry->no_interrupt = req->no_interrupt;
-		__entry->zero = req->zero;
-		__entry->short_not_ok = req->short_not_ok;
+		__entry->rdw1 = req->dw1;
 		__entry->status = req->status;
 		__entry->ret = ret;
 		__entry->req = req;
 	),
-	TP_printk("%s: req %p length %d/%d sgs %d/%d stream %d %s%s%s status %d --> %d",
-		__get_str(name),__entry->req,  __entry->actual, __entry->length,
-		__entry->num_mapped_sgs, __entry->num_sgs, __entry->stream_id,
-		__entry->zero ? "Z" : "z",
-		__entry->short_not_ok ? "S" : "s",
-		__entry->no_interrupt ? "i" : "I",
-		__entry->status, __entry->ret
-	)
+	TP_printk("%s: req %p length %d/%d sgs %d/%d stream %d %s status %d --> %d",
+		usb_gadget_ep_name(__get_buf(USB_EP_MAX_NAME_LEN), __entry->edw3),
+		__entry->req, __entry->actual, __entry->length,
+		__entry->num_mapped_sgs, __entry->num_sgs,
+		u32_get_bits(__entry->rdw1, USB_REQ_STREAM_ID),
+		__print_flags(__entry->rdw1, ":", USB_REQ_FLAGS),
+		__entry->status, __entry->ret)
 );
 
 DEFINE_EVENT(udc_log_req, usb_ep_alloc_request,
-- 
2.17.1


