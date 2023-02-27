Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F1D6A38FC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 03:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjB0Cph (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 21:45:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjB0Cpf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 21:45:35 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C78FF17
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 18:45:13 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R269iR006230;
        Mon, 27 Feb 2023 02:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=0qmkZfrq2PTHevh9BThZ+cWPedVJBgv+EHb4XdSbAUE=;
 b=UnGTODnDA0yIhhXJJ96Gs5VTSvKa6gTFavOMBlV7nvKgRHALkQ4Vo/4pXEAKpj7LNTGq
 oS56wvyvqvLB+dv7NI86uD2Svf6s+huAGBmhGTzCT3solZ6zvlgpdOR+kNIlIXQOGNAI
 EFZntbb9MHAG6kgxDmuRm80Gr19CmNpwG2bHpKnBpZPbtvBkc4yxV4FtBgHk26kwoiau
 OI28KYwoKqqwkxEMsQUO2rgGttyk6bTskKYDWlCYFQqGiZPi4M0Gdoeak0JMcc+XnMG0
 bjG5nXpBFkHNhFhDgUCRK3py68vSk1E9N5JWyPaekc7kIxLCRCPM8JebV2IvzvLssdZ4 nw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny9nuufby-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:44:31 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31R2iUi3019941
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 02:44:30 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Sun, 26 Feb 2023 18:44:28 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        "Pawel Laszczak" <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 4/4] usb: xhci: change some trace event __dynamic_array() to __get_buf()
Date:   Mon, 27 Feb 2023 10:44:10 +0800
Message-ID: <1677465850-1396-5-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1677465850-1396-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1677465850-1396-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1M9WwbIHuUEljYX024amZ8CfBblmov56
X-Proofpoint-GUID: 1M9WwbIHuUEljYX024amZ8CfBblmov56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=717 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270019
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
v2: no change

 drivers/usb/host/xhci-trace.h | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 61e93a35..4286dba 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -120,7 +120,6 @@ DECLARE_EVENT_CLASS(xhci_log_trb,
 		__field(u32, field1)
 		__field(u32, field2)
 		__field(u32, field3)
-		__dynamic_array(char, str, XHCI_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->type = ring->type;
@@ -130,8 +129,8 @@ DECLARE_EVENT_CLASS(xhci_log_trb,
 		__entry->field3 = le32_to_cpu(trb->field[3]);
 	),
 	TP_printk("%s: %s", xhci_ring_type_string(__entry->type),
-		  xhci_decode_trb(__get_str(str), XHCI_MSG_MAX, __entry->field0, __entry->field1,
-					__entry->field2, __entry->field3)
+		  xhci_decode_trb(__get_buf(XHCI_MSG_MAX), XHCI_MSG_MAX, __entry->field0,
+				  __entry->field1, __entry->field2, __entry->field3)
 	)
 );
 
@@ -322,7 +321,6 @@ DECLARE_EVENT_CLASS(xhci_log_ep_ctx,
 		__field(u32, info2)
 		__field(u64, deq)
 		__field(u32, tx_info)
-		__dynamic_array(char, str, XHCI_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->info = le32_to_cpu(ctx->ep_info);
@@ -330,7 +328,7 @@ DECLARE_EVENT_CLASS(xhci_log_ep_ctx,
 		__entry->deq = le64_to_cpu(ctx->deq);
 		__entry->tx_info = le32_to_cpu(ctx->tx_info);
 	),
-	TP_printk("%s", xhci_decode_ep_context(__get_str(str),
+	TP_printk("%s", xhci_decode_ep_context(__get_buf(XHCI_MSG_MAX),
 		__entry->info, __entry->info2, __entry->deq, __entry->tx_info)
 	)
 );
@@ -368,7 +366,6 @@ DECLARE_EVENT_CLASS(xhci_log_slot_ctx,
 		__field(u32, info2)
 		__field(u32, tt_info)
 		__field(u32, state)
-		__dynamic_array(char, str, XHCI_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->info = le32_to_cpu(ctx->dev_info);
@@ -376,7 +373,7 @@ DECLARE_EVENT_CLASS(xhci_log_slot_ctx,
 		__entry->tt_info = le64_to_cpu(ctx->tt_info);
 		__entry->state = le32_to_cpu(ctx->dev_state);
 	),
-	TP_printk("%s", xhci_decode_slot_context(__get_str(str),
+	TP_printk("%s", xhci_decode_slot_context(__get_buf(XHCI_MSG_MAX),
 			__entry->info, __entry->info2,
 			__entry->tt_info, __entry->state)
 	)
@@ -433,13 +430,12 @@ DECLARE_EVENT_CLASS(xhci_log_ctrl_ctx,
 	TP_STRUCT__entry(
 		__field(u32, drop)
 		__field(u32, add)
-		__dynamic_array(char, str, XHCI_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->drop = le32_to_cpu(ctrl_ctx->drop_flags);
 		__entry->add = le32_to_cpu(ctrl_ctx->add_flags);
 	),
-	TP_printk("%s", xhci_decode_ctrl_ctx(__get_str(str), __entry->drop, __entry->add)
+	TP_printk("%s", xhci_decode_ctrl_ctx(__get_buf(XHCI_MSG_MAX), __entry->drop, __entry->add)
 	)
 );
 
@@ -525,7 +521,6 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 		    TP_STRUCT__entry(
 				     __field(u32, portnum)
 				     __field(u32, portsc)
-				     __dynamic_array(char, str, XHCI_MSG_MAX)
 				     ),
 		    TP_fast_assign(
 				   __entry->portnum = portnum;
@@ -533,7 +528,7 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 				   ),
 		    TP_printk("port-%d: %s",
 			      __entry->portnum,
-			      xhci_decode_portsc(__get_str(str), __entry->portsc)
+			      xhci_decode_portsc(__get_buf(XHCI_MSG_MAX), __entry->portsc)
 			      )
 );
 
@@ -558,14 +553,13 @@ DECLARE_EVENT_CLASS(xhci_log_doorbell,
 	TP_STRUCT__entry(
 		__field(u32, slot)
 		__field(u32, doorbell)
-		__dynamic_array(char, str, XHCI_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->slot = slot;
 		__entry->doorbell = doorbell;
 	),
 	TP_printk("Ring doorbell for %s",
-		  xhci_decode_doorbell(__get_str(str), __entry->slot, __entry->doorbell)
+		  xhci_decode_doorbell(__get_buf(XHCI_MSG_MAX), __entry->slot, __entry->doorbell)
 	)
 );
 
-- 
2.7.4

