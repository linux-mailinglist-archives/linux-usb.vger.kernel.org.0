Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D26509DCF
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 12:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388471AbiDUKlx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 06:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388468AbiDUKlw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 06:41:52 -0400
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE31325580
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 03:39:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 5846BE000F;
        Thu, 21 Apr 2022 03:39:02 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id c_VDTIWMvAoR; Thu, 21 Apr 2022 03:39:01 -0700 (PDT)
Message-ID: <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1650537541; bh=zq5l56FCslHRv0LP44INMvPqdOCC8lhl+3x4Ss86vKg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Qg6frRcggGYq45LarwxkyjyBZiavvVAn9BBc0s4YRfjPHqDSplD+nTk+eVfs7hZii
         QkpDR7SajqbKqz3xxrMNYu1cIa+NsiESem/Kx/rZ3J1ROtfJEVglWGshq2UpMV2wr6
         K/uFnUIDME7ZX/WcObfj/jQnW7tRFGUJK/nEn4KRtbAP6Rk28Sutcgxp2pxE09VrPF
         NR0g7ZbnRs7SyakYFM9Ts8uPj+TIj4dxeKX6D7XX7PJ9tNlXAyjMyBow1/kUW37JFr
         nA2oSffih6At9vba65lHCcyydcgQpZw4HOqY+1sqwrjpWyU1IR5Sjbz6H5Q6NFIugN
         MvHdXy5fXmMsQ==
Subject: Re: USB device disconnects on resume
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 21 Apr 2022 12:38:56 +0200
In-Reply-To: <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
         <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
         <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
         <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
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

Am Mittwoch, dem 20.04.2022 um 10:40 -0400 schrieb Alan Stern:
> On Wed, Apr 20, 2022 at 12:37:36PM +0200, Martin Kepplinger wrote:
> > Am Dienstag, dem 19.04.2022 um 10:32 -0400 schrieb Alan Stern:
> > > On Tue, Apr 19, 2022 at 11:28:21AM +0200, Martin Kepplinger
> > > wrote:
> > > > hi,
> > > > 
> > > > I'm seeing resets and re-enumerations on runtime-resume for one
> > > > device
> > > > a lot. It's a modem connected to the USB2642 Microchip (SMSC)
> > > > USB2
> > > > hub,
> > > > that's connected to an xhci HC.
> > > > 
> > > > A remote wakeup *sometimes* makes the hub say "physically
> > > > disconnected"
> > > > during resume in hub_activate(), and thus sets reset_resume.
> > > > Then
> > > > the
> > > > device comes up as low-speed device once, which again is not
> > > > allowed
> > > > during normal runtime resume, so would itself trigger a reset.
> > > 
> > > Does the reset-resume always fail in this way?
> > 
> > Resetting itself doesn't usually fail in the sense that a device
> > would
> > not work anymore after resetting. The problem is that the resets
> > happen
> > in the first place. 90+% of runtime-resumes are fine - auto- and
> > wakeup-resume. Resetting is a major problem though, imagine a modem
> > device being re-enumerated during a phone call or "realtime" data
> > connection. I see that a lot.
> 
> Okay, I see.
> 
> > Let me record what hub.c says when leading up to the reset of 1-1.2
> > (the modem), with logs of a normal runtime resume/suspend cycle
> > included before that, as reference:
> > 
> > 1650447001.174798 pureos kernel: usb 1-1: usb auto-resume
> > 1650447001.242810 pureos kernel: usb 1-1: Waited 0ms for CONNECT
> > 1650447001.247853 pureos kernel: usb 1-1: finish resume
> > 1650447001.249697 pureos kernel: hub 1-1:1.0: hub_resume
> > 1650447001.251409 pureos kernel: usb 1-1-port1: status 0507 change
> > 0000
> > 1650447001.251624 pureos kernel: usb 1-1-port2: status 0507 change
> > 0000
> > 1650447001.251793 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg
> > 0000
> > evt 0000
> > 1650447001.253052 pureos kernel: usb 1-1.2: usb auto-resume
> 
> What is the cause of this runtime resume?  According to the port
> status 
> above, the 1-1.2 device did not send a wakeup request.

How would I find out? Recording via usbmon is next on my todo list.

> 
> > 1650447001.318845 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
> > 1650447001.324925 pureos kernel: usb 1-1.2: finish resume
> > 1650447003.831095 pureos kernel: usb 1-1.2: usb auto-suspend,
> > wakeup 1
> > 1650447003.854701 pureos kernel: hub 1-1:1.0: hub_suspend
> > 1650447003.874773 pureos kernel: usb 1-1: usb auto-suspend, wakeup
> > 1
> > 1650447003.922054 pureos kernel: usb 1-1: usb wakeup-resume
> 
> This wakeup occurred only 48 ms after the hub was runtime suspended. 
> But here at least the cause is evident: The hub sent a wakeup request
> because its child (the 1-1.2 modem) disconnected.

fwiw, that wakeup-resume *always* comes about 50 ms after the last
runtime suspend.

> 
> > 1650447003.942066 pureos kernel: usb 1-1: Waited 0ms for CONNECT
> > 1650447003.945755 pureos kernel: usb 1-1: finish resume
> > 1650447003.947589 pureos kernel: hub 1-1:1.0: hub_resume
> > 1650447003.949226 pureos kernel: usb 1-1-port1: status 0507 change
> > 0000
> > 1650447003.949430 pureos kernel: usb 1-1-port2: status 0101 change
> > 0005
> > 1650447004.058779 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg
> > 0004
> > evt 0000
> > 1650447004.074089 pureos kernel: usb 1-1.2: usb wakeup-resume
> > 1650447004.094056 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
> > 1650447004.097255 pureos kernel: usb 1-1.2: finish reset-resume
> > 1650447004.182333 pureos kernel: usb 1-1.2: reset high-speed USB
> > device
> > number 5 using xhci-hcd
> > 1650447004.314425 pureos kernel: usb 1-1-port2: resume, status 0
> > 1650447004.317628 pureos kernel: usb 1-1-port2: status 0101, change
> > 0004, 12 Mb/s
> > 1650447004.318673 pureos kernel: usb 1-1.2: USB disconnect, device
> > number 5
> > 1650447004.323374 pureos kernel: usb 1-1.2: unregistering device
> 
> And it looks like in this case, the reset-resume failed.

Well, at least reset_resume has been set, which I want to avoid.

> 
> > So before resetting, the hub reads
> > "usb 1-1-port2: status 0101 change 0005" instead of normally
> > "usb 1-1-port2: status 0507 change 0000"
> > 
> > but I don't know why. That portstatus/portchange doesn't change
> > over
> > time when I just keep reading portstatus/portchange in
> > hub_activate()
> > in a loop.
> 
> You mean that if the port status and change values are originally 
> 0101 and 0005 in hub_activate(), they remain equal to those values? 
> And 
> similarly if they are originally 0507 and 0000?
> 
> That is to be expected.  Nothing happens to make those values change 
> until hub_activate() sends some commands to the hub.

I see.

Of course this doesn't make much sense, but just so you know: if I just
don't let hub_activate() set udev->reset_resume to 1, then
check_port_resume_type() will do so, and thus again
finish_port_resume() will reset the device by calling
usb_reset_and_verify_device().

> 
> > > > The Hub and device is permanently connected on the PCB, so the
> > > > hub
> > > > is
> > > > interpreting it in a wrong way.
> > > 
> > > What is the hub is interpreting in a wrong way?  Why should a
> > > permanent 
> > > connection on the PCB have anything to do with whether the resume
> > > signals are misinterpreted?
> > 
> > I only wanted to say that the device (modem in this case) cannot be
> > unplugged - there's no plug. That's all :)
> >      
> > https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/hub.c#L1197
> > interprets my situation as a "removed" device.
> 
> What it means is that the modem was electronically disconnected from
> the 
> USB bus.  In theory this could be the result of a mixup in the resume
> signals, but it's more likely that the modem did this deliberately 
> because its firmware crashed.  (Why it should crash while it is 
> suspended is a good question, though...)

ok. assuming such a firmware bug, if I set a new quirk for the device,
do you think I can work around that (in hub.c?) in a way that userspace
doesn't really notice?

In theory, if I know this behaviour in advance, I think I should be
able to somehow wait until the device is ready again instead of
resetting.


> 
> > > >  I found an email that describes what I
> > > > see from Sarah Sharp in 2013 here:
> > > > https://marc.info/?l=linux-usb&m=137754385421825&w=2 Where she
> > > > says:
> > > > 
> > > > "Occasionally, the host controller was sending the SoFs too
> > > > soon on
> > > > resume, and the device would interpret it as a low-speed
> > > > chirp. 
> > > > The
> > > > device would disconnect, and transform from a high speed device
> > > > to
> > > > a
> > > > low speed device.  I don't think increasing the 10 ms time out
> > > > will
> > > > help at all in this case, but you did ask what USB device
> > > > disconnect
> > > > scenarios I've seen."
> > > 
> > > Read the following messages in that email thread.  Sarah said
> > > that
> > > she 
> > > would fix the SoF signal timing in xhci-hcd ("I agree that this
> > > seems
> > > like an xHCI driver issue, and I'll fix it in the driver").  I
> > > have
> > > no 
> > > idea whether this helped the faulty devices; my guess is that it
> > > didn't.
> > 
> > Do you know with what changes she tried to fix that?
> 
> No.  But you ought to be able to see by checking the history for that
> time period.
> 
> Alan Stern


