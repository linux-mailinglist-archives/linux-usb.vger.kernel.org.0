Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637F335C3F3
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239086AbhDLK2T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 06:28:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:53344 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239060AbhDLK2S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 06:28:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1618223280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eKg+1LrX5Aumc0+m5G5bwbHrEC5fce1TswA3SrN/ZeA=;
        b=RREUAqwPfuniQvCVLmyEjeXZKaUvvShdXR8K1xeJa6Lc5CsII5Hga07HJXcigN25u2IqYf
        i93xD/UtfypeXSbWLItVoyIMa+1ovBE7yc6rG7t/aGvrWlXa+6NwuODfBoxCJfIetVdZxf
        sNg0+uX2VVO3SBQt63sS+6ARg9OpJto=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2C93DAF17;
        Mon, 12 Apr 2021 10:28:00 +0000 (UTC)
Message-ID: <8c11f03b08a0bdfd2761a74f5a7964067dc4b98b.camel@suse.com>
Subject: Re: [RFC]extension of the anchor API
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 12 Apr 2021 11:58:16 +0200
In-Reply-To: <20210408150725.GC1296449@rowland.harvard.edu>
References: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
         <20210325150657.GC785961@rowland.harvard.edu>
         <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
         <20210325183856.GA799855@rowland.harvard.edu>
         <cc44e358406f48175fad9e956369d0f5a07efbe9.camel@suse.com>
         <20210408150725.GC1296449@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 08.04.2021, 11:07 -0400 schrieb Alan Stern:
> On Thu, Apr 08, 2021 at 11:23:05AM +0200, Oliver Neukum wrote:
> > Am Donnerstag, den 25.03.2021, 14:38 -0400 schrieb Alan Stern:

> > Yes. If the URBs themselves, as opposed to their payloads, are
> > different, this will happen. Yet I am afraid we are looking at a
> > necessary race condition here. If you cancel a non-atomic operation,
> > you will need to deal with all possible intermediate stages of
> > completion.
> 
> That's not the point.  The point is that the description you wrote is 
> incorrect.
> 
> I can imagine someone who doesn't understand the details of the 
> anchor/mooring API creating an array of pointers to URBs, then filling 
> in those URBs in the array's order.  That would mess things up if a 
> previous kill caused the order of the anchor list to be different from 
> the array order.

OK, I will fix the description.

> How about instead of moving URBs to the end of the list when they 
> complete, you have the anchor maintain a pointer to the most recently 
> submitted URB?

That presumes that the URBs will finish in order. I don't think such
an assumption can be made.

	Regards
		Oliver


