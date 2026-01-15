Return-Path: <linux-usb+bounces-32368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F95D22910
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 07:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6D9B3045CD1
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 06:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBB92236EB;
	Thu, 15 Jan 2026 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VygM8QSB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940F610785;
	Thu, 15 Jan 2026 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458730; cv=none; b=KzgSBjL4SF3yeal3SEfU2EL/kI47r81LdrWgLg0niT6VSL2H0GwvcP1xpto4GpslACP5y29WxRKyk1rTC5/By0TltV+R2jVhtsZ1F9JKNXZ05Vf8JdXkX6bt70TRyIxcAdr3aHtprVe3CyomLTPalhpsGlU1VcDapLVBcQaM1SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458730; c=relaxed/simple;
	bh=3y60AYF0aCXRC5WdJ0SjO3RCZQIbZnyQ61gy+12AcHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdrK6YSpRfKRQ1bx/xzp2mQZF05r1L1Qv5EwS9oStJRzuCfJp+pclXqqeiciAQ//GzeON+/ir9k7lyZQdRJF4JBWvncUibpurvwT2GTOa7m7oXVPl++lW5ICzPdEvOY2/N1rxjWwvNqaB5uT76iUEcc1UNxZdeYe7eRSJjcGF6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VygM8QSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BFAC116D0;
	Thu, 15 Jan 2026 06:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768458730;
	bh=3y60AYF0aCXRC5WdJ0SjO3RCZQIbZnyQ61gy+12AcHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VygM8QSBYtIFqXL6NV/pEroEeGxFEWmCUab1aJUWb+CX599wLTqipXiJKs3d38K9y
	 cifMUXOOS7Jfu9CqT9Uf56jLzxL3qFdrbi2TjOoUft3Hjz/ezJvEjubEXtGZcr3Blo
	 ShEgMZFAzLMF2Sf5ZI2JAM9wxG2ct3luLstZZEn8=
Date: Thu, 15 Jan 2026 07:32:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Cc: heikki.krogerus@linux.intel.com, andersson@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: mux: fix NULL pointer dereference in
 {typec_switch,mux}_put
Message-ID: <2026011541-froth-cabdriver-a214@gregkh>
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
>                                      T7: parent->driver = NULL
>   T8: typec_switch_put(sw)
>   T9: module_put(parent->driver->owner)
>       -> NULL pointer dereference!
> 
> [User-Triggerable Paths]
> Users can trigger this vulnerability through:
> 
>   1. sysfs unbind interface (requires root):
>      # echo "<device>" > /sys/bus/i2c/drivers/<driver>/unbind
> 
>   2. Module unloading (requires root):
>      # rmmod <switch_driver_module>
> 
>   3. USB Type-C hot-unplug (physical access):
>      Physically removing the USB-C device or its parent device
> 
> How to fix:
> Add NULL checks for both 'parent' and 'parent->driver' before calling
> module_put() in typec_switch_put() and typec_mux_put().
> 
> Fixes: 71793b579ba68 ("usb: typec: mux: Allow multiple mux_devs per mux")
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> ---
>  drivers/usb/typec/mux.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 182c902c42f6..6ed8bb999ee0 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -134,7 +134,8 @@ void typec_switch_put(struct typec_switch *sw)
>   for (i = 0; i < sw->num_sw_devs; i++) {
>     sw_dev = sw->sw_devs[i];
> 
> -   module_put(sw_dev->dev.parent->driver->owner);
> +   if (sw_dev->dev.parent && sw_dev->dev.parent->driver)
> +     module_put(sw_dev->dev.parent->driver->owner);
>     put_device(&sw_dev->dev);
>   }
>   kfree(sw);
> @@ -358,7 +359,8 @@ void typec_mux_put(struct typec_mux *mux)
> 
>   for (i = 0; i < mux->num_mux_devs; i++) {
>     mux_dev = mux->mux_devs[i];
> -   module_put(mux_dev->dev.parent->driver->owner);
> +   if (mux_dev->dev.parent && mux_dev->dev.parent->driver)
> +     module_put(mux_dev->dev.parent->driver->owner);
>     put_device(&mux_dev->dev);
>   }
>   kfree(mux);
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

