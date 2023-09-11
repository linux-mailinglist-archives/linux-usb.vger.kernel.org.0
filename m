Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A504B79B48C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350491AbjIKViv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236809AbjIKL1A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 07:27:00 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AA2CDD
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 04:26:55 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B9eO3P002510;
        Mon, 11 Sep 2023 11:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=kgtNamJ0fZ21eh4wcebJAILd6TtjUuigowWXXBzRyw4=;
 b=hzCQfQn1HQSa3JJ5vi4fg315eyvWgFF5PTLg7Umbg6qbFHUemLYXRvYwJjau9yZeEeup
 /gNwiYbOA7mtQqcBrd75WDqwIJB2MzhWwC3IXdMXL81wAaJoEh087RW9oE83DRWQWAxj
 xPySF/r8qY0+bPBjFlq4fOYjJw8P/+c3X8wf2IaZR7K8UB6IqxxdiqdrTatWx1vV2SjM
 sqy1lolgcaFrQ5t3kGk/jGp1iGJWeh9X26A0xB44ecl+u8ew6wan+NtwStGGuLk0U3//
 VoEiuFYiTE0kv2Ii2zjenh5ItTTRqzmqNOFLlPeyQDzTwGfVQiqTxXCBENHjIvh0cRh9 sg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0hfqkghj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 11:26:15 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BBQEX9006564
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 11:26:14 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 04:26:07 -0700
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
Subject: [PATCH v2 10/11] usb: mtu3: trace: reduce buffer usage of trace event
Date:   Mon, 11 Sep 2023 19:24:45 +0800
Message-ID: <20230911112446.1791-11-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: SplsQofIG0gsBX9Xa4t5zC968pPukSH1
X-Proofpoint-GUID: SplsQofIG0gsBX9Xa4t5zC968pPukSH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=498 malwarescore=0
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

 drivers/usb/mtu3/mtu3_trace.h | 42 ++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 03d2a9bac27e..bfd97958c8a6 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -117,30 +117,28 @@ DECLARE_EVENT_CLASS(mtu3_log_request,
 	TP_PROTO(struct mtu3_request *mreq),
 	TP_ARGS(mreq),
 	TP_STRUCT__entry(
-		__string(name, mreq->mep->name)
+		__field(u32, edw3)
 		__field(struct mtu3_request *, mreq)
 		__field(struct qmu_gpd *, gpd)
 		__field(unsigned int, actual)
 		__field(unsigned int, length)
 		__field(int, status)
-		__field(int, zero)
-		__field(int, no_interrupt)
+		__field(u32, rdw1)
 	),
 	TP_fast_assign(
-		__assign_str(name, mreq->mep->name);
+		__entry->edw3 = mreq->mep->ep.dw3;
 		__entry->mreq = mreq;
 		__entry->gpd = mreq->gpd;
 		__entry->actual = mreq->request.actual;
 		__entry->length = mreq->request.length;
 		__entry->status = mreq->request.status;
-		__entry->zero = mreq->request.zero;
-		__entry->no_interrupt = mreq->request.no_interrupt;
+		__entry->rdw1 = mreq->request.dw1;
 	),
 	TP_printk("%s: req %p gpd %p len %u/%u %s%s --> %d",
-		__get_str(name), __entry->mreq, __entry->gpd,
+		USB_EP_NAME(__entry->edw3), __entry->mreq, __entry->gpd,
 		__entry->actual, __entry->length,
-		__entry->zero ? "Z" : "z",
-		__entry->no_interrupt ? "i" : "I",
+		USB_REQ_ZERO(__entry->rdw1) ? "Z" : "z",
+		USB_REQ_NO_INTERRUPT(__entry->rdw1) ? "i" : "I",
 		__entry->status
 	)
 );
@@ -174,7 +172,7 @@ DECLARE_EVENT_CLASS(mtu3_log_gpd,
 	TP_PROTO(struct mtu3_ep *mep, struct qmu_gpd *gpd),
 	TP_ARGS(mep, gpd),
 	TP_STRUCT__entry(
-		__string(name, mep->name)
+		__field(u32, edw3)
 		__field(struct qmu_gpd *, gpd)
 		__field(u32, dw0)
 		__field(u32, dw1)
@@ -182,7 +180,7 @@ DECLARE_EVENT_CLASS(mtu3_log_gpd,
 		__field(u32, dw3)
 	),
 	TP_fast_assign(
-		__assign_str(name, mep->name);
+		__entry->edw3 = mep->ep.dw3;
 		__entry->gpd = gpd;
 		__entry->dw0 = le32_to_cpu(gpd->dw0_info);
 		__entry->dw1 = le32_to_cpu(gpd->next_gpd);
@@ -190,7 +188,7 @@ DECLARE_EVENT_CLASS(mtu3_log_gpd,
 		__entry->dw3 = le32_to_cpu(gpd->dw3_info);
 	),
 	TP_printk("%s: gpd %p - %08x %08x %08x %08x",
-		__get_str(name), __entry->gpd,
+		USB_EP_NAME(__entry->edw3), __entry->gpd,
 		__entry->dw0, __entry->dw1,
 		__entry->dw2, __entry->dw3
 	)
@@ -215,31 +213,29 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 	TP_PROTO(struct mtu3_ep *mep),
 	TP_ARGS(mep),
 	TP_STRUCT__entry(
-		__string(name, mep->name)
+		__field(u32, edw3)
 		__field(unsigned int, type)
 		__field(unsigned int, slot)
-		__field(unsigned int, maxp)
-		__field(unsigned int, mult)
-		__field(unsigned int, maxburst)
+		__field(u32, edw1)
+		__field(u32, edw2)
 		__field(unsigned int, flags)
 		__field(unsigned int, direction)
 		__field(struct mtu3_gpd_ring *, gpd_ring)
 	),
 	TP_fast_assign(
-		__assign_str(name, mep->name);
+		__entry->edw3 = mep->ep.dw3;
 		__entry->type = mep->type;
 		__entry->slot = mep->slot;
-		__entry->maxp = mep->ep.maxpacket;
-		__entry->mult = mep->ep.mult;
-		__entry->maxburst = mep->ep.maxburst;
+		__entry->edw1 = mep->ep.dw1;
+		__entry->edw2 = mep->ep.dw2;
 		__entry->flags = mep->flags;
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
 	),
 	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
-		__get_str(name), usb_ep_type_string(__entry->type),
-		__entry->maxp, __entry->slot,
-		__entry->mult, __entry->maxburst,
+		USB_EP_NAME(__entry->edw3), usb_ep_type_string(__entry->type),
+		USB_EP_MAXPACKET(__entry->edw1), __entry->slot,
+		USB_EP_MULT(__entry->edw2), USB_EP_MAXBURST(__entry->edw2),
 		__entry->gpd_ring, &__entry->gpd_ring->dma,
 		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
-- 
2.17.1

