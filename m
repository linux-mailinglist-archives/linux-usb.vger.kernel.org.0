Return-Path: <linux-usb+bounces-31062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B763C973EF
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32A074E1D0A
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C29130C36C;
	Mon,  1 Dec 2025 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ECoPe78S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6230BB95
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591978; cv=none; b=mD01hTNsItLF59JKooR8RK+a6T829TGqJAT+KCSMJ/XtWp+Re32ym/Bj1m4UgAWr3O7Odt4vQoGAB1wz+7SLPxEWJCB1o9jW+AAbIIqbhwAncQM660FYLQ8XeInidwjIuErjPkltTLAdQXYk/GIsoRUBcKmEaWnrHNOeNSqUu58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591978; c=relaxed/simple;
	bh=mFFOFxlXkYzqkxL/jBvCvI+dfjNbxB2plNZeiEbJmZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQjyOMKCpRxRJOu88/7FuquTHEXuz3yAK0mf2dh8d9kP6kToVKXmS9aUv0MepR3FlIuVYfahfQ80R1bXMspxLMngMJEsGzOvvjcJb8Gd+gCqV3LO96UAut+XUnhf47A2Ptc8R6GSU3U2FPaFvM4IG4LdaZTBYB/WRn+prdSuw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ECoPe78S; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79af62d36bso68642966b.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591975; x=1765196775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOzvEryKCkrNpvspLpfMwILhAFa2s2m3Cqxq22OFJJc=;
        b=ECoPe78SE2XeK7va/XeUzk5On68OcCSSHhWxD3MkXu7JlYnY/77yiRNkqPu1D/iOxu
         u2Sf71Joz3uwEI33gmbTOBby4C5alH2fQlLJmaDlh1Jf0wf/7sew5ixiR6HhMZgmIRNE
         enHNNR+WwYVtd0UCDyILkr7Tsy3aSILH9VxIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591975; x=1765196775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOzvEryKCkrNpvspLpfMwILhAFa2s2m3Cqxq22OFJJc=;
        b=KoBUp6nF9sXR9t8AvUcP1fPEd1lF58Av5yMQO4y9dbJ1IHS98pBkWX/c24g7tj3DuQ
         3gf0RmAo2IayIz3Qukf/JFMV8cuTGQR8+0HHTrt/7uvF4Mb2xE2ZF0k61TOIH63CbNoK
         +Y2sw1jum1PtXXwHP6dG1ed5kbcDkxK8sMPlW6DLGtHFfOZmAgv3eHD2NVzwOVdxjfmU
         FNxmKqagyBct58VoBwS8JvSdxQX9nsVXKdifQ8X8VCCZ2X9fk2CqJDnhA7s8uTgkVvZG
         MkeV/hHKa1dNozmgupqgOOyVnfiBZh/1oLJPKB/W8QwrDah8ZxGZ9H5eZpikVVgqwE9i
         B2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVUH0/VicDsZhj4pct3JQMCtAdtKhnDleatHUr+MDz38pte7r+TcXhyzQTNX9FxQgXhrHF50wsjlaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl307yzzsAhM0s+07LaNrmR80+64jdopN1J5/LwYgooAJ3aO4p
	DjrdzSRNBubpc/cB50jnDZ98DCypOIA3TVhHKccUmQcCYmpZaGGNoNhaDfBgt665eQ==
X-Gm-Gg: ASbGncuwSaXdY8C1OKuqUX2xQJUN+IVNyOXaZ4g8ImFRngbghC8nXa7qoXcAt9ubJwk
	C97T8V0uvYCEm1dYy+tscAqPT7dpA9Qqi28PS9fYWza1ZHspiOgb3uK2N/VlkQLwPIDBtJqc4Fb
	SpuBTInJKUg42VjhQwQB8jGPoIMnzCTCvcetppPsaYlW4y6Hbsnfnt/Yncc7y+22Q4PbRmGmSFd
	Wx0dkBVQvoK3iSrr/nsVKQcQCVDLeFPlIk7j/naALmNKrRidIBAspn9OvNsasTJWIcJscqM+Vwe
	8zrGXKZSH9TuZsNKq6e4jvRuDQXljI1Tu5oEtbOo00hEbLw+BPkY4ZzSjZRgK53BrsRFUwtu0dt
	ll4r5nKZw0+nHs2cC+DCjM2VLYX2d7O8Y1dJBrNlGvfh10GSobmp/zC0MBRQ1PDdhzl+VWwhmwW
	JKOk44gTZ+iS4S8QPFUKO0wlczVwF/FW2w7HLK702uSbH1Y2xy/CZPE9/iDs06Fr9tjMMZmpPmc
	u0v6QRpqb8=
X-Google-Smtp-Source: AGHT+IE8DaR7Kik8466aWNYAdspu3ISPD7yBbPMq0lguD6XcCygqXCAx20V+4wMbwRnBnuB9+Z3lcA==
X-Received: by 2002:a17:907:cbc6:b0:b76:d882:5aaa with SMTP id a640c23a62f3a-b76d8825d0bmr2269904566b.3.1764591974487;
        Mon, 01 Dec 2025 04:26:14 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:14 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 1/8] usb: typec: Implement mode selection
Date: Mon,  1 Dec 2025 12:25:57 +0000
Message-ID: <20251201122604.1268071-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
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
 drivers/usb/typec/Makefile         |   2 +-
 drivers/usb/typec/class.h          |   2 +
 drivers/usb/typec/mode_selection.c | 285 +++++++++++++++++++++++++++++
 include/linux/usb/typec_altmode.h  |  40 ++++
 4 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/mode_selection.c

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..8a6a1c663eb6 100644
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
index 2e89a83c2eb7..d3435936ee7c 100644
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
index 000000000000..1cf8a4dcd742
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,285 @@
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
+
+#include "class.h"
+#include "bus.h"
+
+/**
+ * struct mode_state - State tracking for a specific Type-C alternate mode
+ * @svid: Standard or Vendor ID of the Alternate Mode
+ * @priority: mode priority.
+ * @error: outcome of the last attempt to enter the mode.
+ * @list: list head to link this mode state into a prioritized list
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
+ * @mode_list: prioritized list of available Alternate Modes
+ * @lock: mutex to protect mode_list
+ * @work: work structure
+ * @partner: handle to the Type-C partner device
+ * @active_svid: svid of currently active mode
+ * @timeout: timeout for a mode entry attempt, ms
+ * @delay: delay between mode entry/exit attempts, ms
+ */
+struct mode_selection {
+	struct list_head mode_list;
+	struct mutex lock;
+	struct delayed_work work;
+	struct typec_partner *partner;
+	u16 active_svid;
+	unsigned int timeout;
+	unsigned int delay;
+};
+
+struct mode_order {
+	u16 svid;
+	int enter;
+	int result;
+};
+
+static int activate_altmode(struct device *dev, void *data)
+{
+	if (is_typec_altmode(dev)) {
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
+		const u16 svid, const int enter)
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
+	mutex_lock(&sel->lock);
+
+	ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
+	if (!ms) {
+		mutex_unlock(&sel->lock);
+		return;
+	}
+
+	if (sel->active_svid == ms->svid) {
+		dev_dbg(&sel->partner->dev, "%x altmode is active\n", ms->svid);
+		mode_list_clean(sel);
+	} else if (sel->active_svid != 0) {
+		result = mode_selection_activate(sel, sel->active_svid, 0);
+		if (result) {
+			dev_dbg(&sel->partner->dev, "enable to exit %x altmode\n",
+					sel->active_svid);
+			mode_list_clean(sel);
+		}
+	} else if (ms->error) {
+		dev_dbg(&sel->partner->dev, "%x: entry error %pe\n",
+				ms->svid, ERR_PTR(ms->error));
+		mode_selection_activate(sel, ms->svid, 0);
+		list_del(&ms->list);
+		kfree(ms);
+	} else {
+		result = mode_selection_activate(sel, ms->svid, 1);
+		if (result) {
+			dev_dbg(&sel->partner->dev, "%x: activation error %pe\n",
+					ms->svid, ERR_PTR(result));
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
+	mutex_unlock(&sel->lock);
+}
+
+void typec_altmode_state_update(struct typec_partner *partner, const u16 svid,
+	const int error)
+{
+	struct mode_selection *sel = partner->sel;
+	struct mode_state *ms;
+
+	if (sel) {
+		mutex_lock(&sel->lock);
+		ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
+		if (ms && ms->svid == svid) {
+			ms->error = error;
+			cancel_delayed_work(&sel->work);
+			schedule_delayed_work(&sel->work, 0);
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
+	const struct list_head *a, const struct list_head *b)
+{
+	const struct mode_state *msa = container_of(a, struct mode_state, list);
+	const struct mode_state *msb = container_of(b, struct mode_state, list);
+
+	if (msa->priority < msb->priority)
+		return -1;
+	return 1;
+}
+
+static struct mode_state *create_mode_entry(u16 svid, u8 priority)
+{
+	struct mode_state *ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
+
+	if (ms) {
+		ms->svid = svid;
+		ms->priority = priority;
+		INIT_LIST_HEAD(&ms->list);
+	}
+
+	return ms;
+}
+
+static int altmode_add_to_list(struct device *dev, void *data)
+{
+	if (is_typec_altmode(dev)) {
+		struct list_head *list = (struct list_head *)data;
+		struct typec_altmode *altmode = to_typec_altmode(dev);
+		const struct typec_altmode *pdev = typec_altmode_get_partner(altmode);
+		struct mode_state *ms;
+
+		if (pdev && altmode->ops && altmode->ops->activate) {
+			ms = create_mode_entry(pdev->svid, pdev->priority);
+			if (!ms)
+				return -ENOMEM;
+			list_add_tail(&ms->list, list);
+		}
+	}
+	return 0;
+}
+
+int typec_mode_selection_start(struct typec_partner *partner,
+	const unsigned int delay, const unsigned int timeout)
+{
+	struct mode_selection *sel;
+	int ret;
+
+	if (partner->sel)
+		return -EALREADY;
+
+	sel = kzalloc(sizeof(struct mode_selection), GFP_KERNEL);
+	if (!sel)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&sel->mode_list);
+
+	ret = device_for_each_child(
+		&partner->dev, &sel->mode_list, altmode_add_to_list);
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
+	partner->sel = sel;
+	INIT_DELAYED_WORK(&sel->work, mode_selection_work_fn);
+	schedule_delayed_work(&sel->work, msecs_to_jiffies(delay));
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
index 2c3b6bec2eca..a240d8264b92 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -232,4 +232,44 @@ void typec_altmode_unregister_driver(struct typec_altmode_driver *drv);
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
+	const unsigned int delay, const unsigned int timeout);
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
+	const int result);
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
2.52.0.158.g65b55ccf14-goog


