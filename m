Return-Path: <linux-usb+bounces-32395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22101D2518D
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 15:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F6343013155
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 14:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808D73A0E9A;
	Thu, 15 Jan 2026 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSoxtWQd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24C34F46F;
	Thu, 15 Jan 2026 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488787; cv=none; b=ZBGnhHhL8Ikc0xW5VQFme6uhXev1j9KisuE8gPBn2zfKIxF7cNMUpZ/x2E+cBkrwYmuy0EmzjYzsva7M7DboC2pErJ0UHoY94Ux1vLMTrH3FuQ/IPumPybvHfjcZINrpuJhBFIf+QdK4gBU5jZR/XpEJy3bWyTrEosbmKw+z3go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488787; c=relaxed/simple;
	bh=TOi+FM2yNiOSXD116px7qF65aeGm9ktoQq0xbPisip0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDKaykiW+XKFaU0Km4F8IffK/bSI2XIWvRtc/8fPs55QEh3wvkokPpojPiQd6aVrVmLhunYzfFp5fSPmtVhtBaxHL+no/a3HMZd+pbTIeBRRleJxIqAFiIpOP1fV10ex0tmS4+yqNRapx+K1Ua1LIcNMR4RrY399h2yOLpNbge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSoxtWQd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768488785; x=1800024785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TOi+FM2yNiOSXD116px7qF65aeGm9ktoQq0xbPisip0=;
  b=WSoxtWQdpn2WIw+lksj66U9AmxfzBmZ/Wky+WnJJcB7RBvSoPgH55mfY
   NrnlzhT1LvitVFjCtvmd8mPgzmFPWNGsxVoUj5Kg1ZGodcOkm6UZJe9dq
   ZvCS4LBpxP7pZxEPCzKkQ2nVR0vWphha8ABtaddJ4XiyVsOg6+ciA2nSY
   3tIAdL+Hc/Zg0deiOdlnzhxIVW76hnGckKoO3Ok4vE2hJ+rdnPerNs+jN
   2TUXkT2HQzP8imw58e31926LBtXm5ZYNBTYPKpdVDVZk+GkQ57ekqaGYJ
   YNIU+1/BFu2wXtTmICipe/VnoYJL1g6fFgTq3WPD2clmZawdypDy22OzU
   A==;
X-CSE-ConnectionGUID: srMaEYhgQ7aAsuKcye5laA==
X-CSE-MsgGUID: L0p6flukTfeZyfHiDrbQJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69850844"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69850844"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:53:04 -0800
X-CSE-ConnectionGUID: xjHc3F7mRTuXcvePeJzawQ==
X-CSE-MsgGUID: OHNTLEMOROCTtCiPz9bJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="242511249"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO kuha) ([10.124.220.243])
  by orviesa001.jf.intel.com with SMTP; 15 Jan 2026 06:52:58 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 15 Jan 2026 16:52:35 +0200
Date: Thu, 15 Jan 2026 16:52:35 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v4 5/8] usb: typec: Implement mode selection
Message-ID: <aWj_M-NH4RL8h-jy@kuha>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-6-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113130536.3068311-6-akuchynski@chromium.org>

Tue, Jan 13, 2026 at 01:05:33PM +0000, Andrei Kuchynski kirjoitti:
> The mode selection process is controlled by the following API functions,
> which allow to initiate and complete mode entry based on the priority of
> each mode:
> 
> `typec_mode_selection_start` function compiles a priority list of supported
> Alternate Modes.
> `typec_altmode_state_update` function is invoked by the port driver to
> communicate the current mode of the Type-C connector.
> `typec_mode_selection_delete` function stops the currently running mode
> selection process and releases all associated system resources.
> 
> `mode_selection_work_fn` task attempts to activate modes. The process stops
> on success; otherwise, it proceeds to the next mode after a timeout or
> error.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  drivers/usb/typec/Makefile         |   2 +-
>  drivers/usb/typec/class.h          |   2 +
>  drivers/usb/typec/mode_selection.c | 288 +++++++++++++++++++++++++++++
>  include/linux/usb/typec_altmode.h  |  40 ++++
>  4 files changed, 331 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/typec/mode_selection.c
> 
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index 7a368fea61bc9..8a6a1c663eb69 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_TYPEC)		+= typec.o
> -typec-y				:= class.o mux.o bus.o pd.o retimer.o
> +typec-y				:= class.o mux.o bus.o pd.o retimer.o mode_selection.o
>  typec-$(CONFIG_ACPI)		+= port-mapper.o
>  obj-$(CONFIG_TYPEC)		+= altmodes/
>  obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index 2e89a83c2eb70..d3435936ee7c8 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -9,6 +9,7 @@
>  struct typec_mux;
>  struct typec_switch;
>  struct usb_device;
> +struct mode_selection;
>  
>  struct typec_plug {
>  	struct device			dev;
> @@ -39,6 +40,7 @@ struct typec_partner {
>  	u8				usb_capability;
>  
>  	struct usb_power_delivery	*pd;
> +	struct mode_selection	*sel;
>  
>  	void (*attach)(struct typec_partner *partner, struct device *dev);
>  	void (*deattach)(struct typec_partner *partner, struct device *dev);
> diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
> new file mode 100644
> index 0000000000000..63a1d251c72b4
> --- /dev/null
> +++ b/drivers/usb/typec/mode_selection.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 Google LLC.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/list_sort.h>
> +#include <linux/slab.h>
> +#include <linux/mutex.h>
> +#include <linux/workqueue.h>
> +#include <linux/usb/typec_altmode.h>
> +
> +#include "class.h"
> +
> +/**
> + * struct mode_state - State tracking for a specific Type-C alternate mode
> + * @svid: Standard or Vendor ID of the Alternate Mode
> + * @priority: Mode priority
> + * @error: Outcome of the last attempt to enter the mode
> + * @list: List head to link this mode state into a prioritized list
> + */
> +struct mode_state {
> +	u16 svid;
> +	u8 priority;
> +	int error;
> +	struct list_head list;
> +};
> +
> +/**
> + * struct mode_selection - Manages the selection and state of Alternate Modes
> + * @mode_list: Prioritized list of available Alternate Modes
> + * @lock: Mutex to protect mode_list
> + * @work: Work structure
> + * @partner: Handle to the Type-C partner device
> + * @active_svid: svid of currently active mode
> + * @timeout: Timeout for a mode entry attempt, ms
> + * @delay: Delay between mode entry/exit attempts, ms
> + */
> +struct mode_selection {
> +	struct list_head mode_list;
> +	struct mutex lock;
> +	struct delayed_work work;
> +	struct typec_partner *partner;
> +	u16 active_svid;
> +	unsigned int timeout;
> +	unsigned int delay;
> +};
> +
> +/**
> + * struct mode_order - Mode activation tracking
> + * @svid: Standard or Vendor ID of the Alternate Mode
> + * @enter: Flag indicating if the driver is currently attempting to enter or
> + * exit the mode
> + * @result: Outcome of the attempt to activate the mode
> + */
> +struct mode_order {
> +	u16 svid;
> +	int enter;
> +	int result;
> +};
> +
> +static int activate_altmode(struct device *dev, void *data)
> +{
> +	if (is_typec_partner_altmode(dev)) {
> +		struct typec_altmode *alt = to_typec_altmode(dev);
> +		struct mode_order *order = (struct mode_order *)data;
> +
> +		if (order->svid == alt->svid) {
> +			if (alt->ops && alt->ops->activate)
> +				order->result = alt->ops->activate(alt, order->enter);
> +			else
> +				order->result = -EOPNOTSUPP;
> +			return 1;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int mode_selection_activate(struct mode_selection *sel,
> +		const u16 svid, const int enter)

You need to run these through "scripts/checkpatch.pl --strict".
Please fix all the checks that it gives you.

> +
> +	__must_hold(&sel->lock)
> +{
> +	struct mode_order order = {.svid = svid, .enter = enter, .result = -ENODEV};
> +
> +	/*
> +	 * The port driver may acquire its internal mutex during alternate mode
> +	 * activation. Since this is the same mutex that may be held during the
> +	 * execution of typec_altmode_state_update(), it is crucial to release
> +	 * sel->mutex before activation to avoid potential deadlock.
> +	 * Note that sel->mode_list must remain invariant throughout this unlocked
> +	 * interval.
> +	 */
> +	mutex_unlock(&sel->lock);
> +	device_for_each_child(&sel->partner->dev, &order, activate_altmode);
> +	mutex_lock(&sel->lock);
> +
> +	return order.result;
> +}
> +
> +static void mode_list_clean(struct mode_selection *sel)
> +{
> +	struct mode_state *ms, *tmp;
> +
> +	list_for_each_entry_safe(ms, tmp, &sel->mode_list, list) {
> +		list_del(&ms->list);
> +		kfree(ms);
> +	}
> +}
> +
> +/**
> + * mode_selection_work_fn() - Alternate mode activation task
> + * @work: work structure
> + *
> + * - If the Alternate Mode currently prioritized at the top of the list is already
> + * active, the entire selection process is considered finished.
> + * - If a different Alternate Mode is currently active, the system must exit that
> + * active mode first before attempting any new entry.
> + *
> + * The function then checks the result of the attempt to entre the current mode,
> + * stored in the `ms->error` field:
> + * - if the attempt FAILED, the mode is deactivated and removed from the list.
> + * - `ms->error` value of 0 signifies that the mode has not yet been activated.
> + *
> + * Once successfully activated, the task is scheduled for subsequent entry after
> + * a timeout period. The alternate mode driver is expected to call back with the
> + * actual mode entry result via `typec_altmode_state_update()`.
> + */
> +static void mode_selection_work_fn(struct work_struct *work)
> +{
> +	struct mode_selection *sel = container_of(work,
> +				struct mode_selection, work.work);
> +	struct mode_state *ms;
> +	unsigned int delay = sel->delay;
> +	int result;
> +
> +	mutex_lock(&sel->lock);

guard(mutex)(&sel->lock); ?

> +	ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
> +	if (!ms) {
> +		mutex_unlock(&sel->lock);
> +		return;
> +	}
> +
> +	if (sel->active_svid == ms->svid) {
> +		dev_dbg(&sel->partner->dev, "%x altmode is active\n", ms->svid);
> +		mode_list_clean(sel);
> +	} else if (sel->active_svid != 0) {
> +		result = mode_selection_activate(sel, sel->active_svid, 0);
> +		if (result) {
> +			dev_dbg(&sel->partner->dev, "enable to exit %x altmode\n",
> +					sel->active_svid);

"enable to exit" ?

Just drop that dev_dbg.

> +			mode_list_clean(sel);
> +		} else {
> +			sel->active_svid = 0;
> +		}
> +	} else if (ms->error) {
> +		dev_dbg(&sel->partner->dev, "%x: entry error %pe\n",
> +				ms->svid, ERR_PTR(ms->error));

dev_err (or dev_warn)?

> +		mode_selection_activate(sel, ms->svid, 0);
> +		list_del(&ms->list);
> +		kfree(ms);
> +	} else {
> +		result = mode_selection_activate(sel, ms->svid, 1);
> +		if (result) {
> +			dev_dbg(&sel->partner->dev, "%x: activation error %pe\n",
> +					ms->svid, ERR_PTR(result));

ditto.

> +			list_del(&ms->list);
> +			kfree(ms);
> +		} else {
> +			delay = sel->timeout;
> +			ms->error = -ETIMEDOUT;
> +		}
> +	}
> +
> +	if (!list_empty(&sel->mode_list))
> +		schedule_delayed_work(&sel->work, msecs_to_jiffies(delay));
> +	mutex_unlock(&sel->lock);
> +}
> +
> +void typec_altmode_state_update(struct typec_partner *partner, const u16 svid,
> +	const int error)
> +{
> +	struct mode_selection *sel = partner->sel;
> +	struct mode_state *ms;
> +
> +	if (sel) {
> +		mutex_lock(&sel->lock);
> +		ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
> +		if (ms && ms->svid == svid) {
> +			ms->error = error;
> +			cancel_delayed_work(&sel->work);
> +			schedule_delayed_work(&sel->work, 0);
> +		}
> +		if (!error)
> +			sel->active_svid = svid;
> +		else
> +			sel->active_svid = 0;
> +		mutex_unlock(&sel->lock);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(typec_altmode_state_update);
> +
> +static int compare_priorities(void *priv,
> +	const struct list_head *a, const struct list_head *b)
> +{
> +	const struct mode_state *msa = container_of(a, struct mode_state, list);
> +	const struct mode_state *msb = container_of(b, struct mode_state, list);
> +
> +	if (msa->priority < msb->priority)
> +		return -1;
> +	return 1;
> +}
> +
> +static int altmode_add_to_list(struct device *dev, void *data)
> +{
> +	if (is_typec_partner_altmode(dev)) {
> +		struct list_head *list = (struct list_head *)data;
> +		struct typec_altmode *altmode = to_typec_altmode(dev);
> +		const struct typec_altmode *pdev = typec_altmode_get_partner(altmode);
> +		struct mode_state *ms;
> +
> +		if (pdev && altmode->ops && altmode->ops->activate) {
> +			ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
> +			if (!ms)
> +				return -ENOMEM;
> +			ms->svid = pdev->svid;
> +			ms->priority = pdev->priority;
> +			INIT_LIST_HEAD(&ms->list);
> +			list_add_tail(&ms->list, list);
> +		}
> +	}
> +	return 0;
> +}
> +
> +int typec_mode_selection_start(struct typec_partner *partner,
> +	const unsigned int delay, const unsigned int timeout)
> +{
> +	struct mode_selection *sel;
> +	int ret;
> +
> +	if (partner->usb_mode == USB_MODE_USB4)
> +		return -EBUSY;
> +
> +	if (partner->sel)
> +		return -EALREADY;
> +
> +	sel = kzalloc(sizeof(struct mode_selection), GFP_KERNEL);
> +	if (!sel)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&sel->mode_list);
> +
> +	ret = device_for_each_child(
> +		&partner->dev, &sel->mode_list, altmode_add_to_list);
> +
> +	if (ret || list_empty(&sel->mode_list)) {
> +		mode_list_clean(sel);
> +		kfree(sel);
> +		return ret;
> +	}
> +
> +	list_sort(NULL, &sel->mode_list, compare_priorities);
> +	sel->partner = partner;
> +	sel->delay = delay;
> +	sel->timeout = timeout;
> +	mutex_init(&sel->lock);
> +	INIT_DELAYED_WORK(&sel->work, mode_selection_work_fn);
> +	schedule_delayed_work(&sel->work, msecs_to_jiffies(delay));
> +	partner->sel = sel;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(typec_mode_selection_start);
> +
> +void typec_mode_selection_delete(struct typec_partner *partner)
> +{
> +	struct mode_selection *sel = partner->sel;
> +
> +	if (sel) {
> +		partner->sel = NULL;
> +		cancel_delayed_work_sync(&sel->work);
> +		mode_list_clean(sel);
> +		mutex_destroy(&sel->lock);
> +		kfree(sel);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(typec_mode_selection_delete);

thanks,

-- 
heikki

