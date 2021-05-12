Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236E237EE4F
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 00:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346632AbhELV1t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 17:27:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52223 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1381449AbhELTeY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 15:34:24 -0400
Received: (qmail 944437 invoked by uid 1000); 12 May 2021 15:33:13 -0400
Date:   Wed, 12 May 2021 15:33:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210512193313.GA943744@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org>
 <20210510193849.GB873147@rowland.harvard.edu>
 <20210511025322.GA23868@nchen>
 <20210511191538.GC908414@rowland.harvard.edu>
 <20210512093748.GA17479@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512093748.GA17479@nchen>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 12, 2021 at 05:37:48PM +0800, Peter Chen wrote:
> On 21-05-11 15:15:38, Alan Stern wrote:
> > I suppose we could do something similar for the composite driver, for 
> > gadgets that don't use configfs.
> 
> Originally, I intended to do at composite.c to cover all gadget drivers, but
> I can't find a good way to use usb_composite_dev existing spinlock to do that.

It isn't necessary to use a spinlock.  RCU should work.

> Since most of users already used configfs, I chose to fix it at configfs directly.
> If we want to fix it for legacy gadget drivers (drivers at drivers/usb/gadget/legacy/).
> 
> For .setup & .suspend, we could delay 10ms after usb_gadget_disconnect, ensure
> hardware has triggered related interrupt, and we need to let all UDC drivers to
> add udc->gadget->irq, in that case, the pending threaded interrupt will be handled
> at synchronize_irq at usb_gadget_remove_driver.
> For .disconnect, we could use cdev->config to judge if the first .disconnect
> has run.

I'm not very worried about setup.  There should never be any setup 
events when the pull-up is off.  Disconnect, reset, and suspend are the 
main problems.

> > But what about legacy gadgets?  Are 
> > there any still around that don't use either configfs or the composite 
> > framework?
> 
> I only find raw_gadget.c that doesn't use composite framework, and it doesn't implement
> many usb_gadget_driver callbacks, eg, .disconnect and .suspend. For .setup, we could
> use above solutions for legacy composite driver.

Okay, that's good.

Alan Stern
