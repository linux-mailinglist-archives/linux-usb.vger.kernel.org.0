Return-Path: <linux-usb+bounces-358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4F97A5973
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 07:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDDF8281C92
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 05:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597B234CFE;
	Tue, 19 Sep 2023 05:40:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59D68480
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 05:39:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05856FC
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 22:39:57 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38J4TXYY023881;
	Tue, 19 Sep 2023 05:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=9F7K3K8MfWtDAMLzxYQUO46Jr748/+X/kbbFIreF+SY=;
 b=lNkszbq49GPzJBiStQ/whazkmfA6GxDak4eRY8f5bZxfnNMs+aj8bObqUg9mm8g0zBny
 86x71tSe5tdVtb4H30h3PdM8xmZbP0/7qMBpws0YVExJkmjVXq25G3GIEAIEaxlHRjRa
 ++EXFn9QQfP5v1zjju56MaCczgPgry7G2bQ1r1DMb2orUfpfasLXn0xPI1IDy6npzCAW
 J/3ZgE53mnQqo6jcufTqGdLrUKxke0GxrKUeA/aZYhCVnR4q6iTHe0IZ2xhSLqiRubXc
 RKtK8webz8kSF92LKoy/OiEl/F+oFqtyFkhIFagfKAKTd1jBChYgTyylzhWb+VYuaZ+o Zg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6mtsa3u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 05:39:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38J5dpWk020026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 05:39:52 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 18 Sep 2023 22:39:50 -0700
From: Udipto Goswami <quic_ugoswami@quicinc.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH] usb: XHCI: Implement xhci_handshake_check_state() API
Date: Tue, 19 Sep 2023 11:09:34 +0530
Message-ID: <20230919053934.18037-1-quic_ugoswami@quicinc.com>
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
X-Proofpoint-GUID: CFMvKybOSeHeiyZ5Li9KKwXinb839Qn_
X-Proofpoint-ORIG-GUID: CFMvKybOSeHeiyZ5Li9KKwXinb839Qn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_11,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=419
 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190049
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
 drivers/usb/host/xhci.c      | 20 +++++++++++++++++++-
 drivers/usb/host/xhci.h      |  2 ++
 3 files changed, 22 insertions(+), 2 deletions(-)

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
index e1b1b64a0723..b3407fdce288 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -84,6 +84,23 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
 /*
  * Disable interrupts and begin the xHCI halting process.
  */
+int xhci_handshake_check_state(struct xhci_hcd *xhci,
+	void __iomem *ptr, u32 mask, u32 done, int usec)
+{
+	u32	result;
+
+	ret = readl_poll_timeout_atomic(ptr, result,
+				(result & mask) == done ||
+				result == U32_MAX ||
+				xhci->xhc_state & exit_state,
+				1, timeout_us);
+
+	if (result == U32_MAX || xhci->xch_state & exit_state)
+		return -ENODEV;
+
+	return ret;
+}
+
 void xhci_quiesce(struct xhci_hcd *xhci)
 {
 	u32 halted;
@@ -201,7 +218,8 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
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


