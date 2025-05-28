Return-Path: <linux-usb+bounces-24351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE3AC6537
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 11:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57703188D932
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6D22749F3;
	Wed, 28 May 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xk2cagd3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671026A096
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423343; cv=none; b=bxpHfcW4ZbRsC0oapB33iTHXYmwtNrJ2zMi5t9hyZU2qLUevg4YumWHxgn+a0HPX0N8oQ2OJMXprmQ2VZR3lPiV0qm4NUX2fFcdl4wMjz/e+pV1OkckzGTaqrD7992bVXDMKu9bb2XPmyP7L0yPWB7/+ZpqojlfRPSND0mrfFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423343; c=relaxed/simple;
	bh=eiX09S5BKqy9xMij/1u12OxiEIwlPw+RMfyIwBOrzf0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RCWP/Cjl6hA6cH30Y0NbUMBYlFRpEsUk3UomINcKV4fFHtBzdMKzTUrTXugPZIKLJmG7pvkz7iYORrwlr7PvI2ilWbUJhkvVvt4ovYJ7eax1UHJ3lAoDhINDdFj9/tO5s0nA5eKvbSJErhFJ3vAy77MatUFg5o2XNmRh6fBMCFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xk2cagd3; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74089884644so3834998b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748423340; x=1749028140; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T99kYukxUty4zOqJeP0a/rQaEU86hy4Z0zxbBcK8xas=;
        b=xk2cagd3kgip7RKTlJdSNc07Vz4V8Sn0L+zpNt+vHkZ2MTb24dh4xK2vqjEefG/M9B
         hapt3k8nBpW0IgFEP2RPcUM+GbOUHhP+3y1vD5nsytzMIpLB4AEZ3d/bl4n9TPc9jQjF
         Ia4y/6J8zj+vStQP+DHQwa73P3iV1uxp7erhHNWAk6Sm48SOTUGUTsYmoKaEtXX2ow17
         3GTAOTyjFECpFiLeFPEFELy39mB0O3baTk0laYUx0AkQBpdZLfQl8xoY6Ks/lVID1y5M
         zlW9yMNGMThTpfOv/uvx9swGXJcOeajbETQRBy8AfrzABOM3XdTJYbqOrQpYZ/+PkRfi
         7Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423340; x=1749028140;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T99kYukxUty4zOqJeP0a/rQaEU86hy4Z0zxbBcK8xas=;
        b=VYKcGpmKtYA0Xq+TJ0y8pouyrtFXZd+TKc8ZmdgdMI8PAus0fnBRDG5HZVbFdc0egT
         RkNH4SzD6DwuWL47VA2fRdafdazdeRGeVy2tWF/LVjdxJvxO66ct3rcpE0Qkn+bGVmPw
         0pewSH0KsN2XoRWcacnE18+Ib9JtvRTFoTFcl0wMU0LCpI/rZ+k4COeljtU8Vys9nmCB
         l94+/xTEF0sZ3awssaaNVpIEgQa5uAiO6A+PvbVZPgy0i/MqYz4rvukidgBRA3w7WX10
         qte2kVqrfppe6C9Oln3fvUQSJ7kBm2jMpOkGBBQIO6HmXz6h5ndp+YRl38B2Z6EZ4/uI
         +EVQ==
X-Gm-Message-State: AOJu0Yzt8YFRKucerzRbTrLv6xeVRRr+gAUfq4mqfPLaVqLz9ewm4OOS
	R7ZR5x5lmfBf+29ClSqEtavtiiHKyQ1NnwTuYcmJZdaVTNtut2Q4GWHVl+K87+5CalQqp2eqiR3
	Im4jV+ZCwJ8UJV446PA==
X-Google-Smtp-Source: AGHT+IHwyH5Xt+WEHDetf0XcaouNA/NQCgRzuM+vQdQMig7ruB/anK0URE/icgj28urxMR2Np2YKJTxTWOxr6oo=
X-Received: from pgbdl10.prod.google.com ([2002:a05:6a02:d0a:b0:b0c:3032:f595])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:328d:b0:215:eafc:abd8 with SMTP id adf61e73a8af0-2188c24716cmr25545788637.15.1748423340399;
 Wed, 28 May 2025 02:09:00 -0700 (PDT)
Date: Wed, 28 May 2025 09:04:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250528090849.2095085-1-guanyulin@google.com>
Subject: [PATCH v13 0/4] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org
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
  usb: add apis for offload usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable USB offload during system sleep

 drivers/usb/core/driver.c         | 175 +++++++++++++++++++++++++++++-
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/Kconfig          |  11 ++
 drivers/usb/host/xhci-plat.c      |  42 ++++++-
 drivers/usb/host/xhci-plat.h      |   1 +
 drivers/usb/host/xhci-sideband.c  |  38 +++++++
 include/linux/usb.h               |  18 +++
 include/linux/usb/xhci-sideband.h |   9 ++
 8 files changed, 285 insertions(+), 10 deletions(-)

-- 
2.49.0.1164.gab81da1b16-goog


