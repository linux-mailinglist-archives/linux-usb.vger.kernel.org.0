Return-Path: <linux-usb+bounces-32369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D3D22919
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 07:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0F68301FD0F
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 06:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8342A256C84;
	Thu, 15 Jan 2026 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="slEBXcIP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC5B221542;
	Thu, 15 Jan 2026 06:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458866; cv=none; b=fCc6lgRx7ajmUXKy2IqCZCPBG32nleB4GZXfm/yZ+mb0TktG4PVEigxH6uU+ZFhRchXNPaFjTYYwLG6mWE6AHW9xJLHh6DrjY1nNpaEG4ppa669x2dKNuk+om5ZhmQ4kmXgS2FnKefmNyl4JD/neoPFVOChQHA5QiLZohKsSkhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458866; c=relaxed/simple;
	bh=/e1LEyBe3Tk2wtMsK3QUbqJijJYCaPlJd08TOwvSul0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIxMk2njb5Hb2jNebIbRvYBv4tkqLSgHcoizvfu+yNZHMHMimc5FKkE3hGKjNw0LbK7z4o2PlX8HdPRiq9L5no5ZhPmMtcoA5bTLO5C7ZpHWMdCbHJ2sDh0SK8rc04HU+v7/kGZnHTaqGEi1X/EqX1zS8vcDUvLXSDKgb+FheUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=slEBXcIP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1731EC116D0;
	Thu, 15 Jan 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768458865;
	bh=/e1LEyBe3Tk2wtMsK3QUbqJijJYCaPlJd08TOwvSul0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slEBXcIPEz5+5HCaY+ZNb7DRUSqsRtNB2nSF9mHKG8I07QUVTUk/x5OCfw77cBJIX
	 eu1xXKGq1NgGEvC8AlH4OTT6VzvsvID2kY1IVxVrO0ojGbIhy6RgDq7U4LtTXIy9ad
	 kxsAvY3ERQ9YLbCYxDTw7sIGfVC2KWQJqqVUVDRQ=
Date: Thu, 15 Jan 2026 07:34:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Cc: heikki.krogerus@linux.intel.com, andersson@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: mux: fix NULL pointer dereference in
 {typec_switch,mux}_put
Message-ID: <2026011554-chute-sloppily-34bb@gregkh>
References: <CALEuBan7V-YVTyLif29E0hZx9nacbxJG1xSL6DspxEctDbdtLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALEuBan7V-YVTyLif29E0hZx9nacbxJG1xSL6DspxEctDbdtLg@mail.gmail.com>

On Thu, Jan 15, 2026 at 02:56:24AM +0800, 齐柯宇 wrote:
> This fix was discovered through static code analysis.
> 
> In typec_switch_put() and typec_mux_put(), the code directly dereferences
> sw_dev->dev.parent->driver->owner without checking if 'driver' is NULL.
> This can lead to a NULL pointer dereference kernel crash.
> 
> [Call Chain Analysis]
> The vulnerable functions are called through the following paths:
> 
>   Acquisition path (fwnode_typec_switch_get):
>     typec_port_register()           [class.c]
>       -> typec_switch_get()         [typec_mux.h]
>         -> fwnode_typec_switch_get() [mux.c]
>           -> class_find_device()    (gets device reference)
>           -> try_module_get(sw_devs[i]->dev.parent->driver->owner)
>           -> stores to sw->sw_devs[i]
> 
>   Release path (typec_switch_put):
>     typec_release()                 [class.c]
>       -> typec_switch_put()         [mux.c]
>         -> module_put(sw_dev->dev.parent->driver->owner)  <- BUG!
>         -> put_device(&sw_dev->dev)
> 
>   Registration path (typec_switch_register):
>     I2C/Platform driver probe()
>       -> typec_switch_register(dev, &sw_desc) [mux.c]
>         -> sw_dev->dev.parent = parent  (sets parent device)
>         -> device_add(&sw_dev->dev)
> 
> [Data Flow Analysis]
> The critical data flow is:
> 
>   sw_dev->dev.parent:
>     - Set by typec_switch_register() from the 'parent' parameter
>     - Typically an I2C or Platform device (e.g., &client->dev)
> 
>   sw_dev->dev.parent->driver:
>     - Managed by kernel driver model (drivers/base/dd.c)
>     - Set to driver pointer when driver binds (really_probe)
>     - Set to NULL when driver unbinds (__device_release_driver)
> 
> [Race Condition Scenario]
> The vulnerability can be triggered by the following race condition:
> 
>   Thread A (normal operation)        Thread B (attacker/event)
>   ----------------------------       -------------------------
>   T1: typec_port_register()
>   T2: fwnode_typec_switch_get()
>   T3: try_module_get(parent->driver->owner)
>   T4: store sw_devs[i]
>       ...
>                                      T5: echo <dev> > unbind
>                                      T6: device_driver_detach()

Are you sure that at this point things don't get synced up?

>                                      T7: parent->driver = NULL
>   T8: typec_switch_put(sw)
>   T9: module_put(parent->driver->owner)
>       -> NULL pointer dereference!

A parent should never be null.

> 
> [User-Triggerable Paths]
> Users can trigger this vulnerability through:

It's not a "vulnerability" given the definition of that word.

>   1. sysfs unbind interface (requires root):
>      # echo "<device>" > /sys/bus/i2c/drivers/<driver>/unbind
> 
>   2. Module unloading (requires root):
>      # rmmod <switch_driver_module>
> 
>   3. USB Type-C hot-unplug (physical access):
>      Physically removing the USB-C device or its parent device

I don't think that removing the device can cause this, have you tried?

What AI tool wrote this?  You always have to document your tools, right?

thanks,

greg k-h

