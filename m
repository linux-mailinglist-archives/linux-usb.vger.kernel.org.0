Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9710D2DFE02
	for <lists+linux-usb@lfdr.de>; Mon, 21 Dec 2020 17:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgLUQ0d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 11:26:33 -0500
Received: from netrider.rowland.org ([192.131.102.5]:45557 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725780AbgLUQ0d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Dec 2020 11:26:33 -0500
Received: (qmail 437704 invoked by uid 1000); 21 Dec 2020 11:25:51 -0500
Date:   Mon, 21 Dec 2020 11:25:51 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Jun Li <lijun.kernel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: port power is on again after turning off by user space
Message-ID: <20201221162551.GB436749@rowland.harvard.edu>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
 <20201215051402.GC2142@b29397-desktop>
 <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <20201215155541.GA195633@rowland.harvard.edu>
 <20201216025549.GA5595@b29397-desktop>
 <20201216155144.GA238371@rowland.harvard.edu>
 <20201221053659.GA26433@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221053659.GA26433@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 21, 2020 at 05:37:29AM +0000, Peter Chen wrote:
> On 20-12-16 10:51:44, Alan Stern wrote:
> > On Wed, Dec 16, 2020 at 02:56:20AM +0000, Peter Chen wrote:
> > > On 20-12-15 10:55:41, Alan Stern wrote:
> > > > You've got the general idea.
> > > > 
> > > > Normally ports are owned by the hub driver.  If one of them loses power 
> > > > for some reason (for example, the user turns it off), the hub driver 
> > > > will turn the power back on.  This is because the hub driver wants 
> > > > ports to be powered at all times unless they are in runtime suspend.
> > > > 
> > > > The way to prevent the hub driver from managing the port power is to 
> > > > claim the port for the user, by issuing the USBDEVFS_CLAIM_PORT ioctl.  
> > > > Also, when that is done, the kernel wno't try to manage a device 
> > > > attached to the port -- that is, the kernel won't automatically install 
> > > > a configuration for a new device and it won't try to probe drivers for 
> > > > the device's interfaces if the user installs a config.
> > > > 
> > > 
> > > Alan, we have several use cases for power switchable HUB, one of the use
> > > cases is USB port is managed by kernel (eg, needs mass storage
> > > class), but needs to toggle port power, is it reasonable we add a sysfs
> > > entry to support it?
> > 
> > Can you give more information about your use cases?  After all, if the 
> > port power is turned off then the port can't possibly handle 
> > mass-storage devices -- or anything else.
> 
> Sorry, Alan. Due to holiday season, the U.S team doesn't reply me the
> use case. I think the basic use cases are emulate the hot-plug test for
> USB devices, the USB devices could be Flash Drive on market or DUT (Device
> Under test) for the same controller works at device mode. Assume one
> typical test case:
> 
> Plug in Flash Drive at port 1-1.1 during the boots up:
> 
> while (1) {
> - Check Flash Drive is there (eg, cat /proc/partitions)
> - Turn port 1 at 1-1 off
> - Check Flash Drive is gone
> - Turn port 1 at 1-1 on
> }

Okay.  This can be done as follows:

while (1) {
- Check Flash Drive is there (eg, cat /proc/partitions)
- Claim port 1 on 1-1
- Turn port 1 at 1-1 off
- Check Flash Drive is gone
- Release port 1 on 1-1
- Turn port 1 at 1-1 on
- Delay for 10 seconds (time for device probing)
}


> > On the other hand, if the port is managed by the kernel then the kernel 
> > (not the user) should be responsible for deciding whether or not to 
> > turn off the port's power.
> > 
> > If there's some real reason for turning the port power off for an 
> > extended period of time, the user can claim the port and turn off the 
> > power.  Then later on, the user can release the port and turn the power 
> > back on.
> > 
> 
> Yes, I think this is one of the use cases. We want power power control
> at one application (A), but different with our test application(B), it means
> if the user claims the port, and power off using A, then the A will end.
> After the B finished running, A runs again for power on, but at this time,
> the port owner has changed.

Yes, that won't work.  If you want to keep the port power turned off 
then you have to keep the usbfs device file open -- which means your 
program A must not end and then restart.

(Acutally, I'm not certain about that.  If you claim a port, turn off 
its power, and then release the port, I don't remember whether the hub 
driver will then turn the power back on right away.  It might not.  
But in any case, it isn't good programming to release a port without 
turning its power back on.)

Can A be rewritten so that it doesn't end when B is running?

ALan Stern
