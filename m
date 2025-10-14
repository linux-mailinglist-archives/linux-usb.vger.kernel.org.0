Return-Path: <linux-usb+bounces-29265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB99BD6D35
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 02:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709434045DC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 00:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D551DFFD;
	Tue, 14 Oct 2025 00:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xgNn19aJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918A2F5B
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 00:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760400356; cv=none; b=YGwUN890Bd+jYUOj9O9d7azaQVALKlfKLpa0pYVI7eM2nSZvULO+4WcjyjudZCUoPsBmQClO4O2qZoDyx/1/tkCENnDxefwDkLIs7+MKjLwjrxgxRBaUAhiKdV2ZXmIO3a1ev98yk1+lH0qtBeBN9ROXrP91BQFXE19/xtv5eBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760400356; c=relaxed/simple;
	bh=ZW0TjO8mF1FHzw0/oTa62CuEXz+cYh0vTI3Dl5rRkNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZY47Rzbj5BXBGkndq/iikC35DRl/yY8Edvh/gngBuGRwNz6XM4txCK+qm4dWRyTpckPCVRmvybhkJ5LcKvuQbCsb+YIXTSyGcH0nO8L4V2cTf6XFVZitlQ4FbWgMzqGGOok8ivmIfDQ9IW8a3BMqdf+rfpf3Uv5YHLllTW5LQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xgNn19aJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e3bcf272aso150585e9.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 17:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760400352; x=1761005152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7P6bmZmynaNeCh8SGWSoQQA9un1Bs0HvNnViceNuL0=;
        b=xgNn19aJ95Ji7aLr2bC681aqgzYSyijS707mmdX/nLcyUxDhs0OsleT7nn3JKsXKPa
         HEbrwqVt+lMrcQ1sKTdJ40LQfj4VX5/misXiwHIfwpCVUP6vz4W7t2ufWpXeRRn7lCN9
         BUWU98WwzXTt13HP0XacuyVP1cOqLcgb3RqoSSHbhFm858qDpDTq+CcTY3/MRdnoLnJY
         7hyfMcIj9xwfdqpbFsjBOVb5U1vomShjhWNlSAfWjw401V4PGeRpVqcAq3Xre6WVZUyf
         FLSRwG5xSszG9QJe0wmnSDuWoK1HazAT4cqqJ82ucAyNiApkgYh8WweowueT5tpsWLA5
         t1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760400352; x=1761005152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7P6bmZmynaNeCh8SGWSoQQA9un1Bs0HvNnViceNuL0=;
        b=xUUqUbQgoYR5TKeP9TnUfexCoggTyibtoBFQUJOfQPC9A5Tcm1XxqGtXJpD1NE52+w
         HVVEz27SHQRuTAIq7YzqZB1HIEUkyu5ojQrUWwIihipNACHbM8U8VVQr2Vw3yyBKjtug
         XguLhLmtF3MC5AC1LDuB5aNVMVOg6HLejKszdNVGohiOcM3JwPnLN9/PgfLIFJWFCnAu
         rR1Ng52YhfLXcqwGg0ertgsz0HCQl86Zyz/Z0lCunfvqI3Ilx7gZvRUQXp1oC9GdZP2S
         wc8DyWA5XZQIio3roQAC1a9EeOsVCVERjeO2XvvGRPm9xoho6ZPp7MD3nUH+VEkqLgHo
         bYow==
X-Forwarded-Encrypted: i=1; AJvYcCW1zhWE/G3Pa5Te0xLbTPoa/m5wwo5oPzH2WGX/1pQG0QDahh0EDV2se/7WqYTyeYgrs4laAb6BA38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw0c5Mznh1SjVUbt+ffJIAkLcpAhzPV3Mg4FSI+qL+AbouNKsq
	4eQ+2nldRursPmWr1EBhUnaqBXf+FOecF42jmAfXPeSduVKfagOnPE65iNW091FPeBsToFOceCg
	Uqj5BOa8Kbe6gJbjeI/qIwiAKKMRERbQCH4QFF/Dj
X-Gm-Gg: ASbGncvdXPWpjTCemlP/UDe1VT9s3ZfgZDhhC3XBIT6z39di/QBWxFH6Vh1BrzdJe7b
	wP+wNBXKsvDcwHSdUWPZhWVR5X749PBZkf1BRoRk2kV3TgbGTr9AQ8b4c8i1brwDDIg+HPy7HRV
	f1xPBIMzFCuFW8ua5uYFa/T7XlIWoR0C2uQHX6RzH55ZYI5M0b+TV8md3cGl1j/3qxmAmkPTlg0
	EJ+dQxAQsU+i/WbbQmcVrft0sZcvOJ3/MkUf1zPwI9kdYHL+Ni39znz8G0BQaiCCQ==
X-Google-Smtp-Source: AGHT+IESz2Nfr1qQ6O3uWGKLV0SssE6FbG3HaJH4beHMdfTaOg2FXCV3YUDF/ccarAoxg2eEGJgZSJNtSdkPd1kPSgo=
X-Received: by 2002:a05:600d:426e:b0:45f:2949:7aa9 with SMTP id
 5b1f17b1804b1-46fa9b33c8cmr11599015e9.6.1760400352114; Mon, 13 Oct 2025
 17:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-usbcore-tracing-v1-0-b885a3121b09@google.com>
 <20251013-usbcore-tracing-v1-2-b885a3121b09@google.com> <66a98159-b75c-41f0-8b4d-0ce9b1c8e4ec@rowland.harvard.edu>
In-Reply-To: <66a98159-b75c-41f0-8b4d-0ce9b1c8e4ec@rowland.harvard.edu>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 14 Oct 2025 08:05:25 +0800
X-Gm-Features: AS18NWA6HfDM9IzVCaX-8K42nTN8r-fCH8vlTlXN-a7nDQhpjsEsC3RNo-g0l8I
Message-ID: <CAKzKK0pzfSFJ15esnGB9gY_HMrgubZ1QtSkLOUo2FvsNGtCi6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: core: Add tracepoints for device allocation and
 state changes
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Mon, Oct 13, 2025 at 9:20=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Oct 13, 2025 at 10:01:23AM +0800, Kuen-Han Tsai wrote:
> > Introduce new tracepoints to the USB core to improve debuggability of
> > USB device lifecycle events.
> >
> > The following tracepoints are added:
> >
> > - usb_alloc_dev: Triggered when a new USB device structure is allocated=
,
> > providing insights into early device setup.
> > - usb_set_device_state: Triggered when the USB device state changes,
> > allowing observation of the device's state transitions.
> >
> > These tracepoints capture detailed information about the USB device,
> > including its name, speed, state, bus current value, and authorized
> > flag. This will aid developers in diagnosing issues related to device
> > enumeration within the USB subsystem.
> >
> > Examples:
> >  usb_alloc_dev: usb 1-1 speed 0 state 1 0mA [authorized]
> >  usb_set_device_state: usb 1-1 speed 0 state 2 0mA [authorized]
> >  usb_set_device_state: usb 1-1 speed 2 state 5 500mA [authorized]
> >  usb_set_device_state: usb 1-1 speed 2 state 5 500mA [authorized]
> >  usb_set_device_state: usb 1-1 speed 2 state 6 500mA [authorized]
> >  usb_set_device_state: usb 1-1 speed 2 state 7 500mA [authorized]
> >  usb_set_device_state: usb 1-1 speed 2 state 8 500mA [authorized]
> >  usb_set_device_state: usb 1-1 speed 2 state 0 500mA [authorized]
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
>
> > diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
> > index 766000b4939ef937a04848aa9cc45d8bb8860fe5..11647942ff3ae6c688dac04=
3218f7d886a3e2f88 100644
> > --- a/drivers/usb/core/Makefile
> > +++ b/drivers/usb/core/Makefile
> > @@ -3,10 +3,14 @@
> >  # Makefile for USB Core files and filesystem
> >  #
> >
> > +# define_trace.h needs to know how to find our header
> > +CFLAGS_trace.o                  :=3D -I$(src)
> > +
> >  usbcore-y :=3D usb.o hub.o hcd.o urb.o message.o driver.o
> >  usbcore-y +=3D config.o file.o buffer.o sysfs.o endpoint.o
> >  usbcore-y +=3D devio.o notify.o generic.o quirks.o devices.o
> >  usbcore-y +=3D phy.o port.o
> > +usbcore-y +=3D trace.o
>
> This looks a little odd.  Why not put trace.o at the end of the
> preceding line?
>

Thanks for the review. I will move trace.o to the preceding line.

> > diff --git a/drivers/usb/core/trace.h b/drivers/usb/core/trace.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..db6edf570640e7af0598ccf=
2c7bd71b187605a42
> > --- /dev/null
> > +++ b/drivers/usb/core/trace.h
> > @@ -0,0 +1,61 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2025 Google LLC
> > + */
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM usbcore
> > +
> > +#if !defined(_USB_CORE_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> > +#define _USB_CORE_TRACE_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/tracepoint.h>
> > +#include <linux/usb.h>
> > +
> > +DECLARE_EVENT_CLASS(usb_core_log_usb_device,
> > +     TP_PROTO(struct usb_device *udev),
> > +     TP_ARGS(udev),
> > +     TP_STRUCT__entry(
> > +             __string(name, dev_name(&udev->dev))
> > +             __field(enum usb_device_speed, speed)
> > +             __field(enum usb_device_state, state)
> > +             __field(unsigned short, bus_mA)
> > +             __field(unsigned, authorized)
> > +     ),
> > +     TP_fast_assign(
> > +             __assign_str(name);
> > +             __entry->speed =3D udev->speed;
> > +             __entry->state =3D udev->state;
> > +             __entry->bus_mA =3D udev->bus_mA;
> > +             __entry->authorized =3D udev->authorized;
> > +     ),
> > +     TP_printk("usb %s speed %d state %d %dmA [%s]",
> > +             __get_str(name),
> > +             __entry->speed,
> > +             __entry->state,
>
> Suggestion: Rather than printing the meaningless numerical value of
> __entry->state, print the string value returned by
> usb_state_string(__entry->state).

I kept it consistent with the udc_log_gadget tracepoint, which also
uses the numerical value for the USB state.

If we change the state to a string, should we convert the speed field
to a string using usb_speed_string()?

I lean toward keeping both as numerical values, but I am happy to
switch both to strings if you prefer. Please let me know what you
think is best.

Regards,
Kuen-Han

>
> Alan Stern

