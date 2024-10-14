Return-Path: <linux-usb+bounces-16175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997299C475
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 10:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6153F1C225A3
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 08:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F6F156F3B;
	Mon, 14 Oct 2024 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vyR7KvOW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EDE156F27
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896315; cv=none; b=lyIy+UnaVSpjGRy/Kn45Eiv48X3Xv49Pr5F23tz6b73LyMKittHyVFfsiF110v6yRh8PIV+oDk8ipdzzB63zCSWAvY2ECzttV9N3mb4O4tqQFgMVYNOKZ1vb4mqV+tejTKjS2JR1J6ex2O8yxMbz+JAWxza8l3UHmjw8DE/+hJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896315; c=relaxed/simple;
	bh=MMmxOqDhjHtTHjEFNTHIGe5QUnWTlaXxSiuoBkNwdls=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Yo/fmGiJiXQmqRdxmCCEZIbd02mAET1uCaoQi3nZ1OcGdDaDkfLWZ8e6GqqCVFFMP4z31SVxSAQotlCLNU5jyrEe3GW8DTTSYE4/npybEyWMFlrT9z8aeOMaZUffngETRQY+Vw+FrbgiX0hFalLUIqWlFcEi/uR3VVsuGSEq5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vyR7KvOW; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2939e25402so2162251276.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728896312; x=1729501112; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tJDj6k1vZWgUdDR2yBxvdFEmNrvt6dXxlhPApMDJeNQ=;
        b=vyR7KvOWOewMpOqi2HAHxDueYFNKU4yoHUQGRPbGBtVK1kBAcCMQcHDKUOWgnzmOKQ
         SoopcLPBdcuzugGZ/zMF7GFDFBm2/RKHHDBb8hDW1BpesiyBLFLqVbr/RiL2KifNaXIr
         ut/w9zaWRcV8xkfQ3tKxz93pFdTU2yN4YKcJWqSO+ek8oqJm4C5RFw67Yxo5NtKn2u2/
         1Ydh1jUYzGPL4TZQKx4P6uGCKAnJR81gfkiaMygcqdvxg7oe4CZZszKW9xrFz4M5wtlV
         8w2K6KmzMDf7SMXdH0QvMl0RUzy/AABdcrXEfg9ozEZI7pfrwibWo4bwJzvhtj02EXt3
         /tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896312; x=1729501112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJDj6k1vZWgUdDR2yBxvdFEmNrvt6dXxlhPApMDJeNQ=;
        b=B9tDoh+O0D0mtl5I6vsbo+zmwcQSKvp4oiZxb3XpaNPvBbCJL/5VWmzc16Tqo2D41H
         GFZIvN3OT2Y/QzV0I5DRuT408u0SZHZnzdHlXQggnXRjsUBvsP9wYq5CsHlrdl+LBUw0
         oadKv26Xd45IMj7CnpRcNKuRXGthzNjJNgR5JSYl0bHHG5gwj5Mstc2ezrD39bbKFkox
         oOnoIRQFllcVwwOKVxM/wkUiP77K89/TJNBjDLh6HsiC48dwGQrFP+PfaiDtSlNRHy2Q
         hbHoGv1Dk9V9fqA5aMk+bMeuaSVceix95KW4UzjI/qi1bJAuyLEaeCAvfeECTGwIDusX
         UTMw==
X-Gm-Message-State: AOJu0YwtQXqGp4v1ieh98fwb+poKLsahg9CJ3lpE0GU1qQUrpwr3BWi/
	R0OAYvXvK0v/FhjyAboXCCoOJFyKMdB+3oaCVomqLcHIC7d0ID3624/Ayqijwo1JUhSIrCXwzxC
	fW1rv3kM5bP4MGg==
X-Google-Smtp-Source: AGHT+IF5SavWo6HiF0EKk/WneTyIT4aMwJqzb9YpJJYmmLH93XV8Gx3OlSgXCUZByk5zE4gjAPphiwPmqmu7LFo=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a25:3607:0:b0:e1d:2043:da46 with SMTP id
 3f1490d57ef6-e2919dd4d81mr44625276.3.1728896312291; Mon, 14 Oct 2024 01:58:32
 -0700 (PDT)
Date: Mon, 14 Oct 2024 08:50:24 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014085816.1401364-1-guanyulin@google.com>
Subject: [PATCH v5 0/5] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, yajun.deng@linux.dev, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com, niko.mauno@vaisala.com, 
	andreyknvl@gmail.com, christophe.jaillet@wanadoo.fr, tj@kernel.org, 
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com, ricardo@marliere.net
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
  usb: add apis for sideband usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable sideband transfer during system sleep

 drivers/usb/core/driver.c         | 63 ++++++++++++++++++++++
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
 12 files changed, 302 insertions(+), 5 deletions(-)

-- 
2.47.0.rc1.288.g06298d1525-goog


