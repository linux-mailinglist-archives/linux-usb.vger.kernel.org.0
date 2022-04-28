Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A759512C26
	for <lists+linux-usb@lfdr.de>; Thu, 28 Apr 2022 09:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244702AbiD1HFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Apr 2022 03:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiD1HFl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Apr 2022 03:05:41 -0400
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80494986EF
        for <linux-usb@vger.kernel.org>; Thu, 28 Apr 2022 00:02:25 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 175D9DF85E;
        Thu, 28 Apr 2022 00:01:55 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id U9zpfHVsCpff; Thu, 28 Apr 2022 00:01:54 -0700 (PDT)
Message-ID: <232334eeb9d7321df1632e453839a6d433e6be45.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1651129314; bh=N28c4iOH5TVRzPcGu3oyumxj1JrqYsc8Hp5KBrjG2Y4=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=VH+KXAnx8XwSiwKIXMCwyXJxRcB7IJQaiGPiaUa6QDuudp39WtOy9+4/oujY5yFB5
         0HXdiAMElmbep2DRsrNTlWV4TZI49KFcJKTuWQCk3w2ZLYHEJAWDNgUjVRz3qtvPq8
         dpmK1NRsCpWXvk0RW9G2AnZRlTKMZbeOmlBmaGd2Tm7JIQVfyz8r18iwtu2UgipGmJ
         94nt4A4urVx1SAIvio/sY530DHl1Tsn03fJZWd1FRSB8a8m/IKHOkqhkjV4a3uk6z8
         Kq7oVY9bpTMe5qh0S0MJsE9faiX/Abfo90eiqYDGNhCHRW5QBPjZ1OMoVTE5J3vfc1
         +9khPi4CGa6WA==
Subject: Re: USB device disconnects on resume
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 28 Apr 2022 09:01:50 +0200
In-Reply-To: <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
         <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
         <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
         <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
         <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
         <YmFpMFlTt83s90an@rowland.harvard.edu>
         <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
         <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, dem 26.04.2022 um 10:58 -0400 schrieb Alan Stern:
> On Mon, Apr 25, 2022 at 11:45:05AM +0200, Martin Kepplinger wrote:
> > Alan, thanks so much for asking these questions and thinking this
> > through! It helps.
> > 
> > Am Donnerstag, dem 21.04.2022 um 10:24 -0400 schrieb Alan Stern:
> > > On Thu, Apr 21, 2022 at 12:38:56PM +0200, Martin Kepplinger
> > > wrote:
> > > > Am Mittwoch, dem 20.04.2022 um 10:40 -0400 schrieb Alan Stern:
> > > > > On Wed, Apr 20, 2022 at 12:37:36PM +0200, Martin Kepplinger
> > > > > wrote:
> > > > > > Resetting itself doesn't usually fail in the sense that a
> > > > > > device
> > > > > > would
> > > > > > not work anymore after resetting. The problem is that the
> > > > > > resets
> > > > > > happen
> > > > > > in the first place. 90+% of runtime-resumes are fine -
> > > > > > auto-
> > > > > > and
> > > > > > wakeup-resume. Resetting is a major problem though, imagine
> > > > > > a
> > > > > > modem
> > > > > > device being re-enumerated during a phone call or
> > > > > > "realtime"
> > > > > > data
> > > > > > connection. I see that a lot.
> > > > > 
> > > > > Okay, I see.
> > > 
> > > By the way, I assume that while resetting the modem is a major
> > > problem 
> > > for your potential use cases, having it crash with no hope of
> > > recovery 
> > > is even worse.  But maybe I'm wrong...
> > 
> > Sure that's true (and I have other usb-related problems too that
> > result
> > in the xhci HC dying even, when I see "xhci-hcd.4.auto: Port resume
> > timed out, port 1-1: 0xfe3", so the Hub where the modem is
> > connected)
> > but these resets are a seperate issue I want to tackle now and see
> > whether it help with other usb-related problems, so let's focus on
> > this
> > disconnect/reset situation. So let's not get confused :)
> 
> Okay.
> 
> > > > > > 1650447001.318845 pureos kernel: usb 1-1.2: Waited 0ms for
> > > > > > CONNECT
> > > > > > 1650447001.324925 pureos kernel: usb 1-1.2: finish resume
> > > > > > 1650447003.831095 pureos kernel: usb 1-1.2: usb auto-
> > > > > > suspend,
> > > > > > wakeup 1
> > > > > > 1650447003.854701 pureos kernel: hub 1-1:1.0: hub_suspend
> > > > > > 1650447003.874773 pureos kernel: usb 1-1: usb auto-suspend,
> > > > > > wakeup
> > > > > > 1
> > > > > > 1650447003.922054 pureos kernel: usb 1-1: usb wakeup-resume
> > > > > 
> > > > > This wakeup occurred only 48 ms after the hub was runtime
> > > > > suspended. 
> > > > > But here at least the cause is evident: The hub sent a wakeup
> > > > > request
> > > > > because its child (the 1-1.2 modem) disconnected.
> > > > 
> > > > fwiw, that wakeup-resume *always* comes about 50 ms after the
> > > > last
> > > > runtime suspend.
> > > 
> > > Maybe the modem's firmware has some 50-ms timeout that expires
> > > and
> > > then 
> > > causes the crash.
> > 
> > I now recorded usbmon (1u) traffic of a similar sequence I sent
> > here,
> > with a few usbmon-timestamps in the logs:
> > 
> > https://source.puri.sm/Librem5/linux/-/issues/303#note_197913
> > 
> > the usbmon log textfile is attached in that comment link and in
> > this
> > email.
> 
> Hmmm.  The usbmon trace appears to show a successful reset-resume. 
> Did
> anything bad happen during that experiment from your point of view?

well, the modem device got disconnected and re-enumerated.

> 
> > > > > > 1650447003.942066 pureos kernel: usb 1-1: Waited 0ms for
> > > > > > CONNECT
> > > > > > 1650447003.945755 pureos kernel: usb 1-1: finish resume
> > > > > > 1650447003.947589 pureos kernel: hub 1-1:1.0: hub_resume
> > > > > > 1650447003.949226 pureos kernel: usb 1-1-port1: status 0507
> > > > > > change
> > > > > > 0000
> > > > > > 1650447003.949430 pureos kernel: usb 1-1-port2: status 0101
> > > > > > change
> > > > > > 0005
> > > > > > 1650447004.058779 pureos kernel: hub 1-1:1.0: state 7 ports
> > > > > > 3
> > > > > > chg
> > > > > > 0004
> > > > > > evt 0000
> > > > > > 1650447004.074089 pureos kernel: usb 1-1.2: usb wakeup-
> > > > > > resume
> > > > > > 1650447004.094056 pureos kernel: usb 1-1.2: Waited 0ms for
> > > > > > CONNECT
> > > > > > 1650447004.097255 pureos kernel: usb 1-1.2: finish reset-
> > > > > > resume
> > > > > > 1650447004.182333 pureos kernel: usb 1-1.2: reset high-
> > > > > > speed
> > > > > > USB
> > > > > > device
> > > > > > number 5 using xhci-hcd
> > > > > > 1650447004.314425 pureos kernel: usb 1-1-port2: resume,
> > > > > > status
> > > > > > 0
> > > > > > 1650447004.317628 pureos kernel: usb 1-1-port2: status
> > > > > > 0101,
> > > > > > change
> > > > > > 0004, 12 Mb/s
> 
> This line indicates the real source of the trouble.  Shortly after
> the 
> reset part of the reset-resume, the modem disconnected again.  That
> is, 
> it disconnected itself twice: Once while it was suspended or right
> when 
> the resume occurred, and then a second time immediately following the
> reset.

indeed...

> 
> > > > > > 1650447004.323374 pureos kernel: usb 1-1.2: unregistering
> > > > > > device
> > > > > 
> > > > > And it looks like in this case, the reset-resume failed.
> > > > 
> > > > Well, at least reset_resume has been set, which I want to
> > > > avoid.
> > > 
> > > Do you mean you would prefer to have the modem disconnect
> > > permanently
> > > (or at least until the next reboot)?
> > 
> > no. I mean I'd prefer the kernel keep the device usable when such a
> > disconnect happens - after a short pause until the modem is up
> > again -
> > and not re-enumerate.
> 
> That's exactly what a reset-resume is supposed to do.  Maybe the
> pause 
> is too short; you can increase it by adding an msleep() call in 
> finish_port_resume() just before it calls
> usb_reset_and_verify_device().
> 
> > An audio stream is not being interrupted by such a usb disconnect
> > and
> > if I'd keep the ttyUSB device for userspace, I'd keep an opened
> > ttyUSB
> > controllable - even if possibly with a large latency spike. That
> > would
> > stay a bad workaround of course. Do you know what I'm thinking
> > about?
> 
> Certainly.
> 
> > > One thing you can do pretty easily, without changing the kernel,
> > > is 
> > > prevent the modem from going into runtime suspend in the first
> > > place.  
> > > For example, if you have a program like powertop overseeing your
> > > runtime 
> > > power management, you could tell it not to let the modem
> > > suspend.  Or
> > > if 
> > > you want to set it up by hand, the command is:
> > > 
> > >         echo on >/sys/bus/usb/devices/.../power/control
> > > 
> > > (where "..." is the appropriate path for the modem device, such
> > > as 
> > > "1-1.2").  You can even write a udev script to do this
> > > automatically 
> > > whenever the modem is detected.
> > 
> > I know that this "solves" my problems but that also prevents the
> > usb2
> > hub (1-1) from suspending and that's not a practical solution. The
> > hub
> > uses a *lot* of power.
> 
> And there's no way to use a different hub -- one that consumes less 
> power -- because the connections are hard-wired on the board.  :-(

correct.

> 
> > > > In theory, if I know this behaviour in advance, I think I
> > > > should be
> > > > able to somehow wait until the device is ready again instead of
> > > > resetting.
> > > 
> > > What if the modem never becomes ready again (or not until you
> > > reboot)?  
> > > I think that sort of behavior is not at all unlikely.  You can
> > > test
> > > this 
> > > by disabling the code in finish_port_resume() that does reset-
> > > resumes.
> > 
> > if I just do that, I get "gone after usb resume? status -5" and
> > thus a
> > reset is triggered after all (also, when I do msleep(500) instead
> > of
> > reset_and_verify_device() there).
> 
> Here's a quick low-level description of what's going on.
> 
> When a hub gets a disconnect event on one of its ports, it disables
> the 
> port.  The port then remains disabled, even if another device is
> plugged 
> in, until a successful port reset occurs.  In other words, the _only_
> way to re-enable a port is to issue a reset.
> 
> The reset-resume mechanism in the kernel takes care of issuing the 
> reset, and it checks to make sure that the device attached to the
> port 
> hasn't been changed (i.e., it's still the same device as before, not
> a 
> new one).  If that works, the device is put back in its former
> operating 
> state and should keep on functioning normally.  If that doesn't work,
> or 
> if there is a new device attached to the port, the kernel treats the 
> event just like a normal disconnect + connect.
> 
> So what you want really _is_ a reset-resume.  If successful, it will 
> give the behavior you mentioned above: continued transmission with
> maybe 
> some data loss and a big latency spike at one point.  Anything other 
> than a successful reset-resume will cause the ttyUSB file to become 
> unusable, exactly what you don't want.
> 
> So the real question you need to answer is why a reset-resume
> sometimes 
> fails with this modem.  I suspect the answer will be that the modem
> is 
> buggy, and there may not be any way to work around the bug.  But try 
> putting the msleep(500) just before the usb_reset_and_verify_device()
> call; maybe it will help.
> 
> Alan Stern

ok. thanks a lot for that suggestion! I added an extremely long
msleep(5000) there and the behaviour indeed consistently changes a bit.
(almost consistently, rarely I see the modem coming up as low-speed
device, which is not allowed by hub.c and thus re-enumeration is
triggered) but I added more debug messages and almost always that's how
it looks like. I hope my added messages are understandable enough:

11:43:50.800648: hub 1-1:1.0: hub_suspend
11:43:50.820074: usb 1-1: usb auto-suspend, wakeup 1
11:43:50.880637: usb 1-1: usb wakeup-resume
11:43:50.908646: usb 1-1: Waited 0ms for CONNECT
11:43:50.910445: usb 1-1: finish resume
11:43:50.911865: hub 1-1:1.0: hub_resume
11:43:50.913842: usb 1-1-port1: status 0507 change 0000
11:43:50.914026: usb 1-1-port2: status 0101 change 0005
11:43:51.020887: usb usb1-port1: resume, status 0
11:43:51.021205: hub 1-1:1.0: state 7 ports 3 chg 0004 evt 0000
11:43:51.048658: usb 1-1.2: usb wakeup-resume
11:43:51.076670: usb 1-1.2: Waited 0ms for CONNECT
11:43:51.078573: usb 1-1.2: finish reset-resume
11:43:56.305074: usb 1-1-port2: hub_port_reset: starting try 0 of 5
11:43:56.328683: hub 1-1:1.0: port_wait_reset: err = -11
11:43:56.333794: usb 1-1-port2: not enabled, trying reset again... 0 of
5. status=-11
11:43:56.334074: usb 1-1-port2: hub_port_reset: starting try 1 of 5
11:43:56.536645: usb 1-1-port2: hub_port_reset: no superspeed. status:
0. bail out
11:43:56.628824: usb 1-1.2: reset high-speed USB device number 6 using
xhci-hcd
11:43:56.640305: usb 1-1-port2: hub_port_reset: starting try 0 of 5
11:43:56.656735: usb 1-1-port2: hub_port_reset: no superspeed. status:
0. bail out
11:43:56.752738: usb 1-1-port2: resume, status 0
11:43:56.755442: usb 1-1-port2: port_event: call
hub_port_connect_change because connect_change is 1
11:43:56.756663: usb 1-1-port2: status 0101, change 0004, 12 Mb/s
11:43:56.756942: usb 1-1.2: hub_port_connect_change: not resuscitating.
11:43:56.762495: usb 1-1-port2: hub_port_connect_change: could not
revalidate the connection. call hub_port_connect.
11:43:56.762797: usb 1-1.2: USB disconnect, device number 6
11:43:56.765481: usb 1-1.2: unregistering device

I'm sending this before analyzing it further. I'll do so soon but
wanted to show you that already.

                            martin


