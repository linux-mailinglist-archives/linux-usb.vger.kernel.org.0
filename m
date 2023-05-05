Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22826F7AC2
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 03:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjEEBtV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 21:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjEEBtU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 21:49:20 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295D112487
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 18:49:19 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3450gmVD014330;
        Fri, 5 May 2023 01:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=t/vmRgITmHNXxYywQr401xV+/c9caqytPRpxIOZXsGA=;
 b=Wf9KKWfKLQuVIJKbggUtIKTFTvCUiLOY94NtE3R7486KYW4lxf33jLkwQz5daUXCkG+R
 sZ5x9WrG8k/wI/AttWqOeM6hjS1MDpKVxUQUdkQ2hOAAZeINAHFcHmY8hE+Vxv1PWo1n
 +awkC9Jc36VZ5CNfBIEPblNYGszQYQ1FNx1m0K1zaRabMHWcf6KkMpZGgzP8ZcjqR/Oa
 q9XXbvBdx5lkOInbEc27q4r0TsBU2RGaBpcj36wNvY42BsYpFuKp8l213n8YcQ146/30
 tY3lsQSXf2XraoktDjkHC8wfnXb4Rensef3Hn5xh2FzZnsKfgyR6QH2MU20vutQEHnyW Sg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qcmm38crh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 01:49:16 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3451nFO3013137
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 5 May 2023 01:49:15 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 4 May 2023 18:49:13 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v6] usb: dwc3: fix gadget mode suspend interrupt handler issue
Date:   Fri, 5 May 2023 09:49:02 +0800
Message-ID: <20230505014902.27313-1-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MN3q3hy-TWj84LKDZi6ve6ZkXKZ8bK5N
X-Proofpoint-GUID: MN3q3hy-TWj84LKDZi6ve6ZkXKZ8bK5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_15,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050014
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
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

Remove link_state compare in dwc3_gadget_suspend_interrupt() and add a
suspended flag to replace the compare function.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
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

 drivers/usb/dwc3/core.h   | 2 ++
 drivers/usb/dwc3/gadget.c | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d56457c02996..efacaacbbeb2 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1116,6 +1116,7 @@ struct dwc3_scratchpad_array {
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
  * @wakeup_configured: set if the device is configured for remote wakeup.
+ * @suspended: set if suspend irq happen to avoid possible consective suspend.
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
index c0ca4d12f95d..2c750534b405 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4303,8 +4303,10 @@ static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
 {
 	enum dwc3_link_state next = evtinfo & DWC3_LINK_STATE_MASK;
 
-	if (dwc->link_state != next && next == DWC3_LINK_STATE_U3)
+	if (!dwc->suspended && next == DWC3_LINK_STATE_U3) {
+		dwc->suspended = true;
 		dwc3_suspend_gadget(dwc);
+	}
 
 	dwc->link_state = next;
 }
@@ -4312,6 +4314,9 @@ static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
 static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		const struct dwc3_event_devt *event)
 {
+	if  (event->type != DWC3_DEVICE_EVENT_SUSPEND)
+		dwc->suspended = false;
+
 	switch (event->type) {
 	case DWC3_DEVICE_EVENT_DISCONNECT:
 		dwc3_gadget_disconnect_interrupt(dwc);
-- 
2.17.1

