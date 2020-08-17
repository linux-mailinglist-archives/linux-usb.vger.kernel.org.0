Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4DE24658E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 13:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgHQLfQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 07:35:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:18301 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726286AbgHQLfM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 07:35:12 -0400
IronPort-SDR: NVN8dMwr9usodMEYOVKOUB5XKqsSFeMe1z5+wsl1lQOphe6DzgsM2G0rGUKyUPS217IT65aLM3
 zU4MFl/S3D6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="142309387"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="142309387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:35:11 -0700
IronPort-SDR: BCldVN+sRnh4lPc4AXWJM4xPFbUdaNgAkla/d9FVVHb+5m7poCDP/g19ZBOiTGmd32UuuizOEy
 o9HimdsTivQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="326383266"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 04:35:10 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1k7dPx-009IrN-B4; Mon, 17 Aug 2020 14:35:09 +0300
Date:   Mon, 17 Aug 2020 14:35:09 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     John Garry <john.garry@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
Message-ID: <20200817113509.GJ1891694@smile.fi.intel.com>
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com>
 <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
 <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com>
 <20200814180720.GE1891694@smile.fi.intel.com>
 <20200814195119.GA45072@rowland.harvard.edu>
 <CAHp75VdMXd3LWLM5ooBsWGZnSXnJBW3R5gH9Cpux0EHmcxjTvQ@mail.gmail.com>
 <20200815015000.GA52242@rowland.harvard.edu>
 <CAHp75VdCCe=sKuas+sdu__qYVSEO4pKqZ8RGq_Jxaoh91HXZ+g@mail.gmail.com>
 <20200816160550.GB86937@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200816160550.GB86937@rowland.harvard.edu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 16, 2020 at 12:05:50PM -0400, Alan Stern wrote:
> On Sun, Aug 16, 2020 at 11:33:14AM +0300, Andy Shevchenko wrote:
> > On Sat, Aug 15, 2020 at 4:50 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > On Sat, Aug 15, 2020 at 12:55:57AM +0300, Andy Shevchenko wrote:

...

> > > Sure, the difference in ordering was pretty obvious.  What is not
> > > obvious is why this should cause a problem.
> > 
> > It may be not causing any problem right now, but with all these small
> > steps we may come to the case like DWC3 removal mess.
> > 
> > > Do you think that the host controller driver is going to try to use the
> > > IRQ vector somewhere between the pci_free_irq_vectors call and the
> > > usb_put_hcd call?  If that's not going to happen then I don't see what
> > > difference the order of the two calls makes.
> > 
> > I think that this is a bit incorrect to rely on side-effects to ruin
> > the clear understanding of what ordering is going on. If you insist,
> > you can take John's solution, but I won't give a tag on such.
> > 
> > Also take into consideration the possible copy'n'paste of this example
> > to other drivers. I have seen a lot of bad examples were
> > copied'n'pasted all over the kernel during my reviews. I don't want to
> > give another one.
> > 
> > So, the review process, in my opinion, should be slightly broader that
> > we usually understand it, i.e. take into account:
> > - *run-time* bisectability
> > - possible copy'n'paste of the code excerpts
> 
> I see.  So you use "correct" in the broader sense of "good form" as well 
> as strict correctness.  (It was confusing because I wouldn't conflate 
> those two different concepts.)

Thank you for clarification, I'm not native speaker and this is a good learn
to me. I will try to use better wording in the future.

> Okay, now your reply makes sense.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


