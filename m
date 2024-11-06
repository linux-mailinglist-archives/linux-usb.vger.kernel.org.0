Return-Path: <linux-usb+bounces-17164-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F89BE10E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 09:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E97151C23298
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 08:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6701D5CF4;
	Wed,  6 Nov 2024 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QgnsZzxj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593ED199243
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882116; cv=none; b=UyGwv839TTG3MGrycyFRPSh3oBNOJb8mSlJROXohxWvRqLXHHLvh1xziovHq38szUaWJlCx+YFuKLiWBJx0q7a/UtDwY2Hffgfp7tEhoalZ2eJF2ffWHcb1NW4EAAfGziGMFEZqoWhj2YFpM9y/dzk+9w1pMJekF9w9acnYBLik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882116; c=relaxed/simple;
	bh=1gKbUy0hvqMiIFVOqU0r6R+JX/FdNFtqzepVp9aPdHY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uWnPfy6EDgXoBs/nsoGLSsi1l1Ks5WFJW9mGXmWpSNa6UbdU+aUvD4A+yknr/nHUdbb6xoSzrKwNFzhnvGbQxdXETR4haVlwKFvXAlE6SXMK+8IUoYbfiK7cgn3n/OkXpUEi5QoCAlg4gUwlFuOJ9/7lu1s6Umg2KJI+HDX04AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QgnsZzxj; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e355f1ff4bso119170367b3.2
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 00:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730882112; x=1731486912; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+sZnhN4f59w8eaVlm9uPspF2D1aSNtZ8q/ULxpzacKg=;
        b=QgnsZzxjl1pfLAa98P51T2P1UJ609DOAFGsjhH8zBUeSJJFSYqp39lRNq+6Ch65CbF
         9XJzSsq5XeJvAgWzY3uyLbYk/mooezWc/E3FIZpAElvD4DoqiWgdSFx1d9ZlVHC8boCr
         T8EGYb0cpzBBatw4nIKx0bT9Q8fCBExLT+wth687I4OeNR/F4r30lRvqP+au2+Bed7AO
         13pPFAbCImTHLTxwZDXTkghwRuUWkxgAvAOHxMzLrVmDXjmFPfqUebWhnGz/xWxFJ9Cs
         wpqOMXxT5NPeGgbZj+1HkLLMSVZBLgw/EfvPDmgFBZCaWlxZgvFgUr67HWNX708HcOwq
         Xbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730882112; x=1731486912;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sZnhN4f59w8eaVlm9uPspF2D1aSNtZ8q/ULxpzacKg=;
        b=OedwVDI2okyKSrzNGyeaenJ9XUC4WwvBTayh4zIhpERVpNMfp/lar0hjpSOqZ2p7dB
         zbPm4wx6m9vAUu0y+J7uA8lqpse4D00CKAqbqAgpZY+TQzcP6bZLKR1173nxvrgEhozp
         wg6ltGTqg6PTlkyjghG96GYPTN9Cfrcrmepl7gjkSH4xnTUTp1quDoGrw1VPYk6G1kxK
         NtGK5VkYeEWYSnSEkx6AjuV4VH9B4vaJwXoTgrJLXzobJDhuXCENUwn1g8vitxLLqXbk
         cedPG+J0tVwHrMOd5GCxUV6ecXggEhHz2A5hTfdKZhTlFD9ga9rfKgG5pehHqsF354o4
         PnQA==
X-Gm-Message-State: AOJu0YwZgdF22RWh2abOk8zYWXwKR1K3T01fearsUbUw/wKWjkisU2yz
	vb744+tsSqAUSJBveknyRTWZWNRkKJAJcl8bJxF3vuxGFSVpcYuK6ZVT8sCGLrJ9dB3/u1dPuH/
	KqCFn8WAbrDQZ8g==
X-Google-Smtp-Source: AGHT+IHOksJL+AHrN3er9na69HscWBTL2INnAN32T9B6olbGvvN+npsilT1SmjoIKHmUPaN1Z/4NdH5ApfdcALQ=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a25:a407:0:b0:e33:4850:b1bd with SMTP id
 3f1490d57ef6-e334b7cf78fmr10125276.1.1730882112322; Wed, 06 Nov 2024 00:35:12
 -0800 (PST)
Date: Wed,  6 Nov 2024 08:32:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241106083501.408074-1-guanyulin@google.com>
Subject: [PATCH v6 0/5] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@linaro.org, 
	dianders@chromium.org, kekrby@gmail.com, oneukum@suse.com, 
	yajun.deng@linux.dev, niko.mauno@vaisala.com, christophe.jaillet@wanadoo.fr, 
	tj@kernel.org, stanley_chang@realtek.com, andreyknvl@gmail.com, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
  usb: add apis for sideband usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable sideband transfer during system sleep

 drivers/usb/core/driver.c         | 87 +++++++++++++++++++++++++++
 drivers/usb/core/hcd.c            |  4 ++
 drivers/usb/core/usb.c            |  4 ++
 drivers/usb/dwc3/core.c           | 97 ++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/core.h           |  1 +
 drivers/usb/host/xhci-plat.c      | 38 ++++++++++--
 drivers/usb/host/xhci-sideband.c  | 92 +++++++++++++++++++++++++++++
 include/linux/usb.h               | 20 +++++++
 include/linux/usb/hcd.h           | 13 +++++
 include/linux/usb/xhci-sideband.h |  5 ++
 10 files changed, 356 insertions(+), 5 deletions(-)

-- 
2.47.0.199.ga7371fff76-goog


