Return-Path: <linux-usb+bounces-13845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA1F95AC74
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 06:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DD6AB217DA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 04:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B570C381B8;
	Thu, 22 Aug 2024 04:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dj5eWp8e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5272233A;
	Thu, 22 Aug 2024 04:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724300194; cv=none; b=kPQWqSl34pNL2IpenOMLaqIAhLR7IscDVW7wxUdoBCQzyocNpzyD1fOeEsi6LYYLCjQzh6KHyvi/B3aHhG3T6CO4803FBHC/kLiRDy/2cgEiKfu6tXJcuuzvknBgDFzoQJXEeix55MAQqIAE2bMHGUK23ViOoOy3w2248GSrGkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724300194; c=relaxed/simple;
	bh=LcAYJElrUmw8cakNhbZlmrL27yzOntaJO0b9hxovysA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHFv+i6SSEapxHHRTiw1mce7Ph9MHMJ4m4O6h+3mo9CTuf9RIX+fZZG8LL5HCtpYk3lfZuPE4j/X8mVbJ71KlQxhoosT+T7zNIhOUgE/xO8TCFi63CJrl+bUZ71+MxR1PrUcttdAY6TItygiXPIs+7uPMCZtpQs/n0ydmACA5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dj5eWp8e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724300192; x=1755836192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcAYJElrUmw8cakNhbZlmrL27yzOntaJO0b9hxovysA=;
  b=Dj5eWp8ebyaRHq9xL5KvEBNJDI//OiT/3BOIg7l05LDcrEoDiVSY8fRD
   xyHQ2xAcafaNbJT4+xWz1mU530D37/0E1/W1XSmN1n/OP0FoIL9ez0g7Q
   ub8A5mAtlPi8f+7szqs1e4v3MJA/m7Ogdb/gilW15cB679sQR/wgwOjUS
   MktInTkRsGLkqWVwPL3T6f99LPM5Mt25eSgtHU+sXymkwaM3HPAUMSlL6
   MQl3Ui77/+9S0Aj3jMbHuEKxU5ezg+ZhZ4wp1nX1Xouq1Ssf2TM+d8P4B
   XOQS4YflptquYvT8SEBsA5fLlxFOezOZ0SDsSZofy0rkWlkSSHDH6Ur2R
   g==;
X-CSE-ConnectionGUID: vYPn7BjISMShQGypUGqZ9Q==
X-CSE-MsgGUID: pRfx7NBZQuagNcwVXRkiZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33846726"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="33846726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 21:16:31 -0700
X-CSE-ConnectionGUID: CDxB2P9ARQ219xXZDtNGng==
X-CSE-MsgGUID: G9OIF0lNQJqeSRsSmg9Wnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="92049605"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2024 21:16:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgzFH-000CLg-2i;
	Thu, 22 Aug 2024 04:16:23 +0000
Date: Thu, 22 Aug 2024 12:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>, Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, opensource.kernel@vivo.com
Subject: Re: [PATCH 2/5] usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
Message-ID: <202408221126.F1eulsSr-lkp@intel.com>
References: <20240821121048.31566-3-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821121048.31566-3-liulei.rjpt@vivo.com>

Hi Lei,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lei-Liu/usb-aspeed_udc-Use-devm_clk_get_enabled-helpers/20240821-201358
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240821121048.31566-3-liulei.rjpt%40vivo.com
patch subject: [PATCH 2/5] usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408221126.F1eulsSr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221126.F1eulsSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221126.F1eulsSr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/udc/pxa27x_udc.c: In function 'pxa_udc_probe':
   drivers/usb/gadget/udc/pxa27x_udc.c:2401:39: error: passing argument 1 of 'clk_prepare_enable' from incompatible pointer type [-Wincompatible-pointer-types]
    2401 |         udc->clk = clk_prepare_enable(&pdev->dev, NULL);
         |                                       ^~~~~~~~~~
         |                                       |
         |                                       struct device *
   In file included from drivers/usb/gadget/udc/pxa27x_udc.c:18:
   include/linux/clk.h:1107:50: note: expected 'struct clk *' but argument is of type 'struct device *'
    1107 | static inline int clk_prepare_enable(struct clk *clk)
         |                                      ~~~~~~~~~~~~^~~
   drivers/usb/gadget/udc/pxa27x_udc.c:2401:20: error: too many arguments to function 'clk_prepare_enable'
    2401 |         udc->clk = clk_prepare_enable(&pdev->dev, NULL);
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/clk.h:1107:19: note: declared here
    1107 | static inline int clk_prepare_enable(struct clk *clk)
         |                   ^~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/udc/pxa27x_udc.c:2401:18: error: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2401 |         udc->clk = clk_prepare_enable(&pdev->dev, NULL);
         |                  ^


vim +2401 drivers/usb/gadget/udc/pxa27x_udc.c

  2345	
  2346	/**
  2347	 * pxa_udc_probe - probes the udc device
  2348	 * @pdev: platform device
  2349	 *
  2350	 * Perform basic init : allocates udc clock, creates sysfs files, requests
  2351	 * irq.
  2352	 */
  2353	static int pxa_udc_probe(struct platform_device *pdev)
  2354	{
  2355		struct pxa_udc *udc = &memory;
  2356		int retval = 0, gpio;
  2357		struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
  2358		unsigned long gpio_flags;
  2359	
  2360		if (mach) {
  2361			gpio_flags = mach->gpio_pullup_inverted ? GPIOF_ACTIVE_LOW : 0;
  2362			gpio = mach->gpio_pullup;
  2363			if (gpio_is_valid(gpio)) {
  2364				retval = devm_gpio_request_one(&pdev->dev, gpio,
  2365							       gpio_flags,
  2366							       "USB D+ pullup");
  2367				if (retval)
  2368					return retval;
  2369				udc->gpiod = gpio_to_desc(mach->gpio_pullup);
  2370			}
  2371			udc->udc_command = mach->udc_command;
  2372		} else {
  2373			udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
  2374		}
  2375	
  2376		udc->regs = devm_platform_ioremap_resource(pdev, 0);
  2377		if (IS_ERR(udc->regs))
  2378			return PTR_ERR(udc->regs);
  2379		udc->irq = platform_get_irq(pdev, 0);
  2380		if (udc->irq < 0)
  2381			return udc->irq;
  2382	
  2383		udc->dev = &pdev->dev;
  2384		if (of_have_populated_dt()) {
  2385			udc->transceiver =
  2386				devm_usb_get_phy_by_phandle(udc->dev, "phys", 0);
  2387			if (IS_ERR(udc->transceiver))
  2388				return PTR_ERR(udc->transceiver);
  2389		} else {
  2390			udc->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
  2391		}
  2392	
  2393		if (IS_ERR(udc->gpiod)) {
  2394			dev_err(&pdev->dev, "Couldn't find or request D+ gpio : %ld\n",
  2395				PTR_ERR(udc->gpiod));
  2396			return PTR_ERR(udc->gpiod);
  2397		}
  2398		if (udc->gpiod)
  2399			gpiod_direction_output(udc->gpiod, 0);
  2400	
> 2401		udc->clk = clk_prepare_enable(&pdev->dev, NULL);
  2402		if (IS_ERR(udc->clk))
  2403			return PTR_ERR(udc->clk);
  2404	
  2405		udc->vbus_sensed = 0;
  2406	
  2407		the_controller = udc;
  2408		platform_set_drvdata(pdev, udc);
  2409		udc_init_data(udc);
  2410	
  2411		/* irq setup after old hardware state is cleaned up */
  2412		retval = devm_request_irq(&pdev->dev, udc->irq, pxa_udc_irq,
  2413					  IRQF_SHARED, driver_name, udc);
  2414		if (retval != 0) {
  2415			dev_err(udc->dev, "%s: can't get irq %i, err %d\n",
  2416				driver_name, udc->irq, retval);
  2417			goto err;
  2418		}
  2419	
  2420		if (!IS_ERR_OR_NULL(udc->transceiver))
  2421			usb_register_notifier(udc->transceiver, &pxa27x_udc_phy);
  2422		retval = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
  2423		if (retval)
  2424			goto err_add_gadget;
  2425	
  2426		pxa_init_debugfs(udc);
  2427		if (should_enable_udc(udc))
  2428			udc_enable(udc);
  2429		return 0;
  2430	
  2431	err_add_gadget:
  2432		if (!IS_ERR_OR_NULL(udc->transceiver))
  2433			usb_unregister_notifier(udc->transceiver, &pxa27x_udc_phy);
  2434	err:
  2435		clk_unprepare(udc->clk);
  2436		return retval;
  2437	}
  2438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

