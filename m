Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 390E36B805C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 19:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjCMSZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 14:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjCMSZO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 14:25:14 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C4E4486;
        Mon, 13 Mar 2023 11:25:06 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DGYQ6g025741;
        Mon, 13 Mar 2023 18:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=74OtDDXmuBHNX13+OI7QCQcfaElb4rop3VSjcF/eEJE=;
 b=JfjJQBDadPTTWWRpttSH2/wudcLSCchqjPO62Pvork+5uclql8Cfk9XM2A7AZ8LMINS/
 mx2sJaI21AkPCHG5JpXrq+CO/WaBFGeJFyALD5Fma/5OzE7ECeTWyUfmJ+nKRYkGOKgm
 Tmoj1/Fg/oo567mc6PbSUbewAd4QSoCHxpWeZ+OY6JnB3YOVsGOjmfsIdz1iphJ4I1Ge
 xWmh1Uwe9XcrQvr2SGp+2Akx7r+DkxNmsW4WmehyDojuDfMSk8uA1y8s6I4BGMhFHY7S
 6Kz/aAWP42nbeWTx8RSRs6PgmDH2zrtG5Cm+XN7aqEmXI6bULg2fPgeGIZpfoBkC329z FQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p8hvbnvcu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Mar 2023 18:25:02 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 32DIP1UJ016817;
        Mon, 13 Mar 2023 18:25:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 3p8jqkm6k5-1;
        Mon, 13 Mar 2023 18:25:01 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DIOQ6L016614;
        Mon, 13 Mar 2023 18:25:01 GMT
Received: from hu-devc-lv-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.164])
        by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 32DIP1XH016791;
        Mon, 13 Mar 2023 18:25:01 +0000
Received: by hu-devc-lv-c.qualcomm.com (Postfix, from userid 464172)
        id 0EA0320E5B; Mon, 13 Mar 2023 11:25:01 -0700 (PDT)
From:   Elson Roy Serrao <quic_eserrao@quicinc.com>
To:     gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        balbi@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH v8 4/5] usb: dwc3: Add function suspend and function wakeup support
Date:   Mon, 13 Mar 2023 11:24:51 -0700
Message-Id: <1678731892-20503-5-git-send-email-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1678731892-20503-1-git-send-email-quic_eserrao@quicinc.com>
References: <1678731892-20503-1-git-send-email-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ScKX_TGfGmaHYvh6ySszsfnoCkuSK5q-
X-Proofpoint-GUID: ScKX_TGfGmaHYvh6ySszsfnoCkuSK5q-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_09,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=945 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130144
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB host sends function suspend and function resume notifications to
the interface through SET_FEATURE/CLEAR_FEATURE setup packets.
Add support to handle these packets by delegating the requests to
composite layer. Also add support to handle function wake notification
requests to exit from function suspend state.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 drivers/usb/dwc3/core.h   |  3 +++
 drivers/usb/dwc3/debug.h  |  2 ++
 drivers/usb/dwc3/ep0.c    | 12 ++++--------
 drivers/usb/dwc3/gadget.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 416e0ef..3412ebb 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -527,6 +527,7 @@
 #define DWC3_DGCMD_SET_ENDPOINT_NRDY	0x0c
 #define DWC3_DGCMD_SET_ENDPOINT_PRIME	0x0d
 #define DWC3_DGCMD_RUN_SOC_BUS_LOOPBACK	0x10
+#define DWC3_DGCMD_DEV_NOTIFICATION	0x07
 
 #define DWC3_DGCMD_STATUS(n)		(((n) >> 12) & 0x0F)
 #define DWC3_DGCMD_CMDACT		BIT(10)
@@ -539,6 +540,8 @@
 #define DWC3_DGCMDPAR_TX_FIFO			BIT(5)
 #define DWC3_DGCMDPAR_LOOPBACK_DIS		(0 << 0)
 #define DWC3_DGCMDPAR_LOOPBACK_ENA		BIT(0)
+#define DWC3_DGCMDPAR_DN_FUNC_WAKE		BIT(0)
+#define DWC3_DGCMDPAR_INTF_SEL(n)		((n) << 4)
 
 /* Device Endpoint Command Register */
 #define DWC3_DEPCMD_PARAM_SHIFT		16
diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 8bb2c9e..09d7038 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -72,6 +72,8 @@ dwc3_gadget_generic_cmd_string(u8 cmd)
 		return "Set Endpoint Prime";
 	case DWC3_DGCMD_RUN_SOC_BUS_LOOPBACK:
 		return "Run SoC Bus Loopback Test";
+	case DWC3_DGCMD_DEV_NOTIFICATION:
+		return "Device Notification";
 	default:
 		return "UNKNOWN";
 	}
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 8aa14a5..953b752 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -30,6 +30,8 @@
 static void __dwc3_ep0_do_control_status(struct dwc3 *dwc, struct dwc3_ep *dep);
 static void __dwc3_ep0_do_control_data(struct dwc3 *dwc,
 		struct dwc3_ep *dep, struct dwc3_request *req);
+static int dwc3_ep0_delegate_req(struct dwc3 *dwc,
+				 struct usb_ctrlrequest *ctrl);
 
 static void dwc3_ep0_prepare_one_trb(struct dwc3_ep *dep,
 		dma_addr_t buf_dma, u32 len, u32 type, bool chain)
@@ -368,7 +370,7 @@ static int dwc3_ep0_handle_status(struct dwc3 *dwc,
 		 * Function Remote Wake Capable	D0
 		 * Function Remote Wakeup	D1
 		 */
-		break;
+		return dwc3_ep0_delegate_req(dwc, ctrl);
 
 	case USB_RECIP_ENDPOINT:
 		dep = dwc3_wIndex_to_dep(dwc, ctrl->wIndex);
@@ -517,13 +519,7 @@ static int dwc3_ep0_handle_intf(struct dwc3 *dwc,
 
 	switch (wValue) {
 	case USB_INTRF_FUNC_SUSPEND:
-		/*
-		 * REVISIT: Ideally we would enable some low power mode here,
-		 * however it's unclear what we should be doing here.
-		 *
-		 * For now, we're not doing anything, just making sure we return
-		 * 0 so USB Command Verifier tests pass without any errors.
-		 */
+		ret = dwc3_ep0_delegate_req(dwc, ctrl);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f37f949..b72d5c8 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2391,6 +2391,47 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g)
 	return ret;
 }
 
+static void dwc3_resume_gadget(struct dwc3 *dwc);
+
+static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
+{
+	struct  dwc3		*dwc = gadget_to_dwc(g);
+	unsigned long		flags;
+	int			ret;
+	int			link_state;
+
+	if (!dwc->wakeup_configured) {
+		dev_err(dwc->dev, "remote wakeup not configured\n");
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	/*
+	 * If the link is in U3, signal for remote wakeup and wait for the
+	 * link to transition to U0 before sending device notification.
+	 */
+	link_state = dwc3_gadget_get_link_state(dwc);
+	if (link_state == DWC3_LINK_STATE_U3) {
+		ret = __dwc3_gadget_wakeup(dwc, false);
+		if (ret) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return -EINVAL;
+		}
+		dwc3_resume_gadget(dwc);
+		dwc->link_state = DWC3_LINK_STATE_U0;
+	}
+
+	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
+					       DWC3_DGCMDPAR_DN_FUNC_WAKE |
+					       DWC3_DGCMDPAR_INTF_SEL(intf_id));
+	if (ret)
+		dev_err(dwc->dev, "function remote wakeup failed, ret:%d\n", ret);
+
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return ret;
+}
+
 static int dwc3_gadget_set_remote_wakeup(struct usb_gadget *g, int set)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
@@ -3028,6 +3069,7 @@ static void dwc3_gadget_async_callbacks(struct usb_gadget *g, bool enable)
 static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.get_frame		= dwc3_gadget_get_frame,
 	.wakeup			= dwc3_gadget_wakeup,
+	.func_wakeup		= dwc3_gadget_func_wakeup,
 	.set_remote_wakeup	= dwc3_gadget_set_remote_wakeup,
 	.set_selfpowered	= dwc3_gadget_set_selfpowered,
 	.pullup			= dwc3_gadget_pullup,
-- 
2.7.4

