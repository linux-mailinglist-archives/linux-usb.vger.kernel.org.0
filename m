Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B97151013A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 16:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351847AbiDZPBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 11:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351843AbiDZPBi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 11:01:38 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 81118B1A9B
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 07:58:29 -0700 (PDT)
Received: (qmail 841292 invoked by uid 1000); 26 Apr 2022 10:58:28 -0400
Date:   Tue, 26 Apr 2022 10:58:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB device disconnects on resume
Message-ID: <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
 <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
 <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
 <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
 <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
 <YmFpMFlTt83s90an@rowland.harvard.edu>
 <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 11:45:05AM +0200, Martin Kepplinger wrote:
> Alan, thanks so much for asking these questions and thinking this
> through! It helps.
> 
> Am Donnerstag, dem 21.04.2022 um 10:24 -0400 schrieb Alan Stern:
> > On Thu, Apr 21, 2022 at 12:38:56PM +0200, Martin Kepplinger wrote:
> > > Am Mittwoch, dem 20.04.2022 um 10:40 -0400 schrieb Alan Stern:
> > > > On Wed, Apr 20, 2022 at 12:37:36PM +0200, Martin Kepplinger
> > > > wrote:
> > > > > Resetting itself doesn't usually fail in the sense that a
> > > > > device
> > > > > would
> > > > > not work anymore after resetting. The problem is that the
> > > > > resets
> > > > > happen
> > > > > in the first place. 90+% of runtime-resumes are fine - auto-
> > > > > and
> > > > > wakeup-resume. Resetting is a major problem though, imagine a
> > > > > modem
> > > > > device being re-enumerated during a phone call or "realtime"
> > > > > data
> > > > > connection. I see that a lot.
> > > > 
> > > > Okay, I see.
> > 
> > By the way, I assume that while resetting the modem is a major
> > problem 
> > for your potential use cases, having it crash with no hope of
> > recovery 
> > is even worse.  But maybe I'm wrong...
> 
> Sure that's true (and I have other usb-related problems too that result
> in the xhci HC dying even, when I see "xhci-hcd.4.auto: Port resume
> timed out, port 1-1: 0xfe3", so the Hub where the modem is connected)
> but these resets are a seperate issue I want to tackle now and see
> whether it help with other usb-related problems, so let's focus on this
> disconnect/reset situation. So let's not get confused :)

Okay.

> > > > > 1650447001.318845 pureos kernel: usb 1-1.2: Waited 0ms for
> > > > > CONNECT
> > > > > 1650447001.324925 pureos kernel: usb 1-1.2: finish resume
> > > > > 1650447003.831095 pureos kernel: usb 1-1.2: usb auto-suspend,
> > > > > wakeup 1
> > > > > 1650447003.854701 pureos kernel: hub 1-1:1.0: hub_suspend
> > > > > 1650447003.874773 pureos kernel: usb 1-1: usb auto-suspend,
> > > > > wakeup
> > > > > 1
> > > > > 1650447003.922054 pureos kernel: usb 1-1: usb wakeup-resume
> > > > 
> > > > This wakeup occurred only 48 ms after the hub was runtime
> > > > suspended. 
> > > > But here at least the cause is evident: The hub sent a wakeup
> > > > request
> > > > because its child (the 1-1.2 modem) disconnected.
> > > 
> > > fwiw, that wakeup-resume *always* comes about 50 ms after the last
> > > runtime suspend.
> > 
> > Maybe the modem's firmware has some 50-ms timeout that expires and
> > then 
> > causes the crash.
> 
> I now recorded usbmon (1u) traffic of a similar sequence I sent here,
> with a few usbmon-timestamps in the logs:
> 
> https://source.puri.sm/Librem5/linux/-/issues/303#note_197913
> 
> the usbmon log textfile is attached in that comment link and in this
> email.

Hmmm.  The usbmon trace appears to show a successful reset-resume.  Did
anything bad happen during that experiment from your point of view?

> > > > > 1650447003.942066 pureos kernel: usb 1-1: Waited 0ms for
> > > > > CONNECT
> > > > > 1650447003.945755 pureos kernel: usb 1-1: finish resume
> > > > > 1650447003.947589 pureos kernel: hub 1-1:1.0: hub_resume
> > > > > 1650447003.949226 pureos kernel: usb 1-1-port1: status 0507
> > > > > change
> > > > > 0000
> > > > > 1650447003.949430 pureos kernel: usb 1-1-port2: status 0101
> > > > > change
> > > > > 0005
> > > > > 1650447004.058779 pureos kernel: hub 1-1:1.0: state 7 ports 3
> > > > > chg
> > > > > 0004
> > > > > evt 0000
> > > > > 1650447004.074089 pureos kernel: usb 1-1.2: usb wakeup-resume
> > > > > 1650447004.094056 pureos kernel: usb 1-1.2: Waited 0ms for
> > > > > CONNECT
> > > > > 1650447004.097255 pureos kernel: usb 1-1.2: finish reset-resume
> > > > > 1650447004.182333 pureos kernel: usb 1-1.2: reset high-speed
> > > > > USB
> > > > > device
> > > > > number 5 using xhci-hcd
> > > > > 1650447004.314425 pureos kernel: usb 1-1-port2: resume, status
> > > > > 0
> > > > > 1650447004.317628 pureos kernel: usb 1-1-port2: status 0101,
> > > > > change
> > > > > 0004, 12 Mb/s

This line indicates the real source of the trouble.  Shortly after the 
reset part of the reset-resume, the modem disconnected again.  That is, 
it disconnected itself twice: Once while it was suspended or right when 
the resume occurred, and then a second time immediately following the 
reset.

> > > > > 1650447004.323374 pureos kernel: usb 1-1.2: unregistering
> > > > > device
> > > > 
> > > > And it looks like in this case, the reset-resume failed.
> > > 
> > > Well, at least reset_resume has been set, which I want to avoid.
> > 
> > Do you mean you would prefer to have the modem disconnect permanently
> > (or at least until the next reboot)?
> 
> no. I mean I'd prefer the kernel keep the device usable when such a
> disconnect happens - after a short pause until the modem is up again -
> and not re-enumerate.

That's exactly what a reset-resume is supposed to do.  Maybe the pause 
is too short; you can increase it by adding an msleep() call in 
finish_port_resume() just before it calls usb_reset_and_verify_device().

> An audio stream is not being interrupted by such a usb disconnect and
> if I'd keep the ttyUSB device for userspace, I'd keep an opened ttyUSB
> controllable - even if possibly with a large latency spike. That would
> stay a bad workaround of course. Do you know what I'm thinking about?

Certainly.

> > One thing you can do pretty easily, without changing the kernel, is 
> > prevent the modem from going into runtime suspend in the first
> > place.  
> > For example, if you have a program like powertop overseeing your
> > runtime 
> > power management, you could tell it not to let the modem suspend.  Or
> > if 
> > you want to set it up by hand, the command is:
> > 
> >         echo on >/sys/bus/usb/devices/.../power/control
> > 
> > (where "..." is the appropriate path for the modem device, such as 
> > "1-1.2").  You can even write a udev script to do this automatically 
> > whenever the modem is detected.
> 
> I know that this "solves" my problems but that also prevents the usb2
> hub (1-1) from suspending and that's not a practical solution. The hub
> uses a *lot* of power.

And there's no way to use a different hub -- one that consumes less 
power -- because the connections are hard-wired on the board.  :-(

> > > In theory, if I know this behaviour in advance, I think I should be
> > > able to somehow wait until the device is ready again instead of
> > > resetting.
> > 
> > What if the modem never becomes ready again (or not until you
> > reboot)?  
> > I think that sort of behavior is not at all unlikely.  You can test
> > this 
> > by disabling the code in finish_port_resume() that does reset-
> > resumes.
> 
> if I just do that, I get "gone after usb resume? status -5" and thus a
> reset is triggered after all (also, when I do msleep(500) instead of
> reset_and_verify_device() there).

Here's a quick low-level description of what's going on.

When a hub gets a disconnect event on one of its ports, it disables the 
port.  The port then remains disabled, even if another device is plugged 
in, until a successful port reset occurs.  In other words, the _only_ 
way to re-enable a port is to issue a reset.

The reset-resume mechanism in the kernel takes care of issuing the 
reset, and it checks to make sure that the device attached to the port 
hasn't been changed (i.e., it's still the same device as before, not a 
new one).  If that works, the device is put back in its former operating 
state and should keep on functioning normally.  If that doesn't work, or 
if there is a new device attached to the port, the kernel treats the 
event just like a normal disconnect + connect.

So what you want really _is_ a reset-resume.  If successful, it will 
give the behavior you mentioned above: continued transmission with maybe 
some data loss and a big latency spike at one point.  Anything other 
than a successful reset-resume will cause the ttyUSB file to become 
unusable, exactly what you don't want.

So the real question you need to answer is why a reset-resume sometimes 
fails with this modem.  I suspect the answer will be that the modem is 
buggy, and there may not be any way to work around the bug.  But try 
putting the msleep(500) just before the usb_reset_and_verify_device() 
call; maybe it will help.

Alan Stern
