Return-Path: <linux-usb+bounces-872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4927B461D
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 10:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 5FA74284896
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 08:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BB314F62;
	Sun,  1 Oct 2023 08:18:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F79F9F0
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 08:18:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B819C;
	Sun,  1 Oct 2023 01:18:49 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="446656290"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="446656290"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 01:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="700047588"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="700047588"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 01:18:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andy@kernel.org>)
	id 1qmrez-00000001qqK-11KX;
	Sun, 01 Oct 2023 11:18:41 +0300
Date: Sun, 1 Oct 2023 11:18:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
Message-ID: <ZRkrYChL0hKZwQGp@smile.fi.intel.com>
References: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr>
 <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
 <ZRE3JNVNqFN0knHl@smile.fi.intel.com>
 <CACRpkdZdSTCeobuFdXNbJcHTKJp1V=t1sfp2tp25Mb0FBh74pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZdSTCeobuFdXNbJcHTKJp1V=t1sfp2tp25Mb0FBh74pA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Sep 27, 2023 at 04:01:58PM +0200, Linus Walleij wrote:
> On Mon, Sep 25, 2023 at 9:30 AM Andy Shevchenko <andy@kernel.org> wrote:

...

> > > +     if (pxa_ohci->usb_host)
> > > +             gpiod_put(pxa_ohci->usb_host);
> >
> > Linus, Bart, do we have misdesigned _optinal() GPIO APIs?
> >
> > In GPIOLIB=n, the above requires that redundant check. Shouldn't we replace
> > gpiod_put() stub to be simply no-op?
> 
> You mean the WARN_ON(desc) in gpiod_put() in the static inline
> stub version?
> 
> I thought about it for a bit, drafted a patch removing them, and then
> realized the following:
> 
> If someone is making the gpiolib optional for a driver, i.e. neither
> DEPENDS ON GPIOLIB nor SELECT GPIOLIB, they are a quite
> narrow segment. I would say in 9 cases out of 10 or more this is
> just a driver that should depend on or select GPIOLIB.
> 
> I think such drivers should actually do the NULL checks and not be
> too convenient, the reason is readability: someone reading that
> driver will be thinking gpios are not optional if they can call
> gpiod_set_value(), gpiod_put() etc without any sign that the
> desc is optional.
> 
> If the driver uses [devm_]gpiod_get_optional() the library is not
> using the stubs and does the right thing, and it is clear that
> the GPIO is *runtime* optional.
> 
> But *compile time* optional, *combined* with runtime optional -
> I'm not so happy if we try to avoid warnings around that. I think
> it leads to confusing configs and code that looks like gpiolib is
> around despite it wasn't selected.
> 
> If the code isn't depending on or selecting GPIOLIB and still
> use _optional() calls, it better be ready to do some extra checks,
> because this is a weird combo, it can't be common.
> 
> Could be a documentation update making this clear though.
> 
> What do you other people think?

The problem here indeed if the code is not selecting or being dependent on
GPIOLIB and uses _optional() calls.

I agree that this is quite a niche that should be addressed on the driver side.

-- 
With Best Regards,
Andy Shevchenko



