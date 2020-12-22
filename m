Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE6F2E0462
	for <lists+linux-usb@lfdr.de>; Tue, 22 Dec 2020 03:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgLVCfu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 21:35:50 -0500
Received: from netrider.rowland.org ([192.131.102.5]:58545 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725783AbgLVCfu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Dec 2020 21:35:50 -0500
Received: (qmail 456589 invoked by uid 1000); 21 Dec 2020 21:35:09 -0500
Date:   Mon, 21 Dec 2020 21:35:09 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Jun Li <lijun.kernel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Frank Li <frank.li@nxp.com>
Subject: Re: port power is on again after turning off by user space
Message-ID: <20201222023509.GA456319@rowland.harvard.edu>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
 <20201215051402.GC2142@b29397-desktop>
 <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <20201215155541.GA195633@rowland.harvard.edu>
 <20201216025549.GA5595@b29397-desktop>
 <20201216155144.GA238371@rowland.harvard.edu>
 <20201221053659.GA26433@b29397-desktop>
 <20201221162551.GB436749@rowland.harvard.edu>
 <20201222020215.GA4706@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222020215.GA4706@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 22, 2020 at 02:02:44AM +0000, Peter Chen wrote:
> On 20-12-21 11:25:51, Alan Stern wrote:
> > Okay.  This can be done as follows:
> > 
> > while (1) {
> > - Check Flash Drive is there (eg, cat /proc/partitions)
> > - Claim port 1 on 1-1
> > - Turn port 1 at 1-1 off
> > - Check Flash Drive is gone
> > - Release port 1 on 1-1
> > - Turn port 1 at 1-1 on
> > - Delay for 10 seconds (time for device probing)
> > }
> > 
> > 
> > > > On the other hand, if the port is managed by the kernel then the kernel 
> > > > (not the user) should be responsible for deciding whether or not to 
> > > > turn off the port's power.
> > > > 
> > > > If there's some real reason for turning the port power off for an 
> > > > extended period of time, the user can claim the port and turn off the 
> > > > power.  Then later on, the user can release the port and turn the power 
> > > > back on.
> > > > 
> > > 
> > > Yes, I think this is one of the use cases. We want power power control
> > > at one application (A), but different with our test application(B), it means
> > > if the user claims the port, and power off using A, then the A will end.
> > > After the B finished running, A runs again for power on, but at this time,
> > > the port owner has changed.
> > 
> > Yes, that won't work.  If you want to keep the port power turned off 
> > then you have to keep the usbfs device file open -- which means your 
> > program A must not end and then restart.
> > 
> > (Acutally, I'm not certain about that.  If you claim a port, turn off 
> > its power, and then release the port, I don't remember whether the hub 
> > driver will then turn the power back on right away.  It might not.  
> > But in any case, it isn't good programming to release a port without 
> > turning its power back on.)
> > 
> > Can A be rewritten so that it doesn't end when B is running?
> > 
> 
> Of course. I think the similar use case like below:
> 
> Program A (Port power control program)
> 
> while (1) {
> 	- Wait "turn off" command;
> 	- Claim requested port;
> 	- Turn off requested port;
> 	- Wait "turn on" command;
> 	- Turn on requested port
> 	- Release requested port;

You have to be a little careful about this.  Let's say you turn on the 
port power.  THen the device will connect and be enumerated.

But if you haven't released the port at this point, the kernel won't 
select a configuration for the device; it will leave the device in the 
unconfigured state.  Perhaps the code in usb_hub_release_port() and 
usb_hub_release_all_ports() needs to be changed; perhaps these routines 
should select and install a configuration if the child device isn't 
already configured.

For the time being, the safest approach is to release the port first 
and then turn on the power.  Of course, that's not ideal either because 
it would mean changing the power setting for a port you don't own.  But 
right now that's the best you can do.

> };
> 
> Program B actually is a script:
> 
> {
> while [ "$i" -lt 10000 ];
> do
> - Check Flash Drive is there (eg, cat /proc/partitions);
> - Send "turn off" command;
> - Wait 5 seconds, and check if Flash Drive has gone;
> - Send "turn on" command;
> - i=`expr $i + 1`;
> done
> terminate program A;
> };
> 
> I need to find communication solution between program A and script B.
> Or would you have any suggestions to design such kinds of test case?

Normally programs like this would communicate by a pipe or a Unix 
socket.  One way to make this work is for program B to run A in the 
background before the "while" loop starts, so that B could control 
the standard input and output files that A uses.  That's probably the 
approach I would take.

Alan Stern
