Return-Path: <linux-usb+bounces-2389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 969077DC9C9
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 10:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE8E2812B8
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883ED15EB6;
	Tue, 31 Oct 2023 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KH2KR+sd"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9234107A7
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 09:41:19 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3076C1
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 02:41:16 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da03c5ae220so5827014276.1
        for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 02:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698745276; x=1699350076; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AAE8DZ37OcIWWcnHaRuH9NBD5aoBnldXmYIwxjbhOaA=;
        b=KH2KR+sdtQpHU8T/m8rxtdxeszlvRfGg+jb91Qu68O6LhKppAx7PNRzkEkw8cv3c/g
         yuCxfpA6s5qeX1lLHpWKuHd15lSS3LsKxjTvv8YqBpbMWnHmnY2C85S9sw9sCGS4eb0I
         Yuuk5uZYcnpD9nqgsWBfCmxl7YP1eojF790tprUlWJnsXksraEs3FNQtL7ZamSirA9vU
         V47lLjttRby5nA+UBLHXv7dQt54Gx1LgzfGCllcaZKbFYkCv4azgEf2Q+bEAmXfKIQau
         NQE47hMS2+lW9gW38E01pCfZzbEp0r8oFMp/iC3mMcJBDhl9YOtQGzjeIzmRz/bV8cr2
         WF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698745276; x=1699350076;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAE8DZ37OcIWWcnHaRuH9NBD5aoBnldXmYIwxjbhOaA=;
        b=Cq0LTEgUNriFGuSx13gKjB5wR9wwHFHdWfVwGqN7Zjdo6Xb+JRREff0bXlHM/81Nke
         lnTIChhw8F8KfpW5SbRxSnD0ZWJTg0w+naHggohoxbUZEy4/iAXUxFu9eFT/p+1FXWS2
         76x1CaK3VMe0tkUFEBSR0t6EZdduha4cBB8RbKPTBcg31KUn52ogIefUgjVJc1oK2iNI
         jkzp0k9mrTwsysJtzi+yxdCOYtpJKZQDEJTjLEUyXJBWo5N/CVVo8xMq186lzU2OZRAD
         Icj03ZCLgdYmmrvVgPq4dy9ubuNh89cFWPxaNPbBZcLQd1Jku1piq7ayPp9bxM0JHo3m
         kuRQ==
X-Gm-Message-State: AOJu0Yyzma2ES+5d2GwMNPo0a7tGNmMpQKSAS4/uVLbfheissbQlml69
	FgFLi1ipKRH8YhszcMQ4mYM+YeKEn1dniXo=
X-Google-Smtp-Source: AGHT+IGx9jY0E4VFXMuDOvKB8tsPm8Ew4oBVBmQYjB1u2E6jaMuplNkYOYJxCKtK6SX1UAEi06SAlLGGnaLQueg=
X-Received: from guanyulin-p620linsp01.ntc.corp.google.com ([2401:fa00:fc:202:a5e:4630:6c4b:b198])
 (user=guanyulin job=sendgmr) by 2002:a25:a526:0:b0:da0:c924:4fdc with SMTP id
 h35-20020a25a526000000b00da0c9244fdcmr44590ybi.6.1698745275891; Tue, 31 Oct
 2023 02:41:15 -0700 (PDT)
Date: Tue, 31 Oct 2023 17:38:55 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031093921.755204-1-guanyulin@google.com>
Subject: [PATCH] rpm: pm: enable PM_RPM_EXCEPTION config flag
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, len.brown@intel.com, 
	pavel@ucw.cz, stern@rowland.harvard.edu, heikki.krogerus@linux.intel.com, 
	mkl@pengutronix.de, hadess@hadess.net, mailhol.vincent@wanadoo.fr, 
	ivan.orlov0322@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, pumahsu@google.com, raychi@google.com, 
	albertccwang@google.com, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Introducing PM_RPM_EXCEPTION config flag, which may alter the priority
between system power management and runtime power management. In
suspend-to-idle flow, PM core will suspend all devices to avoid device
interact with the system. However, chances are devices might be used by
other systems rather than a single system. In this case, PM core shouldn't
suspend the devices. One may use PM_RPM_EXCEPTION config flag to mark
such exception, and determine the power state of a device with runtime
power management rather than system power management.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/generic.c |  6 ++++++
 drivers/usb/core/usb.h     | 16 ++++++++++++++++
 kernel/power/Kconfig       |  8 ++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 740342a2812a..bb0dfcfc9764 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -266,6 +266,9 @@ int usb_generic_driver_suspend(struct usb_device *udev, pm_message_t msg)
 {
 	int rc;
 
+	if (usb_runtime_pm_exception(udev))
+		return 0;
+
 	/* Normal USB devices suspend through their upstream port.
 	 * Root hubs don't have upstream ports to suspend,
 	 * so we have to shut down their downstream HC-to-USB
@@ -294,6 +297,9 @@ int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 {
 	int rc;
 
+	if (usb_runtime_pm_exception(udev))
+		return 0;
+
 	/* Normal USB devices resume/reset through their upstream port.
 	 * Root hubs don't have upstream ports to resume or reset,
 	 * so we have to start up their downstream HC-to-USB
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index 60363153fc3f..14a054f814a2 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -90,6 +90,22 @@ extern void usb_major_cleanup(void);
 extern int usb_device_supports_lpm(struct usb_device *udev);
 extern int usb_port_disable(struct usb_device *udev);
 
+#ifdef	CONFIG_PM_RPM_EXCEPTION
+
+static inline int usb_runtime_pm_exception(struct usb_device *udev)
+{
+	return atomic_read(&udev->dev.power.usage_count);
+}
+
+#else
+
+static inline int usb_runtime_pm_exception(struct usb_device *udev)
+{
+	return 0;
+}
+
+#endif
+
 #ifdef	CONFIG_PM
 
 extern int usb_suspend(struct device *dev, pm_message_t msg);
diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 4b31629c5be4..beba7a0f3947 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -193,6 +193,14 @@ config PM
 	  responsible for the actual handling of device suspend requests and
 	  wake-up events.
 
+config PM_RPM_EXCEPTION
+	bool "Prioritize Runtime Power Management more than Power Management"
+	default n
+	help
+	Provides a way to prioritize Runtime Power Management more than Power
+	Management. This way system can suspnd with maintaining specific
+	components in operation.
+
 config PM_DEBUG
 	bool "Power Management Debug Support"
 	depends on PM
-- 
2.42.0.820.g83a721a137-goog


