Return-Path: <linux-usb+bounces-32540-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD2qAbrDb2lsMQAAu9opvQ
	(envelope-from <linux-usb+bounces-32540-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 19:04:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BCE490D9
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 19:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D06F5EC77A
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 15:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD9544D001;
	Tue, 20 Jan 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHdoDma5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B92F533E;
	Tue, 20 Jan 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922687; cv=none; b=CDxGPX5l2dtAjOE8hAeOs8VWWVHEAeUc+MIPgH+n0Q3Blxjmpz9hDF9UWNOj565ZXz2mCaKysGnlPXxL8RmySqsYVyfoUVz8ubDBuKdMJ66aKtlRky+EXpTC8yNsRbAe/4ENJ5RPXNPH5bj9WtagpA1oXgrejEHVbuyuA1hAZvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922687; c=relaxed/simple;
	bh=96yThi5GXkJ11U5BzBbUsGZBgXc/Z532EFPCzaEiN3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+5juG1ol35jtffmBe/DsPD4Rz1JI40MyqbSaRRfkyyNebsgaPbcxpC6pExXghDGS5rB2elaoELg9tRI5nKWpvsCJUdK7IXQSRiKQ+/LXnKsbgDjR/586edmM/saXbIwPoMlVKbcs0f5MxoZ9nf+sSyXIL9AqQSpZDERIwQuNN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHdoDma5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768922685; x=1800458685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=96yThi5GXkJ11U5BzBbUsGZBgXc/Z532EFPCzaEiN3c=;
  b=lHdoDma5PpzBFUpbj6taTKQeAj/xwBLiJlX2Fj+/zkwqlGMRIbOfwZJY
   DAFL/vEREcrSoQPARKqcd8xTACrJP8DFEtoccUM1vjTY/CvzlRy/9OeDf
   tYVsVE60EEYvBpi5AH/9rXDIPMvkSpkORkQuq3fwThlJVNRbDUSSjAA2C
   Us1cN9RXdEDHyofQw5wSEKhUIL9tZ5OgAKp9cVQ6Xa474G/yTyRo9tgHx
   OQSHVkmd2YdpUJ1oyc9BybiUFORm/6+Ix1lwEQipPKc6V3SEKB8VgP4+3
   Cq+YJs/r/zjunndyg7eHd9wvAE4VkA+Lge0SEwzAEML+LuygkE5EvrlF0
   g==;
X-CSE-ConnectionGUID: lGBN3i+eTrGjfPQ0iUP0IA==
X-CSE-MsgGUID: OptmSt7UQzaXnHumgTLHWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69866782"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69866782"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:24:45 -0800
X-CSE-ConnectionGUID: bP+KGXplTX6t31O3YsEOWg==
X-CSE-MsgGUID: hxg0vMinQ92KK+u1mSVNTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210614493"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.221.217])
  by fmviesa005.fm.intel.com with SMTP; 20 Jan 2026 07:24:39 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 20 Jan 2026 17:24:15 +0200
Date: Tue, 20 Jan 2026 17:24:15 +0200
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
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v5 4/7] usb: typec: Implement mode selection
Message-ID: <aW-eHyuUEV6IT_Va@kuha>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
 <20260119131824.2529334-5-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119131824.2529334-5-akuchynski@chromium.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32540-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,chromium.org:email,work.work:url]
X-Rspamd-Queue-Id: 68BCE490D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mon, Jan 19, 2026 at 01:18:21PM +0000, Andrei Kuchynski kirjoitti:
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

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in V5:
> - Adopt guard(mutex)(&sel->lock) in mode_selection_work_fn()
> - Use dev_err instead of dev_dbg, remove the error message when exiting
>   the mode
> - Update typec_altmode_state_update() to only reschedule the
>   mode_selection_work_fn task if it was successfully cancelled
> - Clean up code style and alignment issues
> 
>  drivers/usb/typec/Makefile         |   2 +-
>  drivers/usb/typec/class.h          |   2 +
>  drivers/usb/typec/mode_selection.c | 283 +++++++++++++++++++++++++++++
>  include/linux/usb/typec_altmode.h  |  40 ++++
>  4 files changed, 326 insertions(+), 1 deletion(-)
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
> index 0000000000000..a95b31e21b528
> --- /dev/null
> +++ b/drivers/usb/typec/mode_selection.c
> @@ -0,0 +1,283 @@
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
> +	/* Protects the mode_list*/
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
> +				   const u16 svid, const int enter)
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
> +	guard(mutex)(&sel->lock);
> +
> +	ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
> +	if (!ms)
> +		return;
> +
> +	if (sel->active_svid == ms->svid) {
> +		dev_dbg(&sel->partner->dev, "%x altmode is active\n", ms->svid);
> +		mode_list_clean(sel);
> +	} else if (sel->active_svid != 0) {
> +		result = mode_selection_activate(sel, sel->active_svid, 0);
> +		if (result)
> +			mode_list_clean(sel);
> +		else
> +			sel->active_svid = 0;
> +	} else if (ms->error) {
> +		dev_err(&sel->partner->dev, "%x: entry error %pe\n",
> +			ms->svid, ERR_PTR(ms->error));
> +		mode_selection_activate(sel, ms->svid, 0);
> +		list_del(&ms->list);
> +		kfree(ms);
> +	} else {
> +		result = mode_selection_activate(sel, ms->svid, 1);
> +		if (result) {
> +			dev_err(&sel->partner->dev, "%x: activation error %pe\n",
> +				ms->svid, ERR_PTR(result));
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
> +}
> +
> +void typec_altmode_state_update(struct typec_partner *partner, const u16 svid,
> +				const int error)
> +{
> +	struct mode_selection *sel = partner->sel;
> +	struct mode_state *ms;
> +
> +	if (sel) {
> +		mutex_lock(&sel->lock);
> +		ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
> +		if (ms && ms->svid == svid) {
> +			ms->error = error;
> +			if (cancel_delayed_work(&sel->work))
> +				schedule_delayed_work(&sel->work, 0);
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
> +			      const struct list_head *a, const struct list_head *b)
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
> +			ms = kzalloc(sizeof(*ms), GFP_KERNEL);
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
> +			       const unsigned int delay, const unsigned int timeout)
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
> +	sel = kzalloc(sizeof(*sel), GFP_KERNEL);
> +	if (!sel)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&sel->mode_list);
> +
> +	ret = device_for_each_child(&partner->dev, &sel->mode_list,
> +				    altmode_add_to_list);
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
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index 7e6c02d74b54f..70026f5f8f997 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -240,4 +240,44 @@ void typec_altmode_unregister_driver(struct typec_altmode_driver *drv);
>  	module_driver(__typec_altmode_driver, typec_altmode_register_driver, \
>  		      typec_altmode_unregister_driver)
>  
> +/**
> + * typec_mode_selection_start - Start an alternate mode selection process
> + * @partner: Handle to the Type-C partner device
> + * @delay: Delay between mode entry/exit attempts, ms
> + * @timeout: Timeout for a mode entry attempt, ms
> + *
> + * This function initiates the process of attempting to enter an Alternate Mode
> + * supported by the connected Type-C partner.
> + * Returns 0 on success, or a negative error code on failure.
> + */
> +int typec_mode_selection_start(struct typec_partner *partner,
> +			       const unsigned int delay, const unsigned int timeout);
> +
> +/**
> + * typec_altmode_state_update - Report the current status of an Alternate Mode
> + * negotiation
> + * @partner: Handle to the Type-C partner device
> + * @svid: Standard or Vendor ID of the Alternate Mode. A value of 0 should be
> + * passed if no mode is currently active
> + * @result: Result of the entry operation. This should be 0 on success, or a
> + * negative error code if the negotiation failed
> + *
> + * This function should be called by an Alternate Mode driver to report the
> + * result of an asynchronous alternate mode entry request. It signals what the
> + * current active SVID is (or 0 if none) and the success or failure status of
> + * the last attempt.
> + */
> +void typec_altmode_state_update(struct typec_partner *partner, const u16 svid,
> +				const int result);
> +
> +/**
> + * typec_mode_selection_delete - Delete an alternate mode selection instance
> + * @partner: Handle to the Type-C partner device.
> + *
> + * This function cancels a pending alternate mode selection request that was
> + * previously started with typec_mode_selection_start().
> + * This is typically called when the partner disconnects.
> + */
> +void typec_mode_selection_delete(struct typec_partner *partner);
> +
>  #endif /* __USB_TYPEC_ALTMODE_H */
> -- 
> 2.52.0.457.g6b5491de43-goog

-- 
heikki

