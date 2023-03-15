Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0CC6BB38B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Mar 2023 13:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjCOMsD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Mar 2023 08:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233084AbjCOMrt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Mar 2023 08:47:49 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB48726872
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 05:47:27 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FALIVN010705;
        Wed, 15 Mar 2023 12:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=HWVAm0Do4oe0Iyy1xzcAxS6hSjCldzUp8CY6dUYUY+s=;
 b=GzBBgE5N0XUKltM4VjJUeoHtVCPofIE8ME35s+PH6JdVhPHQ69TaI9McBWo6zvdSTVJR
 yR1psrQQD8xTzFLnA+HytmsiR1vFDPgEoFVYpzemSB7+oufO9AbdykhC2uSCqBatOFk5
 Cdk0TCeqnqLqvsTy14SwNEpiBHMo4MvmBAetirh3rCpN0oYIs1apAvEAhaZB18uec+E7
 8aV5wcRnqrryakL+tSZHyYe1Qx5C+czhfkp43gf3X96uiXNI4uGfXWeI7zzO5QvI4eko
 2kcmfJaCqyMNJEW/P/Tt5YaruvCOMWBZlqp+ATFFgecZAdakP1yTJX9xcQkODxzG9c5s SQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pb2by9gy8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Mar 2023 12:47:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32FClOaw007552
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Mar 2023 12:47:24 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 05:47:22 -0700
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH v2] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
Date:   Wed, 15 Mar 2023 18:17:05 +0530
Message-ID: <20230315124705.14723-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ckbM9zFb8fcInXXQ1LRDVIrI0vnHGYFp
X-Proofpoint-GUID: ckbM9zFb8fcInXXQ1LRDVIrI0vnHGYFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_06,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=730 bulkscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150109
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the dwc3 device is runtime suspended, various required clocks would
get disabled and it is not guaranteed that access to any registers would
work. Depending on the SoC glue, a register read could be as benign as
returning 0 or be fatal enough to hang the system.

In order to prevent such scenarios of fatal errors, bail out of debugfs
function is dwc3 is suspended.

Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
v2: Replaced return 0 with -EINVAL & seq_puts with pr_err.

 drivers/usb/dwc3/debugfs.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 850df0e6bcab..0e6cf7b89f8b 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -544,6 +544,11 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 	u32			reg;
 	u8			speed;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
@@ -580,6 +585,11 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	u32			reg;
 	u8			speed;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
 
@@ -641,6 +651,11 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	u32			mdwidth;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
 
@@ -663,6 +678,11 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	u32			mdwidth;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
 
@@ -684,6 +704,11 @@ static int dwc3_tx_request_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXREQQ);
 	seq_printf(s, "%u\n", val);
@@ -699,6 +724,11 @@ static int dwc3_rx_request_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXREQQ);
 	seq_printf(s, "%u\n", val);
@@ -714,6 +744,11 @@ static int dwc3_rx_info_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXINFOQ);
 	seq_printf(s, "%u\n", val);
@@ -729,6 +764,11 @@ static int dwc3_descriptor_fetch_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_DESCFETCHQ);
 	seq_printf(s, "%u\n", val);
@@ -744,6 +784,11 @@ static int dwc3_event_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_EVENTQ);
 	seq_printf(s, "%u\n", val);
@@ -835,6 +880,11 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 	u32			upper_32_bits;
 	u32			reg;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		pr_err("Invalid operation, DWC3 suspended!");
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = DWC3_GDBGLSPMUX_EPSELECT(dep->number);
 	dwc3_writel(dwc->regs, DWC3_GDBGLSPMUX, reg);
-- 
2.17.1

