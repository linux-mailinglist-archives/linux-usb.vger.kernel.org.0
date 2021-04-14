Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10D335EF44
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 10:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344890AbhDNINS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 04:13:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:60552 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349934AbhDNIMY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Apr 2021 04:12:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1618387922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cUArCRKfHMhF1D22qkoVMD3TlAZ59hfU9WptMICLfQw=;
        b=YM6wKk3TVQ/0j1WcCARmPy798kPcRmovVpVxS1sU/Mc454yYEIZpIYGz2f6Usub5ubw+xs
        XH6nsogadvAO10fKN4WUnY0HMd2++gJUDno4VcsdUS4fg109jzpSFyefS9FHQslU8BXOIS
        49yv7WjhmJPSHebX80Ll1fRmabqtuko=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3ADA3AFC8;
        Wed, 14 Apr 2021 08:12:02 +0000 (UTC)
Message-ID: <30abed362c4b2e6af33078505ac9985389ad39bb.camel@suse.com>
Subject: Re: [RFC]extension of the anchor API
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 14 Apr 2021 10:12:01 +0200
In-Reply-To: <20210412150628.GA1420451@rowland.harvard.edu>
References: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
         <20210325150657.GC785961@rowland.harvard.edu>
         <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
         <20210325183856.GA799855@rowland.harvard.edu>
         <cc44e358406f48175fad9e956369d0f5a07efbe9.camel@suse.com>
         <20210408150725.GC1296449@rowland.harvard.edu>
         <8c11f03b08a0bdfd2761a74f5a7964067dc4b98b.camel@suse.com>
         <20210412150628.GA1420451@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 12.04.2021, 11:06 -0400 schrieb Alan Stern:
> On Mon, Apr 12, 2021 at 11:58:16AM +0200, Oliver Neukum wrote:

> > That presumes that the URBs will finish in order. I don't think such
> > an assumption can be made.
> 
> I don't understand -- I can't detect any such presumption.

OK, this shows that I am bad at explaining.
> 
> As far as I can tell, the only reason for maintaining the URBs in any 
> particular order on the anchor list is so that usb_kill_anchored_urbs 
> and usb_poison_anchored_urbs can kill them in reverse order of 
> submission.  THat's why the current code moves completed URBs to the end 
> of the list.

No longer strictly true, as the API has a call to submit everything
on an anchor, but I think it boils down to the same thing.

> If you keep a pointer to the most recently submitted URB, killing them 
> easy enough to do.  Start with that URB, then go backward through the 
> list (wrapping to the end when you reach the beginning of the list).

Yes, but that supposes that the next on the list has not been
resubmitted _before_ the one after it.

If you do not keep the list ordered, but in the initial order,
we can have the situation that A (happens most recently submitted)
is followed by B and C, but C was submitted before B.


> 
> The order in which the URBs complete doesn't matter, because trying to 
> unlink a completed URB won't cause any harm.

As long as it stays completed.

>   The only assumption here 
> is that URBs get submitted in the list's order (possibly circularly) -- 
> this should always be true.

I am afraid we cannot guarantee that. It might intuitively seem so,
but nothing guarantees that all URBs are going to the same endpoint.

	Regards
		Oliver


