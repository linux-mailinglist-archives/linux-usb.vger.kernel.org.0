Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3EE79BBFD
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350393AbjIKVhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236808AbjIKL0v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 07:26:51 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A14CDD
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 04:26:47 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BAkvbO002372;
        Mon, 11 Sep 2023 11:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=r2jeakWTFf1gx1HK0iNCS3RB47R86z2o/QG48gKkrwU=;
 b=NHHG7QlXRE12qY8OSAQ3dcXIsliiX4JA4ZXgHC4dMMjiSatkQJ8OnvhPa9kKi4yOnZSo
 yu3JDWVuksclt4VyYKQUFPR2az5HKZyFaTqyaWqeYeIsypuLO/bUIYrSp02HYvoz3JRR
 hhZkUG23mGKq48vDOAVqfYc11H7vobc5rPxoUtLU4Y8n82TE4vdzG1mbgs7glsPrDVXr
 W2R9V44Ijlib8xG3k7A/VNLTtGn/rbPhJbTB0Q5gQ6KUy+hqW6vAMcNpsg9sWY3MY+gF
 XGjjlWP/uUWsfQJkSn7NJvkeRlm6tVkRRZxmj4Kq7TZgOLcAwss7IxlD/Ez/wNAr5/AK sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0hfqkgh4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 11:26:01 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BBQ0dT015743
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 11:26:00 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 04:25:53 -0700
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
Subject: [PATCH v2 08/11] usb: dwc3: trace: reduce buffer usage of trace event
Date:   Mon, 11 Sep 2023 19:24:43 +0800
Message-ID: <20230911112446.1791-9-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
References: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xe1Xiozr8BHX2brL3ZDuAoRsJrmtOJMN
X-Proofpoint-GUID: Xe1Xiozr8BHX2brL3ZDuAoRsJrmtOJMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=530 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110104
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
v2: no change

 drivers/usb/dwc3/trace.h | 54 +++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index d2997d17cfbe..e1885b83fff8 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -102,30 +102,26 @@ DECLARE_EVENT_CLASS(dwc3_log_request,
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
 	TP_printk("%s: req %p length %u/%u %s%s%s ==> %d",
-		__get_str(name), __entry->req, __entry->actual, __entry->length,
-		__entry->zero ? "Z" : "z",
-		__entry->short_not_ok ? "S" : "s",
-		__entry->no_interrupt ? "i" : "I",
+		USB_EP_NAME(__entry->edw3), __entry->req, __entry->actual, __entry->length,
+		USB_REQ_ZERO(__entry->rdw1) ? "Z" : "z",
+		USB_REQ_SHORT_NOT_OK(__entry->rdw1) ? "S" : "s",
+		USB_REQ_NO_INTERRUPT(__entry->rdw1) ? "i" : "I",
 		__entry->status
 	)
 );
@@ -185,7 +181,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		struct dwc3_gadget_ep_cmd_params *params, int cmd_status),
 	TP_ARGS(dep, cmd, params, cmd_status),
 	TP_STRUCT__entry(
-		__string(name, dep->name)
+		__field(u32, edw3)
 		__field(unsigned int, cmd)
 		__field(u32, param0)
 		__field(u32, param1)
@@ -193,7 +189,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__field(int, cmd_status)
 	),
 	TP_fast_assign(
-		__assign_str(name, dep->name);
+		__entry->edw3 = dep->endpoint.dw3;
 		__entry->cmd = cmd;
 		__entry->param0 = params->param0;
 		__entry->param1 = params->param1;
@@ -201,7 +197,7 @@ DECLARE_EVENT_CLASS(dwc3_log_gadget_ep_cmd,
 		__entry->cmd_status = cmd_status;
 	),
 	TP_printk("%s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
-		__get_str(name), dwc3_gadget_ep_cmd_string(__entry->cmd),
+		USB_EP_NAME(__entry->edw3), dwc3_gadget_ep_cmd_string(__entry->cmd),
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
@@ -240,7 +236,7 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->dequeue = dep->trb_dequeue;
 	),
 	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x sofn %08x (%c%c%c%c:%c%c:%s)",
-		__get_str(name), __entry->trb, __entry->enqueue,
+		USB_EP_NAME(__entry->edw3), __entry->trb, __entry->enqueue,
 		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
 		int pcm = ((__entry->size >> 24) & 3) + 1;
@@ -290,31 +286,27 @@ DECLARE_EVENT_CLASS(dwc3_log_ep,
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
+		USB_EP_NAME(__entry->edw3), USB_EP_MAXPACKET(__entry->edw1),
+		USB_EP_MAXPACKET_LIMIT(__entry->edw1), USB_EP_MAX_STREAMS(__entry->edw2),
+		USB_EP_MAXBURST(__entry->edw2), __entry->trb_enqueue,
 		__entry->trb_dequeue,
 		__entry->flags & DWC3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & DWC3_EP_STALL ? 'S' : 's',
-- 
2.17.1

