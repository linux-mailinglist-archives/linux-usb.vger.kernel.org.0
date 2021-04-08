Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99760357F0E
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 11:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhDHJX3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 05:23:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:56982 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231140AbhDHJX2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Apr 2021 05:23:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1617873797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SDy3Hgx4YK2iaQCTk3BRIHBMt+mFmuLK2rtuCM3mVBo=;
        b=LMDj3SvJm3hFXfcjBY1qWofp3Nbgh3t0Z9dru2J76Zz2t2Z2m6PC88X59MjRua8+1FIU8c
        E7ZccwpQ5dJhqlsUleNOH9jkLgO5Cb0tWu2UB4lQrb+Ql+uhqp9Ns39e8dZt83X+uyC04c
        L4NcCfTF7wB0MuhShZ3ZmWcwsHdHMqQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1CC4EAF23;
        Thu,  8 Apr 2021 09:23:17 +0000 (UTC)
Message-ID: <cc44e358406f48175fad9e956369d0f5a07efbe9.camel@suse.com>
Subject: Re: [RFC]extension of the anchor API
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 08 Apr 2021 11:23:05 +0200
In-Reply-To: <20210325183856.GA799855@rowland.harvard.edu>
References: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
         <20210325150657.GC785961@rowland.harvard.edu>
         <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
         <20210325183856.GA799855@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 25.03.2021, 14:38 -0400 schrieb Alan Stern:
> On Thu, Mar 25, 2021 at 05:04:25PM +0100, Oliver Neukum wrote:
> > Am Donnerstag, den 25.03.2021, 11:06 -0400 schrieb Alan Stern:
> > > > +:c:func:`usb_submit_anchored_urbs`
> > > > +---------------------------------
> > > > +
> > > > +The URBs contained in anchor are chronologically submitted until
> > > 
> > > "chronologically" is the wrong word.  They are submitted in the order
> > > of the anchor's list, which is the same as the order that an iterator
> > > would use.
> > 
> > OK. "In the same sequence as they were anchored" ?
> 
> Hmmm.  What happens if you submit an anchor's worth of URBs, but then 
> you kill them in the reverse order (which is how you would normally want 
> to cancel a bunch of URBs)?  Since each URB gets moved to the end of the 
> anchor's list when it completes, after they are all killed the list will 
> be reversed.  So the next time you submit the anchor, the order of URBs 
> will be backward.  If some of the URBs completed before they were 
> killed, the order will be mixed up.

Yes. If the URBs themselves, as opposed to their payloads, are
different, this will happen. Yet I am afraid we are looking at a
necessary race condition here. If you cancel a non-atomic operation,
you will need to deal with all possible intermediate stages of
completion.

> Of course, if you never use the URBs on an anchor after killing it, this 
> doesn't matter.

Yes, to partially solve this issue I wrote
usb_transfer_anchors()
which allows you to separate those URBs you kill (or submit)
by shifting them to another anchor. This is incomplete,
as obviously something you kill may do a transfer.

	Regards
		Oliver


