Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1876EEC71
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 04:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238824AbjDZCjx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 22:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjDZCjw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 22:39:52 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB41189
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 19:39:50 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33Q2TaZa012556;
        Wed, 26 Apr 2023 02:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ucKMi9Mmuywx9IqksiTAASu8kp2RWEsJfazop7CY3XM=;
 b=pch/0ZYDobJ7tkV1wD6yOe/JkjL/WHcNaYCKyg6BKoX2lGALqz3oc30tOCe56TPv95Z/
 tenJA90V6pVpqF5g+KLI8uDIuCJo4mKlKmkRJaqyNhti4h+wVtOyy+braACKWXSuhAg5
 OUFxdxZ4zH0U7V+sFgXhFFATBlkX76E/Ky2c4p+n2XLtdJT4nufNDUmUeUT8B7pdYEyn
 jbUfJRDa+H08jYmb+Z1VGYXfKYTNc3RuOyL/C0Y1cpKM/ob+HsZrU/aL7arptFEoZZfQ
 e7BkKdhRt85HPG6FMQRvEazSJfSVS8hKWnrkEEhaclonuUVZk7UJPiKQo+rAsKr766Fa EA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6an22gxm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Apr 2023 02:39:47 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33Q2dl5v003955
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Apr 2023 02:39:47 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 25 Apr 2023 19:39:45 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v5] usb: dwc3: update link state on each device level interrupt
Date:   Wed, 26 Apr 2023 10:39:40 +0800
Message-ID: <1682476780-2367-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dBTdDEieJU_vVqLvmLhYnpk6HySIReDl
X-Proofpoint-ORIG-GUID: dBTdDEieJU_vVqLvmLhYnpk6HySIReDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260022
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

v5: (refer v4 https://lore.kernel.org/linux-usb/1682393256-15572-1-git-send-email-quic_linyyuan@quicinc.com/)
1) rename suspend_irq_happen to suspended and document it
2) add old_link_state for link change interrupt usage and change accordingly

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

 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/gadget.c | 43 +++++++++++++++++++++++++------------------
 2 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d56457c..140866a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1038,6 +1038,7 @@ struct dwc3_scratchpad_array {
  * @ep0_next_event: hold the next expected event
  * @ep0state: state of endpoint zero
  * @link_state: link state
+ * @old_link_state: cache link state for link change interrupt usage
  * @speed: device speed (super, high, full, low)
  * @hwparams: copy of hwparams registers
  * @regset: debugfs pointer to regdump file
@@ -1116,6 +1117,7 @@ struct dwc3_scratchpad_array {
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
  * @wakeup_configured: set if the device is configured for remote wakeup.
+ * @suspended: set if suspend irq happen to avoid possible consective suspend.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1254,6 +1256,7 @@ struct dwc3 {
 	enum dwc3_ep0_next	ep0_next_event;
 	enum dwc3_ep0_state	ep0state;
 	enum dwc3_link_state	link_state;
+	enum dwc3_link_state	old_link_state;
 
 	u16			u2sel;
 	u16			u2pel;
@@ -1332,6 +1335,7 @@ struct dwc3 {
 	unsigned		dis_split_quirk:1;
 	unsigned		async_callbacks:1;
 	unsigned		wakeup_configured:1;
+	unsigned		suspended:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c0ca4d1..a1aba3a 100644
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
@@ -4190,14 +4189,11 @@ static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc, unsigned int evtinfo)
 		dwc->gadget_driver->resume(dwc->gadget);
 		spin_lock(&dwc->lock);
 	}
-
-	dwc->link_state = evtinfo & DWC3_LINK_STATE_MASK;
 }
 
 static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
-		unsigned int evtinfo)
+		enum dwc3_link_state next)
 {
-	enum dwc3_link_state	next = evtinfo & DWC3_LINK_STATE_MASK;
 	unsigned int		pwropt;
 
 	/*
@@ -4220,7 +4216,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	pwropt = DWC3_GHWPARAMS1_EN_PWROPT(dwc->hwparams.hwparams1);
 	if (DWC3_VER_IS_PRIOR(DWC3, 250A) &&
 			(pwropt != DWC3_GHWPARAMS1_EN_PWROPT_HIB)) {
-		if ((dwc->link_state == DWC3_LINK_STATE_U3) &&
+		if ((dwc->old_link_state == DWC3_LINK_STATE_U3) &&
 				(next == DWC3_LINK_STATE_RESUME)) {
 			return;
 		}
@@ -4249,7 +4245,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 			u32	u1u2;
 			u32	reg;
 
-			switch (dwc->link_state) {
+			switch (dwc->old_link_state) {
 			case DWC3_LINK_STATE_U1:
 			case DWC3_LINK_STATE_U2:
 				reg = dwc3_readl(dwc->regs, DWC3_DCTL);
@@ -4295,23 +4291,34 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 		break;
 	}
 
-	dwc->link_state = next;
+	dwc->old_link_state = next;
 }
 
-static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
-					  unsigned int evtinfo)
+static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc)
 {
-	enum dwc3_link_state next = evtinfo & DWC3_LINK_STATE_MASK;
-
-	if (dwc->link_state != next && next == DWC3_LINK_STATE_U3)
+	if (!dwc->suspended) {
+		dwc->suspended = true;
 		dwc3_suspend_gadget(dwc);
+	}
+}
 
-	dwc->link_state = next;
+static inline void dwc3_gadget_interrupt_early(struct dwc3 *dwc,
+			const struct dwc3_event_devt *event)
+{
+	dwc->link_state = event->event_info & DWC3_LINK_STATE_MASK;
+
+	if (event->type != DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE)
+		dwc->old_link_state = dwc->link_state;
+
+	if  (event->type != DWC3_DEVICE_EVENT_SUSPEND)
+		dwc->suspended = false;
 }
 
 static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		const struct dwc3_event_devt *event)
 {
+	dwc3_gadget_interrupt_early(dwc, event);
+
 	switch (event->type) {
 	case DWC3_DEVICE_EVENT_DISCONNECT:
 		dwc3_gadget_disconnect_interrupt(dwc);
@@ -4323,18 +4330,18 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		dwc3_gadget_conndone_interrupt(dwc);
 		break;
 	case DWC3_DEVICE_EVENT_WAKEUP:
-		dwc3_gadget_wakeup_interrupt(dwc, event->event_info);
+		dwc3_gadget_wakeup_interrupt(dwc);
 		break;
 	case DWC3_DEVICE_EVENT_HIBER_REQ:
 		dev_WARN_ONCE(dwc->dev, true, "unexpected hibernation event\n");
 		break;
 	case DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE:
-		dwc3_gadget_linksts_change_interrupt(dwc, event->event_info);
+		dwc3_gadget_linksts_change_interrupt(dwc, dwc->link_state);
 		break;
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

