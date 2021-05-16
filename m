Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B08381F4C
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 16:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhEPOmd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 May 2021 10:42:33 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56653 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230324AbhEPOmd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 May 2021 10:42:33 -0400
Received: (qmail 1060585 invoked by uid 1000); 16 May 2021 10:41:18 -0400
Date:   Sun, 16 May 2021 10:41:18 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hritik Vijay <hritikxx8@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Order in which kernel decides binding device driver
Message-ID: <20210516144118.GB1060053@rowland.harvard.edu>
References: <YKA0hphGFeqM+BZG@Journey.localdomain>
 <20210516010154.GA1046393@rowland.harvard.edu>
 <YKCovrGBB4QQAl52@Journey.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKCovrGBB4QQAl52@Journey.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please use Reply-To-All so that your responses show up on the mailing 
list.

On Sun, May 16, 2021 at 10:38:14AM +0530, Hritik Vijay wrote:
> On Sat, May 15, 2021 at 09:01:54PM -0400, Alan Stern wrote:
> > I believe this happens in the order that the drivers are registered.  
> > For drivers in modules, this will be the order in which the modules are 
> > loaded.
> Can you please reference the code snippet with this ? If it happens in

There is no such snippet.  This is an emergent effect; it happens 
because __device_attach in drivers/base/dd.c calls bus_for_each_drv to 
try to match drivers with a new device, bus_for_each_drv in bus.c uses 
next_driver to iterate through the list of drivers on a bus, next_driver 
uses klist_next to follow the klist of driver knodes, and bus_add_driver 
calls klist_add_tail to add a new driver knode to the end of the klist 
of drivers for a bus.

> the order in which the modules are loaded then I suppose its the
> responsibility of the hot-plugging daemon (udev here) to take care of
> the load order.

No; load order is nobody's responsibility.  Making sure the system works 
correctly is the responsibility of the programmers who wrote the device 
drivers (is that you in this case?).  Drivers are supposed to work as 
desired no matter what order they get probed in.

> > driver will be able to manage a particular device.  For cases where 
> > there are two drivers capable of handling the same device, people 
> > usually have some sort of priority scheme to decide.  For example, many 
> > USB mass-storage devices can be handled by either the usb-storage or the 
> > uas driver, but uas has higher priority.
> > 
> > Alan Stern
> I'm curious about the case where no particular priority is defined.

In that case there is no definite requirement.  Either driver may be 
probed first and consequently may end up binding to the device; the 
result is more or less random.  It may even differ from one boot to the 
next.

> Hrtk

Alan Stern
