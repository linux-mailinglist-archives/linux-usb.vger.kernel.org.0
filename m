Return-Path: <linux-usb+bounces-24483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52DACD9A7
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 10:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17EDD3A4049
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 08:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DBE2874EA;
	Wed,  4 Jun 2025 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lh1XKtDx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179CD24677D
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025505; cv=none; b=WFmwnv1yJUDroPof8aaTU1tXWWaBFoq7b/2ApjU7LtUI78hzREptvg+F/ybdottDLa7BLWsSeIyMLuu9El/3yzYvBxeioJUuMe9PkMDmY2jXfAQiAV7+LvPR23xk5m/oxIT9d0b5/U3VB1lSrA7yUxO1j8I7Clt+r+KjFQElvZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025505; c=relaxed/simple;
	bh=E+ctp5Kf/i4Vkucx3SYkHv1ekiPgitLob8eYzy5uk/A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uNs2A7cMYrQJDZOIltqthKLkf3e5iWjlBgUsqOYuxeJxVOJevf7bHjGnoWVp4Svu2R6y6Jtt7S4FHT+mU7Hu+WNzbWSM3PT/TqA6F16Y5wdbAkUyPmiCcfAkowc++++IfytsuavTUxFGayRP/m743f0fBz6R3z44p4P49ov6wcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lh1XKtDx; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-234906c5e29so66641385ad.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749025503; x=1749630303; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BR/cqEY4np4yUPPU0CUL00J0wezf5HZmGTl9XyHaXUk=;
        b=Lh1XKtDx/fkQLu3uh+h+kdmG3+lSIX8EEp2p7+1cVcb3moW5oMsWNjr99poImHrHu5
         5kkaVub5pFF/H1y+nfG6kDVvlifq+9gvQSjXPg2hznBNjhEY3cTx3d/HKv4FOxeqY0hl
         nUg0UtrVp5tNgY94hBgrnbtq+ttDPdWP+iaU+yp67KnSBdpUP8Aqt8SYk2yoUlDiXVUd
         QuDjpuwnw5fz/AOsX1YNuDWuw2NiSIfqb1FAK2CRdTKLznznC44Qj7hKeKXQAGijC8cQ
         JBkYyuWe56YtUeKLAdbIpHT1Mo2IA3b9pzXHr2s3LpRtblRUfUnMlR8svejNWzYxAhZb
         A9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025503; x=1749630303;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BR/cqEY4np4yUPPU0CUL00J0wezf5HZmGTl9XyHaXUk=;
        b=pcVP08BHdRObCbNB+LMhOCkuCBqwsKYa49sjVApTn6RldPdRqvE9D/DzeApx8OmoWz
         5WG5qEgbnD3JCC895i7XEkTcvq7hcFCQ70ob8VweE9k6hi4AdYv3AGGT2mP9JuUBvxIM
         CU3mN3+ZeG4lrtEfwO1TgO/HDSRUCgm4oBawvwIV3DMMzaSIVWYzFGjvr0To99J9K4+Z
         t+MpSFzZl1OQCrywcEaW9WwuvNRt83vfVnwPnJxFY0/ieyyyI+nRYQlbObzF0LBL0EzW
         GbcWT+pep2BsB4d+2FSf31Bm/6FOMfGmjTMPHDDuoDl5IRJsLxoVrjcjLs7F5ST2QFBi
         slug==
X-Gm-Message-State: AOJu0YxZ3ejDj1JMIfVdqxPmjNvBlpwuAThBv8RP0QVEkTT2AQv2jwn0
	4E4K6kPU9Mn6x/kM4oRTPvFz+06NcyjSVf/OwFhdBgg7zffnerD049wKHUnqzPCi4jCpaqq9HxA
	gcIgU5qDgROtDbEKBdg==
X-Google-Smtp-Source: AGHT+IGJiuIlt5+Y4kHcki1caySgyQkGIABrznkydsidONCfyonDF8tyBnPrVY+m2CsPNRKAhiwmnN0YzQM616k=
X-Received: from pgh11.prod.google.com ([2002:a05:6a02:4e0b:b0:b2c:df7b:f167])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:6bc7:b0:235:ca87:37ae with SMTP id d9443c01a7336-235e1201315mr22269695ad.41.1749025503391;
 Wed, 04 Jun 2025 01:25:03 -0700 (PDT)
Date: Wed,  4 Jun 2025 08:23:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250604082449.2029156-1-guanyulin@google.com>
Subject: [PATCH v14 0/4] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	sumit.garg@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Wesley Cheng and Mathias Nyman's USB offload design enables a co-processor
to handle some USB transfers, potentially allowing the system to sleep
(suspend-to-RAM) and save power. However, Linux's System Sleep model halts
the USB host controller when the main system isn't managing any USB
transfers. To address this, the proposal modifies the system to recognize
offloaded USB transfers and manage power accordingly. This way, offloaded
USB transfers could still happen during system sleep (Suspend-to-RAM).

This involves two key steps:
1. Transfer Status Tracking: Propose offload_usage and corresponding apis
drivers could track USB transfers on the co-processor, ensuring the
system is aware of any ongoing activity.
2. Power Management Adjustment:  Modifications to the USB driver stack
(xhci host controller driver, and USB device drivers) allow the system to
sleep (Suspend-to-RAM) without disrupting co-processor managed USB
transfers. This involves adding conditional checks to bypass some power
management operations in the System Sleep model.

changelog
----------
Changes in v14:
- Introduce CONFIG_USB_OFFLOAD for control usb offload related features.
- Specify __must_hold marco on usb_offload_check().
- Cosmetics changes on coding style.


Changes in v13:
- Ensure offload_usage is modified only when the device is neither
  suspended nor marked as "offload_at_suspend".
- Move lock manipulations into usb_offload_get()/usb_offload_put().
- Cosmetics changes on coding style.

Changes in v12:
- Rebase on TOT.
- Cosmetics changes on coding style.

Changes in v11:
- Use USB subsystem wrappers in usb_offload_get()/usb_offload_put().
- Refine logics and add comment in usb_suspend_both()/usb_resume_both().

Changes in v10:
- Remove unnecessary operations in dwc3 driver.
- Introduce CONFIG_USB_XHCI_SIDEBAND_SUSPEND to enable/disable offloaded
  usb transfers during system Suspend-to-RAM.
- Modify the approach to detect offloaded USB transfers when the system
  resumes from Suspend-to-RAM.
- Mark sideband activity when sideband interrupters are created/removed.
- Cosmetics changes on coding style.

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

Guan-Yu Lin (4):
  usb: xhci-plat: separate dev_pm_ops for each pm_event
  usb: offload: add apis for offload usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable USB offload during system sleep

 drivers/usb/core/Kconfig          |  10 +++
 drivers/usb/core/Makefile         |   1 +
 drivers/usb/core/driver.c         |  50 +++++++++--
 drivers/usb/core/offload.c        | 136 ++++++++++++++++++++++++++++++
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/Kconfig          |  11 +++
 drivers/usb/host/xhci-plat.c      |  42 ++++++++-
 drivers/usb/host/xhci-plat.h      |   1 +
 drivers/usb/host/xhci-sideband.c  |  38 +++++++++
 include/linux/usb.h               |  18 ++++
 include/linux/usb/xhci-sideband.h |   9 ++
 11 files changed, 307 insertions(+), 10 deletions(-)
 create mode 100644 drivers/usb/core/offload.c

-- 
2.49.0.1204.g71687c7c1d-goog


