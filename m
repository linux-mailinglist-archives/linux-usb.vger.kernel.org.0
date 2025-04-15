Return-Path: <linux-usb+bounces-23079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB174A89CB7
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 13:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C3551884135
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 11:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E643229115F;
	Tue, 15 Apr 2025 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b="DgubTRi2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CAF2676CF
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717221; cv=none; b=AHKL4wQYfqhxj2+LR20ozqZv4aLuiZA0TbujROAD7kO2HYWc+jBbKr0elVYXmyr+X4f92k71rcwNVuGrcnABbZD2dNYwHCk7LJJffo/JNahel0PqKb6JbOH9PO7K0olqhl41OGShJEmq70UqummbQK13dWEPA7fS5Q//LJHEb5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717221; c=relaxed/simple;
	bh=O/rT8+I9mTT1hvtVqcKe/fjxb+s+XOn8MkeEF7/UclI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cFFl1NqCvBp1ZnVwekczeSuH+Nn1VlDmw0zI0XxQZoWg1W/Y55aXXZ1dbrP4gTsMO0QhJUBayr7FBEjvS/Ici4boi0aQSw8hSYiibK/76ViqIOD8R2MXlUnkDxIfD5xVEUEBEPnoHbwrsLnVeTtFx/dpLmBcXIwiXMniX7SOVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com; spf=pass smtp.mailfrom=mvista.com; dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b=DgubTRi2; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mvista.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2279915e06eso57073585ad.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744717217; x=1745322017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aev0NKrAlcg9mgeOUSYkPy9/PBVFtBme5rActlatexo=;
        b=DgubTRi2CjCvf/OMQDWR4F1rIUepe1UIQy+Zlzzp2g4KtxOmIFwFaNeY0NI9Zbmk84
         8EFyscGNfQFUrAzopoDrgOSp8yQaq1d2dQ17ELMow8wrmu00TpJV2CQcUGl0A1Ulqfnj
         53SsiIaJV/zQIPou88ZvjxO3rGa6DMbpD+Qqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744717217; x=1745322017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aev0NKrAlcg9mgeOUSYkPy9/PBVFtBme5rActlatexo=;
        b=USGt9qJwcmn6ItocQra8fG0h8N3uK9Ps8oGUr0aCgdRLgTN5qwY5GFtzvFe/7E6feX
         UJRQyu/B82LUBeOpkyh/X0FHpjLytq4rqbgLU+JcutL8ZuFGZVtfhmiYPAkEOIDyek++
         kmCYZhzsPw+OiBScA53kb30RvT7MV7bhGN+YALRx9UWOyar/UpRRIvAJ4j+oIzaLdzL+
         9aro66fwQIoB04dwuOZnvU2KX3X2vn8qoGFwgGWD5y43qQ56Lk0GfSEnPydktLjyelyS
         VAwNsIe5mItbSQ+UT1ueZ92/XfA0/VG76EIxHH02qMtCrPSbCrrG2GAx07dUeew8zR09
         +R8w==
X-Forwarded-Encrypted: i=1; AJvYcCVLAQEbN1+/j6jSExI1pFFUiQC9MGjcy7mIZiJA8JhBZ/UsTPOWtyUibjmjZXiwTZ8TDrPMAtxeIK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hnf4c/aKuMW0e8GTPjExoXe1udj1j3wlVmDepJSr3OsIgG8h
	ZcJGDXCpZiazJIBT40UQs2wY9zqbeKK4Ocbba50An9ufvf+wmsVnNhGCdPVsR68=
X-Gm-Gg: ASbGncsYFDfny6y0hkkr1mIvcZC1peXXkyXKGmDUxUmSKiczUcPcDQ/GmXwjRTQibE0
	e3Teo6Cj8214Rw4Zyj8BYlzColVLsROK1WIoHm7D0Nz1SX1DlYrc7IxMg+5ZSoXTiENrAYvH+cX
	Up/M2q3uvMhkAAysdtrS9vIp9Z9beQGCvLER1N4/zJziIKbeDmiRptq6HZiX4Ij4iiVA2P57rr1
	/VRQob3HmSaz569c2tvL4+r8RvQUBwYRmXs0ytcgDiV1YHutMXu6gQVyb3/glq3BjJC/GTCNzHb
	aMamrrJF+mgxvnTJ8n356EInVemmw0lHzw5urESUh/VcMRTgjRqEVa0Q
X-Google-Smtp-Source: AGHT+IH7crPf+qwLzPI4w3eOrxW6iChDBV2CDgTRlXrgZfjm8Atec9trgc/njYSLmtbuVdbEstoRxQ==
X-Received: by 2002:a17:902:f54f:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22bea4fddfamr188923395ad.49.1744717217403;
        Tue, 15 Apr 2025 04:40:17 -0700 (PDT)
Received: from testing.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df07dcfasm14299971a91.14.2025.04.15.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:40:17 -0700 (PDT)
From: Hardik Gohil <hgohil@mvista.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Yu Chen <chenyu56@huawei.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Ferry Toth <fntoth@gmail.com>,
	Wesley Cheng <wcheng@codeaurora.org>,
	John Stultz <john.stultz@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Hardik Gohil <hgohil@mvista.com>
Subject: [PATCH v5.4.y] usb: dwc3: core: Do core softreset when switch mode
Date: Tue, 15 Apr 2025 11:39:52 +0000
Message-Id: <20250415113952.1847695-1-hgohil@mvista.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu Chen <chenyu56@huawei.com>

commit f88359e1588b85cf0e8209ab7d6620085f3441d9 upstream.

From: John Stultz <john.stultz@linaro.org>

According to the programming guide, to switch mode for DRD controller,
the driver needs to do the following.

To switch from device to host:
1. Reset controller with GCTL.CoreSoftReset
2. Set GCTL.PrtCapDir(host mode)
3. Reset the host with USBCMD.HCRESET
4. Then follow up with the initializing host registers sequence

To switch from host to device:
1. Reset controller with GCTL.CoreSoftReset
2. Set GCTL.PrtCapDir(device mode)
3. Reset the device with DCTL.CSftRst
4. Then follow up with the initializing registers sequence

Currently we're missing step 1) to do GCTL.CoreSoftReset and step 3) of
switching from host to device. John Stult reported a lockup issue seen
with HiKey960 platform without these steps[1]. Similar issue is observed
with Ferry's testing platform[2].

So, apply the required steps along with some fixes to Yu Chen's and John
Stultz's version. The main fixes to their versions are the missing wait
for clocks synchronization before clearing GCTL.CoreSoftReset and only
apply DCTL.CSftRst when switching from host to device.

[1] https://lore.kernel.org/linux-usb/20210108015115.27920-1-john.stultz@linaro.org/
[2] https://lore.kernel.org/linux-usb/0ba7a6ba-e6a7-9cd4-0695-64fc927e01f1@gmail.com/

Fixes: 41ce1456e1db ("usb: dwc3: core: make dwc3_set_mode() work properly")
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ferry Toth <fntoth@gmail.com>
Cc: Wesley Cheng <wcheng@codeaurora.org>
Cc: <stable@vger.kernel.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Tested-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Link: https://lore.kernel.org/r/374440f8dcd4f06c02c2caf4b1efde86774e02d9.1618521663.git.Thinh.Nguyen@synopsys.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Hardik Gohil <hgohil@mvista.com>
---
this fix is missing in v5.4.y stable version

apply the following dependend patch before applying this patch
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.10.236&id=c2cd3452d5f8b66d49a73138fba5baadd5b489bd

 drivers/usb/dwc3/core.c | 25 +++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 1a420c00d6ca..650eb4f735f9 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -122,6 +122,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (dwc->dr_mode != USB_DR_MODE_OTG)
 		return;
 
+	mutex_lock(&dwc->mutex);
+
 	pm_runtime_get_sync(dwc->dev);
 
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_OTG)
@@ -155,6 +157,25 @@ static void __dwc3_set_mode(struct work_struct *work)
 		break;
 	}
 
+	/* For DRD host or device mode only */
+	if (dwc->desired_dr_role != DWC3_GCTL_PRTCAP_OTG) {
+		reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+		reg |= DWC3_GCTL_CORESOFTRESET;
+		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+
+		/*
+		 * Wait for internal clocks to synchronized. DWC_usb31 and
+		 * DWC_usb32 may need at least 50ms (less for DWC_usb3). To
+		 * keep it consistent across different IPs, let's wait up to
+		 * 100ms before clearing GCTL.CORESOFTRESET.
+		 */
+		msleep(100);
+
+		reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+		reg &= ~DWC3_GCTL_CORESOFTRESET;
+		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+	}
+
 	spin_lock_irqsave(&dwc->lock, flags);
 
 	dwc3_set_prtcap(dwc, dwc->desired_dr_role);
@@ -179,6 +200,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 		}
 		break;
 	case DWC3_GCTL_PRTCAP_DEVICE:
+		dwc3_core_soft_reset(dwc);
+
 		dwc3_event_buffers_setup(dwc);
 
 		if (dwc->usb2_phy)
@@ -201,6 +224,7 @@ static void __dwc3_set_mode(struct work_struct *work)
 out:
 	pm_runtime_mark_last_busy(dwc->dev);
 	pm_runtime_put_autosuspend(dwc->dev);
+	mutex_unlock(&dwc->mutex);
 }
 
 void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
@@ -1511,6 +1535,7 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc3_cache_hwparams(dwc);
 
 	spin_lock_init(&dwc->lock);
+	mutex_init(&dwc->mutex);
 
 	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 34f3fbba391b..44b0239676a1 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -13,6 +13,7 @@
 
 #include <linux/device.h>
 #include <linux/spinlock.h>
+#include <linux/mutex.h>
 #include <linux/ioport.h>
 #include <linux/list.h>
 #include <linux/bitops.h>
@@ -929,6 +930,7 @@ struct dwc3_scratchpad_array {
  * @scratch_addr: dma address of scratchbuf
  * @ep0_in_setup: one control transfer is completed and enter setup phase
  * @lock: for synchronizing
+ * @mutex: for mode switching
  * @dev: pointer to our struct device
  * @sysdev: pointer to the DMA-capable device
  * @xhci: pointer to our xHCI child
@@ -1061,6 +1063,9 @@ struct dwc3 {
 	/* device lock */
 	spinlock_t		lock;
 
+	/* mode switching lock */
+	struct mutex		mutex;
+
 	struct device		*dev;
 	struct device		*sysdev;
 
-- 
2.25.1


