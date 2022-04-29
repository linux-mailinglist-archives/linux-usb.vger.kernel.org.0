Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15702515570
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 22:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238479AbiD2UZU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 16:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239542AbiD2UZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 16:25:19 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5646D49C8E
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 13:21:59 -0700 (PDT)
Received: (qmail 960426 invoked by uid 1000); 29 Apr 2022 16:21:58 -0400
Date:   Fri, 29 Apr 2022 16:21:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB device disconnects on resume
Message-ID: <YmxI5rIlyxOrPBHD@rowland.harvard.edu>
References: <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
 <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
 <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
 <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
 <YmFpMFlTt83s90an@rowland.harvard.edu>
 <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
 <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
 <232334eeb9d7321df1632e453839a6d433e6be45.camel@puri.sm>
 <YmrnVHA2/kttJQJa@rowland.harvard.edu>
 <1cb1cd1178703b4a67db849cc4c074b0c00b1332.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cb1cd1178703b4a67db849cc4c074b0c00b1332.camel@puri.sm>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 29, 2022 at 12:15:09PM +0200, Martin Kepplinger wrote:
> Am Donnerstag, dem 28.04.2022 um 15:13 -0400 schrieb Alan Stern:
> > On Thu, Apr 28, 2022 at 09:01:50AM +0200, Martin Kepplinger wrote:

I'll discuss what's going on, in greater detail...

> > > 11:43:50.800648: hub 1-1:1.0: hub_suspend
> > > 11:43:50.820074: usb 1-1: usb auto-suspend, wakeup 1
> > > 11:43:50.880637: usb 1-1: usb wakeup-resume
> > > 11:43:50.908646: usb 1-1: Waited 0ms for CONNECT
> > > 11:43:50.910445: usb 1-1: finish resume
> > > 11:43:50.911865: hub 1-1:1.0: hub_resume
> > > 11:43:50.913842: usb 1-1-port1: status 0507 change 0000
> > > 11:43:50.914026: usb 1-1-port2: status 0101 change 0005

That line is printed by hub_activate().  The 0001 bit in the "change" 
field is USB_PORT_STAT_C_CONNECTION.  hub_activate() clears it in line 
1178.

> > > 11:43:51.020887: usb usb1-port1: resume, status 0
> > > 11:43:51.021205: hub 1-1:1.0: state 7 ports 3 chg 0004 evt 0000

This line is printed at the start of hub_event().  It calls port_event() 
which calls hub_handle_remote_wakeup(), which calls usb_remote_wakeup(), 
which prints the next line:

> > > 11:43:51.048658: usb 1-1.2: usb wakeup-resume

Then usb_autoresume_device() ends up calling usb_port_resume()

> > > 11:43:51.076670: usb 1-1.2: Waited 0ms for CONNECT

That was from wait_for_connected().

> > > 11:43:51.078573: usb 1-1.2: finish reset-resume

Now we're in finish_port_resume() (including your 5-second delay), which 
calls usb_reset_and_verify_device(), which calls hub_port_init() in a 
loop. That routine starts by calling hub_port_reset().

> > > 11:43:56.305074: usb 1-1-port2: hub_port_reset: starting try 0 of 5

It issues a port reset and calls hub_port_wait_reset() to wait for the 
reset to complete.

> > > 11:43:56.328683: hub 1-1:1.0: port_wait_reset: err = -11
> > 
> > -EAGAIN means that the modem disconnected around the time of the
> > reset, 
> > so the reset failed.
> > 
> 
> ok, but we try up to 5 times and the second time below runs further,
> until the !hub_is_superspeed()
> 
> > > 11:43:56.333794: usb 1-1-port2: not enabled, trying reset again...
> > > 0 of
> > > 5. status=-11
> > > 11:43:56.334074: usb 1-1-port2: hub_port_reset: starting try 1 of 5

Okay, we try another reset.  But this time we don't see the return value 
from hub_port_wait_reset(), which means the value was 0, -ENOTCONN, or 
-ENODEV.  It would be nice to know what it really was.

> > > 11:43:56.536645: usb 1-1-port2: hub_port_reset: no superspeed.
> > > status:
> > > 0. bail out
> > 
> > Not sure what that means.
> 
> https://elixir.bootlin.com/linux/v5.18-rc4/source/drivers/usb/core/hub.c#L2995

That's not really bailing out.  Taking that goto means we are done 
trying to reset the device.  But what is the value of status?  I guess 
it must be 0, because if it weren't, hub_port_init() would follow its 
failure pathway.  Instead, it reached this line:

> > > 11:43:56.628824: usb 1-1.2: reset high-speed USB device number 6
> > > using
> > > xhci-hcd

and so the reset must have succeeded.  Now hub_port_init() issues a 
second reset as part of the normal device initialization procedure:

> > > 11:43:56.640305: usb 1-1-port2: hub_port_reset: starting try 0 of 5
> > > 11:43:56.656735: usb 1-1-port2: hub_port_reset: no superspeed.
> > > status:
> > > 0. bail out
> > > 11:43:56.752738: usb 1-1-port2: resume, status 0
> > 
> > And it's hard to tell exactly what that refers to.
> 
> https://elixir.bootlin.com/linux/v5.18-rc4/source/drivers/usb/core/hub.c#L3782

Which is back in hub_handle_remote_wakeup(), so evidently the entire 
reset succeeded and hub_port_init() should return 0.  It would be nice 
to verify this.

Anyway, it looks like the whole remote wakeup thing worked.

> > > 11:43:56.755442: usb 1-1-port2: port_event: call
> > > hub_port_connect_change because connect_change is 1
> 
> this is 1 because change_bits has been read as "1" and
> USB_PORT_STAT_C_CONNECTION is set.

Well, hub->change_bits certainly did cause connect_change to be 1, 
because hub_activate() set that bit in line 1241.  However the only 
reason for USB_PORT_STAT_C_CONNECTION to have been set when port_init() 
began would be if the modem disconnected itself again before it was 
reset.

Actually, that wouldn't be too surprising considering that the modem did 
disconnect itself during the first reset attempt.

> > > 11:43:56.756663: usb 1-1-port2: status 0101, change 0004, 12 Mb/s

This is printed at the start of hub_port_connect_change().  It indicates 
that the modem has once again disconnected itself, which must have 
happened at some point after the reset succeeded (which was only 4 ms 
earlier).  This is where the kernel gives up; it treats these
spontaneous disconnections the same as a real unplug.

> > > 11:43:56.756942: usb 1-1.2: hub_port_connect_change: not
> > > resuscitating.
> 
> and here the udev->state is 7 (configured), so it's not resuscitated.

Right.  The modem was resumed and reset, so at this point the port 
should have been enabled.  But it wasn't.  As far as the kernel is 
concerned, the modem is gone beyond hope of saving.

> > > 11:43:56.762495: usb 1-1-port2: hub_port_connect_change: could not
> > > revalidate the connection. call hub_port_connect.
> > > 11:43:56.762797: usb 1-1.2: USB disconnect, device number 6
> > > 11:43:56.765481: usb 1-1.2: unregistering device
> > 
> > It looks like these things happened after the reset-resume failed. 
> > But 
> > the control flow isn't clear (more log messages might help).

Going through it in more detail has shown that the reset did succeed but 
then the modem disconnected again afterward.  There isn't much we can do 
if the modem refuses to remain connected.

> I'll resend with a bit more messages later. any specific other file
> where the present debug messages would make sense? power management of
> the qmi_wwan and generic usb drivers all look good.

Not much else comes to mind.

> > > I'm sending this before analyzing it further. I'll do so soon but
> > > wanted to show you that already.
> > 
> > Okay.  But it seems that the modem refused to be reset properly. 
> > When 
> > that happens there's no way to avoid disconnection.  And in fact I
> > would 
> > expect that re-initialization and enumeration would then be
> > impossible, 
> > since the first step of initialization is to perform a reset.
> 
> That's what gives me hope. re-initialization after "unregistering"
> always (ok, almost, but we can assume always) works.

I don't see why re-initialization works any better.  It's not likely to 
be a question of waiting long enough, since you already waited for 5 
seconds.  There must be something different between the reset-resume and 
the re-initialization, but I can't tell what.

Maybe a usbmon trace showing the entire thing, both the reset-resume and 
the following re-initialization, would help.

Alan Stern
