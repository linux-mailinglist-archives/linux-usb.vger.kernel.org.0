Return-Path: <linux-usb+bounces-11783-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF5691C3B3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 18:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03AC5283DD7
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 16:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A242E1C9EB1;
	Fri, 28 Jun 2024 16:27:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 3FD441B94F
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719592027; cv=none; b=lbc3f5om+vtWHlwqzpY9yluA8ufpG/r5F1pjK3CEOgjg5JyUOe23C8yXVjTFsCbOEHOr/VzD3SC9NR8uMIMWhLHyUVRJlrzJUuLV1NWwrRDxeyqg88rYyOwf0vzW823sEgN2DhV+/LiUgjmbgftZib723EssVp14T1bJfHHU41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719592027; c=relaxed/simple;
	bh=ntrJ9FOQYqk3ISt9xSv0McV1UhZUfYv75Sjx8CS8+qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8vC2i6Qwj6Kk+GPff1inE+WNSFz/uZV1eaYK39tp8Nq9TQWEyvvoVj1Enrv9hQ03YxyqSpaVtfBOAej7vPDwZPVMp+gXau3hGHsw9dL3FNFY5bN6i0+P1ODLthguf6HSdnFUMim5gtV3IaWDGBjm3yBZDUmzH0/j5omqLGPwL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 776495 invoked by uid 1000); 28 Jun 2024 12:27:02 -0400
Date: Fri, 28 Jun 2024 12:27:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Darrion Ramos <darrionramos@gmail.com>,
  USB list <linux-usb@vger.kernel.org>
Subject: Re: Remote wake up in gadget drivers
Message-ID: <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>

On Fri, Jun 28, 2024 at 05:39:45PM +0200, Andrey Konovalov wrote:
> (syzkaller to bcc)
> 
> Hi Alan,
> 
> I hope you could you clarify some things wrt the remote wake up
> support in gadget drivers.
> 
> Please see the Darrion's message first:
> 
> On Fri, Jun 28, 2024 at 5:34 AM Darrion Ramos <darrionramos@gmail.com> wrote:
> >
> > Additionally, we have been looking into the raw_gadget and have 
> > noticed that the keyboard example (both a physical instance on a 
> > raspberry pi and the virtual instance) do not wakeup the host device 
> > from suspend.

I don't understand the second part.  With a virtual instance, the gadget 
is physically on the host.  So if the host is suspended, how can the 
gadget do anything at all, let alone wake up the host?

> >  It seems that the emulated device does not communicate 
> > to the host that it is a wakeup capable device. The 
> > /sys/bus/devices/.../power directory for the respective udc is 
> > missing the wakeup files that would enable this.

What you wrote here is not what you meant; there is no /sys/bus/devices/ 
path.  Did you mean /sys/bus/usb/devices/... on the host, or did you 
mean /sys/bus/platform/... (or whatever) on the RPi?

> >  From my research on 
> > this I only found that the usb_gadget struct for the device needs to 
> > have the wakeup_capable flag set for the host to recognize the 
> > device as a remote wakeup source. I have printed the value during 
> > the gadget_bind and it seems to be set so I am not sure what else 
> > could be causing the host to not have the device recognized for 
> > remote wakeup. If anybody has any ideas on what needs to be modified 
> > in the raw_gadget or any resources for looking into it more it would 
> > be greatly appreciated, thanks!

The /sys/bus/usb/devices/.../power/wakeup file on the host will 
generally reflect the setting of the USB_CONFIG_ATT_WAKEUP bit in the 
gadget's configuration descriptor bmAttributes byte.  The code that 
sets wakeup_capable is in drivers/usb/core/hub.c, in the 
usb_set_device_state() function.  You can see that it uses the 
USB_CONFIG_ATT_WAKEUP bit.

> I assume that to take advantage of remote wake up, the device needs to
> first of all set the USB_DEVICE_REMOTE_WAKEUP bit in bmAttributes.

That bit gets set when the host tells the gadget to enable remote 
wakeup.  And generally the UDC driver handles this, not the gadget 
driver.

> But then, is the wake up supposed to be initiated through the gadget
> driver or through the UDC sysfs files as the ones that Darrion
> mentioned?

The wakeup request is initiated by the gadget driver calling 
usb_gadget_wakeup().

> For the former case, I assume that adding a new ioctl to Raw Gadget
> that calls usb_gadget_wakeup() would be a way to support this?

Yes.

> AFAICS, only the g_zero gadget driver calls usb_gadget_wakeup(). Do
> the other gadget drivers just have no support for remote wake up?

Grep shows that function/u_ether.c also calls usb_gadget_wakeup().  I 
don't know about most of the gadget drivers.  The f_mass_storage driver 
has no need for remote wakeup, for example, and the same is probably 
true for a lot of the others.  You'd think that the f_hid function would 
support remote wakeup, but maybe nobody ever implemented it.

Alan Stern

