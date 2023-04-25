Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFF176EDAA3
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 05:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbjDYD2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Apr 2023 23:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233297AbjDYD1v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Apr 2023 23:27:51 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683279755
        for <linux-usb@vger.kernel.org>; Mon, 24 Apr 2023 20:27:47 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33P15x57013077;
        Tue, 25 Apr 2023 03:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=6OAbwzCEY3AJEvEkJ6DiAZvPW2AaPrKgaXPq7bTiiTk=;
 b=FKZy+9UE7rWHmtq7S5soKA5RjqKu74WFDAiCzs2cVMo+1jg54fCp9d5a1a5TQlcK0TCi
 FsDQaByUw+Q0L7FlMX3QaupLV19yUA0d5x7InS5BxqnhDTXYbWROtfrnmmmtW0f2IUrX
 greuI85UzjrUWnno2WNzYbT4WyltsgoCC0RJDhNIAZM0WttBXoTErJR5pyI5I9nNyaaS
 inF4lIkri9bnUY+MJkmz6CqIxIjbbnMvtaeZ5ju0ec/RgeG7GmwJK9NV5Ff/21U+vhRc
 fGZkvQCsKRaRKBsGPuRqnIYy+9fxstUD1YwGk3AKhOTlD9HfUZeem50DU1JiXuPY5h5n 2A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5tjf1k62-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 03:27:43 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33P3Rh7I027400
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 03:27:43 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 24 Apr 2023 20:27:41 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v4] usb: dwc3: update link state on each device level interrupt
Date:   Tue, 25 Apr 2023 11:27:36 +0800
Message-ID: <1682393256-15572-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sqpS1mDLMQC_dk7PQM-l4MFTbugJz4_o
X-Proofpoint-ORIG-GUID: sqpS1mDLMQC_dk7PQM-l4MFTbugJz4_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_02,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250028
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When work in gadget mode, currently driver doesn't update software level
link_state correctly as link state change event is not enabled for most
devices, in function dwc3_gadget_suspend_interrupt(), it will only pass
suspend event to UDC core when software level link state changes, so when
interrupt generated in sequences of suspend -> reset -> conndone ->
suspend, link state is not updated during reset and conndone, so second
suspend interrupt event will not pass to UDC core.

As in gadget mode, device level interrupt event have link state
information, let's trust it and update software level link state to it
when process each device level interrupt.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---

v4: (refer v3 https://lore.kernel.org/linux-usb/1682053861-21737-1-git-send-email-quic_linyyuan@quicinc.com/)
1) remove link state checking in dwc3_gadget_wakeup_interrupt()
2) remove two switch/case to if opeartion

v3: (refer v2 https://lore.kernel.org/linux-usb/1682042472-21222-1-git-send-email-quic_linyyuan@quicinc.com/)
no code change since v2, changes compare v1 as below,
1) add a flag suspend_irq_happen to simplify dwc3_gadget_suspend_interrupt(),
   it will avoid refer to software level link_state, finally link_state will
   only used in dwc3_gadget_linksts_change_interrupt().
2) remove sw setting of link_state in dwc3_gadget_func_wakeup()
3) add dwc3_gadget_interrupt_early() to correct setting of link_state
   and suspend_irq_happen.

v2: update according v1 discussion
v1: https://lore.kernel.org/linux-usb/1675221286-23833-1-git-send-email-quic_linyyuan@quicinc.com/

 drivers/usb/dwc3/core.h   |  1 +
 drivers/usb/dwc3/gadget.c | 30 ++++++++++++++++++------------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d56457c..8622f9c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1332,6 +1332,7 @@ struct dwc3 {
 	unsigned		dis_split_quirk:1;
 	unsigned		async_callbacks:1;
 	unsigned		wakeup_configured:1;
+	unsigned		suspend_irq_happen:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c0ca4d1..9dc64a4 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2440,7 +2440,6 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
 			return -EINVAL;
 		}
 		dwc3_resume_gadget(dwc);
-		dwc->link_state = DWC3_LINK_STATE_U0;
 	}
 
 	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
@@ -4178,7 +4177,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	 */
 }
 
-static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc, unsigned int evtinfo)
+static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc)
 {
 	/*
 	 * TODO take core out of low power mode when that's
@@ -4190,8 +4189,6 @@ static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc, unsigned int evtinfo)
 		dwc->gadget_driver->resume(dwc->gadget);
 		spin_lock(&dwc->lock);
 	}
-
-	dwc->link_state = evtinfo & DWC3_LINK_STATE_MASK;
 }
 
 static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
@@ -4298,20 +4295,29 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	dwc->link_state = next;
 }
 
-static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
-					  unsigned int evtinfo)
+static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc)
 {
-	enum dwc3_link_state next = evtinfo & DWC3_LINK_STATE_MASK;
-
-	if (dwc->link_state != next && next == DWC3_LINK_STATE_U3)
+	if (!dwc->suspend_irq_happen) {
+		dwc->suspend_irq_happen = true;
 		dwc3_suspend_gadget(dwc);
+	}
+}
 
-	dwc->link_state = next;
+static inline void dwc3_gadget_interrupt_early(struct dwc3 *dwc,
+			const struct dwc3_event_devt *event)
+{
+	if (event->type != DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE)
+		dwc->link_state = event->event_info & DWC3_LINK_STATE_MASK;
+
+	if  (event->type != DWC3_DEVICE_EVENT_SUSPEND)
+		dwc->suspend_irq_happen = false;
 }
 
 static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		const struct dwc3_event_devt *event)
 {
+	dwc3_gadget_interrupt_early(dwc, event);
+
 	switch (event->type) {
 	case DWC3_DEVICE_EVENT_DISCONNECT:
 		dwc3_gadget_disconnect_interrupt(dwc);
@@ -4323,7 +4329,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		dwc3_gadget_conndone_interrupt(dwc);
 		break;
 	case DWC3_DEVICE_EVENT_WAKEUP:
-		dwc3_gadget_wakeup_interrupt(dwc, event->event_info);
+		dwc3_gadget_wakeup_interrupt(dwc);
 		break;
 	case DWC3_DEVICE_EVENT_HIBER_REQ:
 		dev_WARN_ONCE(dwc->dev, true, "unexpected hibernation event\n");
@@ -4334,7 +4340,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 	case DWC3_DEVICE_EVENT_SUSPEND:
 		/* It changed to be suspend event for version 2.30a and above */
 		if (!DWC3_VER_IS_PRIOR(DWC3, 230A))
-			dwc3_gadget_suspend_interrupt(dwc, event->event_info);
+			dwc3_gadget_suspend_interrupt(dwc);
 		break;
 	case DWC3_DEVICE_EVENT_SOF:
 	case DWC3_DEVICE_EVENT_ERRATIC_ERROR:
-- 
2.7.4

