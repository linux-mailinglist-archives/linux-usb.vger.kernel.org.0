Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917B64B33FB
	for <lists+linux-usb@lfdr.de>; Sat, 12 Feb 2022 10:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbiBLJIU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Feb 2022 04:08:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiBLJIT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Feb 2022 04:08:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7363126562
        for <linux-usb@vger.kernel.org>; Sat, 12 Feb 2022 01:08:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 11E66B800A0
        for <linux-usb@vger.kernel.org>; Sat, 12 Feb 2022 09:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF7FC340E7;
        Sat, 12 Feb 2022 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644656893;
        bh=4DvC5aoFUuLhMXQm6R2sQeTPkCfKU9gKWAUgwDecqH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oeu5x39/2qCJ0C0j3CZGSHYY15Xad/EYveQiw+kUf4KJJnFlumW7+odY30U9vG+57
         6kAya1fGBAJm710Yu0kjem7bsThCHyfKx3JLmXLLxUVbhu367XOxBF2m8dVDq7T82P
         jvyOnNB7hjXu31qM9mJpYvSxrHHEFIsxGNjw2QaE=
Date:   Sat, 12 Feb 2022 10:08:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: Re: [usb:usb-linus 14/14] drivers/usb/dwc2/drd.c:133:28: error:
 'struct dwc2_hsotg' has no member named 'enabled'; did you mean
 'hcd_enabled'?
Message-ID: <Ygd4+jn4it6vZ1R0@kroah.com>
References: <202202112236.AwoOTtHO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202202112236.AwoOTtHO-lkp@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 12, 2022 at 01:58:06AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> head:   269cbcf7b72de6f0016806d4a0cec1d689b55a87
> commit: 269cbcf7b72de6f0016806d4a0cec1d689b55a87 [14/14] usb: dwc2: drd: fix soft connect when gadget is unconfigured
> config: microblaze-randconfig-r021-20220211 (https://download.01.org/0day-ci/archive/20220211/202202112236.AwoOTtHO-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=269cbcf7b72de6f0016806d4a0cec1d689b55a87
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>         git fetch --no-tags usb usb-linus
>         git checkout 269cbcf7b72de6f0016806d4a0cec1d689b55a87
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/usb/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/err.h:5,
>                     from include/linux/clk.h:12,
>                     from drivers/usb/dwc2/drd.c:10:
>    drivers/usb/dwc2/drd.c: In function 'dwc2_drd_role_sw_set':
> >> drivers/usb/dwc2/drd.c:133:28: error: 'struct dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?
>      133 |                 if (hsotg->enabled) {
>          |                            ^~~~~~~
>    include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
>       58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>          |                                                    ^~~~
>    drivers/usb/dwc2/drd.c:133:17: note: in expansion of macro 'if'
>      133 |                 if (hsotg->enabled) {
>          |                 ^~
> >> drivers/usb/dwc2/drd.c:133:28: error: 'struct dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?
>      133 |                 if (hsotg->enabled) {
>          |                            ^~~~~~~
>    include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
>       58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>          |                                                             ^~~~
>    drivers/usb/dwc2/drd.c:133:17: note: in expansion of macro 'if'
>      133 |                 if (hsotg->enabled) {
>          |                 ^~
> >> drivers/usb/dwc2/drd.c:133:28: error: 'struct dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?
>      133 |                 if (hsotg->enabled) {
>          |                            ^~~~~~~
>    include/linux/compiler.h:69:10: note: in definition of macro '__trace_if_value'
>       69 |         (cond) ?                                        \
>          |          ^~~~
>    include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
>       56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>          |                            ^~~~~~~~~~~~~~
>    drivers/usb/dwc2/drd.c:133:17: note: in expansion of macro 'if'
>      133 |                 if (hsotg->enabled) {
>          |                 ^~
> 
> 
> vim +133 drivers/usb/dwc2/drd.c
> 
>    104	
>    105		/*
>    106		 * In case of USB_DR_MODE_PERIPHERAL, clock is disabled at the end of
>    107		 * the probe and enabled on udc_start.
>    108		 * If role-switch set is called before the udc_start, we need to enable
>    109		 * the clock to read/write GOTGCTL and GUSBCFG registers to override
>    110		 * mode and sessions. It is the case if cable is plugged at boot.
>    111		 */
>    112		if (!hsotg->ll_hw_enabled && hsotg->clk) {
>    113			int ret = clk_prepare_enable(hsotg->clk);
>    114	
>    115			if (ret)
>    116				return ret;
>    117		}
>    118	
>    119		spin_lock_irqsave(&hsotg->lock, flags);
>    120	
>    121		if (role == USB_ROLE_NONE) {
>    122			/* default operation mode when usb role is USB_ROLE_NONE */
>    123			if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
>    124				role = USB_ROLE_HOST;
>    125			else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
>    126				role = USB_ROLE_DEVICE;
>    127		}
>    128	
>    129		if (role == USB_ROLE_HOST) {
>    130			already = dwc2_ovr_avalid(hsotg, true);
>    131		} else if (role == USB_ROLE_DEVICE) {
>    132			already = dwc2_ovr_bvalid(hsotg, true);
>  > 133			if (hsotg->enabled) {
>    134				/* This clear DCTL.SFTDISCON bit */
>    135				dwc2_hsotg_core_connect(hsotg);
>    136			}
>    137		} else {
>    138			if (dwc2_is_device_mode(hsotg)) {
>    139				if (!dwc2_ovr_bvalid(hsotg, false))
>    140					/* This set DCTL.SFTDISCON bit */
>    141					dwc2_hsotg_core_disconnect(hsotg);
>    142			} else {
>    143				dwc2_ovr_avalid(hsotg, false);
>    144			}
>    145		}
>    146	
>    147		spin_unlock_irqrestore(&hsotg->lock, flags);
>    148	
>    149		if (!already && hsotg->dr_mode == USB_DR_MODE_OTG)
>    150			/* This will raise a Connector ID Status Change Interrupt */
>    151			dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
>    152	
>    153		if (!hsotg->ll_hw_enabled && hsotg->clk)
>    154			clk_disable_unprepare(hsotg->clk);
>    155	
>    156		dev_dbg(hsotg->dev, "%s-session valid\n",
>    157			role == USB_ROLE_NONE ? "No" :
>    158			role == USB_ROLE_HOST ? "A" : "B");
>    159	
>    160		return 0;
>    161	}
>    162	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

I will go revert this change.

greg k-h
