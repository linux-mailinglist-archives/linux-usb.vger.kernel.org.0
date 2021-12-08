Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFFC46CFC6
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 10:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhLHJOX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 04:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhLHJOV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 04:14:21 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEC5C061746
        for <linux-usb@vger.kernel.org>; Wed,  8 Dec 2021 01:10:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id F2B1FCE205A
        for <linux-usb@vger.kernel.org>; Wed,  8 Dec 2021 09:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4814BC00446;
        Wed,  8 Dec 2021 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638954646;
        bh=FNoDZ65zKdzy5cL1jsQjioUyzdx7+jg46AwYdLP7JXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eH7wgaSGR8eoiEjAxWxVnuS3OKES5NTbz6jPbwHOgoNncpJKGo7wqlPYjIMgoKOY6
         /k5xDsBUk9cEWFuP6g9qzl2M4b/WrKWlsoU8tUa5lLiaiKyc+yFYh5BniU11rXYPdX
         o962n84fZadYgOslCc6nCfhoyFk5OcR7GEwEobAY=
Date:   Wed, 8 Dec 2021 10:10:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Chugh, Sanjeev" <Sanjeev_Chugh@mentor.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
 release
Message-ID: <YbB2j+eyc3Mdc7iv@kroah.com>
References: <1638320288-6465-1-git-send-email-sanjeev_chugh@mentor.com>
 <YaoS3RoqkGkf6NFa@kroah.com>
 <361b7459f1d64f5e8b7bccaa2dd536e5@svr-ies-mbx-01.mgc.mentorg.com>
 <Ya96omTSiwDNoRu5@kroah.com>
 <f400fe3c8a744203b20aebb6c83a029a@svr-ies-mbx-01.mgc.mentorg.com>
 <YbBY5TWsbjqEgfi2@kroah.com>
 <6871470e531b4d79b02abd1c10a53a5d@svr-ies-mbx-01.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6871470e531b4d79b02abd1c10a53a5d@svr-ies-mbx-01.mgc.mentorg.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 08, 2021 at 07:26:08AM +0000, Chugh, Sanjeev wrote:
> 
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Wednesday, December 8, 2021 12:34 PM
> > To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> > Cc: linux-usb@vger.kernel.org
> > Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
> > release
> > 
> > On Wed, Dec 08, 2021 at 06:58:23AM +0000, Chugh, Sanjeev wrote:
> > > Hi Greg,
> > >
> > > > -----Original Message-----
> > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > Sent: Tuesday, December 7, 2021 8:46 PM
> > > > To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> > > > Cc: linux-usb@vger.kernel.org
> > > > Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub
> > > > mutex release
> > > >
> > > > On Tue, Dec 07, 2021 at 05:54:06AM +0000, Chugh, Sanjeev wrote:
> > > > > Hello Greg,
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > > > Sent: Friday, December 3, 2021 6:22 PM
> > > > > > To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> > > > > > Cc: linux-usb@vger.kernel.org
> > > > > > Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb
> > > > > > hub mutex release
> > > > > >
> > > > > > On Wed, Dec 01, 2021 at 06:28:08AM +0530, Sanjeev Chugh wrote:
> > > > > > > Rogue usb sticks can cause endless port connect change events
> > > > > > > due to unstable electric connection between usb chip and the port.
> > > > > > > Port connect change will cause device enumeration for the new
> > > > > > > device connection and new device processing is done with the
> > > > > > > usb hub mutex acquired. This can cause very short time gap
> > > > > > > between unlock/lock of hub device mutex. So if some thread is
> > > > > > > running at low priority than hub_thread, it can face hub device mutex
> > starvation.
> > > > > > >
> > > > > > > This commit introduces a sleep of 25ms after the hub device
> > > > > > > mutex is unlocked in hub_events so that if hub_thread is stuck
> > > > > > > in a endless loop, all other threads will get fair amount of
> > > > > > > chance to acquire the usb hub mutex.
> > > > > > >
> > > > > > > Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
> > > > > > > ---
> > > > > > >  drivers/usb/core/hub.c | 11 +++++++++++
> > > > > > >  1 file changed, 11 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > > > > > index 00070a8..0be2acc 100644
> > > > > > > --- a/drivers/usb/core/hub.c
> > > > > > > +++ b/drivers/usb/core/hub.c
> > > > > > > @@ -5763,6 +5763,17 @@ static void hub_event(struct
> > > > > > > work_struct
> > > > > > > *work)
> > > > > > >  out_hdev_lock:
> > > > > > >  	usb_unlock_device(hdev);
> > > > > > >
> > > > > > > +	/*
> > > > > > > +	 * Rogue usb sticks can cause endless device connection
> > > > > > > +	 * events due to unstable electric connection.
> > > > > >
> > > > > > What is a "usb stick"?  Any usb device could cause this, right?
> > > > >
> > > > > In my test case, I have used a usb pen drive of Sandisk Make of 32 GB
> > capacity.
> > > > But yes, any faulty usb device or even faulty usb cable used for the
> > > > usb device connection can cause this issue.
> > > > > >
> > > > > > > This
> > > > > > > +	 * can cause very short time gap between unlock/lock
> > > > > > > +	 * of hub device mutex thus causing mutex starvation
> > > > > > > +	 * for some other lower priority thread. Thus sleep
> > > > > > > +	 * would give fair chance to all other threads to
> > > > > > > +	 * acquire the usb hub mutex.
> > > > > > > +	 */
> > > > > > > +	msleep(25);
> > > > > >
> > > > > > What normal code path did you just slow down here?  Why not slow
> > > > > > down the disconnect path instead of the connect path?
> > > > > >
> > > > > In case of faulty usb device, USB device enumeration doesn't
> > > > > succeed at all
> > > > and comes out of hub_port_init() from a failure path. There is no
> > > > device disconnection path in this flow. Therefore, this delay is
> > > > added after
> > > > hub_port_connect_change() is done trying to handle the port connect
> > > > change event.
> > > >
> > > > So you are going to slow down all valid devices just to handle the
> > > > fact that an abusive device can cause the system to slow down?
> > > >
> > > > What exactly is the problem if you plug in an abusive device, that
> > > > you are trying to solve?
> > >
> > > My apologies for not explaining the impact of failure at first place itself.
> > >
> > > Our end product is a car radio. If a faulty usb device(pen drive) is connected to
> > the radio system, unstable electric connection between the usb device and the
> > usb hub port can lead to endless port connect change events notified to the
> > EHCI controller. Thus hub_event() is forced to process all the connection change
> > events with hub device mutex lock acquired in the beginning of the function and
> > released only after event is processed. On every attempt, hub_port_init() fails
> > with usb commands timing out. E.g.
> > >
> > > [ 226.854368] usb 1-1.3: new high-speed USB device number 7 using
> > > ci_hdrc [ 231.934052] usb 1-1.3: device descriptor read/64, error -110
> > > [ 247.124276] usb 1-1.3: device descriptor read/64, error -110 [
> > > 247.494572] usb 1-1.3: new high-speed USB device number 9 using
> > > ci_hdrc [ 252.574226] usb 1-1.3: device descriptor read/64, error -110
> > > [ 267.764276] usb 1-1.3: device descriptor read/64, error -110 [
> > > 268.134641] usb 1-1.3: new high-speed USB device number 11 using
> > > ci_hdrc [ 273.214691] usb 1-1.3: device descriptor read/64, error -110
> > > [ 288.404281] usb 1-1.3: device descriptor read/64, error -110 [
> > > 288.777986] usb 1-1.3: new high-speed USB device number 13 using
> > > ci_hdrc [ 293.857331] usb 1-1.3: device descriptor read/64, error -110
> > > [ 309.044488] usb 1-1.3: device descriptor read/64, error -110 [
> > > 309.414428] usb 1-1.3: new high-speed USB device number 15 using
> > > ci_hdrc [ 314.494496] usb 1-1.3: device descriptor read/64, error -110
> > >
> > > This goes on and on.
> > 
> > You have plenty of time between those events (seconds), so why will a 25msec
> > sleep help out here?
> > 
> 
> Well, these seconds are the spent due to usb device descriptor command failing with timeout (5 seconds for one usb device command multiplied by 4 re-tries). This time is spent inside hub_port_init() function when the hub device lock is already taken so how would it help the lock waiter threads ? We need to give the hub driver thread breathing time only after hub device lock is released.

Ah, you are right, sorry.

And can you wrap your text at 72 colums?  Those are very long lines :)

> > > Due to quick and endless number of new connection change events, thread
> > running hub_event() function remains busy processing the hub port change
> > events and being frequently scheduled. During this time, any other threads
> > (either low priority or even equal priority) are starved of the hub device mutex.
> > >
> > > Since threads waiting for the hub device mutex lock are in uninterruptible
> > sleep, this leads to kernel hung task detector triggering hung task after
> > 180(hung_task_timeout_secs) seconds of threads waiting for the hub device
> > mutex. And since we have hung_task_panic set to 1, it leads to kernel panic.
> > >
> > > We can reproduce this issue always with a faulty usb device that is capable of
> > sending endless connect status change events due to unstable electric
> > connection between usb device and the hub port.
> > >
> > > > Is the system still supposed to be running properly?  Why not just
> > > > remove the device or disable the port when detected?
> > > >
> > >
> > > I hope you would agree that user of an embedded Linux based product is not
> > always expected to remove the faulty usb device before hung task is triggered. I
> > mean, user just simply won't know.
> > >
> > > If we have to make a decision on disabling the port, we must know for sure
> > that same usb device is being attempted for enumeration. Let say, we want to
> > make a decision to abort enumeration after certain number of re-tries. But for
> > that, how would we know that new port connect change event is for the same
> > usb device that was tried last time ? Because since hub_port_init() function itself
> > fails and till this point, we don't have unique information about the usb device
> > being attached to the hub port that we can compare to know if it's a re-try for
> > the same usb device or it's a new usb device.
> > 
> > I agree, trying to do this type of detection would be hard, but again, as your log
> > points out, you have seconds between events, so why is your change helping?
> > 
> > And again, you are hurting valid devices here by slowing everything down, why
> > not just delay when a disconnect happens?
> > 
> Again, there is no disconnection path because there was no successful connection. So what's happening is, as soon as the thread releases the hub device lock, it's taken again by hub driver thread within microseconds. Think of a scenario where there is a kernel thread running with lower priority requiring hub device mutex and it just won't be allowed because hub driver thread running with high priority demands to run endlessly.
> 
> > Or just allow the cpu to reschedule?  Why did you pick "25" for this magic value?
> > 
> Magic value of 25ms was decided to cause as smaller delay as possible that prevents the hung task. We did experiments with the higher delay value but not less than 25ms. We wanted to avoid the too short delay which might convert into busy waiting. I am sure it can be further brought down and I'm willing to test with even smaller delays.
> 
> Can you please briefly explain on what do you mean by " just allow the cpu to reschedule" ? Isn't that what delay is doing ?

It is, but it is also delaying a specific amount of time.  What happens
if there is no contention on the lock, you just delayed no matter what.

How about a call to schedule()?

thanks,

greg k-h
