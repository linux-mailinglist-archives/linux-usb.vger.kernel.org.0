Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B919650A225
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 16:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388875AbiDUO1o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 10:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352115AbiDUO1n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 10:27:43 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 611A23D49D
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 07:24:49 -0700 (PDT)
Received: (qmail 669590 invoked by uid 1000); 21 Apr 2022 10:24:48 -0400
Date:   Thu, 21 Apr 2022 10:24:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB device disconnects on resume
Message-ID: <YmFpMFlTt83s90an@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
 <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
 <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
 <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
 <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 21, 2022 at 12:38:56PM +0200, Martin Kepplinger wrote:
> Am Mittwoch, dem 20.04.2022 um 10:40 -0400 schrieb Alan Stern:
> > On Wed, Apr 20, 2022 at 12:37:36PM +0200, Martin Kepplinger wrote:
> > > Resetting itself doesn't usually fail in the sense that a device
> > > would
> > > not work anymore after resetting. The problem is that the resets
> > > happen
> > > in the first place. 90+% of runtime-resumes are fine - auto- and
> > > wakeup-resume. Resetting is a major problem though, imagine a modem
> > > device being re-enumerated during a phone call or "realtime" data
> > > connection. I see that a lot.
> > 
> > Okay, I see.

By the way, I assume that while resetting the modem is a major problem 
for your potential use cases, having it crash with no hope of recovery 
is even worse.  But maybe I'm wrong...

> > > Let me record what hub.c says when leading up to the reset of 1-1.2
> > > (the modem), with logs of a normal runtime resume/suspend cycle
> > > included before that, as reference:
> > > 
> > > 1650447001.174798 pureos kernel: usb 1-1: usb auto-resume
> > > 1650447001.242810 pureos kernel: usb 1-1: Waited 0ms for CONNECT
> > > 1650447001.247853 pureos kernel: usb 1-1: finish resume
> > > 1650447001.249697 pureos kernel: hub 1-1:1.0: hub_resume
> > > 1650447001.251409 pureos kernel: usb 1-1-port1: status 0507 change
> > > 0000
> > > 1650447001.251624 pureos kernel: usb 1-1-port2: status 0507 change
> > > 0000
> > > 1650447001.251793 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg
> > > 0000
> > > evt 0000
> > > 1650447001.253052 pureos kernel: usb 1-1.2: usb auto-resume
> > 
> > What is the cause of this runtime resume?  According to the port
> > status 
> > above, the 1-1.2 device did not send a wakeup request.
> 
> How would I find out? Recording via usbmon is next on my todo list.

That's a good thing to try in any case.

I asked because it seemed possible that you had manually caused the 
resume somehow.

> > > 1650447001.318845 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
> > > 1650447001.324925 pureos kernel: usb 1-1.2: finish resume
> > > 1650447003.831095 pureos kernel: usb 1-1.2: usb auto-suspend,
> > > wakeup 1
> > > 1650447003.854701 pureos kernel: hub 1-1:1.0: hub_suspend
> > > 1650447003.874773 pureos kernel: usb 1-1: usb auto-suspend, wakeup
> > > 1
> > > 1650447003.922054 pureos kernel: usb 1-1: usb wakeup-resume
> > 
> > This wakeup occurred only 48 ms after the hub was runtime suspended. 
> > But here at least the cause is evident: The hub sent a wakeup request
> > because its child (the 1-1.2 modem) disconnected.
> 
> fwiw, that wakeup-resume *always* comes about 50 ms after the last
> runtime suspend.

Maybe the modem's firmware has some 50-ms timeout that expires and then 
causes the crash.

> > > 1650447003.942066 pureos kernel: usb 1-1: Waited 0ms for CONNECT
> > > 1650447003.945755 pureos kernel: usb 1-1: finish resume
> > > 1650447003.947589 pureos kernel: hub 1-1:1.0: hub_resume
> > > 1650447003.949226 pureos kernel: usb 1-1-port1: status 0507 change
> > > 0000
> > > 1650447003.949430 pureos kernel: usb 1-1-port2: status 0101 change
> > > 0005
> > > 1650447004.058779 pureos kernel: hub 1-1:1.0: state 7 ports 3 chg
> > > 0004
> > > evt 0000
> > > 1650447004.074089 pureos kernel: usb 1-1.2: usb wakeup-resume
> > > 1650447004.094056 pureos kernel: usb 1-1.2: Waited 0ms for CONNECT
> > > 1650447004.097255 pureos kernel: usb 1-1.2: finish reset-resume
> > > 1650447004.182333 pureos kernel: usb 1-1.2: reset high-speed USB
> > > device
> > > number 5 using xhci-hcd
> > > 1650447004.314425 pureos kernel: usb 1-1-port2: resume, status 0
> > > 1650447004.317628 pureos kernel: usb 1-1-port2: status 0101, change
> > > 0004, 12 Mb/s
> > > 1650447004.318673 pureos kernel: usb 1-1.2: USB disconnect, device
> > > number 5
> > > 1650447004.323374 pureos kernel: usb 1-1.2: unregistering device
> > 
> > And it looks like in this case, the reset-resume failed.
> 
> Well, at least reset_resume has been set, which I want to avoid.

Do you mean you would prefer to have the modem disconnect permanently 
(or at least until the next reboot)?

> > > So before resetting, the hub reads
> > > "usb 1-1-port2: status 0101 change 0005" instead of normally
> > > "usb 1-1-port2: status 0507 change 0000"
> > > 
> > > but I don't know why. That portstatus/portchange doesn't change
> > > over
> > > time when I just keep reading portstatus/portchange in
> > > hub_activate()
> > > in a loop.
> > 
> > You mean that if the port status and change values are originally 
> > 0101 and 0005 in hub_activate(), they remain equal to those values? 
> > And 
> > similarly if they are originally 0507 and 0000?
> > 
> > That is to be expected.  Nothing happens to make those values change 
> > until hub_activate() sends some commands to the hub.
> 
> I see.
> 
> Of course this doesn't make much sense, but just so you know: if I just
> don't let hub_activate() set udev->reset_resume to 1, then
> check_port_resume_type() will do so, and thus again
> finish_port_resume() will reset the device by calling
> usb_reset_and_verify_device().

Yeah, there's some redundancy in there.  The core really tries pretty 
hard to make sure that devices don't get lost just because they have 
trouble handling a suspend + resume.

> > What it means is that the modem was electronically disconnected from
> > the 
> > USB bus.  In theory this could be the result of a mixup in the resume
> > signals, but it's more likely that the modem did this deliberately 
> > because its firmware crashed.  (Why it should crash while it is 
> > suspended is a good question, though...)
> 
> ok. assuming such a firmware bug, if I set a new quirk for the device,
> do you think I can work around that (in hub.c?) in a way that userspace
> doesn't really notice?

One thing you can do pretty easily, without changing the kernel, is 
prevent the modem from going into runtime suspend in the first place.  
For example, if you have a program like powertop overseeing your runtime 
power management, you could tell it not to let the modem suspend.  Or if 
you want to set it up by hand, the command is:

	echo on >/sys/bus/usb/devices/.../power/control

(where "..." is the appropriate path for the modem device, such as 
"1-1.2").  You can even write a udev script to do this automatically 
whenever the modem is detected.

> In theory, if I know this behaviour in advance, I think I should be
> able to somehow wait until the device is ready again instead of
> resetting.

What if the modem never becomes ready again (or not until you reboot)?  
I think that sort of behavior is not at all unlikely.  You can test this 
by disabling the code in finish_port_resume() that does reset-resumes.

Alan Stern
