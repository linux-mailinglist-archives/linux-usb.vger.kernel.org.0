Return-Path: <linux-usb+bounces-15897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F76995F30
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 07:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D796B24AAB
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 05:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D04C17ADE8;
	Wed,  9 Oct 2024 05:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kfPX3Y+k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171A17A583
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452741; cv=none; b=Sbz44G037NEOjvuivA91zxxc862hIQSDAXXpu/XKcp7yxfGpu1OEGFJNmwVLR6PCWFN8qEekNKgkDuKTdjU63vkaNz0MwdsqlQa6yC24WVOB+INI3lzJFGyVFdG+4L6+xCLRR76bhv276RTR9fRnb4Rz+6lRxfoXkOyQqoC0SZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452741; c=relaxed/simple;
	bh=OEnEasctneyXPSWDbjrh/TEJGBN8UZEjmWt+j/RDpaY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TDSSuT6SqbhmB8azr/3cN8mrS2cjGaH5Jdogw975bAh0oASho1v0Op6j/g5wyS3lPXGgDCmRklJNHxh5IOlvWOsEdrx20DpEhb5wqM2e/6Ij2DF8QwsNCgynkSnEArnJWC941K15QU+poA82yMgVeZTukRzFVViIiw7h0vms7kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kfPX3Y+k; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e02b5792baaso9382366276.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2024 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728452739; x=1729057539; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mFDVI6R/1CwWgc1JLsOCgD08cArkJWhUepOJ8DVmKVE=;
        b=kfPX3Y+k051ThbiNPK44Pkf+A9Ma8OCusGdbGPBATp8xOQw1WDrkZZcJgEJ+tW93bh
         nq/0itufOejvvyDOdarodm1ve9+tZxJdNw2NEjFNSX8lQ97JpDdtvJ0/JesIucwqN65m
         hCIFfpf5JYx5ZmRB/5Vn41YlXZheoybY505kXDUIIFE1E7py9rYWLvZjqkY8Ao/CQp07
         DhSfiLBfzmnXwJrZGS+fOy3H/KfFSsRjD7miK7p4AWhxvKBuU03xWUuzfWWj771qV3Ay
         z0JACP36CYWz0xf3hDhBxG91lJKX8ZPFpmbuArDwEYy9D5LVo4LmM45bQ4hl6FH/DtYj
         FSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728452739; x=1729057539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFDVI6R/1CwWgc1JLsOCgD08cArkJWhUepOJ8DVmKVE=;
        b=S01KNhoi6DG6tXoo7muU8E66DwrHmh5VmBIljq9PyFhXxK3ioRugIkL+z/upGR/VQO
         ZsIZUE829QZpgg51C58kpkXIiWa9SVxClc+F/T19mOzCQNf+PrXBfulaXECyJ1fdXXae
         bttj/URxatIubRGnv9XCL+vcUC17oDHJHFKgW4DWNFE28tV6DP8vF1orBD9g1B3TeDOF
         3ZrrbIuEzdegrlfUIs4x7ch/EAwPioAlWjkKTOqixCSWchiuRwY53DHnxQwFop/QtoJA
         lr5Yh1uo2xJ6ajhkYCWZOaigcYUAD8ubzloWaDVrvraN3IIVtfdO7pZ+TqH1e1Nu7kx/
         kKsg==
X-Gm-Message-State: AOJu0Yxj9NO3mHIu765QFvscnOnHLTvZ5tPkB04t9lMfslPh505rfHeA
	A0dcx8fnYb5aUcLkeGMY8YzbDOhldKR2KQrhRPaZZrRRqnFoDwjunGJ4wsK4VS+lFj5LtVX9SF1
	JYebKikdOc7nhKg==
X-Google-Smtp-Source: AGHT+IHTioHUqiDQFl5fHP3gNPgxe0xyIQ/BIR271liuspanypSr44hcwdxzy7cpXnxEhqq2oe/tf2xxRvaVpOk=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a25:6804:0:b0:e25:d596:4847 with SMTP id
 3f1490d57ef6-e28fe3e62a8mr23070276.6.1728452738821; Tue, 08 Oct 2024 22:45:38
 -0700 (PDT)
Date: Wed,  9 Oct 2024 05:42:57 +0000
In-Reply-To: <20241009054429.3970438-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241009054429.3970438-4-guanyulin@google.com>
Subject: [PATCH v4 3/5] usb: add apis for sideband uasge tracking
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

Introduce sb_usage_count and corresponding apis to track sideband usage
on each usb_device. A sideband refers to the co-processor that accesses
the usb_device via shared control on the same USB host controller. To
optimize power usage, it's essential to monitor whether ther sideband is
actively using the usb_device. This information is vital when
determining if a usb_device can be safely suspended during system power
state transitions.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c | 54 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h       | 13 ++++++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 0c3f12daac79..c1ba5ed15214 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1673,6 +1673,60 @@ void usb_disable_autosuspend(struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(usb_disable_autosuspend);
 
+/**
+ * usb_sideband_get - notify usb driver there's a new active sideband
+ * @udev: the usb_device which has an active sideband
+ *
+ * An active sideband indicates that another entity is currently using the usb
+ * device. Notify the usb device by increasing the sb_usage_count. This allows
+ * usb driver to adjust power management policy based on sideband activities.
+ */
+void usb_sideband_get(struct usb_device *udev)
+{
+	struct usb_device *parent = udev;
+
+	do {
+		atomic_inc(&parent->sb_usage_count);
+		parent = parent->parent;
+	} while (parent);
+}
+EXPORT_SYMBOL_GPL(usb_sideband_get);
+
+/**
+ * usb_sideband_put - notify usb driver there's a sideband deactivated
+ * @udev: the usb_device which has a sideband deactivated
+ *
+ * The inverse operation of usb_sideband_get, which notifies the usb device by
+ * decreasing the sb_usage_count. This allows usb driver to adjust power
+ * management policy based on sideband activities.
+ */
+void usb_sideband_put(struct usb_device *udev)
+{
+	struct usb_device *parent = udev;
+
+	do {
+		atomic_dec(&parent->sb_usage_count);
+		parent = parent->parent;
+	} while (parent);
+}
+EXPORT_SYMBOL_GPL(usb_sideband_put);
+
+/**
+ * usb_sideband_check - check sideband activities on the host controller
+ * @udev: the usb_device which has a sideband deactivated
+ *
+ * Check if there are any sideband activity on the USB device right now. This
+ * information could be used for power management or other forms or resource
+ * management.
+ *
+ * Returns true on any active sideband existence, false otherwise
+ */
+bool usb_sideband_check(struct usb_device *udev)
+{
+	return !!atomic_read(&udev->sb_usage_count);
+}
+EXPORT_SYMBOL_GPL(usb_sideband_check);
+
 /**
  * usb_autosuspend_device - delayed autosuspend of a USB device and its interfaces
  * @udev: the usb_device to autosuspend
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 672d8fc2abdb..5b9fea378960 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -645,6 +645,7 @@ struct usb3_lpm_parameters {
  *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
  *	Will be used as wValue for SetIsochDelay requests.
  * @use_generic_driver: ask driver core to reprobe using the generic driver.
+ * @sb_usage_count: number of active sideband accessing this usb device.
  *
  * Notes:
  * Usbcore drivers should not set usbdev->state directly.  Instead use
@@ -731,6 +732,8 @@ struct usb_device {
 
 	u16 hub_delay;
 	unsigned use_generic_driver:1;
+
+	atomic_t sb_usage_count;
 };
 
 #define to_usb_device(__dev)	container_of_const(__dev, struct usb_device, dev)
@@ -798,6 +801,9 @@ static inline int usb_acpi_port_lpm_incapable(struct usb_device *hdev, int index
 #ifdef CONFIG_PM
 extern void usb_enable_autosuspend(struct usb_device *udev);
 extern void usb_disable_autosuspend(struct usb_device *udev);
+extern void usb_sideband_get(struct usb_device *udev);
+extern void usb_sideband_put(struct usb_device *udev);
+extern bool usb_sideband_check(struct usb_device *udev);
 
 extern int usb_autopm_get_interface(struct usb_interface *intf);
 extern void usb_autopm_put_interface(struct usb_interface *intf);
@@ -818,6 +824,13 @@ static inline int usb_enable_autosuspend(struct usb_device *udev)
 static inline int usb_disable_autosuspend(struct usb_device *udev)
 { return 0; }
 
+static inline int usb_sideband_get(struct usb_device *udev)
+{ return 0; }
+static inline int usb_sideband_put(struct usb_device *udev)
+{ return 0; }
+static inline bool usb_sideband_check(struct usb_device *udev)
+{ return false; }
+
 static inline int usb_autopm_get_interface(struct usb_interface *intf)
 { return 0; }
 static inline int usb_autopm_get_interface_async(struct usb_interface *intf)
-- 
2.47.0.rc0.187.ge670bccf7e-goog


