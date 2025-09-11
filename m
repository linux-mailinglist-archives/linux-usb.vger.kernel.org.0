Return-Path: <linux-usb+bounces-27950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00337B53519
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 16:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CEAD5A3D8B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 14:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65EF314A65;
	Thu, 11 Sep 2025 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3fRxzJNH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A721019E
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600469; cv=none; b=snEy2mccMydOMvF6woix/CkxWe4du2bzeQ9xdq9kjqGoCHJzV5isP0sruwaY0AixgtpaJ4I0SDanfdv8zFqUiauy+ugMSOUS4Et3u3ZYCRfZmOcQNgHwNq1+XpoZOLGq+LSLCnX16S5jovccPGh4ShYk18UuMkDG/PUu9bBWIoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600469; c=relaxed/simple;
	bh=+iYwU3lAJZN4irjGgO7FnAikEFpf8kacEm1KMOnoLBg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cpYjB+nipjVQS4vwqBHlNSRmhCStY1iCazkXMLeOHittp/QWd8HlQvCCTY/Pb+nNHsc+kdE9+dc//hyffXF9jSIV4mPshrnGZOBZEvbnJudIyD4NjpAAAgUzRx4uow2kKp/Fd7RUUsSAOYHcojI12VnNR+yz3U1DL7C+YWrw6v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3fRxzJNH; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so925471b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 07:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757600467; x=1758205267; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BXpKyC+FtSuNs0YLqsRlk5q4vvwtie8skRJ55fTgeiY=;
        b=3fRxzJNHgCMbaPx6pKhdQkp0+jihAeT3dp61558GeulI03lflmoJmFaMh6UUARDVff
         PASyDbCvocIam9I/pqITXuXj6jl1jqfmUFpgY7FKw8/lZhW41aZL9IsoE5aCAHn+mX7X
         Qs50sWhgc/K0y0kwXShHMyTfP8MXWrlAFTnX5+JVVz+7AKAg6RyQvO5Fd/72WHUw45sb
         JTDHpxi7/LT9og9yoAxtlm3ps4YkEdppSuDc3hDihfhYUS68P2xoryiAU7RdHSTEkZ+Y
         0tmoNwJLHdA5U/l4g3hX71BG3Qe76g6ZRiivMJymbq116uMxegHCGbuf3wSJGsbgVJiG
         qt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757600467; x=1758205267;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXpKyC+FtSuNs0YLqsRlk5q4vvwtie8skRJ55fTgeiY=;
        b=uanBlBCOpI1m7V7yuuMnYDgs+unQaawmpoIEFbGKxmtRFsW/APrBLfMceBUOvUU5Dc
         w+xVOmuBNYaZhxAPxgidEiUNHl4SRtrbqO7qAqYbgNyxUupiz/bzRSlhYvRzWQxbOaS9
         4PwOmhpO09tMkWiwyJGncvi3qBCBOGgTJdx7te/nrIM4oful1yZeRkmHEF2+EtdGwTKy
         kLx8h+PkPCbng9Nv2vxnsN4GtdhLrxJaMP95F5vNKjwcZE+YF9vJN0KoMClSMHByZc+p
         1t6Co0xMLXclxFgtS8c32l0gm/2PNbNO2l5phdgVwIuzlNHf2KjgE5md+ycUfkge2SlD
         v1jw==
X-Gm-Message-State: AOJu0Yxe9jLgcs0DQej/YXEkLE/kwgeF5spVc/WM+TYxKot0UT5EwWBz
	ZZuw5Zqwyx/mXXikKpj1hJbJ6SUOY1hYITLD80FM0tYGuHAFEPCNjzgxCrlN1QXDpUUP5IokxgK
	gvGLxrH1ppUiefELyPw==
X-Google-Smtp-Source: AGHT+IGxazJ6wSRTWeq83hZ8mq5zVKYCYBbAtGgqkOmgLsu8aqytxOCePqUp/OIJ0Q3QGgdvYcabZuO39IHBHJs=
X-Received: from pgam28.prod.google.com ([2002:a05:6a02:2b5c:b0:b47:1324:ea0a])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:939e:b0:251:5160:f6c4 with SMTP id adf61e73a8af0-25345e324ebmr25326771637.50.1757600467216;
 Thu, 11 Sep 2025 07:21:07 -0700 (PDT)
Date: Thu, 11 Sep 2025 14:20:12 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250911142051.90822-1-guanyulin@google.com>
Subject: [PATCH v16 0/4] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, hannelotta@gmail.com, 
	zijun.hu@oss.qualcomm.com, xu.yang_2@nxp.com, stern@rowland.harvard.edu, 
	andriy.shevchenko@linux.intel.com, amardeep.rai@intel.com, 
	dominique.martinet@atmark-techno.com, quic_wcheng@quicinc.com, 
	sakari.ailus@linux.intel.com, dh10.jung@samsung.com
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
Changes in v16:
- Consolidate configs into only CONFIG_USB_XHCI_SIDEBAND.

Changes in v15:
- Rebase on TOT.

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

 drivers/usb/core/Makefile         |   1 +
 drivers/usb/core/driver.c         |  50 +++++++++--
 drivers/usb/core/offload.c        | 136 ++++++++++++++++++++++++++++++
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/xhci-plat.c      |  42 ++++++++-
 drivers/usb/host/xhci-plat.h      |   1 +
 drivers/usb/host/xhci-sideband.c  |  36 ++++++++
 include/linux/usb.h               |  18 ++++
 include/linux/usb/xhci-sideband.h |   9 ++
 9 files changed, 284 insertions(+), 10 deletions(-)
 create mode 100644 drivers/usb/core/offload.c

-- 
2.51.0.384.g4c02a37b29-goog


