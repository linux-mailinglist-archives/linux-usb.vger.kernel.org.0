Return-Path: <linux-usb+bounces-127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD37A1A39
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 11:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2EDD2824E1
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 09:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FA6DDB8;
	Fri, 15 Sep 2023 09:18:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC952D534
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 09:18:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBF2C1
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 02:18:12 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F7oLhE004189;
	Fri, 15 Sep 2023 09:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=qXLCIDOjZQB0HjsE7nkmAHO+syOBd/L4X4QiMsjfhTE=;
 b=VutaDu+it1c94G62WeooGipuZA4YWO+UQd+A8RvyxEq1b3e5cJYh8hXEIbyD9cd89BMx
 Os3qxNyLRF1LOSazv2YSBLemX3QHG7wpmaN6oRRKv148p9jL0aIvlMmeImuBxXIg4mta
 kQeW0FyPraRBpOpbyGywRFy5kRIvuhB8HBRKVym64QBgSdCXbjmc19na+NZOmDR9ZWek
 FYrGzZHGBzUOgB3Ny1jRGpxp3urB2r8RcFD4DyZ1RoxtY9OeDgRT7xTTUJ6lHKIuza/K
 IxL/Zj4h/j08XxsBKAxI5z/ndq9MhlI66t5vi2aVkgAOzpyUR4v3LjlrAwEqgZrTkNgT fg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g86rj0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 09:17:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F9Ht0r024144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 09:17:55 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 02:17:53 -0700
From: Udipto Goswami <quic_ugoswami@quicinc.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [RFC] usb: XHCI: Implement xhci_handshake_check_state() API
Date: Fri, 15 Sep 2023 14:47:37 +0530
Message-ID: <20230915091737.31721-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PZgUZxl_YMjrubVyVXaJPXMZtzZJ_TDK
X-Proofpoint-ORIG-GUID: PZgUZxl_YMjrubVyVXaJPXMZtzZJ_TDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=386
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150081
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/usb/host/xhci-ring.c |  2 +-
 drivers/usb/host/xhci.c      | 27 ++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h      |  2 ++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1dde53f6eb31..af9e27d3d303 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -450,7 +450,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
 	 * and try to recover a -ETIMEDOUT with a host controller reset.
 	 */
-	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
+	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->cmd_ring,
 			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
 	if (ret < 0) {
 		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e1b1b64a0723..7bfcb09bcad0 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -84,6 +84,30 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
 /*
  * Disable interrupts and begin the xHCI halting process.
  */
+int xhci_handshake_check_state(struct xhci_hcd *xhci,
+	void __iomem *ptr, u32 mask, u32 done, int usec)
+{
+	u32	result;
+
+	do {
+		result = readl_relaxed(ptr);
+		if (result == ~(u32)0)
+			return -ENODEV;
+
+		if (xhci->xhc_state & XHCI_STATE_REMOVING)
+			return -ENODEV;
+
+		result &= mask;
+		if (result == done)
+			return 0;
+
+		udelay(1);
+		usec--;
+	} while (usec > 0);
+
+	return -ETIMEDOUT;
+}
+
 void xhci_quiesce(struct xhci_hcd *xhci)
 {
 	u32 halted;
@@ -201,7 +225,8 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 	if (xhci->quirks & XHCI_INTEL_HOST)
 		udelay(1000);
 
-	ret = xhci_handshake(&xhci->op_regs->command, CMD_RESET, 0, timeout_us);
+	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->command,
+						CMD_RESET, 0, timeout_us);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7e282b4522c0..504c04d19c05 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2119,6 +2119,8 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
 int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us);
+int xhci_handshake_check_state(struct xhci_hcd *xhci,
+			void __iomem *ptr, u32 mask, u32 done, int usec);
 void xhci_quiesce(struct xhci_hcd *xhci);
 int xhci_halt(struct xhci_hcd *xhci);
 int xhci_start(struct xhci_hcd *xhci);
-- 
2.17.1


