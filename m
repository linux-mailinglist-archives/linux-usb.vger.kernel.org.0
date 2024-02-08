Return-Path: <linux-usb+bounces-6071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6001D84ECC3
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 00:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9620BB25E3E
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 23:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB94355788;
	Thu,  8 Feb 2024 23:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FNiiHMtl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CAB50A7E;
	Thu,  8 Feb 2024 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707434082; cv=none; b=LyIeiWRr/xs2Cu+Vp63rOGqcy6HwzkFj+H2GqGnOUuk1FnapZg1+FbIpiVoM0bFlxGLA0eR8QQXmfppBxlXlNi4bv5MTb29BRMCbNhDI/xk3cElWK9o+IJsIyAynhOeENUvCLF86z+3CeaJjsJ1QwRIX9/JbJp60WWHmISJ7/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707434082; c=relaxed/simple;
	bh=mMfpAsIQkrbAWVmvCtRxOhWRPl8nuSyQX1IpdSaNgfg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BsD8SbT1IFFUMvxRatgLzKoMHHfgeNskAC53oIrUAXqNbJ4fygHyDi9pICJvIz13gSNK+NiaqjGskhkYRQzqezWM9AVSjqHOD9oV6MreOSNBpGby1XTZKSAyX76jKwKxo19NIAgjIcSQzxJ0016QemIhGDCbhCUWo3aoMzQBnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FNiiHMtl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 418Mf3TJ022643;
	Thu, 8 Feb 2024 23:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=0+4zaN2NaOvE5eSNuM7R
	vaMAH7ifIk0BKTL8NmYDuJc=; b=FNiiHMtl8/evjAD3+BQlaYvPka9L/47++SKQ
	gRLvC+aitnCt0UTraei/9jtqQV9XIcinDBTdc/xejK2ZuvkRzx1ezQyDFAzSVw0f
	ravDH04suj4OPoKC71k/CK6ujYElGUlWnnDC3vsoky95DoMmdCVK6Z/zaHo9lB3O
	jost0pVYNWYAPM7TmlQyaZWpEqeLOop6Y5pgynNQyxeU+tBf+U1MwwzuuV38RRt8
	55At5mJF8BWt1UYzLxdcpUURTsgaOeMnQLiXtSQ+jRUApJmyJJtot85Gk8byxb/6
	w5VLFHriCZRhv2UU/26QwSvvkCGgsCPwqzwtYZJGQ3DJYua3/g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4pavjs00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 23:14:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 418NEHsg013081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 23:14:17 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 8 Feb 2024 15:14:17 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v14 05/53] xhci: make isoc_bei_interval variable interrupter specific.
Date: Thu, 8 Feb 2024 15:13:18 -0800
Message-ID: <20240208231406.27397-6-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208231406.27397-1-quic_wcheng@quicinc.com>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KznavazFv7W2o9T-fozCvAQrhTcK2yBI
X-Proofpoint-GUID: KznavazFv7W2o9T-fozCvAQrhTcK2yBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=638 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080131

From: Mathias Nyman <mathias.nyman@linux.intel.com>

isoc_bei_interval is used to balance how often completed isochronous
events cause interrupts. If interval is too large then the event ring
may fill up before the completed isoc TRBs are handled.

isoc_bei_interval is tuned based on how full the event ring is.

isoc_bei_interval variable needs to be per interrupter as
with several interrupters each one has its own event ring.

move isoc_bei_interval variable to the interrupter structure.

if a secondary interrupter does not care about this feature then
keep isoc_bei_interval 0.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c  |  2 +-
 drivers/usb/host/xhci-ring.c | 15 +++++++++------
 drivers/usb/host/xhci.h      |  2 +-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a7716202a8dd..450adaca68ee 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2533,7 +2533,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (xhci_add_interrupter(xhci, ir, 0))
 		goto fail;
 
-	xhci->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
+	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
 	/*
 	 * XXX: Might need to set the Interrupter Moderation Register to
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f8e78068c36f..1b619a290446 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3103,8 +3103,8 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		event_ring_deq = ir->event_ring->dequeue;
 
 		/* ring is half-full, force isoc trbs to interrupt more often */
-		if (xhci->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
-			xhci->isoc_bei_interval = xhci->isoc_bei_interval / 2;
+		if (ir->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
+			ir->isoc_bei_interval = ir->isoc_bei_interval / 2;
 
 		event_loop = 0;
 	}
@@ -3972,7 +3972,8 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
 }
 
 /* Check if we should generate event interrupt for a TD in an isoc URB */
-static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
+static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i,
+				 struct xhci_interrupter *ir)
 {
 	if (xhci->hci_version < 0x100)
 		return false;
@@ -3983,8 +3984,8 @@ static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
 	 * If AVOID_BEI is set the host handles full event rings poorly,
 	 * generate an event at least every 8th TD to clear the event ring
 	 */
-	if (i && xhci->quirks & XHCI_AVOID_BEI)
-		return !!(i % xhci->isoc_bei_interval);
+	if (i && ir->isoc_bei_interval && xhci->quirks & XHCI_AVOID_BEI)
+		return !!(i % ir->isoc_bei_interval);
 
 	return true;
 }
@@ -3993,6 +3994,7 @@ static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
 static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		struct urb *urb, int slot_id, unsigned int ep_index)
 {
+	struct xhci_interrupter *ir;
 	struct xhci_ring *ep_ring;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
@@ -4010,6 +4012,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
+	ir = xhci->interrupters[0];
 
 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4097,7 +4100,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				td->last_trb = ep_ring->enqueue;
 				td->last_trb_seg = ep_ring->enq_seg;
 				field |= TRB_IOC;
-				if (trb_block_event_intr(xhci, num_tds, i))
+				if (trb_block_event_intr(xhci, num_tds, i, ir))
 					field |= TRB_BEI;
 			}
 			/* Calculate TRB length */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index daee202cd369..44e447fdad62 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1432,6 +1432,7 @@ struct xhci_interrupter {
 	struct xhci_intr_reg __iomem *ir_set;
 	unsigned int		intr_num;
 	bool			ip_autoclear;
+	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_irq_pending;
 	u32	s3_irq_control;
@@ -1504,7 +1505,6 @@ struct xhci_hcd {
 	u8		isoc_threshold;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
-	u32		isoc_bei_interval;
 	int		event_ring_max;
 	/* 4KB min, 128MB max */
 	int		page_size;

