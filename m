Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50D4EB5781
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 23:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbfIQV1W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 17:27:22 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35587 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbfIQV1W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 17:27:22 -0400
Received: by mail-pf1-f196.google.com with SMTP id 205so2914804pfw.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 14:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cM7VvKY0L0frOBmxfBJAx5RW2SOLFl3AbxIMHOZKfiE=;
        b=ZW/oKFN3vfXItdTrjdILNGootkrpS4wpHoqKwmIlvMqozlxxruPnWuwdnMuF3mdBG2
         DoMqnMHmwhCQ+wZ1qlHm16SSlOVCeN+E3DqJS9doCK1XNlmTmU8hZ/TgdJacug+bs2ng
         fP6lcVLRwH8day+QLCSsI/jlN7xyKlImkidmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cM7VvKY0L0frOBmxfBJAx5RW2SOLFl3AbxIMHOZKfiE=;
        b=fhuzUmGJ1MI/N8j4pdQt/ee+/rZrZH7jT3CeZSpF5oHterCzD5g9/uZO3J9TE0kcsa
         c/grOql0ZmtvL7jbuNWchTL1f6imV2VxHEWTulS+112gKz8/9o1EMMU57vAA86w8UBZh
         cldFOstBoKkoLEHxy45c6VBTTBkB1TOdle5Z5No8gUWq0Rr3QzM9qNdEI9H+VjqewGu3
         oNh/ZAleSuwi7pq3EOuZIKUAXpBGNE34tXAXk08O8hBtacqurpr2itU0aAYx3HakO7cT
         y1lcVeMtNMnBFukijSBZ+Z5nuK9mFZw100smNW9h9FVNkBL21YPiM+ye1rD2cWsqvT5N
         Ldmg==
X-Gm-Message-State: APjAAAUiOFgQt3YBvB1HVfRhSN0xNcrKJKGCTlb8Y+IPDUo8YmLQU9NC
        si+NZFzyZdvi74q+i5nQmIp78g==
X-Google-Smtp-Source: APXvYqyYrcoe0oUhSfr2M9GbTHt5pZRV9GK02ABp9w/AvZKYR2V9CYHqaPstp8PUDmlIzukvYd9m5g==
X-Received: by 2002:a17:90a:6302:: with SMTP id e2mr181594pjj.34.1568755641694;
        Tue, 17 Sep 2019 14:27:21 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id l7sm8489803pga.92.2019.09.17.14.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 14:27:21 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     linux-bluetooth@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hui Peng <benquike@gmail.com>, linux-pm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Len Brown <len.brown@intel.com>,
        Mathias Payer <mathias.payer@nebelwelt.net>,
        Dmitry Torokhov <dtor@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mans Rullgard <mans@mansr.com>, Pavel Machek <pavel@ucw.cz>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH 1/2] usb: support suspend_noirq
Date:   Tue, 17 Sep 2019 14:27:01 -0700
Message-Id: <20190917212702.35747-2-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190917212702.35747-1-abhishekpandit@chromium.org>
References: <20190917212702.35747-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If we put a usb device into reset in the suspend callback, it will
disconnect and the resume will not be called. In order to support
turning off the device on suspend and restoring it on resume, we must do
the reset action in suspend_noirq.

e.g. Undesirable behavior: bluetooth driver asserts reset in suspend, it
disconnects, the resume is never called

e.g. Desirable new behavior: bluetooth driver asserts reset in
suspend_noirq, device doesn't disconnect, resume is called where power
is restored and usb disconnects and reconnects device

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

 drivers/usb/core/driver.c | 56 +++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.c    |  6 +++++
 include/linux/pm.h        |  8 ++++++
 include/linux/usb.h       |  3 +++
 4 files changed, 73 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index ebcadaad89d1..a7657d4e3177 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1207,6 +1207,26 @@ static int usb_suspend_interface(struct usb_device *udev,
 	return status;
 }
 
+/* Ignore errors during system sleep transitions so no return code */
+static void usb_suspend_interface_noirq(struct usb_device *udev,
+				       struct usb_interface *intf,
+				       pm_message_t msg)
+{
+	struct usb_driver	*driver;
+	int			status = 0;
+
+	if (udev->state == USB_STATE_NOTATTACHED ||
+			intf->condition == USB_INTERFACE_UNBOUND)
+		return;
+	driver = to_usb_driver(intf->dev.driver);
+
+	if (driver->suspend_noirq)
+		status = driver->suspend_noirq(intf, msg);
+
+	if (status)
+		dev_err(&intf->dev, "suspend_noirq error %d\n", status);
+}
+
 static int usb_resume_interface(struct usb_device *udev,
 		struct usb_interface *intf, pm_message_t msg, int reset_resume)
 {
@@ -1369,6 +1389,39 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 	return status;
 }
 
+/**
+ * usb_suspend_noirq - additional suspend activity without interrupt handlers
+ * @udev: the usb_device to suspend
+ * @msg: Power Management message describing this state transition
+ *
+ * As a final step in suspend, we allow interfaces to take action without the
+ * interrupt handler enabled. For example, a driver may want to power down
+ * a device during suspend (to save power) and re-enable it on resume. Doing it
+ * in the noirq callback will make sure the resume runs (device doesn't get
+ * removed on suspend path) and the device can complete a reset.
+ *
+ * This routine can run only in process context.
+ *
+ * Return: 0 once complete.
+ */
+
+static int usb_suspend_noirq(struct usb_device *udev, pm_message_t msg)
+{
+	int			i = 0, n = 0;
+	struct usb_interface	*intf;
+
+	/* Run noirq callbacks on all interfaces */
+	if (udev->state != USB_STATE_NOTATTACHED && udev->actconfig) {
+		n = udev->actconfig->desc.bNumInterfaces;
+		for (i = n - 1; i >= 0; --i) {
+			intf = udev->actconfig->interface[i];
+			usb_suspend_interface_noirq(udev, intf, msg);
+		}
+	}
+
+	return 0;
+}
+
 /**
  * usb_resume_both - resume a USB device and its interfaces
  * @udev: the usb_device to resume
@@ -1455,6 +1508,9 @@ int usb_suspend(struct device *dev, pm_message_t msg)
 	struct usb_device	*udev = to_usb_device(dev);
 	int r;
 
+	if (PMSG_IS_NOIRQ(msg))
+		return usb_suspend_noirq(udev, msg);
+
 	unbind_no_pm_drivers_interfaces(udev);
 
 	/* From now on we are sure all drivers support suspend/resume
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 0ab8738047da..a236477de50a 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -465,6 +465,11 @@ static int usb_dev_suspend(struct device *dev)
 	return usb_suspend(dev, PMSG_SUSPEND);
 }
 
+static int usb_dev_suspend_noirq(struct device *dev)
+{
+	return usb_suspend(dev, PMSG_SUSPEND_NOIRQ);
+}
+
 static int usb_dev_resume(struct device *dev)
 {
 	return usb_resume(dev, PMSG_RESUME);
@@ -494,6 +499,7 @@ static const struct dev_pm_ops usb_device_pm_ops = {
 	.prepare =	usb_dev_prepare,
 	.complete =	usb_dev_complete,
 	.suspend =	usb_dev_suspend,
+	.suspend_noirq =	usb_dev_suspend_noirq,
 	.resume =	usb_dev_resume,
 	.freeze =	usb_dev_freeze,
 	.thaw =		usb_dev_thaw,
diff --git a/include/linux/pm.h b/include/linux/pm.h
index 3619a870eaa4..9f5e7899f076 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -410,6 +410,9 @@ const struct dev_pm_ops name = { \
  *		memory contents from a hibernation image has failed, call
  *		->thaw() and ->complete() for all devices.
  *
+ * SUSPEND_NOIRQ	System is going to suspend without interrupt handlers
+ *			enabled, call ->suspend_noirq() for all devices.
+ *
  * The following PM_EVENT_ messages are defined for internal use by
  * kernel subsystems.  They are never issued by the PM core.
  *
@@ -439,6 +442,7 @@ const struct dev_pm_ops name = { \
 #define PM_EVENT_USER		0x0100
 #define PM_EVENT_REMOTE		0x0200
 #define PM_EVENT_AUTO		0x0400
+#define PM_EVENT_NOIRQ		0x0800
 
 #define PM_EVENT_SLEEP		(PM_EVENT_SUSPEND | PM_EVENT_HIBERNATE)
 #define PM_EVENT_USER_SUSPEND	(PM_EVENT_USER | PM_EVENT_SUSPEND)
@@ -446,6 +450,7 @@ const struct dev_pm_ops name = { \
 #define PM_EVENT_REMOTE_RESUME	(PM_EVENT_REMOTE | PM_EVENT_RESUME)
 #define PM_EVENT_AUTO_SUSPEND	(PM_EVENT_AUTO | PM_EVENT_SUSPEND)
 #define PM_EVENT_AUTO_RESUME	(PM_EVENT_AUTO | PM_EVENT_RESUME)
+#define PM_EVENT_SUSPEND_NOIRQ	(PM_EVENT_NOIRQ | PM_EVENT_SUSPEND)
 
 #define PMSG_INVALID	((struct pm_message){ .event = PM_EVENT_INVALID, })
 #define PMSG_ON		((struct pm_message){ .event = PM_EVENT_ON, })
@@ -457,6 +462,8 @@ const struct dev_pm_ops name = { \
 #define PMSG_THAW	((struct pm_message){ .event = PM_EVENT_THAW, })
 #define PMSG_RESTORE	((struct pm_message){ .event = PM_EVENT_RESTORE, })
 #define PMSG_RECOVER	((struct pm_message){ .event = PM_EVENT_RECOVER, })
+#define PMSG_SUSPEND_NOIRQ	((struct pm_message){ \
+					.event = PM_EVENT_SUSPEND_NOIRQ, })
 #define PMSG_USER_SUSPEND	((struct pm_message) \
 					{ .event = PM_EVENT_USER_SUSPEND, })
 #define PMSG_USER_RESUME	((struct pm_message) \
@@ -469,6 +476,7 @@ const struct dev_pm_ops name = { \
 					{ .event = PM_EVENT_AUTO_RESUME, })
 
 #define PMSG_IS_AUTO(msg)	(((msg).event & PM_EVENT_AUTO) != 0)
+#define PMSG_IS_NOIRQ(msg)	(((msg).event & PM_EVENT_NOIRQ) != 0)
 
 /*
  * Device run-time power management status.
diff --git a/include/linux/usb.h b/include/linux/usb.h
index e87826e23d59..0e2079661ae6 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1139,6 +1139,8 @@ struct usbdrv_wrap {
  *	try to continue using the device if suspend fails in this case.
  *	Instead, let the resume or reset-resume routine recover from
  *	the failure.
+ * @suspend_noirq: Similar to suspend() but called with the usb interrupt
+ *	handler disabled.
  * @resume: Called when the device is being resumed by the system.
  * @reset_resume: Called when the suspended device has been reset instead
  *	of being resumed.
@@ -1191,6 +1193,7 @@ struct usb_driver {
 			void *buf);
 
 	int (*suspend) (struct usb_interface *intf, pm_message_t message);
+	int (*suspend_noirq)(struct usb_interface *intf, pm_message_t message);
 	int (*resume) (struct usb_interface *intf);
 	int (*reset_resume)(struct usb_interface *intf);
 
-- 
2.23.0.237.gc6a4ce50a0-goog

