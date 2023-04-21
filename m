Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25B26EA15D
	for <lists+linux-usb@lfdr.de>; Fri, 21 Apr 2023 04:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbjDUCBj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Apr 2023 22:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjDUCBi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 22:01:38 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670B0198D
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 19:01:35 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33L1uXfp015800;
        Fri, 21 Apr 2023 02:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=67S/XZ/o6R/iQxsAshepzEsH9lGQwy8SgAoMsASox9k=;
 b=dHC9maBooUTNn2XM9lUTOCeR6VZWMhpNIMMvGnjHhrfykhfGRW/0DQZT+4Bvt/LIirvD
 pfM/SpUWi93u2aL/rn0BRSJTCMyxggRcIuB6f12y4XucLqRyKSXMF2Y8t/m9tOn76W8W
 SJj1Pozcb5HXMSkjzCWeCHkvwJhaegPybOPrwUa0RrXckId40yJM3bse5P6OPG5TXDLH
 cJT3P/qx4FJUC1nSWYNE7w0zYjuVtUcWq+6oYTWXVWx6d4QPlgVCoaSD+vOoDrInqm8Y
 j4MY5CcEoZXDyEgoMjfhtqn0nVeDurhR+WuPgg4JPeZU5vrETtNcGCzriMl/H+9M/Q07 5A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3dcmgckh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Apr 2023 02:01:33 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33L21OAV024081
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Apr 2023 02:01:24 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 19:01:22 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2] usb: dwc3: update link state on each device level interrupt
Date:   Fri, 21 Apr 2023 10:01:12 +0800
Message-ID: <1682042472-21222-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lxaGFxjGSf8MJZSdMABxMRofphA4eQN5
X-Proofpoint-GUID: lxaGFxjGSf8MJZSdMABxMRofphA4eQN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_17,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210016
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
v2: update according v1 discussion
v1: https://lore.kernel.org/linux-usb/1675221286-23833-1-git-send-email-quic_linyyuan@quicinc.com/

 drivers/usb/dwc3/core.h   |  1 +
 drivers/usb/dwc3/gadget.c | 40 ++++++++++++++++++++++++++++------------
 2 files changed, 29 insertions(+), 12 deletions(-)

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
index 9f492c8..239cfc1 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2422,7 +2422,6 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
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
@@ -4298,20 +4295,39 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	dwc->link_state = next;
 }
 
-static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
-					  unsigned int evtinfo)
+static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc)
 {
-	enum dwc3_link_state next = evtinfo & DWC3_LINK_STATE_MASK;
-
-	if (dwc->link_state != next && next == DWC3_LINK_STATE_U3)
+	if (!dwc->suspend_irq_happen && dwc->link_state == DWC3_LINK_STATE_U3) {
+		dwc->suspend_irq_happen = true;
 		dwc3_suspend_gadget(dwc);
+	}
+}
 
-	dwc->link_state = next;
+static inline void dwc3_gadget_interrupt_early(struct dwc3 *dwc,
+			const struct dwc3_event_devt *event)
+{
+	switch (event->type) {
+	case DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE:
+		break;
+	default:
+		dwc->link_state = event->event_info & DWC3_LINK_STATE_MASK;
+		break;
+	}
+
+	switch (event->type) {
+	case DWC3_DEVICE_EVENT_SUSPEND:
+		break;
+	default:
+		dwc->suspend_irq_happen = false;
+		break;
+	}
 }
 
 static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		const struct dwc3_event_devt *event)
 {
+	dwc3_gadget_interrupt_early(dwc, event);
+
 	switch (event->type) {
 	case DWC3_DEVICE_EVENT_DISCONNECT:
 		dwc3_gadget_disconnect_interrupt(dwc);
@@ -4323,7 +4339,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		dwc3_gadget_conndone_interrupt(dwc);
 		break;
 	case DWC3_DEVICE_EVENT_WAKEUP:
-		dwc3_gadget_wakeup_interrupt(dwc, event->event_info);
+		dwc3_gadget_wakeup_interrupt(dwc);
 		break;
 	case DWC3_DEVICE_EVENT_HIBER_REQ:
 		dev_WARN_ONCE(dwc->dev, true, "unexpected hibernation event\n");
@@ -4334,7 +4350,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
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

