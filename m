Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB454381F55
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 16:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbhEPOxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 May 2021 10:53:07 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58551 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233315AbhEPOxH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 May 2021 10:53:07 -0400
Received: (qmail 1060786 invoked by uid 1000); 16 May 2021 10:51:51 -0400
Date:   Sun, 16 May 2021 10:51:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210516145151.GC1060053@rowland.harvard.edu>
References: <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org>
 <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org>
 <20210512153358.GC934575@rowland.harvard.edu>
 <87bl9d7oo0.fsf@kernel.org>
 <20210514165830.GA1010288@rowland.harvard.edu>
 <875yzk7b2y.fsf@kernel.org>
 <20210515153113.GB1036273@rowland.harvard.edu>
 <8735un6mjl.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735un6mjl.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 16, 2021 at 12:43:58PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Alan Stern <stern@rowland.harvard.edu> writes:
> >
> > If it's okay to call those functions in interrupt context then the 
> > kerneldoc definitely should be updated.  However, I don't see why you 
> > would want to make DELAYED_STATUS mandatory.  If all the necessary work 
> > can be done in the set_alt handler, why not return the status 
> > immediately?
> 
> because we avoid a special case. Instead of having magic return value to
> mean "Don't do anything until I enqueue a request" we can just make that
> an assumption, i.e. gadget driver *must* enqueue requests for data and
> status stages.

Okay.  But that would require auditing every gadget/function driver to 
ensure that they _do_ enqueue status stage requests, and auditing every 
UDC driver to ensure they don't send unsolicited status responses to 
control requests with data stages.  Until this happens, we're forced to 
use the DELAYED_STATUS magic value.

> > BTW, does it seem odd to you that these function drivers defer some of 
> > the set_alt activities into a work thread but do the ep_enable/disable 
> > parts right away, in interrupt context?  I should think the drivers 
> > would want to minimize the amount of processing that happens 
> > in_interrupt.
> 
> it is a bit odd, yes. I'm pretty sure this is forcing odd things to
> happen in at least camera gadget, which must communicate with v4l2.
> 
> IIRC, camera gadget processes frames in the same context as the
> ->complete callback, as well, which also runs in_interrupt.

Something for the UVC maintainers to cogitate on...

Alan Stern
