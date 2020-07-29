Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B14D232024
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 16:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgG2OOt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 10:14:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41947 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726772AbgG2OOt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 10:14:49 -0400
Received: (qmail 1532820 invoked by uid 1000); 29 Jul 2020 10:14:48 -0400
Date:   Wed, 29 Jul 2020 10:14:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Roger Quadros <rogerq@ti.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Adding and removing the same gadget multiple times
Message-ID: <20200729141448.GB1530967@rowland.harvard.edu>
References: <20200728193246.GD1507946@rowland.harvard.edu>
 <20200729014656.GA17475@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729014656.GA17475@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 29, 2020 at 01:47:20AM +0000, Peter Chen wrote:
> On 20-07-28 15:32:46, Alan Stern wrote:
> > Roger:
> > 
> > Your commit fac323471df6 ("usb: udc: allow adding and removing the same 
> > gadget device") from a few years ago just caught my eye.  (I don't 
> > recall whether I noticed it at the time.)
> > 
> > In any case, we need to talk about it.  What you're doing -- 
> > unregistering and re-registering the struct device embedded in the 
> > gadget structure -- is strictly forbidden by the kernel's device model. 
> > It's even mentioned specifically in the kerneldoc for device_add().
> > 
> > Now, I guess doing this would be okay _if_ you took care not to 
> > re-register the device until all references to the previous incarnation 
> > have been dropped.  In particular, setting the structure's memory to 0 
> > should not be done immediately after calling device_unregister() -- 
> > which is what the commit does -- but rather in the release routine.
> > 
> > Do you know which UDC drivers actually do re-register their gadgets?  In 
> > particular, do they have their own release routines or do they rely on 
> > the default usb_udc_nop_release() provided by the UDC core?
> 
> dwc3 and cdns3 gadget driver do that, they use default usb_udc_nop_release()
> provided by the UDC core. The usb_add_gadget_udc is called when the
> controller role switch to device mode (the host VBUS is seen at device
> side), and usb_del_gadget_udc is called when the cable is disconnected
> from host.

What if the role switches back to host without the cable being
disconnected?

> > Moving the 
> > memset into that routine ought to be okay; leaving it where it is would 
> > be a time bomb waiting to go off.  I'm suprised it hasn't caused 
> > problems already.
> 
> I have not seen problem when do hot plug, maybe one second is enough to
> free all resources for gadget device?

Maybe.  I don't know what other parts of the kernel might take a
reference to the gadget's embedded struct device, but it certainly is
not safe to wipe the struct device memory until the last reference
has been dropped.  And it is not safe to re-register the gadget until
the memory has been wiped.

(It used to be that userspace could keep a reference to a device
indefinitely, just by holding open one of its sysfs attribute files.
That may not be true any more, but there may be other ways for
userspace to accomplish the same thing.)

Alan Stern
