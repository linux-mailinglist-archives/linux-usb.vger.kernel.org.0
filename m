Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5313A6FFE1C
	for <lists+linux-usb@lfdr.de>; Fri, 12 May 2023 02:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239504AbjELApl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 May 2023 20:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjELApk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 May 2023 20:45:40 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429882101
        for <linux-usb@vger.kernel.org>; Thu, 11 May 2023 17:45:38 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34C04gNv024862;
        Fri, 12 May 2023 00:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=78qp2M7q/PkV08p2jb5DIqcz1scEEbSrZlXleJOQJpc=;
 b=BcuBd7Ukfve/xJY51m6L69wnKG/yeyOl4Y9ZoIh/7BJ4S3EY1ol902zRIEPOgoG/NRTS
 O7glN3lDT7SBDVsqIa8ellI9S6aeAsoEj917j5QtEqZfqI0D7qC4yWQo03c2RDFh4Qfr
 B654fWXig5VOab89wASyATHBM4hyoIyffebQcpAovOEHdWSvH3oN2dmvSdty5M9/mcbO
 x51v0kevbwAFwL7twIRzKhk4al1A+LU2wSFrWu5fZMGGFfRjBtK4V/WXTB2K4x4IwgHD
 DzaAFh7EAHUYlWaiCY2CfKPK4w5nuP0uVCmLYjzu1+5O217Kzm4VDa5IlsbJHU58Ies/ Pg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgpfk2ubq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 May 2023 00:45:35 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34C0jYFA003514
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 May 2023 00:45:34 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 11 May 2023 17:45:33 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v10] usb: dwc3: fix gadget mode suspend interrupt handler issue
Date:   Fri, 12 May 2023 08:45:24 +0800
Message-ID: <20230512004524.31950-1-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2j4jV2euZtCicDjKxIUOYvWI8Upt0Rsg
X-Proofpoint-GUID: 2j4jV2euZtCicDjKxIUOYvWI8Upt0Rsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120005
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

Remove link_state compare in dwc3_gadget_suspend_interrupt() and add a
suspended flag to replace the compare function.

Fixes: 799e9dc82968 ("usb: dwc3: gadget: conditionally disable Link State change events")
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---

v10: (refer v9: https://lore.kernel.org/linux-usb/20230511054540.28239-1-quic_linyyuan@quicinc.com/)
1) update better changeset as Fixes tag 

v9: (refer v8 https://lore.kernel.org/linux-usb/20230510014718.13872-1-quic_linyyuan@quicinc.com/)
1) add a Fixes tag
2) add Acked-by tag from Thinh

v8: (refer v7 https://lore.kernel.org/linux-usb/20230509050743.5781-1-quic_linyyuan@quicinc.com/)
1) move some suspended flag clear to specific event handler

v7: (refer v6 https://lore.kernel.org/linux-usb/20230505014902.27313-1-quic_linyyuan@quicinc.com/)
1) reword suspended flag comment
2) remove one extra space in if operation
4) clear suspended flag for wakeup/reset/disconnect interrupt
3) clear suspended flag for remote wakeup related case.

v6: (refer v5 https://lore.kernel.org/linux-usb/1682476780-2367-1-git-send-email-quic_linyyuan@quicinc.com/)
1) change subject
2) only keep suspended flag related change

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

 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d56457c02996..1f043c31a096 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1116,6 +1116,7 @@ struct dwc3_scratchpad_array {
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
  * @wakeup_configured: set if the device is configured for remote wakeup.
+ * @suspended: set to track suspend event due to U3/L2.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1332,6 +1333,7 @@ struct dwc3 {
 	unsigned		dis_split_quirk:1;
 	unsigned		async_callbacks:1;
 	unsigned		wakeup_configured:1;
+	unsigned		suspended:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c0ca4d12f95d..f244bebf1ea0 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2440,6 +2440,7 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
 			return -EINVAL;
 		}
 		dwc3_resume_gadget(dwc);
+		dwc->suspended = false;
 		dwc->link_state = DWC3_LINK_STATE_U0;
 	}
 
@@ -3938,6 +3939,8 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
 {
 	int			reg;
 
+	dwc->suspended = false;
+
 	dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RX_DET);
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
@@ -3962,6 +3965,8 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 {
 	u32			reg;
 
+	dwc->suspended = false;
+
 	/*
 	 * Ideally, dwc3_reset_gadget() would trigger the function
 	 * drivers to stop any active transfers through ep disable.
@@ -4180,6 +4185,8 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
 static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc, unsigned int evtinfo)
 {
+	dwc->suspended = false;
+
 	/*
 	 * TODO take core out of low power mode when that's
 	 * implemented.
@@ -4277,6 +4284,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 		if (dwc->gadget->wakeup_armed) {
 			dwc3_gadget_enable_linksts_evts(dwc, false);
 			dwc3_resume_gadget(dwc);
+			dwc->suspended = false;
 		}
 		break;
 	case DWC3_LINK_STATE_U1:
@@ -4303,8 +4311,10 @@ static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
 {
 	enum dwc3_link_state next = evtinfo & DWC3_LINK_STATE_MASK;
 
-	if (dwc->link_state != next && next == DWC3_LINK_STATE_U3)
+	if (!dwc->suspended && next == DWC3_LINK_STATE_U3) {
+		dwc->suspended = true;
 		dwc3_suspend_gadget(dwc);
+	}
 
 	dwc->link_state = next;
 }
-- 
2.17.1

