Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C136C4B2C49
	for <lists+linux-usb@lfdr.de>; Fri, 11 Feb 2022 19:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352414AbiBKR7M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Feb 2022 12:59:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352422AbiBKR7K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Feb 2022 12:59:10 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89717D44
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 09:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644602348; x=1676138348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vxU5+I+dzy2evP7GT5fZRiXdp7dkgLSxKspowSOEnmo=;
  b=bzm6GZLXvU3uO2666Q6Qw0ETduC5R9CrjVoP0WNET4BDPc3p7+TnKlXP
   HpZcwYkUf2hExdciYITEJSC88faOXaYXIi+BiaOOOBaRQrX+RQ2vRcVC/
   wfOGZgmkrdw7d3EPql92mTfC4tBMgdEFaPdr+8fxk6HkUk1R7Vmt3i1A/
   y2QEClZeFfijf3N1FjpnDA+pQi7oH8oXvjsLiJa9tYABh411Qqlq7EPU2
   io3B49Ozz8AitTubD393Fuwiaxg2jE0Ws8S2GoOOaIWksMw6yQJ5ikyjL
   S4mVwQkvI0m/mP14jLzdTl8644tXDK4/SJDl+VuYW7GxaRbgkwlZkf/uS
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="247369758"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="247369758"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 09:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="634163650"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Feb 2022 09:59:06 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nIaCC-0004ty-SP; Fri, 11 Feb 2022 17:59:00 +0000
Date:   Sat, 12 Feb 2022 01:58:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [usb:usb-linus 14/14] drivers/usb/dwc2/drd.c:133:28: error: 'struct
 dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?
Message-ID: <202202112236.AwoOTtHO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
head:   269cbcf7b72de6f0016806d4a0cec1d689b55a87
commit: 269cbcf7b72de6f0016806d4a0cec1d689b55a87 [14/14] usb: dwc2: drd: fix soft connect when gadget is unconfigured
config: microblaze-randconfig-r021-20220211 (https://download.01.org/0day-ci/archive/20220211/202202112236.AwoOTtHO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=269cbcf7b72de6f0016806d4a0cec1d689b55a87
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-linus
        git checkout 269cbcf7b72de6f0016806d4a0cec1d689b55a87
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/linux/clk.h:12,
                    from drivers/usb/dwc2/drd.c:10:
   drivers/usb/dwc2/drd.c: In function 'dwc2_drd_role_sw_set':
>> drivers/usb/dwc2/drd.c:133:28: error: 'struct dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?
     133 |                 if (hsotg->enabled) {
         |                            ^~~~~~~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/usb/dwc2/drd.c:133:17: note: in expansion of macro 'if'
     133 |                 if (hsotg->enabled) {
         |                 ^~
>> drivers/usb/dwc2/drd.c:133:28: error: 'struct dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?
     133 |                 if (hsotg->enabled) {
         |                            ^~~~~~~
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/usb/dwc2/drd.c:133:17: note: in expansion of macro 'if'
     133 |                 if (hsotg->enabled) {
         |                 ^~
>> drivers/usb/dwc2/drd.c:133:28: error: 'struct dwc2_hsotg' has no member named 'enabled'; did you mean 'hcd_enabled'?
     133 |                 if (hsotg->enabled) {
         |                            ^~~~~~~
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/usb/dwc2/drd.c:133:17: note: in expansion of macro 'if'
     133 |                 if (hsotg->enabled) {
         |                 ^~


vim +133 drivers/usb/dwc2/drd.c

   104	
   105		/*
   106		 * In case of USB_DR_MODE_PERIPHERAL, clock is disabled at the end of
   107		 * the probe and enabled on udc_start.
   108		 * If role-switch set is called before the udc_start, we need to enable
   109		 * the clock to read/write GOTGCTL and GUSBCFG registers to override
   110		 * mode and sessions. It is the case if cable is plugged at boot.
   111		 */
   112		if (!hsotg->ll_hw_enabled && hsotg->clk) {
   113			int ret = clk_prepare_enable(hsotg->clk);
   114	
   115			if (ret)
   116				return ret;
   117		}
   118	
   119		spin_lock_irqsave(&hsotg->lock, flags);
   120	
   121		if (role == USB_ROLE_NONE) {
   122			/* default operation mode when usb role is USB_ROLE_NONE */
   123			if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
   124				role = USB_ROLE_HOST;
   125			else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
   126				role = USB_ROLE_DEVICE;
   127		}
   128	
   129		if (role == USB_ROLE_HOST) {
   130			already = dwc2_ovr_avalid(hsotg, true);
   131		} else if (role == USB_ROLE_DEVICE) {
   132			already = dwc2_ovr_bvalid(hsotg, true);
 > 133			if (hsotg->enabled) {
   134				/* This clear DCTL.SFTDISCON bit */
   135				dwc2_hsotg_core_connect(hsotg);
   136			}
   137		} else {
   138			if (dwc2_is_device_mode(hsotg)) {
   139				if (!dwc2_ovr_bvalid(hsotg, false))
   140					/* This set DCTL.SFTDISCON bit */
   141					dwc2_hsotg_core_disconnect(hsotg);
   142			} else {
   143				dwc2_ovr_avalid(hsotg, false);
   144			}
   145		}
   146	
   147		spin_unlock_irqrestore(&hsotg->lock, flags);
   148	
   149		if (!already && hsotg->dr_mode == USB_DR_MODE_OTG)
   150			/* This will raise a Connector ID Status Change Interrupt */
   151			dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
   152	
   153		if (!hsotg->ll_hw_enabled && hsotg->clk)
   154			clk_disable_unprepare(hsotg->clk);
   155	
   156		dev_dbg(hsotg->dev, "%s-session valid\n",
   157			role == USB_ROLE_NONE ? "No" :
   158			role == USB_ROLE_HOST ? "A" : "B");
   159	
   160		return 0;
   161	}
   162	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
