Return-Path: <linux-usb+bounces-19151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015DA06C88
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 04:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12713A59D8
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 03:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0980C154C05;
	Thu,  9 Jan 2025 03:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zjMCLNvV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30B487BF
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 03:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736394992; cv=none; b=I5RZ9cRGkIVlOi2CwgHFAFD97JudGcJGInMGsfzRovjyDE1WEqzyyD8172To+iemKmRRDvqfdIIhrtfxOUIvgQltxQ3TQSBnYhlHmDUjwe8098uWyaSzWhlzvvLKrE825snnl3PaCwe67yHXIdhsOHxZs3bB+eIt43xCHRqhBFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736394992; c=relaxed/simple;
	bh=nnYbxItNV3grYE1ZD7AAO6D4lFOTFugIRpVse3vCnhk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Mmn5EK6g8rCMNr69flfrOPFQJPEVcz+N+bQsW5xBEEyTYHI53ztF4caAt3zaa9aZZHZFMyd+Hup/MHbVrBkLMxt8VC4T1XFVtkY2CS8D0z8FAZue5K9s5xXrXqBgRITVvmo40w1zOsqO3Bdz4g70yePzIkBNuczQa4wXl9H5Tfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zjMCLNvV; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21632eacb31so5969925ad.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 19:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736394990; x=1736999790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EQevtosOZdLWnoQGZ8KDWWGERMcs6wRsxcX07h50iCs=;
        b=zjMCLNvVdVTJw5Hu+wKIAzLUB7Xbu2T+NQ3HaG4y+I6eVMsQnUqV6BWj/uNND8JDmZ
         tgoS/J/iAm6cBGh6SeNxNtQsuJkxYTVsuusCWa0UfQB6C/r/Wrb+T6qdzp9/CZj9HxT9
         cYmnqdSN3iCZrsrifPC4q9DEcCOBTltGoEvEeU6SxniMtF46ZfX9mZ2sc5G5aU/StvJs
         Ydu4hPpNdEQAGSOyMapiblkJ1kFDGa/sZ6jM5DfkxO3ny/H20D7hC45+5689sYe7Ie7N
         SsszDSjRH3bHBzqaSdJexxtCdlzdZ6rerqqn2FTzkCdlSo8VZa32rrCyLxwDVmlS5Wtz
         SsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736394990; x=1736999790;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQevtosOZdLWnoQGZ8KDWWGERMcs6wRsxcX07h50iCs=;
        b=MC/XeS48L8PNsi3THT1JniLBdavydEgpiLj0XOplJhNCF+yz50awb4Nhfhuh68Dxg6
         UvI1aX/ltvg9P7VJkOAoAKHFJyAThJeU+1UvwXVKjblFt23hsWFafV1mONzFcKAmWavi
         A3h7Qq63Di56hyHWHAx+mJMWMcngLcbHb/XGlDjvXnkkn32qRSgW0UqkGjwQchq2tD/R
         ijoXZa1oxFiIZzU/sz/eQim5QYtGVvQXL5Msw0nWDdn/vXh3jMCQHpS7h8AkJbxt7XqB
         YQYlYNhyA2QFRQnXaSIf6NPMDcL1rG4LhiFaYcYoD4NaXuHSZ5/4JREgspea1KaRSuSs
         /HXA==
X-Gm-Message-State: AOJu0YxKmiXuw5ictq7HhDa+uAKdiEupPOSciVIn/q93cd+0PZX8vwyD
	qF4FCuL+q+qq4yl44RSwnydlhHn3vzeqvRNyJ7U5A/y2wOa4vUduzDVLC72R4tPQI+z0UK2wUff
	sGrJk6xmsnZSZUQ==
X-Google-Smtp-Source: AGHT+IEU1x7PpwbS47PBemW1WDcvS8xcqLpfy6S+7l6RoeL5PwIgcDc/SqYTo1ldAAnjY4llyKX3t79pKjkbrEQ=
X-Received: from pfbbd43.prod.google.com ([2002:a05:6a00:27ab:b0:728:aad0:33a4])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a83:b0:1e1:afd3:bbfc with SMTP id adf61e73a8af0-1e88cf7846fmr9180792637.3.1736394990134;
 Wed, 08 Jan 2025 19:56:30 -0800 (PST)
Date: Thu,  9 Jan 2025 03:55:04 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109035605.1486717-1-guanyulin@google.com>
Subject: [PATCH v7 0/5] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Wesley Cheng and Mathias Nyman's USB offload design enables a co-processor
to handle some USB transfers, potentially allowing the main system to
sleep and save power. However, Linux's power management system halts the
USB host controller when the main system isn't managing any USB transfers.
To address this, the proposal modifies the system to recognize offloaded
USB transfers and manage power accordingly.

This involves two key steps:
1. Transfer Status Tracking: Propose xhci_sideband_get and
xhci_sideband_put to track USB transfers on the co-processor, ensuring the
system is aware of any ongoing activity.
2. Power Management Adjustment:  Modifications to the USB driver stack
(dwc3 controller driver, xhci host controller driver, and USB device
drivers) allow the system to sleep without disrupting co-processor managed
USB transfers. This involves adding conditional checks to bypass some
power management operations.

patches depends on series "Introduce QC USB SND audio offloading support" 
https://lore.kernel.org/lkml/20241213235403.4109199-1-quic_wcheng@quicinc.com/T/

changelog
----------
Changes in v7:
- Remove counting mechanism in struct usb_hcd. The USB device's offload
  status will be solely recorded in each related struct usb_device.
- Utilizes `needs_remote_wakeup` attribute in struct usb_interface to
  control the suspend flow of USB interfaces and associated USB endpoints.
  This addresses the need to support interrupt transfers generated by
  offloaded USB devices while the system is suspended.
- Block any offload_usage change during USB device suspend period.

Changes in v6:
- Fix build errors when CONFIG_USB_XHCI_SIDEBAND is disabled.
- Explicitly specify the data structure of the drvdata refereced in
  dwc3_suspend(), dwc3_resume().
- Move the initialization of counters to the patches introducing them.

Changes in v5:
- Walk through the USB children in usb_sideband_check() to determine the
  sideband activity under the specific USB device. 
- Replace atomic_t by refcount_t.
- Reduce logs by using dev_dbg & remove __func__.

Changes in v4:
- Isolate the feature into USB driver stack.
- Integrate with series "Introduce QC USB SND audio offloading support"

Changes in v3:
- Integrate the feature with the pm core framework.

Changes in v2:
- Cosmetics changes on coding style.

[v3] PM / core: conditionally skip system pm in device/driver model
[v2] usb: host: enable suspend-to-RAM control in userspace
[v1] [RFC] usb: host: Allow userspace to control usb suspend flows
---

Guan-Yu Lin (5):
  usb: dwc3: separate dev_pm_ops for each pm_event
  usb: xhci-plat: separate dev_pm_ops for each pm_event
  usb: add apis for offload usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable USB offload during system sleep

 drivers/usb/core/driver.c         | 145 ++++++++++++++++++++++++++++--
 drivers/usb/core/endpoint.c       |   8 --
 drivers/usb/core/usb.c            |   4 +
 drivers/usb/dwc3/core.c           | 105 +++++++++++++++++++++-
 drivers/usb/dwc3/core.h           |   1 +
 drivers/usb/host/xhci-plat.c      |  42 ++++++++-
 drivers/usb/host/xhci-sideband.c  |  82 +++++++++++++++++
 include/linux/usb.h               |  27 +++++-
 include/linux/usb/hcd.h           |   7 ++
 include/linux/usb/xhci-sideband.h |   6 ++
 sound/usb/qcom/qc_audio_offload.c |   3 +
 11 files changed, 410 insertions(+), 20 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


