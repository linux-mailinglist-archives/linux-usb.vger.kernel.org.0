Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559B46D5C8F
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 12:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbjDDKBy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 06:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbjDDKBx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 06:01:53 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C74B1BD6
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 03:01:51 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3349fuYj016187;
        Tue, 4 Apr 2023 10:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=TEc5c6bXeAkKavsDqE7vQweXHC0/b1D8m/G4DJ/fmKc=;
 b=bf1G21Ccre8OS8wnrZ3QTEThi/DedXMv+UxxpFTB1iy/jITMHCqZ0lqRQezo4tWEpDTc
 8Av0gMd8ufLODG+oFw6vVUh5+BtSW9SSAanRJbvepZpNi/J95wvdCvu6Y6Sxh7xETY2l
 Nls7CRy5jtLCUDmIEd8WAUbpUQGbByJeehbf3VEQbImGbLeiVyuAB+nsSb9ygUxsZqaw
 x2IlehkYjDuPcw6AwO2fjlBZwbgUsRK3vm72O5XjlpOASq484dUoakAyrUEQy0UeYNOC
 EF5T+aBSS2enUOVvHaZ+fROUFMJZ67cU32B8KbDH126EQzCLruYvZg2gEJhlBRroYubM gw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prg9bg6ct-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Apr 2023 10:01:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334A1AeL000326
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 4 Apr 2023 10:01:10 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 03:01:07 -0700
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>, Oliver Neukum <oneukum@suse.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when devices
Date:   Tue, 4 Apr 2023 15:30:55 +0530
Message-ID: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pbaS-e7g_UWh6KiG321x04NVt-4508O2
X-Proofpoint-ORIG-GUID: pbaS-e7g_UWh6KiG321x04NVt-4508O2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_03,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=848 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040092
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
v4: Introduced pm_runtime_get_if_in_use in order to make sure dwc3 isn't
suspended while accessing the registers.

 drivers/usb/dwc3/debugfs.c | 191 ++++++++++++++++++++++++++++++++-----
 1 file changed, 169 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 850df0e6bcab..e57cafb7da4b 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -543,13 +543,25 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 	enum dwc3_link_state	state;
 	u32			reg;
 	u8			speed;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
 		seq_puts(s, "Not available\n");
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return 0;
+		goto err;
 	}
 
 	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
@@ -559,9 +571,11 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%s\n", (speed >= DWC3_DSTS_SUPERSPEED) ?
 		   dwc3_gadget_link_string(state) :
 		   dwc3_gadget_hs_link_string(state));
+err:
 	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	return 0;
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
 }
 
 static int dwc3_link_state_open(struct inode *inode, struct file *file)
@@ -579,6 +593,20 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	char			buf[32];
 	u32			reg;
 	u8			speed;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
+
 
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
@@ -601,8 +629,8 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
 	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return -EINVAL;
+		count = -EINVAL;
+		goto err;
 	}
 
 	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
@@ -610,13 +638,15 @@ static ssize_t dwc3_link_state_write(struct file *file,
 
 	if (speed < DWC3_DSTS_SUPERSPEED &&
 	    state != DWC3_LINK_STATE_RECOV) {
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return -EINVAL;
+		count = -EINVAL;
+		goto err;
 	}
 
 	dwc3_gadget_set_link_state(dwc, state);
+err:
 	spin_unlock_irqrestore(&dwc->lock, flags);
-
+	pm_runtime_put(dwc->dev);
+err_nolock:
 	return count;
 }
 
@@ -640,6 +670,19 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			mdwidth;
 	u32			val;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
@@ -650,9 +693,11 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
 	val *= mdwidth;
 	val >>= 3;
 	seq_printf(s, "%u\n", val);
-	spin_unlock_irqrestore(&dwc->lock, flags);
 
-	return 0;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
 }
 
 static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
@@ -662,6 +707,19 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	unsigned long		flags;
 	u32			mdwidth;
 	u32			val;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
@@ -673,8 +731,9 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
 	val >>= 3;
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	return 0;
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
 }
 
 static int dwc3_tx_request_queue_show(struct seq_file *s, void *unused)
@@ -683,13 +742,27 @@ static int dwc3_tx_request_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_TXREQQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	return 0;
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
 }
 
 static int dwc3_rx_request_queue_show(struct seq_file *s, void *unused)
@@ -698,13 +771,27 @@ static int dwc3_rx_request_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXREQQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	return 0;
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
 }
 
 static int dwc3_rx_info_queue_show(struct seq_file *s, void *unused)
@@ -713,13 +800,28 @@ static int dwc3_rx_info_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_RXINFOQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
 
-	return 0;
 }
 
 static int dwc3_descriptor_fetch_queue_show(struct seq_file *s, void *unused)
@@ -728,13 +830,29 @@ static int dwc3_descriptor_fetch_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_DESCFETCHQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
+
 
-	return 0;
 }
 
 static int dwc3_event_queue_show(struct seq_file *s, void *unused)
@@ -743,13 +861,28 @@ static int dwc3_event_queue_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = dep->dwc;
 	unsigned long		flags;
 	u32			val;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	val = dwc3_core_fifo_space(dep, DWC3_EVENTQ);
 	seq_printf(s, "%u\n", val);
 	spin_unlock_irqrestore(&dwc->lock, flags);
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
 
-	return 0;
 }
 
 static int dwc3_transfer_type_show(struct seq_file *s, void *unused)
@@ -834,6 +967,19 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 	u32			lower_32_bits;
 	u32			upper_32_bits;
 	u32			reg;
+	int			ret = 0;
+
+	ret = pm_runtime_get_if_in_use(dwc->dev);
+	/* check if pm runtime get fails, bail out early */
+	if (ret < 0)
+		goto err_nolock;
+
+	if (!ret) {
+		ret = -EINVAL;
+		dev_err(dwc->dev,
+				"Invalid operation, DWC3 suspended!");
+		goto err_nolock;
+	}
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	reg = DWC3_GDBGLSPMUX_EPSELECT(dep->number);
@@ -845,8 +991,9 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
 	ep_info = ((u64)upper_32_bits << 32) | lower_32_bits;
 	seq_printf(s, "0x%016llx\n", ep_info);
 	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	return 0;
+	pm_runtime_put(dwc->dev);
+err_nolock:
+	return ret;
 }
 
 DEFINE_SHOW_ATTRIBUTE(dwc3_tx_fifo_size);
-- 
2.17.1

