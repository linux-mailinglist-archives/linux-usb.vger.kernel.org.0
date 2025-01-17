Return-Path: <linux-usb+bounces-19497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56CA15227
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 15:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA6B3167BD1
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788D278F37;
	Fri, 17 Jan 2025 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0AhajcRx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74474146013
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125554; cv=none; b=V0IiBp6BEQ5h1qRbhd16etOD/DqffnXvip9zA2TasxPolvXDDZtkQz22DS/huJZL8tEluiasguquNMIPrsi7CZJYLkaPR47rVPm6PMyH5wKga9ukohEI8wvbHVaxlb0RvNkRMxINNn+YaHlMLRBunTK37HzwiC9I7yiMN7hZZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125554; c=relaxed/simple;
	bh=cxvVbfr0SP93ptb1opNO2nPWWzwByLjlQBu4F7PTAXc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=H+FjBpqyGZ45iQIQKn4iGxITIqS9j/p39+binA0HDJ5jbr1YYlaioNdSPVWe3pjPqFjYKHGy8F26k87zY7iwYzX8UXkCRSi+4P1nWYjn45n1WakiUW6JT79hq2qJAktQ6eu5KVA43qtSqhOzkQYjd3ZvtO3HIy4u0sfyGeDlXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0AhajcRx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so6463813a91.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737125552; x=1737730352; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kFgsBLap9k3z5DIxtR/rpT9p15veoHYOv3U93sP0pEs=;
        b=0AhajcRx1mi7d9HZElAYF2eEFCpAU0s89qjbvVHBsEhREPqQhx6YPC35pxRWJBwqhP
         0q4naISYFqQDHDBOdU+3/zY8uMk5hxuo2WXDQaC24i0IiFiq5/zj6szUPqL357y+a3O9
         yXUco82UXw6hVo0s+WpxIwrBuE0bzYLx7mLuYF9dmgkCis5FmJxW/MBWp2VeSDRpO/Rf
         tZCWKDHK4EQ+zwbjDx+uZqG2k6gA3FgYm+j7nyugDLi9zeCBDJ38+ha3ROy8d1AEe7Tg
         qnW6qt1Nmdbm3vbf19oy4TU204JfS2VDx7tpE9IRUsMYE9HqP257oVIhTMVWC/g5v+Cf
         /9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125552; x=1737730352;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFgsBLap9k3z5DIxtR/rpT9p15veoHYOv3U93sP0pEs=;
        b=aLHLFxEZBB78WMKEwtyRf86cUtV8AFgiyZUyb5UK6ah7g7vhPrWc+wO4z1mpon0F2B
         3hoL/TJtqfhmMU1urfYpdrrhKqf5HzQ9Q9GPsQaMEOZpSXCLIoI61vYhcNSCJL4T4LAe
         tKRETsfi/5A7tqoDiDgT58gGv6tb8Pdyj+qTp7+rtTGfWVkJ/7NIkVwUZqTLy0WoP1gn
         Jgcj86fS3a+dgGO0kXya6wAN6vJJjkusgR06hNnNRK1byphAC9JG/8i9lmkpQ8J1TCwI
         xVcTTtRG130LuJKHIExzG/Skcj5jz/4d08TJ2XYNbG4XF4tAD15qyp0Nz5mQG3jJFVRE
         iL3g==
X-Gm-Message-State: AOJu0YzCrEKc/DxMvEhQ5uA90J3u6Hzv0/Lds09MvLPca+06Nzu7pJGR
	48yAf8sk5XB4sF3HI1NgtOc4v0k8/qEcr7LHlljQOy75DzFZzAFQO/rgzRik9H+m0xa5A8gVBm9
	np0FeXIYkjGbxbg==
X-Google-Smtp-Source: AGHT+IF3Pef8mgClpUhcMTMhDFwTp0b8/63Zl8z51qucj/YTH81WxVWJsN9fk8LECHPIDTl0njlnm/tSWvL8DRo=
X-Received: from pjbsm17.prod.google.com ([2002:a17:90b:2e51:b0:2f4:3ea1:9033])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:54ce:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-2f782d972c5mr4187489a91.30.1737125551853;
 Fri, 17 Jan 2025 06:52:31 -0800 (PST)
Date: Fri, 17 Jan 2025 14:48:00 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117145145.3093352-1-guanyulin@google.com>
Subject: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
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
Changes in v9:
- Remove unnecessary white space change.

Changes in v8:
- Change the runtime pm api to correct the error handling flow.
- Not flushing endpoints of actively offloaded USB devices to avoid
  possible USB transfer conflicts.

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

 drivers/usb/core/driver.c         | 131 +++++++++++++++++++++++++++++-
 drivers/usb/core/endpoint.c       |   8 --
 drivers/usb/core/usb.c            |   4 +
 drivers/usb/dwc3/core.c           | 105 +++++++++++++++++++++++-
 drivers/usb/dwc3/core.h           |   1 +
 drivers/usb/host/xhci-plat.c      |  42 +++++++++-
 drivers/usb/host/xhci-sideband.c  |  82 +++++++++++++++++++
 include/linux/usb.h               |  27 +++++-
 include/linux/usb/hcd.h           |   7 ++
 include/linux/usb/xhci-sideband.h |   6 ++
 sound/usb/qcom/qc_audio_offload.c |   3 +
 11 files changed, 398 insertions(+), 18 deletions(-)

-- 
2.48.0.rc2.279.g1de40edade-goog


