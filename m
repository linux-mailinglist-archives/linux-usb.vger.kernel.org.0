Return-Path: <linux-usb+bounces-1446-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B19DE7C4F83
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A22671C20F11
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C541DA41;
	Wed, 11 Oct 2023 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YKsep26H"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE41DA29
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:02:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FE094;
	Wed, 11 Oct 2023 03:02:31 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B8Ywux022121;
	Wed, 11 Oct 2023 10:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=NYowNHTwmDAHuf9dzttySouzD52J2jwFA4tlHYb/pvk=;
 b=YKsep26H5d0ONKdIkbievnFrWmnYRXwJS2pdEaOOg4zMuGLWxPSqnALhQlNIEoIbtMIi
 l9EhpwbJsIlW8J/vwrKF4V4DKFhG17N9oJDKBtU9ZN4eURC9PcBc9UfnVEA5zvLxCcca
 uLOiE4UFB9hBtgs0T/J//A7YvC04OaoqcC7u12LsNyaKKOL2AmT/ADCoQPacN7R8KMMV
 KaQ9gJn2Hm/5TfrECa2pTGy2iyUcZ/E8uv/J01uYcdUK/8odo4M1qMJ93Kfja5fpXJ3j
 8a+Q6EDVbWPSpQOcJWu4HbVefh1PcUC+UpJwgjDAR2M2okEWbXqPS9+CbK9u4WIFjxa3 hw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tna9c9r20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 10:02:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BA2RwQ012503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 10:02:27 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 03:02:24 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_wcheng@quicinc.com>,
        <quic_jackp@quicinc.com>, <quic_ugoswami@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>
Subject: [RFC] usb: dwc3: core: Fix RAM interface getting stuck during enumeration
Date: Wed, 11 Oct 2023 15:32:14 +0530
Message-ID: <20231011100214.25720-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -bX855sQEA0_eSzIaRYdnR52y6dvH66B
X-Proofpoint-ORIG-GUID: -bX855sQEA0_eSzIaRYdnR52y6dvH66B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_07,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310110088
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This implementation is to fix RAM interface getting stuck during
enumeration and controller not responding to any command.

During plug-out test cases, it is sometimes seen that no events
are generated by the controller and all CSR register reads give "0"
and CSR_Timeout bit gets set indicating that CSR reads/writes are
timing out or timed out.

The issue comes up on different instnaces of enumeration on different
platforms. On one platform, the debug log is as follows:

Prepared a TRB on ep0out and did start transfer to get set
address request from host:

<...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
status: Successful

<...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
ep0out: Transfer Complete (sIL) [Setup Phase]

<...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
Address(Addr = 01)

Then XFER NRDY received on ep0in for zero length status phase and
a Start Transfer was done on ep0in with 0-length packet in 2 Stage
status phase:

<...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]

<...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
sofn 00000000 (HLcs:SC:status2)

<...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
Successful

Then a bus reset was received directly after 500 msec. Software never
got the cmd complete for the start transfer done in status phase. Here
the RAM interface is stuck. So host issues a bus reset as link is
idle for 500 msec:

<...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
Reset [U0]

Then software sees that it is in status phase and we issue an ENDXFER
on ep0in and it gets timedout waiting for the CMDACT to go '0':

<...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
Timed Out

Upon debug with Synopsys, it turns out that the root cause is as
follows:

During any transfer, if the data is not successfully transmitted,
then a Done (with failure) handshake is returned, so that the BMU
can re-attempt the same data again by rewinding its data pointers.

But, if the USB IN is a 0-length payload (which is what is happening
in this case - 2 stage status phase of set_address), then there is no
need to rewind the pointers and the Done (with failure) handshake is
not returned for failure case. This keeps the Request-Done interface
busy till the next Done handshake. The MAC sends the 0-length payload
again when the host requests. If the transmission is successful this
time, the Done (with success) handshake is provided back. Otherwise,
it repeats the same steps again.

If the cable is disconnected or if the Host aborts the transfer on 3
consecutive failed attempts, the Request-Done handshake is not
complete. This keeps the interface busy.

The subsequent RAM access cannot proceed until the above pending
transfer is complete. This results in failure of any access to RAM
address locations. Many of the EndPoint commands need to access the
RAM and they would fail to complete successfully.

Furthermore when cable removal happens, this would not generate a
disconnect event and the "connected" flag remains true always blockin
suspend.

Synopsys confirmed that the issue is present on all USB3 devices and
as a workaround, suggested to re-initialize device mode.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 drivers/usb/dwc3/core.c   | 20 ++++++++++++++++++++
 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/drd.c    |  5 +++++
 drivers/usb/dwc3/gadget.c |  6 ++++--
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 44ee8526dc28..d18b81cccdc5 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -122,6 +122,7 @@ static void __dwc3_set_mode(struct work_struct *work)
 	unsigned long flags;
 	int ret;
 	u32 reg;
+	u8 timeout = 100;
 	u32 desired_dr_role;
 
 	mutex_lock(&dwc->mutex);
@@ -137,6 +138,25 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (!desired_dr_role)
 		goto out;
 
+	/*
+	 * STAR 5001544 - If cable disconnect doesn't generate
+	 * disconnect event in device mode, then re-initialize the
+	 * controller.
+	 */
+	if ((dwc->cable_disconnected == true) &&
+		(dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)) {
+		while (dwc->connected == true && timeout != 0) {
+			mdelay(10);
+			timeout--;
+		}
+
+		if (timeout == 0) {
+			dwc3_gadget_soft_disconnect(dwc);
+			udelay(100);
+			dwc3_gadget_soft_connect(dwc);
+		}
+	}
+
 	if (desired_dr_role == dwc->current_dr_role)
 		goto out;
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index c6c87acbd376..7642330cf608 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1355,6 +1355,7 @@ struct dwc3 {
 	int			last_fifo_depth;
 	int			num_ep_resized;
 	struct dentry		*debug_root;
+	bool			cable_disconnected;
 };
 
 #define INCRX_BURST_MODE 0
@@ -1568,6 +1569,9 @@ void dwc3_event_buffers_cleanup(struct dwc3 *dwc);
 
 int dwc3_core_soft_reset(struct dwc3 *dwc);
 
+int dwc3_gadget_soft_disconnect(struct dwc3 *dwc);
+int dwc3_gadget_soft_connect(struct dwc3 *dwc);
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 039bf241769a..593c023fc39a 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -446,6 +446,8 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 	struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);
 	u32 mode;
 
+	dwc->cable_disconnected = false;
+
 	switch (role) {
 	case USB_ROLE_HOST:
 		mode = DWC3_GCTL_PRTCAP_HOST;
@@ -454,6 +456,9 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 		break;
 	default:
+		if (role == USB_ROLE_NONE)
+			dwc->cable_disconnected = true;
+
 		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
 			mode = DWC3_GCTL_PRTCAP_HOST;
 		else
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 858fe4c299b7..a92df2e04cce 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2634,7 +2634,7 @@ static void dwc3_gadget_disable_irq(struct dwc3 *dwc);
 static void __dwc3_gadget_stop(struct dwc3 *dwc);
 static int __dwc3_gadget_start(struct dwc3 *dwc);
 
-static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
+int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
 {
 	unsigned long flags;
 	int ret;
@@ -2701,7 +2701,7 @@ static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
 	return ret;
 }
 
-static int dwc3_gadget_soft_connect(struct dwc3 *dwc)
+int dwc3_gadget_soft_connect(struct dwc3 *dwc)
 {
 	int ret;
 
@@ -3963,6 +3963,7 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
 	dwc3_gadget_dctl_write_safe(dwc, reg);
 
 	dwc->connected = false;
+	dwc->cable_disconnected = true;
 
 	dwc3_disconnect_gadget(dwc);
 
@@ -4038,6 +4039,7 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 	 */
 	dwc3_stop_active_transfers(dwc);
 	dwc->connected = true;
+	dwc->cable_disconnected = false;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
-- 
2.42.0


