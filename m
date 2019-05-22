Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6475263BB
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 14:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfEVMXf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 08:23:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:58660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728438AbfEVMXe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 08:23:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82DE82173C;
        Wed, 22 May 2019 12:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558527814;
        bh=GlbBNYXcrjDRSqB/8QJc2vcGZsLKZdk7+9IZxNx26hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PEyEYLtYdoKPQL4o+7D4XKF5++uDV07gw4c9+qDCKYX/mZYJbMLkRuOu7BwXUE1bq
         7Mg0yQNb+NCeVWXHQi9NbJ5dqMFHo5ggf+FvWH5IoSeE9oJK5YiVTnOmLXbSdCgTbb
         nR+ACcfw+wGeVxljp2D493eWxzPxRzTd+EG6k1Qk=
Date:   Wed, 22 May 2019 14:23:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Adam Gausmann <agausmann@fastmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Raven Ridge xhci_hcd not working: "Refused to change power
 state, currently in D3"
Message-ID: <20190522122331.GA26771@kroah.com>
References: <1b819641-609b-4e0e-86a3-afe81eb73efc@www.fastmail.com>
 <20190522055135.GB13702@kroah.com>
 <6017fa4a-5b29-4c54-ada7-274dcefbaac7@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6017fa4a-5b29-4c54-ada7-274dcefbaac7@www.fastmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 22, 2019 at 05:54:20AM -0500, Adam Gausmann wrote:
> On Wed, May 22, 2019, at 00:51, Greg KH wrote:
> > On Tue, May 21, 2019 at 04:49:14PM -0500, Adam Gausmann wrote:
> > > On my ThinkPad E585, with a Ryzen 5 2500U, my XHCI driver crashes when plugging in a device after switching power states, or during switching itself.
> > > 
> > > Steps to Reproduce: 
> > > 
> > > - Unplug the AC power, or start the computer with AC unplugged. If the computer has AC power at boot, it will work properly, but plugging it in after running unplugged will not.
> > > 
> > > The xhci_hcd and xhci_pci modules remain loaded after the error. Reloading them appears to reset it, and the scenarios above still apply as if the computer was just started.
> > > 
> > > These tests were performed with laptop_mode disabled; enabling it alters the behavior. I will test that more later.
> > > 
> > > Results:
> > > 
> > > The USB device fails to register, and `lsusb` remains unchanged. No other errors will appear after the first one occurs.
> > > One of two error messages will appear in kernel logs:
> > > 
> > > [   51.276650] xhci_hcd 0000:05:00.4: Refused to change power state, currently in D3
> > > [   51.276658] xhci_hcd 0000:05:00.3: Refused to change power state, currently in D3
> > > [   51.277051] xhci_hcd 0000:05:00.3: enabling device (0000 -> 0002)
> > > [   51.277074] xhci_hcd 0000:05:00.3: WARN: xHC restore state timeout
> > > [   51.277077] xhci_hcd 0000:05:00.3: PCI post-resume error -110!
> > > [   51.279316] xhci_hcd 0000:05:00.3: HC died; cleaning up
> > > [   51.288669] xhci_hcd 0000:05:00.4: enabling device (0000 -> 0002)
> > > 
> > > [ 5258.438021] xhci_hcd 0000:05:00.3: Refused to change power state, currently in D3
> > > [ 5258.438328] xhci_hcd 0000:05:00.4: Refused to change power state, currently in D3
> > > [ 5258.450026] xhci_hcd 0000:05:00.3: enabling device (0000 -> 0002)
> > > [ 5258.450511] xhci_hcd 0000:05:00.4: enabling device (0000 -> 0002)
> > > [ 5266.112941] xhci_hcd 0000:05:00.3: Error while assigning device slot ID
> > > [ 5266.112952] xhci_hcd 0000:05:00.3: Max number of devices this xHCI host supports is 64.
> > > [ 5266.112963] usb usb1-port2: couldn't allocate usb_device
> > > [ 5280.960968] xhci_hcd 0000:05:00.3: Error while assigning device slot ID
> > > [ 5280.960979] xhci_hcd 0000:05:00.3: Max number of devices this xHCI host supports is 64.
> > > [ 5280.960993] usb usb1-port2: couldn't allocate usb_device
> > > 
> > > Expected results: 
> > > 
> > > Device connects, powers on, and registers properly, showing up in `lsusb`.
> > > 
> > > Build: 
> > > 
> > > Linux 4.19.44_1 #1 SMP PREEMPT Wed Mar 27 20:41:38 UTC 2019 x86_64 GNU/Linux, with firmware 20181218
> > 
> > 4.19 is pretty old for xhci and normal desktop systems.  Can you please
> > try 5.1 and see if that resolves the issue or not?
> > 
> > thanks,
> > 
> > greg k-h
> >
> 
> Hi Greg, thanks for your feedback.
> 
> I've just tested this on 5.1.3_1 with the same results as before. I
> should also note that I am using the kernel and firmware as packaged
> by Void Linux, and these appear to be the latest available from them.
> Should I try the latest firmware release from git.kernel.org as well?

I doubt you have any firmware here, this looks like an xhci issue.

Can you provide the log messages from 5.1.3?  They might be a bit
different.

thanks,

greg k-h
