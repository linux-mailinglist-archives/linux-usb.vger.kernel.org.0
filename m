Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269222471ED
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390374AbgHQSfp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:35:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:15272 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389522AbgHQSfa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:35:30 -0400
IronPort-SDR: WwPOFoZiwwXgR/g9rq/vrFZunKDVdye5OPkVodrJvOGIxuXfdmBrwCKd9zzazD6Mzx58+x1POh
 TjuliTUX67mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="172823010"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="172823010"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:35:30 -0700
IronPort-SDR: CgV+3nEf5TLUdisZjwZPgOHaw7zn3KUATxXICVyn5ur/jFKH7wgTccxcNiwC3WPThQDhyRe35C
 /4PX6NZWrj/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="326490244"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 11:35:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7jqF-009U8T-Nk; Mon, 17 Aug 2020 21:26:43 +0300
Date:   Mon, 17 Aug 2020 21:26:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v1 3/3] usb: early: xhci-dbc: Sort headers alphabetically
Message-ID: <20200817182643.GT1891694@smile.fi.intel.com>
References: <20200817164226.49119-1-andriy.shevchenko@linux.intel.com>
 <20200817164226.49119-3-andriy.shevchenko@linux.intel.com>
 <20200817165020.GB721399@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817165020.GB721399@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 06:50:20PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 17, 2020 at 07:42:26PM +0300, Andy Shevchenko wrote:
> > For better maintenance sort headers alphabetically.
> 
> Maintenance of what?  That's pointless churn.

Of this driver. When adding a new header may bring a duplication.

> > While at it, move asm/*.h to be included after linux/*.h.
> 
> That's the only valid type of change, but why is a driver having asm/*.h
> files included in the first place?  Shouldn't that be fixed?

I can't see how. fixmap.h is special header for early boot stage and there is
no linux/* part to cover it (no need).

The pci-direct.h is a specific arch-dependent way to access PCI configuration
space without PCI core to be involved (also as above, to be used on early boot
stages).

That said, I simply move them and will preserve ordering as it's now.

-- 
With Best Regards,
Andy Shevchenko


