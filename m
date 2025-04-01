Return-Path: <linux-usb+bounces-22404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C169A7747D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 08:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB10216AD14
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 06:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B991E2606;
	Tue,  1 Apr 2025 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vrfZ83L+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11CA1078F
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 06:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489009; cv=none; b=gbEKwiRhyd8DZbZB14ycr1WDBJm21tRsdmkNjVp/Z0QG8/LM8L79AHfDTZBw/g9MKXnv2CMg34OD16lzdTOq2HOD4xsdl25YW3KCQKk1CpLugc/9zP2uhKX1SCZUxTG+B+SmOofqDqD0m1Ow1ULeFoQvCteow3PONFiWr/3BWCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489009; c=relaxed/simple;
	bh=USbG23zlSAIqxxboVL2BnKC5smfMZAVgXPKkRSRld0I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qKr/DGMk9WiwyqY8BdS17ICm9sfH//uilPmveZBrnClkIqGOt7pObV3/YT0gdIGl3yNwdKNnWFZ/g8JEiAAZXLDMszLFtJVp1vGPVearaeWTSJa3he6Qr2bQxaUG0AC8HGKTG0OvKnykHohLQes4kZhxOJpdDsTcgc2GuJHLGBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vrfZ83L+; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2240c997059so121868645ad.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 23:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743489007; x=1744093807; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OqYe84wc1n9dIq60dY5m/RZydOIHZgtl3uuNumZs698=;
        b=vrfZ83L+bowA2yITVR5dVK4I6h82FHlsI+bXSMt8kD4daHd75PRxzM2lIS1swuVn6S
         4vSlkm9PZC6HcGqdQKnfnpsB2eRCSZvkld2BKs4DzdKXjjWMlrkIpNnUuSkNOHH3TmX3
         2Q9kjdvBguEr+c/pwt1wnkZVpKA2RW5kX2IB4gS2CLQpzlHJ9MliaUZ+59ruf/1v8nw+
         Ie+Ny8io77YK/0S65ebp/TfBzYEa9TcCI5uBxZcBCymXMSrggCKMkkbGVw6mG3sGyQSX
         5OJ86LBJAlgZYwtYjpbLHUQsHpStQuPhX9fPsqaXsfSNVpAagLGkhxGLk2MSTtc5esI/
         7bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489007; x=1744093807;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqYe84wc1n9dIq60dY5m/RZydOIHZgtl3uuNumZs698=;
        b=JHvldSaJk4O/0+gBJjgbYTcyUruD0kuRZ/3fBsDkFxv0r5tvHaT8MndQxz3uReeBi1
         cumHmFnW532P56sxHlIH7iT3Kxw2tlhC3MRJ7leCnjj1U3hAk0aKAIOGAp1m2g6Ncz2l
         +7QDvBUH8GMUx17nfL8H4ly4Axfuhx8Pn2Gjbyur2jfl87Bgy2eUBDgoGJiW1mCrvC7o
         5WMMJaHhAjqCL/U05hfm/j97QD9D9tVG2UbWYvZVNQVlA5DtwQ/qAIyYKXxhiBME7PAk
         vMSYi1TOrW57+gVuTEjGlm1Gw3ElpKDdzFv2QVqNNBS4eGwy8dfe/9K3iRtZgFnVYQCA
         2Vwg==
X-Gm-Message-State: AOJu0Yz7Ei98tNZAnoFBHzhzig8M+gLDGZ3DqDjwJbgBOgW0t4ixH1gu
	4Ye53rxVTr8uSWtJI/7bvOkX4ZcM9H3P9DGr3Pe0GKPXWtlk4kw2MBMaUP1IV1Z/Q1gge7Q2C/t
	xw+694moM9j0wDA==
X-Google-Smtp-Source: AGHT+IG/Msl15+/4rANvxgod1MVl7FV/C1o7eT1eyIP5SvPXayKelEHw73RaXYFBCSQvGe7nthOYn87oNf6fxWM=
X-Received: from pjl14.prod.google.com ([2002:a17:90b:2f8e:b0:2fa:26f0:c221])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f709:b0:224:7a4:b2a with SMTP id d9443c01a7336-2292f942aa8mr216978175ad.11.1743489007210;
 Mon, 31 Mar 2025 23:30:07 -0700 (PDT)
Date: Tue,  1 Apr 2025 06:22:38 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401062951.3180871-1-guanyulin@google.com>
Subject: [PATCH v10 0/4] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
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

patches depends on series "Introduce QC USB SND audio offloading support" 
https://lore.kernel.org/lkml/20250319005141.312805-1-quic_wcheng@quicinc.com/

changelog
----------
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

 drivers/usb/core/driver.c         | 141 ++++++++++++++++++++++++++++--
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/Kconfig          |  11 +++
 drivers/usb/host/xhci-plat.c      |  42 ++++++++-
 drivers/usb/host/xhci-plat.h      |   1 +
 drivers/usb/host/xhci-sideband.c  |  43 +++++++++
 include/linux/usb.h               |  19 ++++
 include/linux/usb/xhci-sideband.h |   9 ++
 8 files changed, 257 insertions(+), 10 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog


