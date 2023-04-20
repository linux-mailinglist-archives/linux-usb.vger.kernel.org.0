Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1506E897A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 07:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjDTFRm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Apr 2023 01:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjDTFRk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 01:17:40 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0736C198E
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 22:17:39 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33K5Fr0A004786;
        Thu, 20 Apr 2023 05:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=4mGOeFm/SJXptejYxSGaxVtzhS+j17q6Xigddj5SRTQ=;
 b=WM8yqLNuVfY0SaqPaiEmth1mBNTqWC14M1v3eyb8sDA6B8buq51VKOaHhXt5/pdBqraT
 VEzTF2Us/fqluJ+pmaQc6OpIWB0qLZNDc/iVfzTAOojDkKkduvY0jH8AENoYWcuHGiCO
 QTj1zp/b6ptEZBRZRggt6RWtfIMt6exTRVNb9a5MgOk1sz5/BNOjGi5kl8o94fC6IuLm
 Ig67bo3uBbzLVmnWbDNByyHollN2OUP3p82U6KvW2O+1rcA5eYnq+zdjo8snf7DkOJjA
 h5s17j4GhokSxr4S2P/A2pEdui8G576PqwcdZGwQ2B/ihhzimQATVBjfhCqKQRtMaPMj 5A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2uh3gcdd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Apr 2023 05:17:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33K5HV1A007145
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Apr 2023 05:17:31 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 19 Apr 2023 22:17:28 -0700
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        "Oliver Neukum" <oneukum@suse.com>, <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH v6] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
Date:   Thu, 20 Apr 2023 10:47:05 +0530
Message-ID: <20230420051705.27801-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T1OpcMoC0RwBYWuS4K8QTVmj-mXcXJ56
X-Proofpoint-GUID: T1OpcMoC0RwBYWuS4K8QTVmj-mXcXJ56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=918
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200042
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the dwc3 device is runtime suspended, various required clocks would
get disabled and it is not guaranteed that access to any registers would
work. Depending on the SoC glue, a register read could be as benign as
returning 0 or be fatal enough to hang the system.

In order to prevent such scenarios of fatal errors, make sure to resume
dwc3 then allow the function to proceed.

Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---

v6: Added changes to handle get_dync failure appropriately.
v5: Reworked the patch to resume dwc3 while accessing the registers.
v4: Introduced pm_runtime_get_if_in_use in order to make sure dwc3 isn't
	suspended while accessing the registers.
v3: Replace pr_err to dev_err. 
v2: Replaced return 0 with -EINVAL & seq_puts with pr_err.

 drivers/usb/dwc3/debugfs.c | 124 +++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index e4a2560b9dc0..b08604a73e69 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -332,6 +332,13 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
 	unsigned int		current_mode;
 	unsigned long		flags;
 	u32			reg;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
@@ -349,6 +356,7 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
 		break;
 	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
+	pm_runtime_put(dwc->dev);
 
 	return 0;
 }
@@ -395,6 +403,13 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = s->private;
 	unsigned long		flags;
 	u32			reg;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
@@ -414,6 +429,7 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 		seq_printf(s, "UNKNOWN %08x\n", DWC3_GCTL_PRTCAP(reg));
 	}
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -463,6 +479,13 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = s->private;
 	unsigned long		flags;
 	u32			reg;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
@@ -493,6 +516,7 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
 		seq_printf(s, "UNKNOWN %d\n", reg);
 	}
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -509,6 +533,7 @@ static ssize_t dwc3_testmode_write(struct file *file,
 	unsigned long		flags;
 	u32			testmode = 0;
 	char			buf[32];
+	int			ret;
 
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
@@ -526,10 +551,17 @@ static ssize_t dwc3_testmode_write(struct file *file,
 	else
 		testmode = 0;
 
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc3_gadget_set_test_mode(dwc, testmode);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return count;
 }
 
@@ -548,12 +580,20 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 	enum dwc3_link_state	state;
 	u32			reg;
 	u8			speed;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
 		seq_puts(s, "Not available\n");
 		spin_unlock_irqrestore(&dwc->lock, flags);
+		pm_runtime_put(dwc->dev);
 		return 0;
 	}
 
@@ -566,6 +606,7 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 		   dwc3_gadget_hs_link_string(state));
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -584,6 +625,7 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	char			buf[32];
 	u32			reg;
 	u8			speed;
+	int			ret;
 
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
@@ -603,10 +645,17 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	else
 		return -EINVAL;
 
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
 		spin_unlock_irqrestore(&dwc->lock, flags);
+		pm_runtime_put(dwc->dev);
 		return -EINVAL;
 	}
 
@@ -616,12 +665,14 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	if (speed < DWC3_DSTS_SUPERSPEED &&
 	    state != DWC3_LINK_STATE_RECOV) {
 		spin_unlock_irqrestore(&dwc->lock, flags);
+		pm_runtime_put(dwc->dev);
 		return -EINVAL;
 	}
 
 	dwc3_gadget_set_link_state(dwc, state);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return count;
 }
 
@@ -645,6 +696,13 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			mdwidth;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
@@ -657,6 +715,7 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -667,6 +726,13 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			mdwidth;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
@@ -679,6 +745,7 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -688,12 +755,20 @@ static int dwc3_tx_request_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXREQQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -703,12 +778,20 @@ static int dwc3_rx_request_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXREQQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -718,12 +801,20 @@ static int dwc3_rx_info_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXINFOQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -733,12 +824,20 @@ static int dwc3_descriptor_fetch_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_DESCFETCHQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -748,12 +847,20 @@ static int dwc3_event_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_EVENTQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -798,6 +905,13 @@ static int dwc3_trb_ring_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	int			i;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	if (dep->number <= 1) {
@@ -827,6 +941,7 @@ static int dwc3_trb_ring_show(struct seq_file *s, void *unused)
 out:
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -839,6 +954,13 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 	u32			lower_32_bits;
 	u32			upper_32_bits;
 	u32			reg;
+	int			ret;
+
+	ret = pm_runtime_get_sync(dwc->dev);
+	if (ret < 0) {
+		pm_runtime_put(dwc->dev);
+		return -EINVAL;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = DWC3_GDBGLSPMUX_EPSELECT(dep->number);
@@ -851,6 +973,7 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 	seq_printf(s, "0x%016llx\n", ep_info);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put(dwc->dev);
 	return 0;
 }
 
@@ -910,6 +1033,7 @@ void dwc3_debugfs_init(struct dwc3 *dwc)
 	dwc->regset->regs = dwc3_regs;
 	dwc->regset->nregs = ARRAY_SIZE(dwc3_regs);
 	dwc->regset->base = dwc->regs - DWC3_GLOBALS_REGS_START;
+	dwc->regset->dev = dwc->dev;
 
 	root = debugfs_create_dir(dev_name(dwc->dev), usb_debug_root);
 	dwc->debug_root = root;
-- 
2.17.1

