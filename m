Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40DEE2DC372
	for <lists+linux-usb@lfdr.de>; Wed, 16 Dec 2020 16:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgLPPwZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Dec 2020 10:52:25 -0500
Received: from netrider.rowland.org ([192.131.102.5]:42357 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725812AbgLPPwZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Dec 2020 10:52:25 -0500
Received: (qmail 239177 invoked by uid 1000); 16 Dec 2020 10:51:44 -0500
Date:   Wed, 16 Dec 2020 10:51:44 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Jun Li <lijun.kernel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: port power is on again after turning off by user space
Message-ID: <20201216155144.GA238371@rowland.harvard.edu>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
 <20201215051402.GC2142@b29397-desktop>
 <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <20201215155541.GA195633@rowland.harvard.edu>
 <20201216025549.GA5595@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216025549.GA5595@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 16, 2020 at 02:56:20AM +0000, Peter Chen wrote:
> On 20-12-15 10:55:41, Alan Stern wrote:
> > You've got the general idea.
> > 
> > Normally ports are owned by the hub driver.  If one of them loses power 
> > for some reason (for example, the user turns it off), the hub driver 
> > will turn the power back on.  This is because the hub driver wants 
> > ports to be powered at all times unless they are in runtime suspend.
> > 
> > The way to prevent the hub driver from managing the port power is to 
> > claim the port for the user, by issuing the USBDEVFS_CLAIM_PORT ioctl.  
> > Also, when that is done, the kernel wno't try to manage a device 
> > attached to the port -- that is, the kernel won't automatically install 
> > a configuration for a new device and it won't try to probe drivers for 
> > the device's interfaces if the user installs a config.
> > 
> 
> Alan, we have several use cases for power switchable HUB, one of the use
> cases is USB port is managed by kernel (eg, needs mass storage
> class), but needs to toggle port power, is it reasonable we add a sysfs
> entry to support it?

Can you give more information about your use cases?  After all, if the 
port power is turned off then the port can't possibly handle 
mass-storage devices -- or anything else.

On the other hand, if the port is managed by the kernel then the kernel 
(not the user) should be responsible for deciding whether or not to 
turn off the port's power.

If there's some real reason for turning the port power off for an 
extended period of time, the user can claim the port and turn off the 
power.  Then later on, the user can release the port and turn the power 
back on.

Alternatively, if you only need to turn off the port power for a short 
time, what you're already doing should be okay.

I can't explain it any better than this unless I understand your use 
cases more fully.

Alan Stern
