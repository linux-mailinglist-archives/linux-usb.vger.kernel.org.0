Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19FFF513C0B
	for <lists+linux-usb@lfdr.de>; Thu, 28 Apr 2022 21:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351382AbiD1TQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Apr 2022 15:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiD1TQk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Apr 2022 15:16:40 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E4CDFBABBC
        for <linux-usb@vger.kernel.org>; Thu, 28 Apr 2022 12:13:24 -0700 (PDT)
Received: (qmail 922515 invoked by uid 1000); 28 Apr 2022 15:13:24 -0400
Date:   Thu, 28 Apr 2022 15:13:24 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB device disconnects on resume
Message-ID: <YmrnVHA2/kttJQJa@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
 <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
 <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
 <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
 <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
 <YmFpMFlTt83s90an@rowland.harvard.edu>
 <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
 <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
 <232334eeb9d7321df1632e453839a6d433e6be45.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <232334eeb9d7321df1632e453839a6d433e6be45.camel@puri.sm>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 28, 2022 at 09:01:50AM +0200, Martin Kepplinger wrote:
> Am Dienstag, dem 26.04.2022 um 10:58 -0400 schrieb Alan Stern:
> > Here's a quick low-level description of what's going on.
> > 
> > When a hub gets a disconnect event on one of its ports, it disables
> > the 
> > port.  The port then remains disabled, even if another device is
> > plugged 
> > in, until a successful port reset occurs.  In other words, the _only_
> > way to re-enable a port is to issue a reset.
> > 
> > The reset-resume mechanism in the kernel takes care of issuing the 
> > reset, and it checks to make sure that the device attached to the
> > port 
> > hasn't been changed (i.e., it's still the same device as before, not
> > a 
> > new one).  If that works, the device is put back in its former
> > operating 
> > state and should keep on functioning normally.  If that doesn't work,
> > or 
> > if there is a new device attached to the port, the kernel treats the 
> > event just like a normal disconnect + connect.
> > 
> > So what you want really _is_ a reset-resume.  If successful, it will 
> > give the behavior you mentioned above: continued transmission with
> > maybe 
> > some data loss and a big latency spike at one point.  Anything other 
> > than a successful reset-resume will cause the ttyUSB file to become 
> > unusable, exactly what you don't want.
> > 
> > So the real question you need to answer is why a reset-resume
> > sometimes 
> > fails with this modem.  I suspect the answer will be that the modem
> > is 
> > buggy, and there may not be any way to work around the bug.  But try 
> > putting the msleep(500) just before the usb_reset_and_verify_device()
> > call; maybe it will help.
> > 
> > Alan Stern
> 
> ok. thanks a lot for that suggestion! I added an extremely long
> msleep(5000) there and the behaviour indeed consistently changes a bit.
> (almost consistently, rarely I see the modem coming up as low-speed
> device, which is not allowed by hub.c and thus re-enumeration is
> triggered) but I added more debug messages and almost always that's how
> it looks like. I hope my added messages are understandable enough:
> 
> 11:43:50.800648: hub 1-1:1.0: hub_suspend
> 11:43:50.820074: usb 1-1: usb auto-suspend, wakeup 1
> 11:43:50.880637: usb 1-1: usb wakeup-resume
> 11:43:50.908646: usb 1-1: Waited 0ms for CONNECT
> 11:43:50.910445: usb 1-1: finish resume
> 11:43:50.911865: hub 1-1:1.0: hub_resume
> 11:43:50.913842: usb 1-1-port1: status 0507 change 0000
> 11:43:50.914026: usb 1-1-port2: status 0101 change 0005
> 11:43:51.020887: usb usb1-port1: resume, status 0
> 11:43:51.021205: hub 1-1:1.0: state 7 ports 3 chg 0004 evt 0000
> 11:43:51.048658: usb 1-1.2: usb wakeup-resume
> 11:43:51.076670: usb 1-1.2: Waited 0ms for CONNECT
> 11:43:51.078573: usb 1-1.2: finish reset-resume
> 11:43:56.305074: usb 1-1-port2: hub_port_reset: starting try 0 of 5
> 11:43:56.328683: hub 1-1:1.0: port_wait_reset: err = -11

-EAGAIN means that the modem disconnected around the time of the reset, 
so the reset failed.

> 11:43:56.333794: usb 1-1-port2: not enabled, trying reset again... 0 of
> 5. status=-11
> 11:43:56.334074: usb 1-1-port2: hub_port_reset: starting try 1 of 5
> 11:43:56.536645: usb 1-1-port2: hub_port_reset: no superspeed. status:
> 0. bail out

Not sure what that means.

> 11:43:56.628824: usb 1-1.2: reset high-speed USB device number 6 using
> xhci-hcd
> 11:43:56.640305: usb 1-1-port2: hub_port_reset: starting try 0 of 5
> 11:43:56.656735: usb 1-1-port2: hub_port_reset: no superspeed. status:
> 0. bail out
> 11:43:56.752738: usb 1-1-port2: resume, status 0

And it's hard to tell exactly what that refers to.

> 11:43:56.755442: usb 1-1-port2: port_event: call
> hub_port_connect_change because connect_change is 1
> 11:43:56.756663: usb 1-1-port2: status 0101, change 0004, 12 Mb/s
> 11:43:56.756942: usb 1-1.2: hub_port_connect_change: not resuscitating.
> 11:43:56.762495: usb 1-1-port2: hub_port_connect_change: could not
> revalidate the connection. call hub_port_connect.
> 11:43:56.762797: usb 1-1.2: USB disconnect, device number 6
> 11:43:56.765481: usb 1-1.2: unregistering device

It looks like these things happened after the reset-resume failed.  But 
the control flow isn't clear (more log messages might help).

> I'm sending this before analyzing it further. I'll do so soon but
> wanted to show you that already.

Okay.  But it seems that the modem refused to be reset properly.  When 
that happens there's no way to avoid disconnection.  And in fact I would 
expect that re-initialization and enumeration would then be impossible, 
since the first step of initialization is to perform a reset.

Alan Stern
