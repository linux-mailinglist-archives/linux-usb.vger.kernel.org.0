Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72EAE79CEBB
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 12:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbjILKsS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 06:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbjILKrr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 06:47:47 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BA9173D
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:46:24 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CAgoqt019696;
        Tue, 12 Sep 2023 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=DImw7qQNjmkbdTS2juSi4cOCSpuwOJeLS5tlfZW/oLc=;
 b=CnAK+lSD6SGC0PqWkPvlUJtdMKnrjW4zy1ckCfupTmhrzCM8eJvLB6zgiCtj89D2Y8z/
 W84if3932YrsLMAZJ7Uu/R0Q0XRq3cIydeG3iQL/ZeMnC/8iyOk72iTr8IPG/bnGSSEA
 XlfiqHtwKHCedMoSskue1sZReD1H8BXMuV7qH/DLQAeTXggCo6Kz2dCqLBH1GtnVfQ5N
 wM7S/5f7EJCpOD3LpV4Yx31WSrKBR9kQbllvqdyLL96ImrBs+O0rBdjLvb/2jC786aK+
 lOS+JFNrQ5kEnH+gz24W5KE0u5hSP8e1/WvXtfKgZQjB1haphVuOYCdkEnG3hok+etZ+ +w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1yacb251-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:42 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CAjexG018486
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:40 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 12 Sep 2023 03:45:33 -0700
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
Subject: [PATCH v3 04/10] usb: udc: trace: reduce buffer usage of trace event
Date:   Tue, 12 Sep 2023 18:44:49 +0800
Message-ID: <20230912104455.7737-5-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: htR4jPrxMKfKvZznFNNAGiC-QxdhxAgR
X-Proofpoint-GUID: htR4jPrxMKfKvZznFNNAGiC-QxdhxAgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=609 priorityscore=1501 bulkscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120090
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Save u32 members into trace event ring buffer and parse it for possible
bit fields.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: no change

 drivers/usb/gadget/udc/trace.h | 106 +++++++++++----------------------
 1 file changed, 35 insertions(+), 71 deletions(-)

diff --git a/drivers/usb/gadget/udc/trace.h b/drivers/usb/gadget/udc/trace.h
index a5ed26fbc2da..10cc6437432d 100644
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
@@ -46,38 +33,25 @@ DECLARE_EVENT_CLASS(udc_log_gadget,
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
 	TP_printk("speed %d/%d state %d %dmA [%s%s%s%s%s%s%s%s%s%s%s%s%s%s] --> %d",
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
+		USB_GADGET_SG_SUPPORTED(__entry->gdw1) ? "sg:" : "",
+		USB_GADGET_IS_OTG(__entry->gdw1) ? "OTG:" : "",
+		USB_GADGET_IS_A_PERIPHERAL(__entry->gdw1) ? "a_peripheral:" : "",
+		USB_GADGET_B_HNP_ENABLE(__entry->gdw1) ? "b_hnp:" : "",
+		USB_GADGET_A_HNP_SUPPORT(__entry->gdw1) ? "a_hnp:" : "",
+		USB_GADGET_HNP_POLLING_SUPPORT(__entry->gdw1) ? "hnp_poll:" : "",
+		USB_GADGET_HOST_REQUEST_FLAG(__entry->gdw1) ? "hostreq:" : "",
+		USB_GADGET_QUIRK_EP_OUT_ALIGNED_SIZE(__entry->gdw1) ? "out_aligned:" : "",
+		USB_GADGET_QUIRK_ALTSET_NOT_SUPP(__entry->gdw1) ? "no_altset:" : "",
+		USB_GADGET_QUIRK_STALL_NOT_SUPP(__entry->gdw1) ? "no_stall:" : "",
+		USB_GADGET_QUIRK_ZLP_NOT_SUPP(__entry->gdw1) ? "no_zlp" : "",
+		USB_GADGET_IS_SELFPOWERED(__entry->gdw1) ? "self-powered:" : "bus-powered:",
+		USB_GADGET_DEACTIVATED(__entry->gdw1) ? "deactivated:" : "activated:",
+		USB_GADGET_CONNECTED(__entry->gdw1) ? "connected" : "disconnected",
 		__entry->ret)
 );
 
@@ -145,32 +119,28 @@ DECLARE_EVENT_CLASS(udc_log_ep,
 	TP_PROTO(struct usb_ep *ep, int ret),
 	TP_ARGS(ep, ret),
 	TP_STRUCT__entry(
-		__string(name, ep->name)
-		__field(unsigned, maxpacket)
-		__field(unsigned, maxpacket_limit)
-		__field(unsigned, max_streams)
-		__field(unsigned, mult)
-		__field(unsigned, maxburst)
+		__field(u32, edw3)
+		__field(u32, edw1)
+		__field(u32, edw2)
 		__field(u8, address)
 		__field(bool, claimed)
 		__field(bool, enabled)
 		__field(int, ret)
 	),
 	TP_fast_assign(
-		__assign_str(name, ep->name);
-		__entry->maxpacket = ep->maxpacket;
-		__entry->maxpacket_limit = ep->maxpacket_limit;
-		__entry->max_streams = ep->max_streams;
-		__entry->mult = ep->mult;
-		__entry->maxburst = ep->maxburst;
+		__entry->edw3 = ep->dw3;
+		__entry->edw1 = ep->dw1;
+		__entry->edw2 = ep->dw2;
 		__entry->address = ep->address,
 		__entry->claimed = ep->claimed;
 		__entry->enabled = ep->enabled;
 		__entry->ret = ret;
 	),
 	TP_printk("%s: mps %d/%d streams %d mult %d burst %d addr %02x %s%s --> %d",
-		__get_str(name), __entry->maxpacket, __entry->maxpacket_limit,
-		__entry->max_streams, __entry->mult, __entry->maxburst,
+		USB_EP_NAME(__entry->edw3), USB_EP_MAXPACKET(__entry->edw1),
+		USB_EP_MAXPACKET_LIMIT(__entry->edw1),
+		USB_EP_MAX_STREAMS(__entry->edw2), USB_EP_MULT(__entry->edw2),
+		USB_EP_MAXBURST(__entry->edw2),
 		__entry->address, __entry->claimed ? "claimed:" : "released:",
 		__entry->enabled ? "enabled" : "disabled", ret)
 );
@@ -219,39 +189,33 @@ DECLARE_EVENT_CLASS(udc_log_req,
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
 	TP_printk("%s: req %p length %d/%d sgs %d/%d stream %d %s%s%s status %d --> %d",
-		__get_str(name),__entry->req,  __entry->actual, __entry->length,
-		__entry->num_mapped_sgs, __entry->num_sgs, __entry->stream_id,
-		__entry->zero ? "Z" : "z",
-		__entry->short_not_ok ? "S" : "s",
-		__entry->no_interrupt ? "i" : "I",
+		USB_EP_NAME(__entry->edw3), __entry->req, __entry->actual, __entry->length,
+		__entry->num_mapped_sgs, __entry->num_sgs, USB_REQ_STREAM_ID(__entry->rdw1),
+		USB_REQ_ZERO(__entry->rdw1) ? "Z" : "z",
+		USB_REQ_SHORT_NOT_OK(__entry->rdw1) ? "S" : "s",
+		USB_REQ_NO_INTERRUPT(__entry->rdw1) ? "i" : "I",
 		__entry->status, __entry->ret
 	)
 );
-- 
2.17.1

