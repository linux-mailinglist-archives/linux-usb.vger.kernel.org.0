Return-Path: <linux-usb+bounces-32507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C794FD3AA1D
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 128883026C33
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B13F369215;
	Mon, 19 Jan 2026 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Epsk9GYk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B265368269
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828735; cv=none; b=BPphULV49AkoRa7KLELNW85EqZR1tdICz/A4UdqacLSGSTqcGjkdtg4OtlJ40oXroLgFqANavoaweG9J99xf7CwhXWztkCw8koLJPnTCZeF6NnUTvSH74cgRlu4C1WfybqqlryNyYr9dTRx9kSXSivYPdjw8eBSwX1upMYCPohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828735; c=relaxed/simple;
	bh=W5rVUeJ0ZYQc7VJJqv7IN5MlC5nYGPDBCCaodck9cLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JD/qCSkCacdW+jEDMIt0qrWUzzlGvZ90DF+aLtseA/V/eEW5+DLM/7m8m3l4jaAcQbVGCgL4MaxaqmW58iHD3W92ToRo1E+qJjnHl+6FhMYKMq/gESB38NmvDjhsUN2NLSfUhCMTOuOmxYyyfip8hCbUZxge9OE9GRMPwtQF5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Epsk9GYk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b874c00a3fcso695228666b.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 05:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828729; x=1769433529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z12NdnfPArhakjxM92nLWa6k5fhcIcqz5sumyUrY3w=;
        b=Epsk9GYkvkXwJwGseMkCl4z3b7pX6KQMt9oaqUeWVCvTM5oANgO32qLDcVtmAisf1L
         Ktm7lDyr7oZPMi2dpCbyBav9Shc9AdAu4oEvTi3B4tGfIVlU/J48ehAR85kbP55U6zLa
         vnaWtDzd8KYCE2vJZC5VNFJxhL3dJvU9ZWvOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828729; x=1769433529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Z12NdnfPArhakjxM92nLWa6k5fhcIcqz5sumyUrY3w=;
        b=Vo9qO1AaIt2pYW+Dw3sAbMAZoEAjwI7MMYqkRuuJ1u7VPRsAerVLzZ4faUR5vg7ph0
         ogBB7vzWbXZSC5rwai93XcxTsRfRPA3+/R5chwu5nIbarVJhkSgr8ISt9clwhR9+2xbq
         ODFKqJAGvmuIWif4Vm7Ef2pyDhpHOGM1NRS3UE6/WpVknibKQPifVeVKFskcLmT8sn20
         7xgYEwAOrVJirEUKTGo2vF4BVyzIPi9ZMsih9F6ubDm2Rt6s/lB8Z1d2MyJTKmpkKsqC
         PW8hDLhBHzVorcLab2JbnPSIW50QmXNU95waIyP7LjGqe8O9KXvBetRvjrM4FXDwlKuG
         0Gdw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ6+zMFOplYJlVkGHCw1GB328RJ/vkpTUGcNRzfBC88U3uDErbbpH96nLt50CyWBJHR7sDR0daMOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTvFEskjxCAq88iwW7H+SsXJuZYngDlt4pMHu8Ih0BZ2290Lnb
	VSemfnx3do+KbLSaM1KGyJqUIUa15GL90dKGh/tvklTlrH0kOT5g5PL7baCRZkas1w==
X-Gm-Gg: AY/fxX6Re5S+LYggfveCGk6L8z6pPf6Mp8U0WktsUAW+k7iJwHStuqSsZ5ueT9OtA/v
	aFhokcTYJm5ZfnWk4D/I84PDjnhflYP2zTfHpgrztsuy42/QKbrIOV+OPZhFM4CIuxEFvVMnAv+
	MUJLFHPt5PqVar/kL9wdNsYHdgkMCBwnwj26GujH6t2my/4u+q4riGEoZ+b8cDggxl49PsaznOr
	XVlyZTu1bg5leSRCfaxuqnuUchDEwbW6r5NNxqXo/JBeciYnBTyHUD2NtF/9m/RiDd/4W+TwlvT
	LsTsce4oGPCafapAr649piXzpOdFwZXpSgapSK5Psao/qufseABw5VoPq6teAW0CnK+fxa5CuYH
	pXom/4b66h+uuysumJ0f3G0MdldPi3YmGWAKseoLY0UMgTJ9JOeivnazMsZR+uW6JtjpKjk89JW
	S0BsPijcVvx0JvzN+u6JZdnvuLAeCt0Rj4Rjy9CUW1KCpFqiWvyimDgpL2b15nj2YEKG4lNPQIn
	B+me9iP
X-Received: by 2002:a17:906:4793:b0:b87:3809:6982 with SMTP id a640c23a62f3a-b8793254fe1mr1093930866b.57.1768828729213;
        Mon, 19 Jan 2026 05:18:49 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:48 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 4/7] usb: typec: Implement mode selection
Date: Mon, 19 Jan 2026 13:18:21 +0000
Message-ID: <20260119131824.2529334-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode selection process is controlled by the following API functions,
which allow to initiate and complete mode entry based on the priority of
each mode:

`typec_mode_selection_start` function compiles a priority list of supported
Alternate Modes.
`typec_altmode_state_update` function is invoked by the port driver to
communicate the current mode of the Type-C connector.
`typec_mode_selection_delete` function stops the currently running mode
selection process and releases all associated system resources.

`mode_selection_work_fn` task attempts to activate modes. The process stops
on success; otherwise, it proceeds to the next mode after a timeout or
error.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
Changes in V5:
- Adopt guard(mutex)(&sel->lock) in mode_selection_work_fn()
- Use dev_err instead of dev_dbg, remove the error message when exiting
  the mode
- Update typec_altmode_state_update() to only reschedule the
  mode_selection_work_fn task if it was successfully cancelled
- Clean up code style and alignment issues

 drivers/usb/typec/Makefile         |   2 +-
 drivers/usb/typec/class.h          |   2 +
 drivers/usb/typec/mode_selection.c | 283 +++++++++++++++++++++++++++++
 include/linux/usb/typec_altmode.h  |  40 ++++
 4 files changed, 326 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/mode_selection.c

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc9..8a6a1c663eb69 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o bus.o pd.o retimer.o mode_selection.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index 2e89a83c2eb70..d3435936ee7c8 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -9,6 +9,7 @@
 struct typec_mux;
 struct typec_switch;
 struct usb_device;
+struct mode_selection;
 
 struct typec_plug {
 	struct device			dev;
@@ -39,6 +40,7 @@ struct typec_partner {
 	u8				usb_capability;
 
 	struct usb_power_delivery	*pd;
+	struct mode_selection	*sel;
 
 	void (*attach)(struct typec_partner *partner, struct device *dev);
 	void (*deattach)(struct typec_partner *partner, struct device *dev);
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
new file mode 100644
index 0000000000000..a95b31e21b528
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Google LLC.
+ */
+
+#include <linux/types.h>
+#include <linux/list_sort.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
+#include <linux/usb/typec_altmode.h>
+
+#include "class.h"
+
+/**
+ * struct mode_state - State tracking for a specific Type-C alternate mode
+ * @svid: Standard or Vendor ID of the Alternate Mode
+ * @priority: Mode priority
+ * @error: Outcome of the last attempt to enter the mode
+ * @list: List head to link this mode state into a prioritized list
+ */
+struct mode_state {
+	u16 svid;
+	u8 priority;
+	int error;
+	struct list_head list;
+};
+
+/**
+ * struct mode_selection - Manages the selection and state of Alternate Modes
+ * @mode_list: Prioritized list of available Alternate Modes
+ * @lock: Mutex to protect mode_list
+ * @work: Work structure
+ * @partner: Handle to the Type-C partner device
+ * @active_svid: svid of currently active mode
+ * @timeout: Timeout for a mode entry attempt, ms
+ * @delay: Delay between mode entry/exit attempts, ms
+ */
+struct mode_selection {
+	struct list_head mode_list;
+	/* Protects the mode_list*/
+	struct mutex lock;
+	struct delayed_work work;
+	struct typec_partner *partner;
+	u16 active_svid;
+	unsigned int timeout;
+	unsigned int delay;
+};
+
+/**
+ * struct mode_order - Mode activation tracking
+ * @svid: Standard or Vendor ID of the Alternate Mode
+ * @enter: Flag indicating if the driver is currently attempting to enter or
+ * exit the mode
+ * @result: Outcome of the attempt to activate the mode
+ */
+struct mode_order {
+	u16 svid;
+	int enter;
+	int result;
+};
+
+static int activate_altmode(struct device *dev, void *data)
+{
+	if (is_typec_partner_altmode(dev)) {
+		struct typec_altmode *alt = to_typec_altmode(dev);
+		struct mode_order *order = (struct mode_order *)data;
+
+		if (order->svid == alt->svid) {
+			if (alt->ops && alt->ops->activate)
+				order->result = alt->ops->activate(alt, order->enter);
+			else
+				order->result = -EOPNOTSUPP;
+			return 1;
+		}
+	}
+	return 0;
+}
+
+static int mode_selection_activate(struct mode_selection *sel,
+				   const u16 svid, const int enter)
+
+	__must_hold(&sel->lock)
+{
+	struct mode_order order = {.svid = svid, .enter = enter, .result = -ENODEV};
+
+	/*
+	 * The port driver may acquire its internal mutex during alternate mode
+	 * activation. Since this is the same mutex that may be held during the
+	 * execution of typec_altmode_state_update(), it is crucial to release
+	 * sel->mutex before activation to avoid potential deadlock.
+	 * Note that sel->mode_list must remain invariant throughout this unlocked
+	 * interval.
+	 */
+	mutex_unlock(&sel->lock);
+	device_for_each_child(&sel->partner->dev, &order, activate_altmode);
+	mutex_lock(&sel->lock);
+
+	return order.result;
+}
+
+static void mode_list_clean(struct mode_selection *sel)
+{
+	struct mode_state *ms, *tmp;
+
+	list_for_each_entry_safe(ms, tmp, &sel->mode_list, list) {
+		list_del(&ms->list);
+		kfree(ms);
+	}
+}
+
+/**
+ * mode_selection_work_fn() - Alternate mode activation task
+ * @work: work structure
+ *
+ * - If the Alternate Mode currently prioritized at the top of the list is already
+ * active, the entire selection process is considered finished.
+ * - If a different Alternate Mode is currently active, the system must exit that
+ * active mode first before attempting any new entry.
+ *
+ * The function then checks the result of the attempt to entre the current mode,
+ * stored in the `ms->error` field:
+ * - if the attempt FAILED, the mode is deactivated and removed from the list.
+ * - `ms->error` value of 0 signifies that the mode has not yet been activated.
+ *
+ * Once successfully activated, the task is scheduled for subsequent entry after
+ * a timeout period. The alternate mode driver is expected to call back with the
+ * actual mode entry result via `typec_altmode_state_update()`.
+ */
+static void mode_selection_work_fn(struct work_struct *work)
+{
+	struct mode_selection *sel = container_of(work,
+				struct mode_selection, work.work);
+	struct mode_state *ms;
+	unsigned int delay = sel->delay;
+	int result;
+
+	guard(mutex)(&sel->lock);
+
+	ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
+	if (!ms)
+		return;
+
+	if (sel->active_svid == ms->svid) {
+		dev_dbg(&sel->partner->dev, "%x altmode is active\n", ms->svid);
+		mode_list_clean(sel);
+	} else if (sel->active_svid != 0) {
+		result = mode_selection_activate(sel, sel->active_svid, 0);
+		if (result)
+			mode_list_clean(sel);
+		else
+			sel->active_svid = 0;
+	} else if (ms->error) {
+		dev_err(&sel->partner->dev, "%x: entry error %pe\n",
+			ms->svid, ERR_PTR(ms->error));
+		mode_selection_activate(sel, ms->svid, 0);
+		list_del(&ms->list);
+		kfree(ms);
+	} else {
+		result = mode_selection_activate(sel, ms->svid, 1);
+		if (result) {
+			dev_err(&sel->partner->dev, "%x: activation error %pe\n",
+				ms->svid, ERR_PTR(result));
+			list_del(&ms->list);
+			kfree(ms);
+		} else {
+			delay = sel->timeout;
+			ms->error = -ETIMEDOUT;
+		}
+	}
+
+	if (!list_empty(&sel->mode_list))
+		schedule_delayed_work(&sel->work, msecs_to_jiffies(delay));
+}
+
+void typec_altmode_state_update(struct typec_partner *partner, const u16 svid,
+				const int error)
+{
+	struct mode_selection *sel = partner->sel;
+	struct mode_state *ms;
+
+	if (sel) {
+		mutex_lock(&sel->lock);
+		ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
+		if (ms && ms->svid == svid) {
+			ms->error = error;
+			if (cancel_delayed_work(&sel->work))
+				schedule_delayed_work(&sel->work, 0);
+		}
+		if (!error)
+			sel->active_svid = svid;
+		else
+			sel->active_svid = 0;
+		mutex_unlock(&sel->lock);
+	}
+}
+EXPORT_SYMBOL_GPL(typec_altmode_state_update);
+
+static int compare_priorities(void *priv,
+			      const struct list_head *a, const struct list_head *b)
+{
+	const struct mode_state *msa = container_of(a, struct mode_state, list);
+	const struct mode_state *msb = container_of(b, struct mode_state, list);
+
+	if (msa->priority < msb->priority)
+		return -1;
+	return 1;
+}
+
+static int altmode_add_to_list(struct device *dev, void *data)
+{
+	if (is_typec_partner_altmode(dev)) {
+		struct list_head *list = (struct list_head *)data;
+		struct typec_altmode *altmode = to_typec_altmode(dev);
+		const struct typec_altmode *pdev = typec_altmode_get_partner(altmode);
+		struct mode_state *ms;
+
+		if (pdev && altmode->ops && altmode->ops->activate) {
+			ms = kzalloc(sizeof(*ms), GFP_KERNEL);
+			if (!ms)
+				return -ENOMEM;
+			ms->svid = pdev->svid;
+			ms->priority = pdev->priority;
+			INIT_LIST_HEAD(&ms->list);
+			list_add_tail(&ms->list, list);
+		}
+	}
+	return 0;
+}
+
+int typec_mode_selection_start(struct typec_partner *partner,
+			       const unsigned int delay, const unsigned int timeout)
+{
+	struct mode_selection *sel;
+	int ret;
+
+	if (partner->usb_mode == USB_MODE_USB4)
+		return -EBUSY;
+
+	if (partner->sel)
+		return -EALREADY;
+
+	sel = kzalloc(sizeof(*sel), GFP_KERNEL);
+	if (!sel)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&sel->mode_list);
+
+	ret = device_for_each_child(&partner->dev, &sel->mode_list,
+				    altmode_add_to_list);
+
+	if (ret || list_empty(&sel->mode_list)) {
+		mode_list_clean(sel);
+		kfree(sel);
+		return ret;
+	}
+
+	list_sort(NULL, &sel->mode_list, compare_priorities);
+	sel->partner = partner;
+	sel->delay = delay;
+	sel->timeout = timeout;
+	mutex_init(&sel->lock);
+	INIT_DELAYED_WORK(&sel->work, mode_selection_work_fn);
+	schedule_delayed_work(&sel->work, msecs_to_jiffies(delay));
+	partner->sel = sel;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(typec_mode_selection_start);
+
+void typec_mode_selection_delete(struct typec_partner *partner)
+{
+	struct mode_selection *sel = partner->sel;
+
+	if (sel) {
+		partner->sel = NULL;
+		cancel_delayed_work_sync(&sel->work);
+		mode_list_clean(sel);
+		mutex_destroy(&sel->lock);
+		kfree(sel);
+	}
+}
+EXPORT_SYMBOL_GPL(typec_mode_selection_delete);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 7e6c02d74b54f..70026f5f8f997 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -240,4 +240,44 @@ void typec_altmode_unregister_driver(struct typec_altmode_driver *drv);
 	module_driver(__typec_altmode_driver, typec_altmode_register_driver, \
 		      typec_altmode_unregister_driver)
 
+/**
+ * typec_mode_selection_start - Start an alternate mode selection process
+ * @partner: Handle to the Type-C partner device
+ * @delay: Delay between mode entry/exit attempts, ms
+ * @timeout: Timeout for a mode entry attempt, ms
+ *
+ * This function initiates the process of attempting to enter an Alternate Mode
+ * supported by the connected Type-C partner.
+ * Returns 0 on success, or a negative error code on failure.
+ */
+int typec_mode_selection_start(struct typec_partner *partner,
+			       const unsigned int delay, const unsigned int timeout);
+
+/**
+ * typec_altmode_state_update - Report the current status of an Alternate Mode
+ * negotiation
+ * @partner: Handle to the Type-C partner device
+ * @svid: Standard or Vendor ID of the Alternate Mode. A value of 0 should be
+ * passed if no mode is currently active
+ * @result: Result of the entry operation. This should be 0 on success, or a
+ * negative error code if the negotiation failed
+ *
+ * This function should be called by an Alternate Mode driver to report the
+ * result of an asynchronous alternate mode entry request. It signals what the
+ * current active SVID is (or 0 if none) and the success or failure status of
+ * the last attempt.
+ */
+void typec_altmode_state_update(struct typec_partner *partner, const u16 svid,
+				const int result);
+
+/**
+ * typec_mode_selection_delete - Delete an alternate mode selection instance
+ * @partner: Handle to the Type-C partner device.
+ *
+ * This function cancels a pending alternate mode selection request that was
+ * previously started with typec_mode_selection_start().
+ * This is typically called when the partner disconnects.
+ */
+void typec_mode_selection_delete(struct typec_partner *partner);
+
 #endif /* __USB_TYPEC_ALTMODE_H */
-- 
2.52.0.457.g6b5491de43-goog


