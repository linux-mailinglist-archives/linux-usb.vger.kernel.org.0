Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 525CB514666
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 12:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357273AbiD2KSd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 06:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbiD2KSb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 06:18:31 -0400
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F922F007
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 03:15:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 9E9A5DF679;
        Fri, 29 Apr 2022 03:15:13 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9EccxYY32lIJ; Fri, 29 Apr 2022 03:15:12 -0700 (PDT)
Message-ID: <1cb1cd1178703b4a67db849cc4c074b0c00b1332.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1651227312; bh=4iREwyrmVbLvf2WaVMGTX4u+oP4slnPpzZdHUA7YeZw=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Pap5m6ZBy1MnoXLzpUgcOvWy9ytoDzu4VC/fJKlvofBHJmcFDjhNjtxLQfckDnLK7
         MjFbuHebZT6LVVhfEiVtWRUmwBqXhmtZ+VbDXRzluRLrC6EIhsup/hh8IIlJgnR9xa
         MYntKwPaPaFvtjOXqm+7c5WbYxeoYAKQYpL0STWK5TAP/ESR5XeNyTGVx4shBUG9Uy
         Lbdpe746I7QpYKS9XTUQpjgBSzhnEJqpsZ1smjh/d9bfHzb6GXRJ2s8z/5w1s8G2T5
         KM+6J9vFSINFcQUpxaW4SRoinsdBDf3c3dY5VH1fsINx1WdXwwvmwyfwrLjgb4LCdK
         q+cDlNiuit03A==
Subject: Re: USB device disconnects on resume
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Fri, 29 Apr 2022 12:15:09 +0200
In-Reply-To: <YmrnVHA2/kttJQJa@rowland.harvard.edu>
References: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
         <Yl7ID1Vxp5+wR1py@rowland.harvard.edu>
         <5117280ddbcd07007adef1680f689bdea6af32e5.camel@puri.sm>
         <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
         <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
         <YmFpMFlTt83s90an@rowland.harvard.edu>
         <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
         <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
         <232334eeb9d7321df1632e453839a6d433e6be45.camel@puri.sm>
         <YmrnVHA2/kttJQJa@rowland.harvard.edu>
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

Am Donnerstag, dem 28.04.2022 um 15:13 -0400 schrieb Alan Stern:
> On Thu, Apr 28, 2022 at 09:01:50AM +0200, Martin Kepplinger wrote:
> > Am Dienstag, dem 26.04.2022 um 10:58 -0400 schrieb Alan Stern:
> > > Here's a quick low-level description of what's going on.
> > > 
> > > When a hub gets a disconnect event on one of its ports, it
> > > disables
> > > the 
> > > port.  The port then remains disabled, even if another device is
> > > plugged 
> > > in, until a successful port reset occurs.  In other words, the
> > > _only_
> > > way to re-enable a port is to issue a reset.
> > > 
> > > The reset-resume mechanism in the kernel takes care of issuing
> > > the 
> > > reset, and it checks to make sure that the device attached to the
> > > port 
> > > hasn't been changed (i.e., it's still the same device as before,
> > > not
> > > a 
> > > new one).  If that works, the device is put back in its former
> > > operating 
> > > state and should keep on functioning normally.  If that doesn't
> > > work,
> > > or 
> > > if there is a new device attached to the port, the kernel treats
> > > the 
> > > event just like a normal disconnect + connect.
> > > 
> > > So what you want really _is_ a reset-resume.  If successful, it
> > > will 
> > > give the behavior you mentioned above: continued transmission
> > > with
> > > maybe 
> > > some data loss and a big latency spike at one point.  Anything
> > > other 
> > > than a successful reset-resume will cause the ttyUSB file to
> > > become 
> > > unusable, exactly what you don't want.
> > > 
> > > So the real question you need to answer is why a reset-resume
> > > sometimes 
> > > fails with this modem.  I suspect the answer will be that the
> > > modem
> > > is 
> > > buggy, and there may not be any way to work around the bug.  But
> > > try 
> > > putting the msleep(500) just before the
> > > usb_reset_and_verify_device()
> > > call; maybe it will help.
> > > 
> > > Alan Stern
> > 
> > ok. thanks a lot for that suggestion! I added an extremely long
> > msleep(5000) there and the behaviour indeed consistently changes a
> > bit.
> > (almost consistently, rarely I see the modem coming up as low-speed
> > device, which is not allowed by hub.c and thus re-enumeration is
> > triggered) but I added more debug messages and almost always that's
> > how
> > it looks like. I hope my added messages are understandable enough:
> > 
> > 11:43:50.800648: hub 1-1:1.0: hub_suspend
> > 11:43:50.820074: usb 1-1: usb auto-suspend, wakeup 1
> > 11:43:50.880637: usb 1-1: usb wakeup-resume
> > 11:43:50.908646: usb 1-1: Waited 0ms for CONNECT
> > 11:43:50.910445: usb 1-1: finish resume
> > 11:43:50.911865: hub 1-1:1.0: hub_resume
> > 11:43:50.913842: usb 1-1-port1: status 0507 change 0000
> > 11:43:50.914026: usb 1-1-port2: status 0101 change 0005
> > 11:43:51.020887: usb usb1-port1: resume, status 0
> > 11:43:51.021205: hub 1-1:1.0: state 7 ports 3 chg 0004 evt 0000
> > 11:43:51.048658: usb 1-1.2: usb wakeup-resume
> > 11:43:51.076670: usb 1-1.2: Waited 0ms for CONNECT
> > 11:43:51.078573: usb 1-1.2: finish reset-resume
> > 11:43:56.305074: usb 1-1-port2: hub_port_reset: starting try 0 of 5
> > 11:43:56.328683: hub 1-1:1.0: port_wait_reset: err = -11
> 
> -EAGAIN means that the modem disconnected around the time of the
> reset, 
> so the reset failed.
> 

ok, but we try up to 5 times and the second time below runs further,
until the !hub_is_superspeed()

> > 11:43:56.333794: usb 1-1-port2: not enabled, trying reset again...
> > 0 of
> > 5. status=-11
> > 11:43:56.334074: usb 1-1-port2: hub_port_reset: starting try 1 of 5
> > 11:43:56.536645: usb 1-1-port2: hub_port_reset: no superspeed.
> > status:
> > 0. bail out
> 
> Not sure what that means.

https://elixir.bootlin.com/linux/v5.18-rc4/source/drivers/usb/core/hub.c#L2995

> 
> > 11:43:56.628824: usb 1-1.2: reset high-speed USB device number 6
> > using
> > xhci-hcd
> > 11:43:56.640305: usb 1-1-port2: hub_port_reset: starting try 0 of 5
> > 11:43:56.656735: usb 1-1-port2: hub_port_reset: no superspeed.
> > status:
> > 0. bail out
> > 11:43:56.752738: usb 1-1-port2: resume, status 0
> 
> And it's hard to tell exactly what that refers to.

https://elixir.bootlin.com/linux/v5.18-rc4/source/drivers/usb/core/hub.c#L3782

> 
> > 11:43:56.755442: usb 1-1-port2: port_event: call
> > hub_port_connect_change because connect_change is 1

this is 1 because change_bits has been read as "1" and
USB_PORT_STAT_C_CONNECTION is set.

> > 11:43:56.756663: usb 1-1-port2: status 0101, change 0004, 12 Mb/s
> > 11:43:56.756942: usb 1-1.2: hub_port_connect_change: not
> > resuscitating.

and here the udev->state is 7 (configured), so it's not resuscitated.

> > 11:43:56.762495: usb 1-1-port2: hub_port_connect_change: could not
> > revalidate the connection. call hub_port_connect.
> > 11:43:56.762797: usb 1-1.2: USB disconnect, device number 6
> > 11:43:56.765481: usb 1-1.2: unregistering device
> 
> It looks like these things happened after the reset-resume failed. 
> But 
> the control flow isn't clear (more log messages might help).

I'll resend with a bit more messages later. any specific other file
where the present debug messages would make sense? power management of
the qmi_wwan and generic usb drivers all look good.

> 
> > I'm sending this before analyzing it further. I'll do so soon but
> > wanted to show you that already.
> 
> Okay.  But it seems that the modem refused to be reset properly. 
> When 
> that happens there's no way to avoid disconnection.  And in fact I
> would 
> expect that re-initialization and enumeration would then be
> impossible, 
> since the first step of initialization is to perform a reset.

That's what gives me hope. re-initialization after "unregistering"
always (ok, almost, but we can assume always) works.


> 
> Alan Stern

again, I'm grateful that you talk that through with me. thanks a alot.

 martin


