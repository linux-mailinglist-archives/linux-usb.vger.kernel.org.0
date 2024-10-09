Return-Path: <linux-usb+bounces-15894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7889995F28
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 07:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 206F728348C
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 05:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3B7166F25;
	Wed,  9 Oct 2024 05:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nPeRRPYS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993C3136327
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452714; cv=none; b=BEqN1NriKhObEiib/T95D95nUg4qac0sTcdZQN65aWH1jHOaZ4s3+UiukGUWPYx217Q5M/Gy65MSCR/U0gTwB3Wo1mB/xrICMoJ0ISAxNVZuEcVl+gTypXFB9pzaS/Rx7PAZt5Vg7756KC2YdhgbCpvykFPH3d4GVsvykUOL0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452714; c=relaxed/simple;
	bh=+BTCQ0PUkDQsZaHM85ifIgxYY/Dc9P+yTGat716rR8E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=o2CwNNIFi085hG9HnoWZZg/gD2HRMyveaXxlkGZG0yQAOC0CpW9Hfz6J65CbpHGhzuSHfACp5fXJFAWM6JqfWcM+B0rWHu2MPl+1Relb8RM9XQ+itG5t7X3NvJW0qC4H+0k5f4FhsfkS4oONUZHbvBRUS8w/bvc7hVTthNbEj+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nPeRRPYS; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e26ba37314so48407047b3.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2024 22:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728452711; x=1729057511; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PiDuNikJa50xX1llUd7AeY3ATX9u0RAJOKDPy46wYBY=;
        b=nPeRRPYS+F72m1z8+Q+7qy6Yrbn3a6E6t4+xT19NuzRYQLqL/FL473zRIWmMes7tYo
         p1QZeWLPdZvpVtJYgABOB5VYu5k6rUpnbYNeAf/2TcZxE+/XcwMhhkkLNW7E+9dzwrUa
         /eEXlQKFmRBQN2FzdLH8ReIt3qe/H/3aUH7vYKgZiTES7HfnIoveGOLMhvEOc5tC/S5H
         Qm49xOLmFLKsDr//uDcjvO1EJTExJsnBHRFbqWVMf2c9J3Oi+3FG3wcOSf4RwJbk27kv
         Ql0B0RAdxpmaoo3jc5mx6GkQB0EhXr7eiPSAMDVk4cLFO4/IY8291Duz+xg1SBQOIURG
         Rhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728452711; x=1729057511;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PiDuNikJa50xX1llUd7AeY3ATX9u0RAJOKDPy46wYBY=;
        b=C+mF6rj/kLfEoli58ESmwSsq3x9iiOf22qls/Vr+zHsnVQPSPCwt4cxayEJupF+TLJ
         f2sjtSs3sMjLd9PmlpsqBlVSnZQKz0MR6CZ1fKVZjqrieeidiCOfOo/ADQ9U05t0Zyd8
         h6yHF5mW1xNdMCarietITQbSx5reNKLilSMTeXV7ySuqF9idkf4KYDfqjikv29wlai+W
         y7L2bb2+i1+tYYTQHR05EfDyUendD/19YerwblxLdrwBtlFhPY9CsPiM8uJ40F3mzsAV
         XvuAXnKHR/VHAy4kig8l2j6Gj2vOsf1ncQuC9/AQUofb6MpMtbbaKHwow6sq7rz310Vb
         w29g==
X-Gm-Message-State: AOJu0Yxpqb/5wHPrt/VxIfgazotacTxhxum4hH/WbSNv+IrWEMiIGukY
	FSEpPwV/cgRuh093EKlVuuxdYgGmxV3l56oIXcYi1VsYtpCZBHIm7tN4wex2q+12sBtbzr5TyzQ
	gBXzhf28psRFkVg==
X-Google-Smtp-Source: AGHT+IFAdtbaCD2+euCYcocpkcRI7vVB9WTSltof4jpixDozK9ZQRUBAoBW7ahCtF6q1tP5317kIACf9RUK8soQ=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a05:690c:4a91:b0:6dd:bcce:7cbe with SMTP
 id 00721157ae682-6e3220de42bmr24407b3.2.1728452711549; Tue, 08 Oct 2024
 22:45:11 -0700 (PDT)
Date: Wed,  9 Oct 2024 05:42:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241009054429.3970438-1-guanyulin@google.com>
Subject: [PATCH v4 0/5] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, elder@kernel.org, 
	oneukum@suse.com, yajun.deng@linux.dev, dianders@chromium.org, 
	kekrby@gmail.com, perex@perex.cz, tiwai@suse.com, tj@kernel.org, 
	stanley_chang@realtek.com, andreyknvl@gmail.com, 
	christophe.jaillet@wanadoo.fr, quic_jjohnson@quicinc.com, 
	ricardo@marliere.net, grundler@chromium.org, niko.mauno@vaisala.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	quic_wcheng@quicinc.com, pumahsu@google.com, 
	Guan-Yu Lin <guanyulin@google.com>
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
https://lore.kernel.org/lkml/20240925010000.2231406-11-quic_wcheng@quicinc.com/T/

changelog
----------
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
  usb: add apis for sideband uasge tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable sideband transfer during system sleep

 drivers/usb/core/driver.c         | 64 ++++++++++++++++++++++
 drivers/usb/core/hcd.c            |  1 +
 drivers/usb/core/usb.c            |  1 +
 drivers/usb/dwc3/core.c           | 90 ++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/core.h           |  8 +++
 drivers/usb/host/xhci-plat.c      | 38 +++++++++++--
 drivers/usb/host/xhci-plat.h      |  7 +++
 drivers/usb/host/xhci-sideband.c  | 74 +++++++++++++++++++++++++
 include/linux/usb.h               | 13 +++++
 include/linux/usb/hcd.h           |  4 ++
 include/linux/usb/xhci-sideband.h |  5 ++
 sound/usb/qcom/qc_audio_offload.c |  3 ++
 12 files changed, 303 insertions(+), 5 deletions(-)

-- 
2.47.0.rc0.187.ge670bccf7e-goog


