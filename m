Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55982DB0A5
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 16:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730456AbgLOP4f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 10:56:35 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41909 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730417AbgLOP4Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 10:56:25 -0500
Received: (qmail 197069 invoked by uid 1000); 15 Dec 2020 10:55:42 -0500
Date:   Tue, 15 Dec 2020 10:55:41 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Jun Li <lijun.kernel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: port power is on again after turning off by user space
Message-ID: <20201215155541.GA195633@rowland.harvard.edu>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
 <20201215051402.GC2142@b29397-desktop>
 <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 15, 2020 at 09:57:53AM +0000, Peter Chen wrote:
>  
> > > > Hi Alan,
> > > >
> > > > I use one HUB power control application
> > > >
> > (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> > com%2Fmvp%2Fuhubctl&amp;data=04%7C01%7Cpeter.chen%40nxp.com%7C
> > 736ece19bc7a430c98b808d8a0b6975c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> > 35%7C0%7C0%7C637436053362151022%7CUnknown%7CTWFpbGZsb3d8eyJ
> > WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> > C1000&amp;sdata=lptf1XO5yeb6lQbAFlKUrZ%2BEX5ATXQRftGwm26WowFA%
> > 3D&amp;reserved=0) to investigate power switchable HUB, and find the kernel
> > turns port power on again at drivers/usb/core/hub.c, after port power is turned
> > off by user space.
> > > >
> > > > 5122                 if (hub_is_port_power_switchable(hub)
> > > > 5123                                 && !port_is_power_on(hub,
> > portstatus)
> > > > 5124                                 && !port_dev->port_owner)
> > > > 5125                         set_port_feature(hdev, port1,
> > USB_PORT_FEAT_POWER);
> > > >
> > > > The main sequence for testing turn port power off like below:
> > > >
> > > > - uhubctl sends command to turn specifc port (eg, 2-1.4) power off.
> > > > - devio at kernel gets that command, and send to hub.
> > > > - port power is off, the hub_event is triggered due to port status is changed.
> > > > - usb_disconnect is called, but port power is on again by kernel at function
> > hub_port_connect.
> > > >
> > > > I can't find the code history why the port power needs to turn on after
> > device is disconnected, do you know why?
> > > > Any sugguestions to fix it? Thanks.
> > >
> > > Seems in this case the port need claimed by user app, I am seeing this
> > > commit
> > >
> > > commit fbaecff06a7db4defa899a664fe2758e5161b39d
> > > Author: Deepak Das <deepakdas.linux@gmail.com>
> > > Date:   Wed Jan 21 23:39:58 2015 +0530
> > >
> > >     usb: core: hub: modify hub reset logic in hub driver
> > >
> > >     Currently if port power is turned off by user on hub port
> > >     using USBDEVFS then port power is turned back ON
> > >     by hub driver.
> > >     This commit modifies hub reset logic in hub_port_connect() to prevent
> > >     hub driver from turning back the port power ON if port is not owned
> > >     by kernel.
> > >
> > >     Signed-off-by: Deepak Das <deepakdas.linux@gmail.com>
> > >     Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >
> > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c index
> > > b4bfa3a..3e9c4d4 100644
> > > --- a/drivers/usb/core/hub.c
> > > +++ b/drivers/usb/core/hub.c
> > > @@ -4655,9 +4655,13 @@ static void hub_port_connect(struct usb_hub
> > > *hub, int port1, u16 portstatus,
> > >         if (!(portstatus & USB_PORT_STAT_CONNECTION) ||
> > >                         test_bit(port1, hub->removed_bits)) {
> > >
> > > -               /* maybe switch power back on (e.g. root hub was reset)
> > */
> > > +               /*
> > > +                * maybe switch power back on (e.g. root hub was reset)
> > > +                * but only if the port isn't owned by someone else.
> > > +                */
> > >                 if (hub_is_port_power_switchable(hub)
> > > -                               && !port_is_power_on(hub,
> > portstatus))
> > > +                               && !port_is_power_on(hub,
> > portstatus)
> > > +                               && !port_dev->port_owner)
> > >                         set_port_feature(hdev, port1,
> > > USB_PORT_FEAT_POWER);
> > >
> > >                 if (portstatus & USB_PORT_STAT_ENABLE)
> > >
> > 
> > Yes, I saw this commit. But the port is owned by kernel, the device on the port
> > could be enumerated by kernel, just the power on the port could be changed by
> > user space.

You've got the general idea.

Normally ports are owned by the hub driver.  If one of them loses power 
for some reason (for example, the user turns it off), the hub driver 
will turn the power back on.  This is because the hub driver wants 
ports to be powered at all times unless they are in runtime suspend.

The way to prevent the hub driver from managing the port power is to 
claim the port for the user, by issuing the USBDEVFS_CLAIM_PORT ioctl.  
Also, when that is done, the kernel wno't try to manage a device 
attached to the port -- that is, the kernel won't automatically install 
a configuration for a new device and it won't try to probe drivers for 
the device's interfaces if the user installs a config.

> I find this issue has discussed there, but I can't open the URL: https://bit.ly/2JzczjZ
> Below the description from: https://github.com/mvp/uhubctl.
> Their workarounds are not good.
> 
> Power comes back on after few seconds on Linux
> 
> Some device drivers in kernel are surprised by USB device
> being turned off and automatically try to power it back on.
> 
> You can use option -r N where N is some number from 10 to 1000
> to fix this - uhubctl will try to turn power off many times in quick
> succession, and it should suppress that. This may be eventually fixed
> in kernel, see more discussion here.
> 
> Disabling USB authorization for device in question before
> turning power off with uhubctl should help:
> 
> echo 0 > sudo tee /sys/bus/usb/devices/${location}.${port}/authorized
> If your device is USB mass storage, invoking udisksctl before calling uhubctl
> should help too:
> 
> sudo udisksctl power-off --block-device /dev/disk/...`
> sudo uhubctl -a off ...

Yes, this certainly indicates that they don't understand the real 
problem or the appropriate solution.  You could file a bug report for 
the github project to tell them.

Alan Stern
