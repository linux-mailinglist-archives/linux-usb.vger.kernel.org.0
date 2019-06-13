Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 789D344DDE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 22:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfFMUyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 16:54:03 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:60766 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725747AbfFMUyD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 16:54:03 -0400
Received: (qmail 6064 invoked by uid 2102); 13 Jun 2019 16:54:02 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Jun 2019 16:54:02 -0400
Date:   Thu, 13 Jun 2019 16:54:02 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <oneukum@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1560434431.11184.13.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1906131648180.1307-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 13 Jun 2019, Mayuresh Kulkarni wrote:

> Hi Alan,
> 
> Thanks for your review and apologies for late response from me. I was on PTO last week and then in a training this week.
> 
> > Aside from the issues Greg raised, it isn't right because it relies on 
> > the suspend and resume callbacks for individual interfaces, not for the 
> > whole device.  There are a few other things that should be changed as 
> > well.
> 
> In our use-case, we open the USB device with our VID/PID and then using that fd
> we bind to our interface. So this approach probably worked for our use-case.

Yes.  But it seems more reliable to use suspend/resume information for 
the whole device, instead of assuming that the userspace program will 
have claimed an interface.

> > Below is my attempt at doing the same thing (not tested, and it doesn't
> > answer all of Greg's objections).  It is very similar to your patch.  
> > Does it work for your application?
> > 
> 
> I am checking your code-changes and will get back to you on this by next week.
> 
> > (Note: I imagine you might run into trouble because devices generally 
> > do not get put into runtime suspend immediately.  So if you call the 
> > USBDEVFS_SUSPEND ioctl and then the USBDEVFS_WAIT_FOR_RESUME ioctl, the 
> > wait will return immediately because the device hasn't yet been 
> > suspended.)
> > 
> 
> For this point, I am suggesting below -
> How about we return "udev->dev.power.usage_count" from suspend ioctl?
> count = 0 -> suspend success so good to call wait-for-resume ioctl
> count != 0 -> don't call resume since suspend did not happen.
> 
> Will that work?

No, it will not.  The usage_count value can change at any time, so it 
will be out-of-date by the time the ioctl returns.  Furthermore, even 
if usage_count is > 0 when the suspend ioctl returns, it may become 0 
later on, and the device will be suspended some time after that.

In fact, if you use the default settings for USB autosuspend, the 
device won't be suspended until 2 seconds after the usage_count becomes 
0.  So even if the suspend ioctl decrements usage_count to 0, the 
device still won't be suspended right away.  If you call the 
wait-for-resume ioctl immediately, the call will fail.

Alan Stern

