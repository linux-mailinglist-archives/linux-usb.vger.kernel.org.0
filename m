Return-Path: <linux-usb+bounces-551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8435B7AD1AC
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 09:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 66B0D281724
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 07:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DED10971;
	Mon, 25 Sep 2023 07:30:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D010942
	for <linux-usb@vger.kernel.org>; Mon, 25 Sep 2023 07:30:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC9FC2;
	Mon, 25 Sep 2023 00:30:53 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412119813"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="412119813"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 00:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697891983"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="697891983"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 00:30:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andy@kernel.org>)
	id 1qkg3I-00000000HOB-1tpD;
	Mon, 25 Sep 2023 10:30:44 +0300
Date: Mon, 25 Sep 2023 10:30:44 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
Message-ID: <ZRE3JNVNqFN0knHl@smile.fi.intel.com>
References: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr>
 <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 24, 2023 at 06:42:54PM +0200, Duje Mihanović wrote:
> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> a GPIO pin related to the USB host controller.
> 
> Convert this function to use the new GPIO descriptor interface.

...

> +	pxa_ohci->usb_host = gpiod_get(&pdev->dev, "usb-host", GPIOD_OUT_LOW);
> +	if (IS_ERR(pxa_ohci->usb_host)) {
> +		dev_warn(&pdev->dev, "failed to get USB host GPIO with %d\n",
> +				(int) pxa_ohci->usb_host);

Casting is no go in 99.9% cases in printf(), so use proper specifier.
Hint: Nice looking message can be obtained by using %pe.

> +		pxa_ohci->usb_host = NULL;

Instead, call for _optional() API.

> +	}

...

> +	if (pxa_ohci->usb_host)
> +		gpiod_put(pxa_ohci->usb_host);

Linus, Bart, do we have misdesigned _optinal() GPIO APIs?

In GPIOLIB=n, the above requires that redundant check. Shouldn't we replace
gpiod_put() stub to be simply no-op?

-- 
With Best Regards,
Andy Shevchenko



