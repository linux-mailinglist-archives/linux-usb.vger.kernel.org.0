Return-Path: <linux-usb+bounces-10066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8E8BE5C1
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 16:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 031801C20B93
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 14:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B65168AEB;
	Tue,  7 May 2024 14:21:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D063315ECEF
	for <linux-usb@vger.kernel.org>; Tue,  7 May 2024 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091662; cv=none; b=FoiMCO3vXMCHd3ffDCuCLxKuH2W8/0N8osJGe8DzFEJ5C/r+ysxDoYC4tXh3VD5l1hfOq4Qu/6poIZlhk6/Buaz/LpD7qz0+SrEqw26MvlIzkodZGXijfRqYUZIz5xd8/345K1j5KLM2GbX5YIkJBJUecEjB3znlLijSKaLsedE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091662; c=relaxed/simple;
	bh=c5McHtSIbch0/mrUJ24oPuBIAbDiUl8NEgKGaup13Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3MtsarDKCJdfADzD8Ddu+XUeCUnqrZ+G6YpSJUCAnrUlVBd6CULOA6FadbiSZVmSFbOdZ23xDfWQAGDB3rQEgEqJeQB2cm9a55Slpl7d8zq6uTP9ZaGwOqmvj6+XLipA49Et9kysxPIf6G+op/rwiA+5n1IFhwfCk/9xhWSZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 921082 invoked by uid 1000); 7 May 2024 10:20:58 -0400
Date: Tue, 7 May 2024 10:20:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
Message-ID: <8a8edaba-670b-47ad-a123-2077e2e0644d@rowland.harvard.edu>
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
 <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>
 <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu>
 <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>

On Tue, May 07, 2024 at 05:14:25PM +0530, Muni Sekhar wrote:
> Thank you, it is very helpful.
> 
> To verify the USB device suspend\resume functionality, I configured
> the USB Power Management variables as follows:
> 
> # cat /sys/bus/usb/devices/2-1.7/power/wakeup
> enabled
> 
> # cat /sys/bus/usb/devices/2-1.7/power/control
> on

This means that the device will be permanently on, and so it will never 
be suspended.  If you want to allow the device to be suspended, you 
have to write "auto" to the file.

> # cat /sys/bus/usb/devices/2-1.7/power/autosuspend_delay_ms
> 0
> 
> # cat /sys/module/usbcore/parameters/autosuspend
> 2
> 
> 
> So, I configured the system to autosuspend the USB device as soon as
> it becomes idle, with no transactions running through the USB device.
> Now, how can I verify that the USB device has entered suspend mode
> from user space? When checking /var/log/kern.log, there are no
> relevant print statements. Are there any other log files related to
> power management or USB subsystems?
> Please correct me if anything in the test procedure mentioned above is
> incorrect.

You can see the device's current state by reading the 
power/runtime_status attribute file in sysfs.  There are lots of other 
informative files in that directory; you should look at them.

If you want to get more debugging information in the kernel log, you can 
enable dynamic debugging for usbcore:

	echo module usbcore =p >/sys/kernel/debug/dynamic_debug/control

Alan Stern

