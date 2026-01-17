Return-Path: <linux-usb+bounces-32458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F976D39084
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 20:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ECF3301B481
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 19:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68CD2DAFAA;
	Sat, 17 Jan 2026 19:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e3rKWINe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D278A2C2368
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678109; cv=none; b=l6cy/HE5mG2ibHWjb0qIh3sqjPTgchvwrn7XoKqC+ueRd+LV/unS8zgKNhTrvKvr79ztEqrgUAGxkECIgcqXeQHd77sGKphaowFB1RAfkMjejYP9QT6dG4WBk6g/gf9t5cUDIXiAFBLPL76bIWWmdsLt+7UBHucDi62Lm2RAqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678109; c=relaxed/simple;
	bh=Wg5Xqnwy2vbbtX9RTMyBaGJiW5IhHY0ZZ63Omd67Q6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NK31GMXAOJNp6BDCcdlVVPKCYox9ffGCerG7Ql5hmv8f/GV7JMpqK/k3qpx3CfUSpOhX2p9aJMsc4YIKUBm6y9gwlg+ZcBdGQkaUJZ2FCvPvVMYSesnIukrPR86eccGyFdMXetw3eedVjLcNDx67jYvdOR9DZ6Do8F7K9tZsd7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e3rKWINe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so1989187a91.1
        for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 11:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768678107; x=1769282907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZTF1+LgXV/vIjF0ra+qRa28WGiK3BElrTtPKASsQpU=;
        b=e3rKWINegXv5WY5dn1rSa5ku3cgeCGKjjf+HDbr7DzqYG1bSh+6eUQyc463gRufjUM
         TJxq6TxWIg/DljUQd81EnpYQ3D/fn02kljJKnl4k0peOj55WPwp+/eYN+UE6H3hRK66S
         Y6HIWwwshLi6vBDkUSZxrTZxkkK5cm+vD+WnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768678107; x=1769282907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hZTF1+LgXV/vIjF0ra+qRa28WGiK3BElrTtPKASsQpU=;
        b=iYdw57arb4pSidAbr5kC7nnBiq4wnbMtdmnyvH7Oo7CFr2sfzbJ+iM6z1ruMvJ0KC2
         JKRF0kC+nNZdxVMcenuo5yBfTuTboAv/ouSUSaLxQWcHBlRzslsmTtlcvaqCqiAQ2sGy
         2z0mzaclzr9MZinK5NH67oUmIO1vx0EGrgVq5j4d+tsUbND/HIxmWiItMHNJnkDYqb/A
         brJ6Et0H8jOPR1nuAlQuehbJNQh1V6Y4ySRzQGwMsccxphJnvLPm+t+RovXTCOVc5Rul
         qzRNozPVzV4M5kT6hMz7k9+WtDqO25vHTt9PHc0PftIIPuPUe39v+M7/7mxpj82WKXtd
         Za0w==
X-Forwarded-Encrypted: i=1; AJvYcCWyPZDGUXYtD5UnEhtQBu4kdKBNaYs91y3tKTZcUpcwvvhmIRxnoMHkHiMob8xqu5VLEzQWXCXIs98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYyTGFtJ2a+xiEemJ1P9Z1iiR+Uw+y6oWnD/OLu0qxy98VKMZ
	zxI4MXLNtwPSxrqWgacdQ7I16cPIvFYCrw12hwN7BpmvFO5abI61TRgHzPrPEYX7OrerNGDHGwY
	wToIZ79gOWOJCxkayGU9T2UTx8EtuE1yHGz0TVNqW
X-Gm-Gg: AY/fxX7LL/LLzmB7Hv5/dZ0QyA91dyWlFPeMq/7UkOZGsNgmkXN2NkSgFSAyw+XXbru
	r2oms3Fr9yCbpevpjRO6ooHdNMNukVWDFYeuXN2KBSHsGJUG4B6RyY5KX5FXVtK+FlZ0XJaAAJO
	kFRTa3/iNNwuKG6oxcTIp5PuyixJOt2NIWMW1IzWfdeXwjqFfR0FgHnf5XYIpVc7aGU0YEsctrV
	i4qFQbj4v3gmQ1ur/lxIFu3lEh7YcIVTl3a7zpyRXqAMPNuri3fgIR46wb2thbFZTxTUw==
X-Received: by 2002:a17:90b:570f:b0:32e:72bd:6d5a with SMTP id
 98e67ed59e1d1-35272bcba8cmr6159734a91.1.1768678106947; Sat, 17 Jan 2026
 11:28:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-6-akuchynski@chromium.org> <aWj_M-NH4RL8h-jy@kuha>
In-Reply-To: <aWj_M-NH4RL8h-jy@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Sat, 17 Jan 2026 20:28:15 +0100
X-Gm-Features: AZwV_QhME5I2zCA0dSsWE14FK0wJZAI3-PLyWEuk_WlQjvPiX1_S-nrQK_P-2Ps
Message-ID: <CAMMMRMepwLPExp4i3M-d3mD_55rcLPGRsB-wVjB0Z-+yzn75-Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] usb: typec: Implement mode selection
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Johan Hovold <johan@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 3:53=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Tue, Jan 13, 2026 at 01:05:33PM +0000, Andrei Kuchynski kirjoitti:
> > The mode selection process is controlled by the following API functions=
,
> > which allow to initiate and complete mode entry based on the priority o=
f
> > each mode:
> >
> > `typec_mode_selection_start` function compiles a priority list of suppo=
rted
> > Alternate Modes.
> > `typec_altmode_state_update` function is invoked by the port driver to
> > communicate the current mode of the Type-C connector.
> > `typec_mode_selection_delete` function stops the currently running mode
> > selection process and releases all associated system resources.
> >
> > `mode_selection_work_fn` task attempts to activate modes. The process s=
tops
> > on success; otherwise, it proceeds to the next mode after a timeout or
> > error.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/Makefile         |   2 +-
> >  drivers/usb/typec/class.h          |   2 +
> >  drivers/usb/typec/mode_selection.c | 288 +++++++++++++++++++++++++++++
> >  include/linux/usb/typec_altmode.h  |  40 ++++
> >  4 files changed, 331 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/usb/typec/mode_selection.c
> >
> > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> > index 7a368fea61bc9..8a6a1c663eb69 100644
> > --- a/drivers/usb/typec/Makefile
> > +++ b/drivers/usb/typec/Makefile
> > @@ -1,6 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_TYPEC)          +=3D typec.o
> > -typec-y                              :=3D class.o mux.o bus.o pd.o ret=
imer.o
> > +typec-y                              :=3D class.o mux.o bus.o pd.o ret=
imer.o mode_selection.o
> >  typec-$(CONFIG_ACPI)         +=3D port-mapper.o
> >  obj-$(CONFIG_TYPEC)          +=3D altmodes/
> >  obj-$(CONFIG_TYPEC_TCPM)     +=3D tcpm/
> > diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> > index 2e89a83c2eb70..d3435936ee7c8 100644
> > --- a/drivers/usb/typec/class.h
> > +++ b/drivers/usb/typec/class.h
> > @@ -9,6 +9,7 @@
> >  struct typec_mux;
> >  struct typec_switch;
> >  struct usb_device;
> > +struct mode_selection;
> >
> >  struct typec_plug {
> >       struct device                   dev;
> > @@ -39,6 +40,7 @@ struct typec_partner {
> >       u8                              usb_capability;
> >
> >       struct usb_power_delivery       *pd;
> > +     struct mode_selection   *sel;
> >
> >       void (*attach)(struct typec_partner *partner, struct device *dev)=
;
> >       void (*deattach)(struct typec_partner *partner, struct device *de=
v);
> > diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mod=
e_selection.c
> > new file mode 100644
> > index 0000000000000..63a1d251c72b4
> > --- /dev/null
> > +++ b/drivers/usb/typec/mode_selection.c
> > @@ -0,0 +1,288 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2025 Google LLC.
> > + */
> > +
> > +#include <linux/types.h>
> > +#include <linux/list_sort.h>
> > +#include <linux/slab.h>
> > +#include <linux/mutex.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/usb/typec_altmode.h>
> > +
> > +#include "class.h"
> > +
> > +/**
> > + * struct mode_state - State tracking for a specific Type-C alternate =
mode
> > + * @svid: Standard or Vendor ID of the Alternate Mode
> > + * @priority: Mode priority
> > + * @error: Outcome of the last attempt to enter the mode
> > + * @list: List head to link this mode state into a prioritized list
> > + */
> > +struct mode_state {
> > +     u16 svid;
> > +     u8 priority;
> > +     int error;
> > +     struct list_head list;
> > +};
> > +
> > +/**
> > + * struct mode_selection - Manages the selection and state of Alternat=
e Modes
> > + * @mode_list: Prioritized list of available Alternate Modes
> > + * @lock: Mutex to protect mode_list
> > + * @work: Work structure
> > + * @partner: Handle to the Type-C partner device
> > + * @active_svid: svid of currently active mode
> > + * @timeout: Timeout for a mode entry attempt, ms
> > + * @delay: Delay between mode entry/exit attempts, ms
> > + */
> > +struct mode_selection {
> > +     struct list_head mode_list;
> > +     struct mutex lock;
> > +     struct delayed_work work;
> > +     struct typec_partner *partner;
> > +     u16 active_svid;
> > +     unsigned int timeout;
> > +     unsigned int delay;
> > +};
> > +
> > +/**
> > + * struct mode_order - Mode activation tracking
> > + * @svid: Standard or Vendor ID of the Alternate Mode
> > + * @enter: Flag indicating if the driver is currently attempting to en=
ter or
> > + * exit the mode
> > + * @result: Outcome of the attempt to activate the mode
> > + */
> > +struct mode_order {
> > +     u16 svid;
> > +     int enter;
> > +     int result;
> > +};
> > +
> > +static int activate_altmode(struct device *dev, void *data)
> > +{
> > +     if (is_typec_partner_altmode(dev)) {
> > +             struct typec_altmode *alt =3D to_typec_altmode(dev);
> > +             struct mode_order *order =3D (struct mode_order *)data;
> > +
> > +             if (order->svid =3D=3D alt->svid) {
> > +                     if (alt->ops && alt->ops->activate)
> > +                             order->result =3D alt->ops->activate(alt,=
 order->enter);
> > +                     else
> > +                             order->result =3D -EOPNOTSUPP;
> > +                     return 1;
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int mode_selection_activate(struct mode_selection *sel,
> > +             const u16 svid, const int enter)
>
> You need to run these through "scripts/checkpatch.pl --strict".
> Please fix all the checks that it gives you.
>

Looks like I ran it without the "--strict" parameter.
My mistake, I'll fix it.

> > +
> > +     __must_hold(&sel->lock)
> > +{
> > +     struct mode_order order =3D {.svid =3D svid, .enter =3D enter, .r=
esult =3D -ENODEV};
> > +
> > +     /*
> > +      * The port driver may acquire its internal mutex during alternat=
e mode
> > +      * activation. Since this is the same mutex that may be held duri=
ng the
> > +      * execution of typec_altmode_state_update(), it is crucial to re=
lease
> > +      * sel->mutex before activation to avoid potential deadlock.
> > +      * Note that sel->mode_list must remain invariant throughout this=
 unlocked
> > +      * interval.
> > +      */
> > +     mutex_unlock(&sel->lock);
> > +     device_for_each_child(&sel->partner->dev, &order, activate_altmod=
e);
> > +     mutex_lock(&sel->lock);
> > +
> > +     return order.result;
> > +}
> > +
> > +static void mode_list_clean(struct mode_selection *sel)
> > +{
> > +     struct mode_state *ms, *tmp;
> > +
> > +     list_for_each_entry_safe(ms, tmp, &sel->mode_list, list) {
> > +             list_del(&ms->list);
> > +             kfree(ms);
> > +     }
> > +}
> > +
> > +/**
> > + * mode_selection_work_fn() - Alternate mode activation task
> > + * @work: work structure
> > + *
> > + * - If the Alternate Mode currently prioritized at the top of the lis=
t is already
> > + * active, the entire selection process is considered finished.
> > + * - If a different Alternate Mode is currently active, the system mus=
t exit that
> > + * active mode first before attempting any new entry.
> > + *
> > + * The function then checks the result of the attempt to entre the cur=
rent mode,
> > + * stored in the `ms->error` field:
> > + * - if the attempt FAILED, the mode is deactivated and removed from t=
he list.
> > + * - `ms->error` value of 0 signifies that the mode has not yet been a=
ctivated.
> > + *
> > + * Once successfully activated, the task is scheduled for subsequent e=
ntry after
> > + * a timeout period. The alternate mode driver is expected to call bac=
k with the
> > + * actual mode entry result via `typec_altmode_state_update()`.
> > + */
> > +static void mode_selection_work_fn(struct work_struct *work)
> > +{
> > +     struct mode_selection *sel =3D container_of(work,
> > +                             struct mode_selection, work.work);
> > +     struct mode_state *ms;
> > +     unsigned int delay =3D sel->delay;
> > +     int result;
> > +
> > +     mutex_lock(&sel->lock);
>
> guard(mutex)(&sel->lock); ?
>

Sounds great. Thanks

> > +     ms =3D list_first_entry_or_null(&sel->mode_list, struct mode_stat=
e, list);
> > +     if (!ms) {
> > +             mutex_unlock(&sel->lock);
> > +             return;
> > +     }
> > +
> > +     if (sel->active_svid =3D=3D ms->svid) {
> > +             dev_dbg(&sel->partner->dev, "%x altmode is active\n", ms-=
>svid);
> > +             mode_list_clean(sel);
> > +     } else if (sel->active_svid !=3D 0) {
> > +             result =3D mode_selection_activate(sel, sel->active_svid,=
 0);
> > +             if (result) {
> > +                     dev_dbg(&sel->partner->dev, "enable to exit %x al=
tmode\n",
> > +                                     sel->active_svid);
>
> "enable to exit" ?
>
> Just drop that dev_dbg.
>
> > +                     mode_list_clean(sel);
> > +             } else {
> > +                     sel->active_svid =3D 0;
> > +             }
> > +     } else if (ms->error) {
> > +             dev_dbg(&sel->partner->dev, "%x: entry error %pe\n",
> > +                             ms->svid, ERR_PTR(ms->error));
>
> dev_err (or dev_warn)?
>

I will change dev_dbg to dev_err and remove the message when exiting
the mode.

Thanks,
Andrei

