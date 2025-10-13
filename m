Return-Path: <linux-usb+bounces-29224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444EBD32CD
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 15:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA4D24F1CE7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633722FBDE9;
	Mon, 13 Oct 2025 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UV8ToDkj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008F52ED16C
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361624; cv=none; b=KTvVSzzfRv08wR+H6JmdEFlcHXoDwCJvc885gQY+Y3/UlBgtYsKOjlpLvA1ulR4f/143B/doo9eDr+dUogesGFhl/lBjZU4/1PyZpc2jH9Kq2wcTGVSILtaTA01lGdAR1VJwI5/OvVknHlsuJ1yk4KwPKsJlkrMSBGhPILUJU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361624; c=relaxed/simple;
	bh=rXV0fds9B1v7gxEiRs65qq3FNKRIItR+U3fJUn5DNOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZReUCi+zJzciLbacpG6NP4YLK7HZAXXNXfs7TXjuEwkB5T4yJ2ibuOPf4Mq6eQjX3sSB4KjAA/H3v7FDtqlkEu53yY2IApYpEmBJnuskO4XfMcuN+RB1Mq9zqlZ7APg2MxmV5vO1FyUa7Jz8J/DcET5ObLmxgK6QN55WV6LMjag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UV8ToDkj; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-87a0801ba1aso695792085a.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760361621; x=1760966421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2n+RCiiUDMgQ680dOwRMZVisWUQ0Cid1LV8qSVmQelA=;
        b=UV8ToDkjA1YLjeWiAGD1UTgRbjs1+iAb/BlmEbYzScYswzmWkMhSYHbx33403jOZYj
         w28ZDAfbOESvJNtCn/PkAOVS4SBRWoXbG1s8HUGOaqwnjfhqYReXSXlRu7an2SUgqo42
         XWtjRQju0cWUBH7rKDF70OGTG3dXMHkbj+LgNO+CSmTaznhJihcr0xXecJ88+I+c1rZd
         y5Ok4l57AkVFJwFT09pdqOubUGIMzHdi6BYon7uBEy/gAZYJ0Z8WwFy/6gPeu0C5Qc12
         XwfMsT1fmbGq8EG/j1ntwafl2NVK2Z9furKGGuX/qyte+KrFEZEbWmPGdjYdes4JKxYp
         kccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361621; x=1760966421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n+RCiiUDMgQ680dOwRMZVisWUQ0Cid1LV8qSVmQelA=;
        b=oPrLLcP+e2ZDbJFYi0PiJNHpjmxfHghhURRKYlmLzR3KO0/OWKOjGedQ9xRXNR7c50
         QR3tANZk3LUy34sZPKHLtrKoF/qwcqgH3fu+WmTQebRHG2C1IGg8+e9LeRQgxIGKn0/i
         xUoea2xVrzdND7W0bpCfF36DgipfwK8e91yExvKX6WcG99dkWdsDpBW7D0OL8cp1jMz8
         izaZBbHO5s1pLYs/krAVdAFCupx65QPr5j65FFDElEuSSAhvsAFQceY7JMswBHslPlqa
         UOXk/p0OueVNlIwjR4fOEdf+cZscZ722/jtVI4AydotMSaiSi+NAoAl9kM6cHbghnd2b
         HGHA==
X-Forwarded-Encrypted: i=1; AJvYcCUEHbgUBw8tbCm7cputdj0PYgueZ8TcSPHGqfD3EtHuLmXYnKfKwbiOkrus/Yonrxi7qU+28gnnrQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkk6MDZv6tbk1W1enupU6nnf/k0iZe4F+WSr3KHF4MDHehOfVK
	U7ArTThlEJDJS9v1D3WuPCrfSknFqxuoYM5N65Ph048YmBurNGiuNDWRVSy/hc7p6Q==
X-Gm-Gg: ASbGnctbp56KCr4CxExftzCvUbtTDiVSPwNMXrSlUS1thBMvTDuCxXl99PARul+iC6Y
	UPhax6VgueH2KH5TaqvvL+SPtPj1aKKRkagRRDr00qvFPyv1Yq/X6vq8TT9GEKC/nCFlq0ZgZTT
	2/szCJruRsAAJ4HZuMMZweHATrYaVV5NkhmtT7X/m46JqWMsp6YOFJN3OIQa/J2OhiRvCkQkpqh
	tkkzhdu1II/B1VHMIzV2lPSSV8RYcUUVhxTfbmEVQDa2DYXn1Lj004PemJrA7TAAU25ptf/Der1
	L3FcJDXVzXOtiT00b78hkwXJIfL86k50PXWhj6UsfmGVIKrs+ze+f/11r14uQQZ6p4MwxejB9zQ
	fTcipOnPvKaXD3NMCXDooxL2FR3S6VLEQNljFc93zMmJJ9zk3dgHdSpNwNI9E
X-Google-Smtp-Source: AGHT+IEsktcyZXTmjmkc0IMUs1Jez/57JKser25HCURDfRyeYL/F0Rlchb1Ae85iPm8JBoW2YiKDiQ==
X-Received: by 2002:a05:620a:1a1a:b0:84b:39e6:898c with SMTP id af79cd13be357-8835059f271mr2792611785a.25.1760361620852;
        Mon, 13 Oct 2025 06:20:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::20b3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849fe85989sm991583485a.28.2025.10.13.06.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:20:20 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:20:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: core: Add tracepoints for device allocation and
 state changes
Message-ID: <66a98159-b75c-41f0-8b4d-0ce9b1c8e4ec@rowland.harvard.edu>
References: <20251013-usbcore-tracing-v1-0-b885a3121b09@google.com>
 <20251013-usbcore-tracing-v1-2-b885a3121b09@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-usbcore-tracing-v1-2-b885a3121b09@google.com>

On Mon, Oct 13, 2025 at 10:01:23AM +0800, Kuen-Han Tsai wrote:
> Introduce new tracepoints to the USB core to improve debuggability of
> USB device lifecycle events.
> 
> The following tracepoints are added:
> 
> - usb_alloc_dev: Triggered when a new USB device structure is allocated,
> providing insights into early device setup.
> - usb_set_device_state: Triggered when the USB device state changes,
> allowing observation of the device's state transitions.
> 
> These tracepoints capture detailed information about the USB device,
> including its name, speed, state, bus current value, and authorized
> flag. This will aid developers in diagnosing issues related to device
> enumeration within the USB subsystem.
> 
> Examples:
>  usb_alloc_dev: usb 1-1 speed 0 state 1 0mA [authorized]
>  usb_set_device_state: usb 1-1 speed 0 state 2 0mA [authorized]
>  usb_set_device_state: usb 1-1 speed 2 state 5 500mA [authorized]
>  usb_set_device_state: usb 1-1 speed 2 state 5 500mA [authorized]
>  usb_set_device_state: usb 1-1 speed 2 state 6 500mA [authorized]
>  usb_set_device_state: usb 1-1 speed 2 state 7 500mA [authorized]
>  usb_set_device_state: usb 1-1 speed 2 state 8 500mA [authorized]
>  usb_set_device_state: usb 1-1 speed 2 state 0 500mA [authorized]
> 
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---

> diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
> index 766000b4939ef937a04848aa9cc45d8bb8860fe5..11647942ff3ae6c688dac043218f7d886a3e2f88 100644
> --- a/drivers/usb/core/Makefile
> +++ b/drivers/usb/core/Makefile
> @@ -3,10 +3,14 @@
>  # Makefile for USB Core files and filesystem
>  #
>  
> +# define_trace.h needs to know how to find our header
> +CFLAGS_trace.o                  := -I$(src)
> +
>  usbcore-y := usb.o hub.o hcd.o urb.o message.o driver.o
>  usbcore-y += config.o file.o buffer.o sysfs.o endpoint.o
>  usbcore-y += devio.o notify.o generic.o quirks.o devices.o
>  usbcore-y += phy.o port.o
> +usbcore-y += trace.o

This looks a little odd.  Why not put trace.o at the end of the 
preceding line?

> diff --git a/drivers/usb/core/trace.h b/drivers/usb/core/trace.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..db6edf570640e7af0598ccf2c7bd71b187605a42
> --- /dev/null
> +++ b/drivers/usb/core/trace.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Google LLC
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM usbcore
> +
> +#if !defined(_USB_CORE_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _USB_CORE_TRACE_H
> +
> +#include <linux/types.h>
> +#include <linux/tracepoint.h>
> +#include <linux/usb.h>
> +
> +DECLARE_EVENT_CLASS(usb_core_log_usb_device,
> +	TP_PROTO(struct usb_device *udev),
> +	TP_ARGS(udev),
> +	TP_STRUCT__entry(
> +		__string(name, dev_name(&udev->dev))
> +		__field(enum usb_device_speed, speed)
> +		__field(enum usb_device_state, state)
> +		__field(unsigned short, bus_mA)
> +		__field(unsigned, authorized)
> +	),
> +	TP_fast_assign(
> +		__assign_str(name);
> +		__entry->speed = udev->speed;
> +		__entry->state = udev->state;
> +		__entry->bus_mA = udev->bus_mA;
> +		__entry->authorized = udev->authorized;
> +	),
> +	TP_printk("usb %s speed %d state %d %dmA [%s]",
> +		__get_str(name),
> +		__entry->speed,
> +		__entry->state,

Suggestion: Rather than printing the meaningless numerical value of 
__entry->state, print the string value returned by 
usb_state_string(__entry->state).

Alan Stern

