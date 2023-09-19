Return-Path: <linux-usb+bounces-370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A047A5D31
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 11:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F1AE282186
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 09:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B3F3D39A;
	Tue, 19 Sep 2023 08:59:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A6C538C
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 08:59:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07AC102
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 01:59:55 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38J0xvvS011336;
	Tue, 19 Sep 2023 08:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ahskw6RhXfDN0qg3iC+HZTdS65u2uNMxtcpOTuN5BBc=;
 b=Ruyqgy0xMpD4GE+uhJm4sbfoXpytAq75K9tJbhFkxbtsv1MZgi530TJyoxsHoLfHCoMC
 G2zJlgtTVQL0DCSJotj3ew0SYw8eahyE8km9tNXiQkTF7PFGF3AUfWj6U/YFHxSM/s3z
 Z8abcwS5XzSmJd3t2SrGC8nPvM8cG2KSLl0j0S8RGtyQVBeamd8APPQz7p46tWtE1Gsz
 w3GSu+phHbHDawi+fFsTUh9WcddifPPjENCYDwgo78mkY2ymRWRxHd71oF+NQxkQDW3I
 8UQSw5HjwB1UL5BZyyxYnkqtwHPX02boRED3DPWFKUfSOB3uFUEd8Lx2ds0MYONq5OAg RQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6qf6j35q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 08:59:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38J8xE9b025580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 08:59:14 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 19 Sep 2023 01:59:11 -0700
From: Udipto Goswami <quic_ugoswami@quicinc.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH v2] usb: XHCI: Implement xhci_handshake_check_state() API
Date: Tue, 19 Sep 2023 14:28:47 +0530
Message-ID: <20230919085847.8210-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MuiRCQx5LVpCJ40kC2ymp4W9-Rff3OlD
X-Proofpoint-ORIG-GUID: MuiRCQx5LVpCJ40kC2ymp4W9-Rff3OlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_03,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=327 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190075
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

In some situations where xhci removal happens parallel to
xhci_handshake, we enoughter a scenario where the
xhci_handshake will fails because the status does not change
the entire duration of polling. This causes the xhci_handshake
to timeout resulting in long wait which might lead to watchdog
timeout.

The API  handles command timeout which may happen upon XHCI
stack removal. Check for xhci state and exit the handshake if
xhci is removed.

Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
v2: Fixed compilation error.

 drivers/usb/host/xhci-ring.c |  5 +++--
 drivers/usb/host/xhci.c      | 21 ++++++++++++++++++++-
 drivers/usb/host/xhci.h      |  2 ++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1dde53f6eb31..26add6c23a1d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -450,8 +450,9 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
 	 * and try to recover a -ETIMEDOUT with a host controller reset.
 	 */
-	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
-			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
+	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->cmd_ring,
+			CMD_RING_RUNNING, 0, 5 * 1000 * 1000,
+			XHCI_STATE_REMOVING);
 	if (ret < 0) {
 		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
 		xhci_halt(xhci);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e1b1b64a0723..95b4c63dbeba 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -84,6 +84,24 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
 /*
  * Disable interrupts and begin the xHCI halting process.
  */
+int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
+		u32 mask, u32 done, int usec, unsigned int exit_state)
+{
+	u32	result;
+	int	ret;
+
+	ret = readl_poll_timeout_atomic(ptr, result,
+				(result & mask) == done ||
+				result == U32_MAX ||
+				xhci->xhc_state & exit_state,
+				1, usec);
+
+	if (result == U32_MAX || xhci->xhc_state & exit_state)
+		return -ENODEV;
+
+	return ret;
+}
+
 void xhci_quiesce(struct xhci_hcd *xhci)
 {
 	u32 halted;
@@ -201,7 +219,8 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 	if (xhci->quirks & XHCI_INTEL_HOST)
 		udelay(1000);
 
-	ret = xhci_handshake(&xhci->op_regs->command, CMD_RESET, 0, timeout_us);
+	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->command,
+				CMD_RESET, 0, timeout_us, XHCI_STATE_REMOVING);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7e282b4522c0..06d5a90dedd5 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2119,6 +2119,8 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
 int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us);
+int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
+		u32 mask, u32 done, int usec, unsigned int exit_state);
 void xhci_quiesce(struct xhci_hcd *xhci);
 int xhci_halt(struct xhci_hcd *xhci);
 int xhci_start(struct xhci_hcd *xhci);
-- 
2.17.1


