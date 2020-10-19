Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69968292EBB
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 21:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731331AbgJSTpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 15:45:50 -0400
Received: from mga05.intel.com ([192.55.52.43]:15134 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731171AbgJSTpu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 15:45:50 -0400
IronPort-SDR: Bk2+TKgFI05KO3IlH91rjMo0jPkeFbuA4Tck/2DVrSgN0rS9qQwYaSByVkMi06T13kTlYCybmP
 k3Qyz9xy2LoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="251787236"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="251787236"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 12:45:40 -0700
IronPort-SDR: x8svOVaM3t1M3q+Lfxg16ct+cki2kLXt7uGj+M6exgaYdBSWV/Me2SPQXPZvJB9zZHZzn1uOHr
 7CJF3CnDpzpQ==
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="523226375"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 12:45:37 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUb79-00ArxQ-Tz; Mon, 19 Oct 2020 22:46:39 +0300
Date:   Mon, 19 Oct 2020 22:46:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Ferry Toth <fntoth@gmail.com>, linux-usb@vger.kernel.org,
        felipe.balbi@linux.intel.com
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Message-ID: <20201019194639.GU4077@smile.fi.intel.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6wig461.fsf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 19, 2020 at 08:45:10AM +0300, Felipe Balbi wrote:
> Ferry Toth <fntoth@gmail.com> writes:
> > This occurs with edison-arduino board, that has a nifty switch allowing 
> > to switch between gadget/host mode. In host mode it boot fine, then 
> > crashes when I flip the switch to gadget.
> >
> > The below trace if what I get from the console when booting with gadget 
> > mode selected.
> >
> > The last kernel is used where everything is obviously working fine is 5.6.0.
> >
> > The kernel is built specifically for the platform, nothing suspcious 
> > going on the the dwc3 area, see 
> > https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0

> It this something you can reproduce on your end? Ferry, can you get dwc3
> trace logs when this happens? ftrace_dump_on_oops may help here.

For time being I can confirm that switch stopped working between v5.7 (v5.8)
and v5.8.16. But I didn't see any crash so far (I don't use any predefined
gadget, though).

afb420486016 usb: dwc3: gadget: Handle ZLP for sg requests
8301e3aa1c8d usb: dwc3: gadget: Fix handling ZLP
d884a90cec5a usb: dwc3: gadget: Don't setup more than requested

Reverting them does not help, so I looked into drivers/usb changes.

Manual guess work did give any result, so I bisected:

# good: [9ece50d8a470ca7235ffd6ac0f9c5f0f201fe2c8] Linux 5.8.5
# good: [96d020ddff6adff267a6900bcfcd46a8993f5152] xhci: Always restore EP_SOFT_CLEAR_TOGGLE even if ep reset failed
# bad: [ccc9838fed80f04e45a2c317e4a2dacdf2f1e3c2] drm/amd/pm: correct the thermal alert temperature limit settings
# bad: [bbf423c28efcde2beec2b187806eda0041cb0582] x86/irq: Unbreak interrupt affinity setting
# good: [9a9cc8c9b1c715317c5fc18ac695751577bdf250] powerpc/perf: Fix crashes with generic_compat_pmu & BHRB
# bad: [8cb3561d084ef532cd13d4f1f9077a900ff9f740] usbip: Implement a match function to fix usbip
# bad: [3c491c44194253789d568549fac3b34dccdbcecd] crypto: af_alg - Work around empty control messages without MSG_MORE
# bad: [1d35dfde2a7d9a0627b1e9465e8e4305478fb945] device property: Fix the secondary firmware node handling in set_primary_fwnode()
# first bad commit: [1d35dfde2a7d9a0627b1e9465e8e4305478fb945] device property: Fix the secondary firmware node handling in set_primary_fwnode()

Revert on v5.9 helps.

Heikki, any idea?

-- 
With Best Regards,
Andy Shevchenko


