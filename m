Return-Path: <linux-usb+bounces-16178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ED699C488
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 11:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C082B2AA96
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 09:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE1F15B971;
	Mon, 14 Oct 2024 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eOZqAOxj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEF315B104
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896331; cv=none; b=A3Wm3xUFqt3pBWEuD9/MdcG+BTQeaTuUhTl+PQtuVUvK7O4pD+KTWXK2VWlCaHzwlEJ49N9+IV5gYyenfvJSyK/ngRibhtQ9Pr8Xk/5wDOm5V5FDFToYaU58v+7Stq1mdZNtAGxcp7Engda4qN0Zq6o/VF/pkAXuC+q34x886o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896331; c=relaxed/simple;
	bh=EU15+Ru20MN5GJaR2Iq5WSX2NUmdvQcj26opweRi4qQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r9D37D//jLCUJL8+XBGkpi0b5ZW4lKIxYQpfCiYxWh+uMNigV/XGefz4Z2phg0/5IZfY9SfxxmK3uht9vDFFOk/0iMxjsOYQDGrp/FgrFw9unH7Qy2CMaPtOQmZI6W5nmF+njXjIO0MyuQk6jDf5epSbn2NoNqBe1W44liPNvJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eOZqAOxj; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e290222fde4so4399485276.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728896327; x=1729501127; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3Gr3/dhYM6/ZLOl5nRxFncYa9Ac7JDDqUDonxbjd0Y=;
        b=eOZqAOxjrXBRkb8eFCumCLM6inem4JclBbZWOb8chzNH95m+YKVHDl9VAfMF0IXB5F
         m3QbvVJzRcTsDpE6EXT8FKCJwZ0WMPwAylm7mCwo71KgnamRVMVLYajCemzBhtItckaF
         vip+snoHffNIftqf38UeTsrV40Z+yjnELa3YT0xZQaT2vQVsD//e/Hc17UwOY6xS/rHM
         c8B5yr56jkI0ZJ89o9a8Wa8mgi2B6nSAzB2SdB0mmGvNkQHdLcKEWLkeGgfjjU5RlYYl
         gZPyAJaQ//SaHiQlN/ZDtCEvvaEE6bHXQ8mhqAZmG4qZh3sc9jRdHYGMjPoABlchXFLB
         IUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896327; x=1729501127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3Gr3/dhYM6/ZLOl5nRxFncYa9Ac7JDDqUDonxbjd0Y=;
        b=rAl4lheZTvpQgPUHGAXdwXcR3+zU3WtlaK9QeWml/nzJs6HIzA5RazOnnuBi27SEH6
         G2TkIRG3gL3FXGKN0Zfje53zeH52h78Ol8+Bf0VKHfpCJyHPfr5XTP1pEldkn8LNJczU
         rx0hzJeiw2hBRmRC4E+9jJ4+iIlVYCG4gN0+eTQvBCaNaoDOXHFlAYZ8pgI8IIe52VTf
         yHUVzqJqdkwpnwHu4eGAqIWCPr+8B+M+HjiO3cGF8ODtVVa8m5eryifCwwfuQfZwagEu
         FPXXDgVUGSrEzReUMSVJO9M9wfdQ8rqzX3Jg4uMaULudEAJsmtOgiG1DsV+/xiemT2Zn
         dYuQ==
X-Gm-Message-State: AOJu0YzgOVKAxKrpLdhWBR3W7wl9V5WUXvWlxww406v0dsSLDbev5rZ0
	dGjviwMWwc2LfbRIFpfDDfK3KSmCFHfdS1hIuDWuXv4C/B4/TqP7JiaMn1AWCYqc4ytsfVwc5BG
	Qqf1WJe/jTMDqQQ==
X-Google-Smtp-Source: AGHT+IFkp0At4RJQAY5NZEsgtLShOUCl9IUeoX1HIsgFMsKuDYqKxKF1EtyJ1HJX86U8UKYYju/aeUg4Qv4RJO0=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a25:d3d2:0:b0:e28:e9ea:8cca with SMTP id
 3f1490d57ef6-e2919fe7b3cmr43777276.8.1728896327307; Mon, 14 Oct 2024 01:58:47
 -0700 (PDT)
Date: Mon, 14 Oct 2024 08:50:27 +0000
In-Reply-To: <20241014085816.1401364-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014085816.1401364-4-guanyulin@google.com>
Subject: [PATCH v5 3/5] usb: add apis for sideband usage tracking
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

Introduce sb_usage_count and corresponding apis to track sideband usage
on each USB device. A sideband refers to the co-processor that accesses
the usb_device via shared control on the same USB host controller. To
optimize power usage, it's essential to monitor whether ther sideband is
actively using the USB device. This information is vital when
determining if a USB device can be safely suspended during system power
state transitions.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h       | 13 ++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 0c3f12daac79..e713cf9b3dd2 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1673,6 +1673,59 @@ void usb_disable_autosuspend(struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(usb_disable_autosuspend);
 
+/**
+ * usb_sideband_get - increment the sb_usage_count of a USB device
+ * @udev: the USB device to increment its sb_usage_count
+ *
+ * Incrementing the sb_usage_count of a usb_device indicates that a sideband is
+ * currently using the device; that is, another entity is actively handling USB
+ * transfers. This information allows the USB driver to adjust its power
+ * management policy based on sideband activity.
+ */
+void usb_sideband_get(struct usb_device *udev)
+{
+	refcount_inc(&udev->sb_usage_count);
+}
+EXPORT_SYMBOL_GPL(usb_sideband_get);
+
+/**
+ * usb_sideband_put - drop the sb_usage_count of a USB device
+ * @udev: the USB device to drop its sb_usage_count
+ *
+ * The inverse operation of usb_sideband_get, which drops the sb_usage_count of
+ * a USB device. This information allows the USB driver to adjust its power
+ * management policy based on sideband activity.
+ */
+void usb_sideband_put(struct usb_device *udev)
+{
+	refcount_dec(&udev->sb_usage_count);
+}
+EXPORT_SYMBOL_GPL(usb_sideband_put);
+
+/**
+ * usb_sideband_check - check sideband activities on a USB device
+ * @udev: the USB device to check its sideband activity.
+ *
+ * Check if there are any sideband activity on the USB device right now. This
+ * information could be used for power management or other forms or resource
+ * management.
+ *
+ * Returns true on any active sideband existence, false otherwise
+ */
+bool usb_sideband_check(struct usb_device *udev)
+{
+	struct usb_device *child;
+	int port1;
+
+	usb_hub_for_each_child(udev, port1, child) {
+		if (usb_sideband_check(child))
+			return true;
+	}
+
+	return !!refcount_read(&udev->sb_usage_count);
+}
+EXPORT_SYMBOL_GPL(usb_sideband_check);
+
 /**
  * usb_autosuspend_device - delayed autosuspend of a USB device and its interfaces
  * @udev: the usb_device to autosuspend
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 672d8fc2abdb..37a36750a851 100644
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
+	refcount_t sb_usage_count;
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
2.47.0.rc1.288.g06298d1525-goog


