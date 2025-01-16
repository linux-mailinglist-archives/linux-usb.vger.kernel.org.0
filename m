Return-Path: <linux-usb+bounces-19407-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE919A13B58
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 14:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54843188B0FE
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 13:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0494A22ACC5;
	Thu, 16 Jan 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QeH0MJs3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1F1F37B0
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035664; cv=none; b=NRGgQqlstyTl1GZ6Td3eYqo+SGjRKkjkHH8dKs9nvxus/0OwJxIZCLG9wQ5u/6O7yZdzWDbsgWFE6e3uMwuXqkWQIlRHwgoNb7Xfwn8rwM0aR6Rcq+Ij3buyhxiTL5GkJQTNaREtx3Aejl8S3KDoZPS7sTAOwVIxqc7qCnP5j2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035664; c=relaxed/simple;
	bh=M3AT9cLBZONSc3dpbsdOqFATjCQrC00qffz5X3yALpU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ikevj1Xs0VbqdlDe7qiIdS7akLz/zj+7CzaFFrtPuysbSYqAYJE3K9PWm6SA5kKc5UUcKpIao6sDJplZNVL1qn02VShtrgaoQe9Cf4X9rEQHMlmtiRdhWYhfisitblNjA2cEnLylVejvLl8KvXMdK6O5TixbSPQLg+uXL0UKLZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QeH0MJs3; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so3236334a91.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 05:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737035662; x=1737640462; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5u9oazVtWSw8LeGn6+Nav58IPdJMEw9u+uloVuqr5M4=;
        b=QeH0MJs3XEQOOrtTNehvjKBIls3y/PdBAAy/kg2UcaphnXEvf588HvTttLhBTd9C9T
         PlVgjLFwBD4snZfivxK7xi1pVrVG/dF1TntpIk1Uq8LlRR/f5R+m7eUhwRNljWlnazH6
         U9D6SgPXMZ99+d13Yccmay7DRJBg7ziK3wE+ZaHN7wAFbB0iAPWA2YJQyC3Sspg9g8zX
         /ZeEzmB0LgB5DYRFx7kk3J/lwC595vZUaASqBlC/19q/9aR2Ja+pgYY/mJqT+t+lfPi/
         mcVZXaAxEDf8tNPevWviHDzP/mNcfxZPYonIMxZ/x85Q0DEEMSpnCB3cvocJ1ZlhUhsi
         GNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035662; x=1737640462;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5u9oazVtWSw8LeGn6+Nav58IPdJMEw9u+uloVuqr5M4=;
        b=Dt21dbC+kRF4/2l2JaAGO9BH8kb2zE7UlDwplH8z+LqQW9kd3ocZB1+X0bUbRka/Gd
         QWePMWiH7rpn0xw9ozH2PiDO+dkLeGowzqq0acjoN+wUaSEkHpuR4kgEEPzVcugkfH1h
         tKrMtcSE6593kfuH9m+PFXnlM2GDeGjnsrOmhp+u64mx6w5JqWnf/DWVEpbVvMQ1o48I
         OSEKfFrN74ibQuKkj8NGJ3A8p6hfp1E/4qO69pLlERrKe5aCBysqHDNCWcFVcKMg8Tvt
         97R8cNghWVqgoxUFYzlJSa1xZ2GHWfHAMKodzoncsxDHBa+ptWEyvPZZT0KfedTXny29
         XpAw==
X-Gm-Message-State: AOJu0YyDT71ci2aVdDS9JcuZyQu+VQGIVoJWZZi1sen92h5ihdaP+woT
	2wdxSnRYLBqpG7XhPkpDgfnfB+Ncl+0MG1T1pHkeKX9nadykK+GYygimDlRtTG6F4pds3d1eMTD
	Xl9NAhTmGStx3Wg==
X-Google-Smtp-Source: AGHT+IEHGWCVN3xDUGJtJQCA97PjM6pZ9KBV2dZbj+AkLwDpCQJd6J66oYEe9DEHG+RvsSIf/3WZOrgj7o63O5E=
X-Received: from pjbpx11.prod.google.com ([2002:a17:90b:270b:b0:2ef:79ee:65c0])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:274b:b0:2ee:8427:4b02 with SMTP id 98e67ed59e1d1-2f548f5f941mr46246113a91.28.1737035662366;
 Thu, 16 Jan 2025 05:54:22 -0800 (PST)
Date: Thu, 16 Jan 2025 13:50:12 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116135358.2335615-1-guanyulin@google.com>
Subject: [PATCH v8 0/5] Support system sleep with offloaded usb transfers
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

 drivers/usb/core/driver.c         | 137 ++++++++++++++++++++++++++++--
 drivers/usb/core/endpoint.c       |   8 --
 drivers/usb/core/usb.c            |   4 +
 drivers/usb/dwc3/core.c           | 105 ++++++++++++++++++++++-
 drivers/usb/dwc3/core.h           |   1 +
 drivers/usb/host/xhci-plat.c      |  42 ++++++++-
 drivers/usb/host/xhci-sideband.c  |  82 ++++++++++++++++++
 include/linux/usb.h               |  27 +++++-
 include/linux/usb/hcd.h           |   7 ++
 include/linux/usb/xhci-sideband.h |   6 ++
 sound/usb/qcom/qc_audio_offload.c |   3 +
 11 files changed, 401 insertions(+), 21 deletions(-)

-- 
2.48.0.rc2.279.g1de40edade-goog


