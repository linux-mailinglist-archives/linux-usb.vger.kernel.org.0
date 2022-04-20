Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C2F508AE8
	for <lists+linux-usb@lfdr.de>; Wed, 20 Apr 2022 16:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379697AbiDTOnZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Apr 2022 10:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379687AbiDTOnY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Apr 2022 10:43:24 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C086526138
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 07:40:37 -0700 (PDT)
Received: (qmail 632382 invoked by uid 1000); 20 Apr 2022 10:40:36 -0400
Date:   Wed, 20 Apr 2022 10:40:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB device disconnects on resume
Message-ID: <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
 <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
 <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 20, 2022 at 12:37:36PM +0200, Martin Kepplinger wrote:
> Am Dienstag, dem 19.04.2022 um 10:32 -0400 schrieb Alan Stern:
> > On Tue, Apr 19, 2022 at 11:28:21AM +0200, Martin Kepplinger wrote:
> > > hi,
> > > 
> > > I'm seeing resets and re-enumerations on runtime-resume for one
> > > device
> > > a lot. It's a modem connected to the USB2642 Microchip (SMSC) USB2
> > > hub,
> > > that's connected to an xhci HC.
> > > 
> > > A remote wakeup *sometimes* makes the hub say "physically
> > > disconnected"
> > > during resume in hub_activate(), and thus sets reset_resume. Then
> > > the
> > > device comes up as low-speed device once, which again is not
> > > allowed
> > > during normal runtime resume, so would itself trigger a reset.
> > 
> > Does the reset-resume always fail in this way?
> 
> Resetting itself doesn't usually fail in the sense that a device would
> not work anymore after resetting. The problem is that the resets happen
> in the first place. 90+% of runtime-resumes are fine - auto- and
> wakeup-resume. Resetting is a major problem though, imagine a modem
> device being re-enumerated during a phone call or "realtime" data
> connection. I see that a lot.

Okay, I see.

> Let me record what hub.c says when leading up to the reset of 1-1.2
> (the modem), with logs of a normal runtime resume/suspend cycle
> included before that, as reference:
> 
> 1650447001.174798 pureos kernel: usb 1-1: usb auto-resume
> 1650447001.242810 pureos kernel: usb 1-1: Waited 0ms for CONNECT
> 1650447001.247853 pureos kernel: usb 1-1: finish resume
> 1650447001.249697 pureos kernel: hub 1-1:1.0: hub_resume
> 1650447001.251409 pureos kernel: usb 1-1-port1: status 0507 change 0000
> 1650447001.251624 pureos kernel: usb 1-1-port2: status 0507 change 0000
> 1650447001.251793 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg 0000
> evt 0000
> 1650447001.253052 pureos kernel: usb 1-1.2: usb auto-resume

What is the cause of this runtime resume?  According to the port status 
above, the 1-1.2 device did not send a wakeup request.

> 1650447001.318845 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
> 1650447001.324925 pureos kernel: usb 1-1.2: finish resume
> 1650447003.831095 pureos kernel: usb 1-1.2: usb auto-suspend, wakeup 1
> 1650447003.854701 pureos kernel: hub 1-1:1.0: hub_suspend
> 1650447003.874773 pureos kernel: usb 1-1: usb auto-suspend, wakeup 1
> 1650447003.922054 pureos kernel: usb 1-1: usb wakeup-resume

This wakeup occurred only 48 ms after the hub was runtime suspended.  
But here at least the cause is evident: The hub sent a wakeup request 
because its child (the 1-1.2 modem) disconnected.

> 1650447003.942066 pureos kernel: usb 1-1: Waited 0ms for CONNECT
> 1650447003.945755 pureos kernel: usb 1-1: finish resume
> 1650447003.947589 pureos kernel: hub 1-1:1.0: hub_resume
> 1650447003.949226 pureos kernel: usb 1-1-port1: status 0507 change 0000
> 1650447003.949430 pureos kernel: usb 1-1-port2: status 0101 change 0005
> 1650447004.058779 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg 0004
> evt 0000
> 1650447004.074089 pureos kernel: usb 1-1.2: usb wakeup-resume
> 1650447004.094056 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
> 1650447004.097255 pureos kernel: usb 1-1.2: finish reset-resume
> 1650447004.182333 pureos kernel: usb 1-1.2: reset high-speed USB device
> number 5 using xhci-hcd
> 1650447004.314425 pureos kernel: usb 1-1-port2: resume, status 0
> 1650447004.317628 pureos kernel: usb 1-1-port2: status 0101, change
> 0004, 12 Mb/s
> 1650447004.318673 pureos kernel: usb 1-1.2: USB disconnect, device
> number 5
> 1650447004.323374 pureos kernel: usb 1-1.2: unregistering device

And it looks like in this case, the reset-resume failed.

> So before resetting, the hub reads
> "usb 1-1-port2: status 0101 change 0005" instead of normally
> "usb 1-1-port2: status 0507 change 0000"
> 
> but I don't know why. That portstatus/portchange doesn't change over
> time when I just keep reading portstatus/portchange in hub_activate()
> in a loop.

You mean that if the port status and change values are originally 
0101 and 0005 in hub_activate(), they remain equal to those values?  And 
similarly if they are originally 0507 and 0000?

That is to be expected.  Nothing happens to make those values change 
until hub_activate() sends some commands to the hub.

> > > The Hub and device is permanently connected on the PCB, so the hub
> > > is
> > > interpreting it in a wrong way.
> > 
> > What is the hub is interpreting in a wrong way?  Why should a
> > permanent 
> > connection on the PCB have anything to do with whether the resume 
> > signals are misinterpreted?
> 
> I only wanted to say that the device (modem in this case) cannot be
> unplugged - there's no plug. That's all :)
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/hub.c#L1197
> interprets my situation as a "removed" device.

What it means is that the modem was electronically disconnected from the 
USB bus.  In theory this could be the result of a mixup in the resume 
signals, but it's more likely that the modem did this deliberately 
because its firmware crashed.  (Why it should crash while it is 
suspended is a good question, though...)

> > >  I found an email that describes what I
> > > see from Sarah Sharp in 2013 here:
> > > https://marc.info/?l=linux-usb&m=137754385421825&w=2 Where she
> > > says:
> > > 
> > > "Occasionally, the host controller was sending the SoFs too soon on
> > > resume, and the device would interpret it as a low-speed chirp. 
> > > The
> > > device would disconnect, and transform from a high speed device to
> > > a
> > > low speed device.  I don't think increasing the 10 ms time out will
> > > help at all in this case, but you did ask what USB device
> > > disconnect
> > > scenarios I've seen."
> > 
> > Read the following messages in that email thread.  Sarah said that
> > she 
> > would fix the SoF signal timing in xhci-hcd ("I agree that this seems
> > like an xHCI driver issue, and I'll fix it in the driver").  I have
> > no 
> > idea whether this helped the faulty devices; my guess is that it
> > didn't.
> 
> Do you know with what changes she tried to fix that?

No.  But you ought to be able to see by checking the history for that 
time period.

Alan Stern
