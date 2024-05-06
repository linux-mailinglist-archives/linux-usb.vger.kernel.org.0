Return-Path: <linux-usb+bounces-10056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8308BD5DB
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 21:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60B901C22089
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 19:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683DF15B0E2;
	Mon,  6 May 2024 19:50:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 5143F157E62
	for <linux-usb@vger.kernel.org>; Mon,  6 May 2024 19:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715025019; cv=none; b=uAWf62n7FjuDGu9bhzjjUSquJUyD+VLrXnstLrrSWd9iMWujgL2kxG1/WPl0ezGBUCuuD7Ak5OCp3OL/gDnlVb6PUFxj25uOl4egw3ouSWSQ9fwLCg9GWMaLb1XQTtzmqVk2HQSLevhNz2lf0feoZtcDU+Op5EGTRjn2VuvXRNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715025019; c=relaxed/simple;
	bh=37baw7qUEl/MmEMITS2inR1LBS0TlYopbdqJ6Sjbyu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aq10ljpcPWzFY9BqJKaeohj3DjKFtMFcgOhlOeleKVK+m/czFoQN9DF3liEzFWsw+CnxxjmxFGPa30AYcrI1Ny0rqQd/Nh7AyXZnrLUoPrNBF4ixjJrLtcO+aon1bLyxLGMVg5axs8i7+y43+cyxItfzQJJOhm2wdPPhMtbQ5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 890029 invoked by uid 1000); 6 May 2024 15:50:16 -0400
Date: Mon, 6 May 2024 15:50:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
Message-ID: <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu>
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
 <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>

On Mon, May 06, 2024 at 09:44:52PM +0530, Muni Sekhar wrote:
> On Mon, May 6, 2024 at 7:59 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, May 06, 2024 at 04:44:30PM +0530, Muni Sekhar wrote:
> > > While we have successfully converted most of the USB device driver
> > > functionality from kernel space to user space using libusb, we are now
> > > seeking guidance on how to implement USB device suspend/resume in user
> > > space. Specifically, we would like to know if libusb provides support
> > > for achieving the suspend/resume functionality mentioned above.
> > > Additionally, any insights or suggestions on how to accomplish this
> > > task would be greatly appreciated.
> >
> > Your question is about libusb, right?  So you'll get better answers if
> > you post it on the libusb mailing list rather than the linux-usb mailing
> > list.
> Can USB device suspend\resume  be implemented in user space driver
> using software other than libusb?

Yes, a userspace driver can use the usbfs interface and can employ the 
ioctl commands listed in /usr/include/linux/usbdevfs.h.  It's possible 
that libusb also provides facilities for controlling suspend and resume; 
I don't know whether it does.

> If so, what are those methods or techniques to achieve USB device
> suspend\resume , can you please provide clarity on this.

As far as I know, these usbfs ioctl commands are not documented 
anywhere.

The USBDEVFS_FORBID_SUSPEND ioctl prevents the device from being 
suspended, and wakes it up if it is currently suspended.

The USBDEVFS_ALLOW_SUSPEND ioctl allows the device to be suspended.  The 
suspend may not happen immediately; it is controlled by the settings in 
the device's power/control and power/autosuspend (or 
power/autosuspend_delay_ms) sysfs attribute files.

The USBDEVFS_WAIT_FOR_RESUME ioctl waits until the device resumes, 
whether because of a remote wakeup or because another process has 
resumed it, and then forbids the device from suspending again until 
you perform another USBDEVFS_ALLOW_SUSPEND ioctl.

Alan Stern

