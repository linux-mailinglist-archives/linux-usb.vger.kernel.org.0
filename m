Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BBD46D2AF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 12:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhLHLsN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 8 Dec 2021 06:48:13 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:31710 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhLHLsM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 06:48:12 -0500
IronPort-SDR: XtziXAB4d4wAvFA+2XZdStXXgBsNOoVFQ2OmfTfvMIxgNiUjE67Q/9aPA4u0lXIVBUmduh0stz
 beJXP9AimRHPt5y8JeSvpECHQKlXO1YLSaqve2WiiEmgWQvuNtNC82863/412wuTu4HheOnHn0
 qL0xwCCO+fs1VZ8G8bWEqvX84DKUCKXn26ozzC5BijNzZMEEfa9qGIvUZVvU3LlZWVb9qIQUkL
 hoSh8crahQTdBBwBUYRmXBk2Y8DeYmI/Yu+sos6YDjlGV7DuLIEsyj0FOIWkP6xN+p4ht8TD7J
 m74vNeYqH4SYpz4Nksc2vf6U
X-IronPort-AV: E=Sophos;i="5.87,297,1631606400"; 
   d="scan'208";a="71942223"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 08 Dec 2021 03:44:41 -0800
IronPort-SDR: BZPp+9a1xtOiRk3OOfSerXkn/5W9SkehHyH/n3G5YDZb3Q2wiPYixhVA07Oi5PYKGrkpMIdh9Z
 GZLNJKLBSia/R/A5v+F9wbGOg6KzccNBRs53lIh6f094wzb3LL0NZHdIJLRPuJDKrHiKjncnkx
 5ZBfRYmZ/apUK1VUAPmy+HUWgcRi2z28b4HyoF0Fx7Yr9fBdFu//dxYYNjiphnJNVyhunbmH1P
 YpWQK8Qiwky1un9RrdHkdo5vwLfH8NXJ1L7SUJ7QfQ4eIY2gAwfhdPGPwxFXzE6huX13ZVf6Mc
 iio=
From:   "Chugh, Sanjeev" <Sanjeev_Chugh@mentor.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
 release
Thread-Topic: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
 release
Thread-Index: AQHX5k6IjsbHRxGuxkKr8PpAjenqEKwgvGyAgAXPsACAAKHkAIAA4cswgAAnKoCAAADxsIAAImyAgAAqgmA=
Date:   Wed, 8 Dec 2021 11:44:36 +0000
Message-ID: <250e8c983f6e4b428ef3bea1bce774d7@svr-ies-mbx-01.mgc.mentorg.com>
References: <1638320288-6465-1-git-send-email-sanjeev_chugh@mentor.com>
 <YaoS3RoqkGkf6NFa@kroah.com>
 <361b7459f1d64f5e8b7bccaa2dd536e5@svr-ies-mbx-01.mgc.mentorg.com>
 <Ya96omTSiwDNoRu5@kroah.com>
 <f400fe3c8a744203b20aebb6c83a029a@svr-ies-mbx-01.mgc.mentorg.com>
 <YbBY5TWsbjqEgfi2@kroah.com>
 <6871470e531b4d79b02abd1c10a53a5d@svr-ies-mbx-01.mgc.mentorg.com>
 <YbB2j+eyc3Mdc7iv@kroah.com>
In-Reply-To: <YbB2j+eyc3Mdc7iv@kroah.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Wednesday, December 8, 2021 2:41 PM
> To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
> release
> 
> On Wed, Dec 08, 2021 at 07:26:08AM +0000, Chugh, Sanjeev wrote:
> >
> > > -----Original Message-----
> > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > Sent: Wednesday, December 8, 2021 12:34 PM
> > > To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> > > Cc: linux-usb@vger.kernel.org
> > > Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub
> > > mutex release
> > >
> > > On Wed, Dec 08, 2021 at 06:58:23AM +0000, Chugh, Sanjeev wrote:
> > > > Hi Greg,
> > > >
> > > > > -----Original Message-----
> > > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > > Sent: Tuesday, December 7, 2021 8:46 PM
> > > > > To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> > > > > Cc: linux-usb@vger.kernel.org
> > > > > Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb
> > > > > hub mutex release
> > > > >
> > > > > On Tue, Dec 07, 2021 at 05:54:06AM +0000, Chugh, Sanjeev wrote:
> > > > > > Hello Greg,
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > > > > Sent: Friday, December 3, 2021 6:22 PM
> > > > > > > To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> > > > > > > Cc: linux-usb@vger.kernel.org
> > > > > > > Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after
> > > > > > > usb hub mutex release
> > > > > > >
> > > > > > > On Wed, Dec 01, 2021 at 06:28:08AM +0530, Sanjeev Chugh wrote:
> > > > > > > > Rogue usb sticks can cause endless port connect change
> > > > > > > > events due to unstable electric connection between usb chip and
> the port.
> > > > > > > > Port connect change will cause device enumeration for the
> > > > > > > > new device connection and new device processing is done
> > > > > > > > with the usb hub mutex acquired. This can cause very short
> > > > > > > > time gap between unlock/lock of hub device mutex. So if
> > > > > > > > some thread is running at low priority than hub_thread, it
> > > > > > > > can face hub device mutex
> > > starvation.
> > > > > > > >
> > > > > > > > This commit introduces a sleep of 25ms after the hub
> > > > > > > > device mutex is unlocked in hub_events so that if
> > > > > > > > hub_thread is stuck in a endless loop, all other threads
> > > > > > > > will get fair amount of chance to acquire the usb hub mutex.
> > > > > > > >
> > > > > > > > Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
> > > > > > > > ---
> > > > > > > >  drivers/usb/core/hub.c | 11 +++++++++++
> > > > > > > >  1 file changed, 11 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/usb/core/hub.c
> > > > > > > > b/drivers/usb/core/hub.c index 00070a8..0be2acc 100644
> > > > > > > > --- a/drivers/usb/core/hub.c
> > > > > > > > +++ b/drivers/usb/core/hub.c
> > > > > > > > @@ -5763,6 +5763,17 @@ static void hub_event(struct
> > > > > > > > work_struct
> > > > > > > > *work)
> > > > > > > >  out_hdev_lock:
> > > > > > > >  	usb_unlock_device(hdev);
> > > > > > > >
> > > > > > > > +	/*
> > > > > > > > +	 * Rogue usb sticks can cause endless device connection
> > > > > > > > +	 * events due to unstable electric connection.
> > > > > > >
> > > > > > > What is a "usb stick"?  Any usb device could cause this, right?
> > > > > >
> > > > > > In my test case, I have used a usb pen drive of Sandisk Make
> > > > > > of 32 GB
> > > capacity.
> > > > > But yes, any faulty usb device or even faulty usb cable used for
> > > > > the usb device connection can cause this issue.
> > > > > > >
> > > > > > > > This
> > > > > > > > +	 * can cause very short time gap between unlock/lock
> > > > > > > > +	 * of hub device mutex thus causing mutex starvation
> > > > > > > > +	 * for some other lower priority thread. Thus sleep
> > > > > > > > +	 * would give fair chance to all other threads to
> > > > > > > > +	 * acquire the usb hub mutex.
> > > > > > > > +	 */
> > > > > > > > +	msleep(25);
> > > > > > >
> > > > > > > What normal code path did you just slow down here?  Why not
> > > > > > > slow down the disconnect path instead of the connect path?
> > > > > > >
> > > > > > In case of faulty usb device, USB device enumeration doesn't
> > > > > > succeed at all
> > > > > and comes out of hub_port_init() from a failure path. There is
> > > > > no device disconnection path in this flow. Therefore, this delay
> > > > > is added after
> > > > > hub_port_connect_change() is done trying to handle the port
> > > > > connect change event.
> > > > >
> > > > > So you are going to slow down all valid devices just to handle
> > > > > the fact that an abusive device can cause the system to slow down?
> > > > >
> > > > > What exactly is the problem if you plug in an abusive device,
> > > > > that you are trying to solve?
> > > >
> > > > My apologies for not explaining the impact of failure at first place itself.
> > > >
> > > > Our end product is a car radio. If a faulty usb device(pen drive)
> > > > is connected to
> > > the radio system, unstable electric connection between the usb
> > > device and the usb hub port can lead to endless port connect change
> > > events notified to the EHCI controller. Thus hub_event() is forced
> > > to process all the connection change events with hub device mutex
> > > lock acquired in the beginning of the function and released only
> > > after event is processed. On every attempt, hub_port_init() fails with usb
> commands timing out. E.g.
> > > >
> > > > [ 226.854368] usb 1-1.3: new high-speed USB device number 7 using
> > > > ci_hdrc [ 231.934052] usb 1-1.3: device descriptor read/64, error
> > > > -110 [ 247.124276] usb 1-1.3: device descriptor read/64, error
> > > > -110 [ 247.494572] usb 1-1.3: new high-speed USB device number 9
> > > > using ci_hdrc [ 252.574226] usb 1-1.3: device descriptor read/64,
> > > > error -110 [ 267.764276] usb 1-1.3: device descriptor read/64,
> > > > error -110 [ 268.134641] usb 1-1.3: new high-speed USB device
> > > > number 11 using ci_hdrc [ 273.214691] usb 1-1.3: device descriptor
> > > > read/64, error -110 [ 288.404281] usb 1-1.3: device descriptor
> > > > read/64, error -110 [ 288.777986] usb 1-1.3: new high-speed USB
> > > > device number 13 using ci_hdrc [ 293.857331] usb 1-1.3: device
> > > > descriptor read/64, error -110 [ 309.044488] usb 1-1.3: device
> > > > descriptor read/64, error -110 [ 309.414428] usb 1-1.3: new
> > > > high-speed USB device number 15 using ci_hdrc [ 314.494496] usb
> > > > 1-1.3: device descriptor read/64, error -110
> > > >
> > > > This goes on and on.
> > >
> > > You have plenty of time between those events (seconds), so why will
> > > a 25msec sleep help out here?
> > >
> >
> > Well, these seconds are the spent due to usb device descriptor command
> failing with timeout (5 seconds for one usb device command multiplied by 4 re-
> tries). This time is spent inside hub_port_init() function when the hub device lock
> is already taken so how would it help the lock waiter threads ? We need to give
> the hub driver thread breathing time only after hub device lock is released.
> 
> Ah, you are right, sorry.
> 
> And can you wrap your text at 72 colums?  Those are very long lines :)
> 
> > > > Due to quick and endless number of new connection change events,
> > > > thread
> > > running hub_event() function remains busy processing the hub port
> > > change events and being frequently scheduled. During this time, any
> > > other threads (either low priority or even equal priority) are starved of the
> hub device mutex.
> > > >
> > > > Since threads waiting for the hub device mutex lock are in
> > > > uninterruptible
> > > sleep, this leads to kernel hung task detector triggering hung task
> > > after
> > > 180(hung_task_timeout_secs) seconds of threads waiting for the hub
> > > device mutex. And since we have hung_task_panic set to 1, it leads to kernel
> panic.
> > > >
> > > > We can reproduce this issue always with a faulty usb device that
> > > > is capable of
> > > sending endless connect status change events due to unstable
> > > electric connection between usb device and the hub port.
> > > >
> > > > > Is the system still supposed to be running properly?  Why not
> > > > > just remove the device or disable the port when detected?
> > > > >
> > > >
> > > > I hope you would agree that user of an embedded Linux based
> > > > product is not
> > > always expected to remove the faulty usb device before hung task is
> > > triggered. I mean, user just simply won't know.
> > > >
> > > > If we have to make a decision on disabling the port, we must know
> > > > for sure
> > > that same usb device is being attempted for enumeration. Let say, we
> > > want to make a decision to abort enumeration after certain number of
> > > re-tries. But for that, how would we know that new port connect
> > > change event is for the same usb device that was tried last time ?
> > > Because since hub_port_init() function itself fails and till this
> > > point, we don't have unique information about the usb device being
> > > attached to the hub port that we can compare to know if it's a re-try for the
> same usb device or it's a new usb device.
> > >
> > > I agree, trying to do this type of detection would be hard, but
> > > again, as your log points out, you have seconds between events, so why is
> your change helping?
> > >
> > > And again, you are hurting valid devices here by slowing everything
> > > down, why not just delay when a disconnect happens?
> > >
> > Again, there is no disconnection path because there was no successful
> connection. So what's happening is, as soon as the thread releases the hub
> device lock, it's taken again by hub driver thread within microseconds. Think of a
> scenario where there is a kernel thread running with lower priority requiring hub
> device mutex and it just won't be allowed because hub driver thread running
> with high priority demands to run endlessly.
> >
> > > Or just allow the cpu to reschedule?  Why did you pick "25" for this magic
> value?
> > >
> > Magic value of 25ms was decided to cause as smaller delay as possible that
> prevents the hung task. We did experiments with the higher delay value but not
> less than 25ms. We wanted to avoid the too short delay which might convert
> into busy waiting. I am sure it can be further brought down and I'm willing to
> test with even smaller delays.
> >
> > Can you please briefly explain on what do you mean by " just allow the cpu to
> reschedule" ? Isn't that what delay is doing ?
> 
> It is, but it is also delaying a specific amount of time.  What happens if there is
> no contention on the lock, you just delayed no matter what.
> 
> How about a call to schedule()?
> 
I can try with schedule() if it works. Will test and post results.

> thanks,
> 
> greg k-h

Thanks !

-Sanjeev
