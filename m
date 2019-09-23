Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D87D6BB71F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 16:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440090AbfIWOuA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 10:50:00 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47019 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2438188AbfIWOuA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 10:50:00 -0400
Received: (qmail 26263 invoked by uid 500); 23 Sep 2019 10:49:59 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 23 Sep 2019 10:49:59 -0400
Date:   Mon, 23 Sep 2019 10:49:59 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     David Heinzelmann <heinzelmann.david@gmail.com>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Check for changed device descriptors when a connection-change
 occurs before validating the connection.
In-Reply-To: <20190920153357.GB5913@dhe-pc>
Message-ID: <Pine.LNX.4.44L0.1909231046380.24712-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 20 Sep 2019, David Heinzelmann wrote:

> On Fri, Sep 20, 2019 at 02:15:38PM +0200, Greg KH wrote:
> > On Fri, Sep 20, 2019 at 03:17:26PM +0200, David Heinzelmann wrote:
> > > Hi,
> > > 
> > > sorry for the wrong patch format.
> > 
> > No problem, that's normal.  But please do not top-post on linux mailing
> > lists.
> > 
> > > I am trying to detect a change. At the moment I think the change could be ignored if a
> > > port connection-change occurs and the port status has again the 'PORT_CONNECTION' bit set. 
> > > 
> > > I have a fx3 device which does a re-enumeration after a firmware download. This is working
> > > as expected and I am seeing a 'remove event' and a 'add event' monitoring via udevadm. But
> > > if I connect multiple devices at the same time via an usb hub I am sometimes not receiving
> > > a 'remove event' and 'add event' for a single device.
> > 
> > Sounds like a broken hub :)
> > 
> 
> I tried different hubs but I forgot to mention that it is also possible to trigger the issue
> without a hub if I reboot the devices via software at the same time. 
> 
> > > I think the problem could be that when a device disconnects and the port connection-change
> > > occurs and before the 'PORT_CONNECTION' bit is checked the device could already be
> > > reconnected and the 'PORT_CONNECTION' bit is set. Therefore I think it is not correct to
> > > resuscitate the exisiting device.
> > 
> > Does your patch actually fix the issue?  When a fx3 device downloads
> > firmware and re-enumerates, it should come back as a totally different
> > device, which will fail this check, right?  So I don't see how this
> > fixes the issues with your devices.
> > 
> 
> With the patch I do not have the issue anymore. After re-enumerate the device comes back with the same
> VID/PID but with a different device descriptor. Therefore the check will fail and hub_port_connect is
> called which initiates a device disconnect and connect. Without this 'reconnect' lsusb still shows me 
> the old device descriptor and I am not able to communicate with the device. 
> 
> > Unless all of the devices reset themselves at the same time and the hub
> > doesn't like that and can't notice that it happened?
> > 
> > If you use a different hub, does that work properly?
> > 
> 
> There is no difference if an other hub is used. It also happens without a hub when the devices are
> rebooted via software. My thoughts on this is that when the device re-enumerates and the device
> descriptor has changed a device disconnect and connect should be initiated instead of doing nothing?
> 
> If I understand it correctly the resuscitation is used for handling port enable-changes occured by EMI.
> But when the device is doing a re-enumeration there should be no resuscitation.

I really don't understand this.

Your patch involves the case where there was a connect-change event but 
the port is still enabled.  Now maybe I've forgotten about one of the 
pathways, but it seems like that combination should never occur.

Certainly it shouldn't occur in your case.  The device disconnects and 
then reconnects with a new set of descriptors.  The disconnect should 
cause the port to be disabled, and the port should remain disabled 
after the reconnect occurs.  So how can your new code run in the first 
place?

Alan Stern

