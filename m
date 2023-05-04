Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3AF6F6424
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 06:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjEDEvU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 00:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjEDEvT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 00:51:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFBB199E
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 21:51:17 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3442pFS4009080;
        Thu, 4 May 2023 04:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=g2Wr0EVpygjnIMExtsnwRZyAKYua94ysj16fdipQy/s=;
 b=kuvLA3Z0MXq08Dahv/+y2MjrZzgJW3V6hHz4zG4sHWQOH7AF8Rhpjk7As6FDE4h72l4R
 EqiZu4HnRbISAsIULbwci8J5dLNEoShqwpNxBw2h9Ead9ohYN+EjwlgOs7mr28l+Nn3j
 J/oZ3EE4pODxR+LTfsWFS/wnZF/7aMi3FTrKIj/5R8iXHf88wQRHNR2OmL5ssVkIt6rT
 +Qdc3ik82xFkR9fQObPdi03sD+tWCNG7nnopKxl7SlNDBoEGwLJhp4ZLQxxqq9+i/D7s
 WgJ56bEvi7sAz+TRgcDaI4NikJ4FixvznjumjThb81QsyqGla/I4GUcDrrxZBl3fqYuK rQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbmy4a21g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 May 2023 04:51:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3444p7eI003608
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 4 May 2023 04:51:07 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 3 May 2023 21:51:03 -0700
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        "Oliver Neukum" <oneukum@suse.com>, <linux-usb@vger.kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
Date:   Thu, 4 May 2023 10:20:52 +0530
Message-ID: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gokuqt-nspHQoel-1YkV9hiepHSXmiiq
X-Proofpoint-GUID: Gokuqt-nspHQoel-1YkV9hiepHSXmiiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_02,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxlogscore=882 spamscore=0 phishscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
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
v8: Replace pm_runtime_get_sync with pm_runtime_resume_and get.
v7: Replaced pm_runtime_put with pm_runtime_put_sync & returned proper values.
v6: Added changes to handle get_dync failure appropriately.
v5: Reworked the patch to resume dwc3 while accessing the registers.
v4: Introduced pm_runtime_get_if_in_use in order to make sure dwc3 isn't
	suspended while accessing the registers.
v3: Replace pr_err to dev_err. 
v2: Replaced return 0 with -EINVAL & seq_puts with pr_err.

 drivers/usb/dwc3/debugfs.c | 99 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index e4a2560b9dc0..a996e3580150 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -332,6 +332,11 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
 	unsigned int		current_mode;
 	unsigned long		flags;
 	u32			reg;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
@@ -349,6 +354,7 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
 		break;
 	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
+	pm_runtime_put_sync(dwc->dev);
 
 	return 0;
 }
@@ -395,6 +401,11 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = s->private;
 	unsigned long		flags;
 	u32			reg;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
@@ -414,6 +425,7 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 		seq_printf(s, "UNKNOWN %08x\n", DWC3_GCTL_PRTCAP(reg));
 	}
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -463,6 +475,11 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = s->private;
 	unsigned long		flags;
 	u32			reg;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
@@ -493,6 +510,7 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
 		seq_printf(s, "UNKNOWN %d\n", reg);
 	}
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -509,6 +527,7 @@ static ssize_t dwc3_testmode_write(struct file *file,
 	unsigned long		flags;
 	u32			testmode = 0;
 	char			buf[32];
+	int			ret;
 
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
@@ -526,10 +545,15 @@ static ssize_t dwc3_testmode_write(struct file *file,
 	else
 		testmode = 0;
 
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc3_gadget_set_test_mode(dwc, testmode);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return count;
 }
 
@@ -548,12 +572,18 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 	enum dwc3_link_state	state;
 	u32			reg;
 	u8			speed;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
 		seq_puts(s, "Not available\n");
 		spin_unlock_irqrestore(&dwc->lock, flags);
+		pm_runtime_put_sync(dwc->dev);
 		return 0;
 	}
 
@@ -566,6 +596,7 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 		   dwc3_gadget_hs_link_string(state));
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -584,6 +615,7 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	char			buf[32];
 	u32			reg;
 	u8			speed;
+	int			ret;
 
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
@@ -603,11 +635,16 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	else
 		return -EINVAL;
 
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
 		spin_unlock_irqrestore(&dwc->lock, flags);
-		return -EINVAL;
+		pm_runtime_put_sync(dwc->dev);
+		return ret;
 	}
 
 	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
@@ -616,12 +653,14 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	if (speed < DWC3_DSTS_SUPERSPEED &&
 	    state != DWC3_LINK_STATE_RECOV) {
 		spin_unlock_irqrestore(&dwc->lock, flags);
-		return -EINVAL;
+		pm_runtime_put_sync(dwc->dev);
+		return ret;
 	}
 
 	dwc3_gadget_set_link_state(dwc, state);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return count;
 }
 
@@ -645,6 +684,11 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			mdwidth;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
@@ -657,6 +701,7 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -667,6 +712,12 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			mdwidth;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		pm_runtime_put_sync(dwc->dev);
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
@@ -679,6 +730,7 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -688,12 +740,18 @@ static int dwc3_tx_request_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXREQQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -703,12 +761,18 @@ static int dwc3_rx_request_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXREQQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -718,12 +782,18 @@ static int dwc3_rx_info_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXINFOQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -733,12 +803,18 @@ static int dwc3_descriptor_fetch_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_DESCFETCHQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -748,12 +824,18 @@ static int dwc3_event_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_EVENTQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -798,6 +880,11 @@ static int dwc3_trb_ring_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	int			i;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	if (dep->number <= 1) {
@@ -827,6 +914,7 @@ static int dwc3_trb_ring_show(struct seq_file *s, void *unused)
 out:
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -839,6 +927,11 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 	u32			lower_32_bits;
 	u32			upper_32_bits;
 	u32			reg;
+	int			ret;
+
+	ret = pm_runtime_resume_and_get(dwc->dev);
+	if (ret < 0)
+		return ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = DWC3_GDBGLSPMUX_EPSELECT(dep->number);
@@ -851,6 +944,7 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 	seq_printf(s, "0x%016llx\n", ep_info);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	pm_runtime_put_sync(dwc->dev);
 	return 0;
 }
 
@@ -910,6 +1004,7 @@ void dwc3_debugfs_init(struct dwc3 *dwc)
 	dwc->regset->regs = dwc3_regs;
 	dwc->regset->nregs = ARRAY_SIZE(dwc3_regs);
 	dwc->regset->base = dwc->regs - DWC3_GLOBALS_REGS_START;
+	dwc->regset->dev = dwc->dev;
 
 	root = debugfs_create_dir(dev_name(dwc->dev), usb_debug_root);
 	dwc->debug_root = root;
-- 
2.17.1

