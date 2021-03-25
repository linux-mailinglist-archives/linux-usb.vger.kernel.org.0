Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EBB349999
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 19:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhCYSjH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 14:39:07 -0400
Received: from netrider.rowland.org ([192.131.102.5]:45151 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229576AbhCYSi5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Mar 2021 14:38:57 -0400
Received: (qmail 800380 invoked by uid 1000); 25 Mar 2021 14:38:56 -0400
Date:   Thu, 25 Mar 2021 14:38:56 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [RFC]extension of the anchor API
Message-ID: <20210325183856.GA799855@rowland.harvard.edu>
References: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
 <20210325150657.GC785961@rowland.harvard.edu>
 <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 25, 2021 at 05:04:25PM +0100, Oliver Neukum wrote:
> Am Donnerstag, den 25.03.2021, 11:06 -0400 schrieb Alan Stern:

> > > +:c:func:`usb_submit_anchored_urbs`
> > > +---------------------------------
> > > +
> > > +The URBs contained in anchor are chronologically submitted until
> > 
> > "chronologically" is the wrong word.  They are submitted in the order
> > of the anchor's list, which is the same as the order that an iterator
> > would use.
> 
> OK. "In the same sequence as they were anchored" ?

Hmmm.  What happens if you submit an anchor's worth of URBs, but then 
you kill them in the reverse order (which is how you would normally want 
to cancel a bunch of URBs)?  Since each URB gets moved to the end of the 
anchor's list when it completes, after they are all killed the list will 
be reversed.  So the next time you submit the anchor, the order of URBs 
will be backward.  If some of the URBs completed before they were 
killed, the order will be mixed up.

Of course, if you never use the URBs on an anchor after killing it, this 
doesn't matter.

Alan Stern
