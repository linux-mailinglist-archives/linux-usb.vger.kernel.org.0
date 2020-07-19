Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C94A22519E
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 13:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgGSL3y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 07:29:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:6128 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbgGSL3x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jul 2020 07:29:53 -0400
IronPort-SDR: axFHnOq66J7reR8eDUywi37ZUcdf+R7GepxfnmMM/T05tzUIPCqjOPCM3ArylGB5s+tUiy8nos
 4E8m/yV/vLmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9686"; a="214492790"
X-IronPort-AV: E=Sophos;i="5.75,370,1589266800"; 
   d="scan'208";a="214492790"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2020 04:29:53 -0700
IronPort-SDR: R/0EASkcdDdmjcpFPQhkd3Zzx9vsnHToHS7GFYiMwKJaSP2lqVeUzRfSVrTFSNFwqhs5NbjqwY
 c4eK7A+dferQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,370,1589266800"; 
   d="scan'208";a="287269961"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2020 04:29:51 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jx7Vw-002hFp-5Z; Sun, 19 Jul 2020 14:29:52 +0300
Date:   Sun, 19 Jul 2020 14:29:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: pch_udc: Convert to use GPIO descriptors
Message-ID: <20200719112952.GK3703480@smile.fi.intel.com>
References: <20200627111029.513642-1-linus.walleij@linaro.org>
 <20200702145716.GX3703480@smile.fi.intel.com>
 <CACRpkdZiO2t8pkt7tFMMzCgHYAiioGc_LY2R3iz=i=wGWF-8Bw@mail.gmail.com>
 <CAHp75VdmiZy_h4TUHVqp9o2Ghay5A9r6BqQEHxDG0Xm+tOP-gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdmiZy_h4TUHVqp9o2Ghay5A9r6BqQEHxDG0Xm+tOP-gw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 01:19:32PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 16, 2020 at 11:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Jul 2, 2020 at 4:57 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > > Andy: your input would be appreciated, this kind of code
> > > > customizing random embedded Intel systems is deep water for
> > > > me, so this is just a rough guess on how it should be done.
> > >
> > > Linus, I have set up the device (it's actually available as Minnowboard v1) and
> > > will look at this.
> >
> > OK whenever you have time, there is no hurry.
> >
> > > For time being there is a patch you need to fold into this (sorry, it's mangled):
> > >
> > > (Explanation: GPIO will be locked with request_irq() call)
> >
> > I do not understand this, sadly. gpiod_lock_as_irq() will be called
> > indeed, but we are requesting it as input and keeping it as such
> > so this should be fine?
> 
> When you clean up GPIO at the same time you don't need to carry this
> memory and resource for the entire lifetime of the driver. When you
> lock it as IRQ the resource is not available to use by others anyway
> and will be requested whenever IRQ is requested. That's how I
> understand it. And to me it makes sense from a flexibility point of
> view and debugging perspective.

I looked closer to the code, it's using it as IRQ and as a GPIO (to know was it
rising or falling). Easier to leave as in your patch. Meanwhile I'm trying to
find some information about actual presence / use of VBUS on Intel Galileo Gen
2 and / or Minnowboard v1.0.

-- 
With Best Regards,
Andy Shevchenko


