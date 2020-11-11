Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBFA2AF592
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 16:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgKKP5U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 10:57:20 -0500
Received: from netrider.rowland.org ([192.131.102.5]:59993 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727497AbgKKP5S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 10:57:18 -0500
Received: (qmail 238536 invoked by uid 1000); 11 Nov 2020 10:57:17 -0500
Date:   Wed, 11 Nov 2020 10:57:17 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Kyungtae Kim <kt0755@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: WARNING in usb_composite_setup_continue
Message-ID: <20201111155717.GC237113@rowland.harvard.edu>
References: <CAEAjamsxe9OuMVpHfox3w57HtGsE3mPXOty9bdXW-iPdx=TXMA@mail.gmail.com>
 <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
 <20201110155650.GC190146@rowland.harvard.edu>
 <20201111075905.GF14896@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111075905.GF14896@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 11, 2020 at 07:59:34AM +0000, Peter Chen wrote:
> On 20-11-10 10:56:50, Alan Stern wrote:
> > Felipe:
> > 
> > On Mon, Nov 09, 2020 at 02:29:42PM -0500, Kyungtae Kim wrote:
> > > We report a bug (in linux-5.8.13) found by FuzzUSB (a modified version
> > > of syzkaller).
> > > 
> > > (corrected analysis)
> > > This bug happens while continuing a delayed setup message in mass
> > > storage gadget.
> > > To be specific, composite_setup() sets FSG_STATE_CONFIG_CHANGE via
> > > fsg_set_alt() (line 1793),
> > > and followed by cdev->delayed_status++ (line 1798).
> > > Meanwile, the mass gadget tries  check cdev->delayed_status == 0
> > > through handle_exception() (line 2428),
> > > which occurs in between the two operations above.
> > > Such a race causes invalid operations eventually.
> > 
> > Do you know who maintains composite.c (or the composite framework) these 
> > days?  This is a real race, and it needs to be fixed.
> > 
> > Part of the problem seems to be that cdev->delayed_status is sometimes 
> > accessed without the protection of cdev->lock.  But I don't know when it 
> > is safe to take that lock, so I can't tell what changes to make.
> > 
> > Another part of the problem is that cdev->delayed_status doesn't count 
> > things properly.  That is, its value is incremented each time a function 
> > driver asks for a delayed status and decremented each time a function 
> > driver calls usb_composite_setup_continue(), and the delayed status 
> > response is sent when the value reaches 0.  But there's nothing to stop 
> > this from happening (imagine a gadget with two functions A and B):
> > 
> > 	Function driver A asks for delayed status;
> > 	Function driver A calls setup_continue(): Now the value
> > 		of the counter is 0 so a status message is queued
> > 		too early;
> > 	Function driver B asks for delayed status;
> > 	Function driver B calls setup_continue(): Now a second
> > 		status message is queued.
> > 
> > I'm willing to help fix these issues, but I need assistance from someone 
> > who fully understands the composite framework.
> > 
> 
> Hi Alan & Kyungtae,
> 
> I quite not understand why this occurs, since cdev->delayed_status's
> increment and decrement are both protected by cdev->lock.
> 
> cdev->delayed_status's increment:
> 
> Place 1:
> case USB_REQ_GET_CONFIGURATION:
> spin_lock(&cdev->lock);
> set_config(cdev, ctrl, w_value);
> 	f->set_alt;
> 	cdev->delayed_status++;
> 
> spin_unlock(&cdev->lock);
> 
> Place 2:
> case USB_REQ_SET_INTERFACE:
> spin_lock(&cdev->lock);
> value = f->set_alt(f, w_index, w_value);
> if (value == USB_GADGET_DELAYED_STATUS) {
> 	DBG(cdev,
> 	 "%s: interface %d (%s) requested delayed status\n",
> 			__func__, intf, f->name);
> 	cdev->delayed_status++;
> 	DBG(cdev, "delayed_status count %d\n",
> 			cdev->delayed_status);
> }
> spin_unlock(&cdev->lock);
> 
> cdev->delayed_status's decrement:
> function: usb_composite_setup_continue which called by fsg_main_thread
> due to FSG_STATE_CONFIG_CHANGE.
> 
> spin_lock_irqsave(&cdev->lock, flags);
> 
> 	if (cdev->delayed_status == 0) {
> 		WARN(cdev, "%s: Unexpected call\n", __func__);
> 
> 	} else if (--cdev->delayed_status == 0) {
> 		...
> 
> spin_unlock_irqrestore(&cdev->lock, flags);

You are right.  I didn't follow the call changes enough to see that 
set_config and reset_config are always called with cdev->lock held.

However, the other problem outlined in my earlier email still remains.  
But now I understand what's happening well enough to write a patch.

Alan Stern
