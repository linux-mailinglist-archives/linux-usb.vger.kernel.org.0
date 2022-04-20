Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88DF6508618
	for <lists+linux-usb@lfdr.de>; Wed, 20 Apr 2022 12:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348058AbiDTKk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Apr 2022 06:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343759AbiDTKk2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Apr 2022 06:40:28 -0400
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA5B3FBF9
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 03:37:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 48F5ADFEDE;
        Wed, 20 Apr 2022 03:37:40 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oluvR5inljxB; Wed, 20 Apr 2022 03:37:39 -0700 (PDT)
Message-ID: <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1650451059; bh=m1etNdJ1z8MrIMkv9CwUVbY0zatlCtzn/CPYAnaYCZs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=TC27ilYmwN9UIrLxCcBKHtoov9GDdk30OiNOOdd209RHbMyAsSIFQXw0Ew8cwohcz
         hWstgSlk6OhQTydvbBgDHb4WzEK2/q/5k+8TS544w9xy9xrJXXPBThzKC85YfX0ib6
         4viXx6/oMUR17Mg00Y1jMfGo85Uhej+Sc2I7mI83IEAzUvBN1dO7iz1k33JkJmzXkg
         hnbW8iEvTScFHVyBr375iuQq9e9Bk0zW8qF+PI5TZm2F9L15PCnglBcEW/e59HIAaH
         gtw4NqJ4m24WFYu5QnLRvq9unzAUa2O6O7stFlF+JjkSZrpII7VDX6/ltZQ3XRIdtT
         YZH6dVzWEE7pA==
Subject: Re: USB device disconnects on resume
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 20 Apr 2022 12:37:36 +0200
In-Reply-To: <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
         <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
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

Am Dienstag, dem 19.04.2022 um 10:32 -0400 schrieb Alan Stern:
> On Tue, Apr 19, 2022 at 11:28:21AM +0200, Martin Kepplinger wrote:
> > hi,
> > 
> > I'm seeing resets and re-enumerations on runtime-resume for one
> > device
> > a lot. It's a modem connected to the USB2642 Microchip (SMSC) USB2
> > hub,
> > that's connected to an xhci HC.
> > 
> > A remote wakeup *sometimes* makes the hub say "physically
> > disconnected"
> > during resume in hub_activate(), and thus sets reset_resume. Then
> > the
> > device comes up as low-speed device once, which again is not
> > allowed
> > during normal runtime resume, so would itself trigger a reset.
> 
> Does the reset-resume always fail in this way?

Resetting itself doesn't usually fail in the sense that a device would
not work anymore after resetting. The problem is that the resets happen
in the first place. 90+% of runtime-resumes are fine - auto- and
wakeup-resume. Resetting is a major problem though, imagine a modem
device being re-enumerated during a phone call or "realtime" data
connection. I see that a lot.

Let me record what hub.c says when leading up to the reset of 1-1.2
(the modem), with logs of a normal runtime resume/suspend cycle
included before that, as reference:

1650447001.174798 pureos kernel: usb 1-1: usb auto-resume
1650447001.242810 pureos kernel: usb 1-1: Waited 0ms for CONNECT
1650447001.247853 pureos kernel: usb 1-1: finish resume
1650447001.249697 pureos kernel: hub 1-1:1.0: hub_resume
1650447001.251409 pureos kernel: usb 1-1-port1: status 0507 change 0000
1650447001.251624 pureos kernel: usb 1-1-port2: status 0507 change 0000
1650447001.251793 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg 0000
evt 0000
1650447001.253052 pureos kernel: usb 1-1.2: usb auto-resume
1650447001.318845 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
1650447001.324925 pureos kernel: usb 1-1.2: finish resume
1650447003.831095 pureos kernel: usb 1-1.2: usb auto-suspend, wakeup 1
1650447003.854701 pureos kernel: hub 1-1:1.0: hub_suspend
1650447003.874773 pureos kernel: usb 1-1: usb auto-suspend, wakeup 1
1650447003.922054 pureos kernel: usb 1-1: usb wakeup-resume
1650447003.942066 pureos kernel: usb 1-1: Waited 0ms for CONNECT
1650447003.945755 pureos kernel: usb 1-1: finish resume
1650447003.947589 pureos kernel: hub 1-1:1.0: hub_resume
1650447003.949226 pureos kernel: usb 1-1-port1: status 0507 change 0000
1650447003.949430 pureos kernel: usb 1-1-port2: status 0101 change 0005
1650447004.058779 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg 0004
evt 0000
1650447004.074089 pureos kernel: usb 1-1.2: usb wakeup-resume
1650447004.094056 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
1650447004.097255 pureos kernel: usb 1-1.2: finish reset-resume
1650447004.182333 pureos kernel: usb 1-1.2: reset high-speed USB device
number 5 using xhci-hcd
1650447004.314425 pureos kernel: usb 1-1-port2: resume, status 0
1650447004.317628 pureos kernel: usb 1-1-port2: status 0101, change
0004, 12 Mb/s
1650447004.318673 pureos kernel: usb 1-1.2: USB disconnect, device
number 5
1650447004.323374 pureos kernel: usb 1-1.2: unregistering device


So before resetting, the hub reads
"usb 1-1-port2: status 0101 change 0005" instead of normally
"usb 1-1-port2: status 0507 change 0000"

but I don't know why. That portstatus/portchange doesn't change over
time when I just keep reading portstatus/portchange in hub_activate()
in a loop.


> 
> > The Hub and device is permanently connected on the PCB, so the hub
> > is
> > interpreting it in a wrong way.
> 
> What is the hub is interpreting in a wrong way?  Why should a
> permanent 
> connection on the PCB have anything to do with whether the resume 
> signals are misinterpreted?

I only wanted to say that the device (modem in this case) cannot be
unplugged - there's no plug. That's all :)
https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/hub.c#L1197
interprets my situation as a "removed" device.

> 
> >  I found an email that describes what I
> > see from Sarah Sharp in 2013 here:
> > https://marc.info/?l=linux-usb&m=137754385421825&w=2 Where she
> > says:
> > 
> > "Occasionally, the host controller was sending the SoFs too soon on
> > resume, and the device would interpret it as a low-speed chirp. 
> > The
> > device would disconnect, and transform from a high speed device to
> > a
> > low speed device.  I don't think increasing the 10 ms time out will
> > help at all in this case, but you did ask what USB device
> > disconnect
> > scenarios I've seen."
> 
> Read the following messages in that email thread.  Sarah said that
> she 
> would fix the SoF signal timing in xhci-hcd ("I agree that this seems
> like an xHCI driver issue, and I'll fix it in the driver").  I have
> no 
> idea whether this helped the faulty devices; my guess is that it
> didn't.

Do you know with what changes she tried to fix that?

> 
> (She never did respond to my comment that there is no such thing as a
> "low-speed chirp".)
> 
> > I can't find any reference to that bug yet. Has anyone experienced
> > something (similar) and knows where I can at least try to work
> > around
> > that?
> > 
> > I don't know Sarahs' current email, could we forward this question
> > to
> > her?
> 
> Sarah hasn't worked on Linux or xhci-hcd for many years.  It's
> probably 
> not worth trying to ask her about this.
> 
> Alan Stern


