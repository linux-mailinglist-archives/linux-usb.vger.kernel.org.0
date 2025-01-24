Return-Path: <linux-usb+bounces-19699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07999A1BB82
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 18:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0560F3A5935
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 17:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08121D0E27;
	Fri, 24 Jan 2025 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="t2L4rsVz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6A3224;
	Fri, 24 Jan 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737740101; cv=none; b=KTXvPOiuMBxwDyzy5bo/pu6MOqwpw+Wy/VFoeY1E6RV26OKgQK5PcTjb18vvMPIC+F3qNXKM47FQHDOVm2E68bTbH8lgo9HTNlfNLxgYUEtfw27mLA6aoK+/84pF8ZGIFzLMdaMsKv5A87kpnP00zRfKNm2KvhqES2MMPGQorYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737740101; c=relaxed/simple;
	bh=WT+ndHRi/mTF5D0kumOVueeFGXT1IyN1QkuRcQUs2oI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RstqzHtO937BLxzWBfQvw9uwpo07GX2GBDNHeUyjzZiQ71ctb1ODK/OJBEwZ0IhPxvdxF+TTXGVpAiTJN0ISlhcsxAvbcHXVWhRiJJRz8orTA6Ncv4stVN/fK6wtobOOmQqEi/ZTkjK5JCoNzgRZL4oS0TBqG5BVFGSVOxD4eGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=t2L4rsVz; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OFIErk025669;
	Fri, 24 Jan 2025 18:34:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=yW8VFvYS8cKPfqSRBaa6hj
	CONGocaVj1yRckhmQ2tJI=; b=t2L4rsVzxRXXxiFTuWSxgQkM7B7SMcQLX9qMPy
	2VDdXYvS0x8Jfznu1wiUVGGiuyNBqZU5B+xpOYhgjKHGcI1pPeJGn+lqqa8umOvs
	sVNqf55KARi6pfszNtSLAzwb6ek8uvzp6BjDZoKdDVYfRvfiks7s6rof65qaKDTa
	wFVKC34biowRQC+jyqW57fNdK/kE8bSZw2nu2lB5tYL+j7XKzyVkeB8ZAoDZzrCa
	gIu8203+aeQLwatsbBs/modIQanbATzAqzspjMpg8w5jrC7YTXISpFyDXb0WvnY4
	jhLhc+PvOG9Iarv8WA6Dkm9UTTdx+qAgqzAdKysgJNjQr+0A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44cdcw0g05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:34:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 05A7C40045;
	Fri, 24 Jan 2025 18:33:55 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A02852FB3C3;
	Fri, 24 Jan 2025 18:33:33 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Jan
 2025 18:33:33 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 24 Jan
 2025 18:33:33 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <fabrice.gasnier@foss.st.com>
Subject: [PATCH] usb: dwc2: gadget: remove of_node reference upon udc_stop
Date: Fri, 24 Jan 2025 18:33:25 +0100
Message-ID: <20250124173325.2747710-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_07,2025-01-23_01,2024-11-22_01

In dwc2_hsotg_udc_start(), e.g. when binding composite driver, "of_node"
is set to hsotg->dev->of_node.

It causes errors when binding the gadget driver several times, on
stm32mp157c-ev1 board. Below error is seen:
"pin PA10 already requested by 49000000.usb-otg; cannot claim for gadget.0"

The first time, no issue is seen as when registering the driver, of_node
isn't NULL:
-> gadget_dev_desc_UDC_store
  -> usb_gadget_register_driver_owner
    -> driver_register
    ...
      -> really_probe -> pinctrl_bind_pins (no effect)

Then dwc2_hsotg_udc_start() sets of_node.

The second time (stop the gadget, reconfigure it, then start it again),
of_node has been set, so the probing code tries to acquire pins for the
gadget. These pins are hold by the controller, hence the error.

So clear gadget.dev.of_node in udc_stop() routine to avoid the issue.

Fixes: 7d7b22928b90 ("usb: gadget: s3c-hsotg: Propagate devicetree to gadget drivers")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Note: I'd have been tempted to remove of_node setting from udc_start:
 -	hsotg->gadget.dev.of_node = hsotg->dev->of_node;

I can't find the original code that parses the device node [1] from
composite_bind() routine, originally part of the series that introduces
this.
I'm not sure if setting the gadget of_node is really useful, but I chose
safe approach to simply clear it in udc_stop().

[1] http://lore.kernel.org/lkml/1340720833-781-6-git-send-email-aletes.xgr@gmail.com/
---
 drivers/usb/dwc2/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index e7bf9cc635be..bd4c788f03bc 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4615,6 +4615,7 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 	spin_lock_irqsave(&hsotg->lock, flags);
 
 	hsotg->driver = NULL;
+	hsotg->gadget.dev.of_node = NULL;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
 	hsotg->enabled = 0;
 
-- 
2.25.1


