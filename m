Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 395216B725C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 10:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbjCMJTM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 05:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjCMJTH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 05:19:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF542BEE1
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 02:19:06 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32CNOEWa007678;
        Mon, 13 Mar 2023 09:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=FvwRbYiKtUMCLqXRgGbcthyaA9fmWAnTTAXwcY8MtLQ=;
 b=fDXfML3SG2bPBTjQXiu2N57o42q+ZrjiwfMSFfe7IlFKS0gGPOl7YGRjz5QJWgmAAezT
 7uCeknT/MvM9qlhcO753zt5dmb56hIMH0JNv6QDfj5HE9OU5yaUZ6tFmZASbqrSgggMW
 9ktS8qX5C7sEh4j7dPWo0b92DcSId+YhLir7KqggjuMn3GefD8Y+P/K/W8DkxMdTRZ7L
 Y1l4q8K0143xEpJyCZfQXoTXv26hm8RHieHkGKozNUdXN/hdLh4NJ4Ur6JcncXUl/3gR
 oCt5e4zG2Hh6pmnNwD6nWyJVBe1B8+6mTZcoXo+aErQiJwih/PxZoCzTa8zwajV69WBj OQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p8j1f49mw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Mar 2023 09:19:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32D9J3gL026258
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Mar 2023 09:19:03 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 13 Mar 2023 02:19:00 -0700
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
Date:   Mon, 13 Mar 2023 14:48:37 +0530
Message-ID: <20230313091837.19806-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RegrJNH6jtfA4cexxv8b0ScuRySrwx5P
X-Proofpoint-ORIG-GUID: RegrJNH6jtfA4cexxv8b0ScuRySrwx5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_01,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=768 clxscore=1011 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130074
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/usb/dwc3/debugfs.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 850df0e6bcab..f921d4911ffc 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -544,6 +544,11 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 	u32			reg;
 	u8			speed;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
@@ -580,6 +585,11 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	u32			reg;
 	u8			speed;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
 
@@ -641,6 +651,11 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	u32			mdwidth;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
 
@@ -663,6 +678,11 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	u32			mdwidth;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
 
@@ -684,6 +704,11 @@ static int dwc3_tx_request_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXREQQ);
 	seq_printf(s, "%u\n", val);
@@ -699,6 +724,11 @@ static int dwc3_rx_request_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXREQQ);
 	seq_printf(s, "%u\n", val);
@@ -714,6 +744,11 @@ static int dwc3_rx_info_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXINFOQ);
 	seq_printf(s, "%u\n", val);
@@ -729,6 +764,11 @@ static int dwc3_descriptor_fetch_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_DESCFETCHQ);
 	seq_printf(s, "%u\n", val);
@@ -744,6 +784,11 @@ static int dwc3_event_queue_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			val;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_EVENTQ);
 	seq_printf(s, "%u\n", val);
@@ -835,6 +880,11 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 	u32			upper_32_bits;
 	u32			reg;
 
+	if (pm_runtime_suspended(dwc->dev)) {
+		seq_puts(s, "Invalid operation, DWC3 suspended!");
+		return 0;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = DWC3_GDBGLSPMUX_EPSELECT(dep->number);
 	dwc3_writel(dwc->regs, DWC3_GDBGLSPMUX, reg);
-- 
2.17.1

