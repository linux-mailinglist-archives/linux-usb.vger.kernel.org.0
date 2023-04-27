Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156ED6F06E8
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 15:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243417AbjD0Nz2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 09:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243218AbjD0Nz1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 09:55:27 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7822103
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682603726; x=1714139726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mNSZDs7qQlMaTmlLQZhTljzdWxEEggLo0iwbLX2jz20=;
  b=ZyteHVDaYOyC2/SLiZUfw43cff5OsfCWAo3UfX6YPALNE4olCmtfC36w
   WQb74FLLLSyBHA3wYybYiQ+nmwTz6z9r0/jFT8zpdo7H97JlEEpKMk92r
   UOrHEet3cU4n6YK9PGUKcO1st8ObU0cuk9YDHgumvz7DO/yanR5WNmot7
   uYEIPxv9jyp3L15A2jXVC8RYDOfohYoNliQmxPoGNDn/mFa7Y1saL5E8C
   xLG2Xt4Tst7CpSBwb8p8e9SLx1xfciKDvZSwR4RLcM1GEn6Zn8RO11yOl
   dQty5H2KhfZHVULik/k8zVu9XygZUXOtZW0Q4pWOT+FImyhgpOTtr/J9l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327057785"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="327057785"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 06:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727077340"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="727077340"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 06:55:23 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ps25i-0000Fj-1V;
        Thu, 27 Apr 2023 13:55:22 +0000
Date:   Thu, 27 Apr 2023 21:54:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH v2 1/2] USB: Extend pci resume function to handle PM
 events
Message-ID: <202304272113.D8iiep8w-lkp@intel.com>
References: <20230427104805.3560591-2-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427104805.3560591-2-Basavaraj.Natikar@amd.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Basavaraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.3 next-20230426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Basavaraj-Natikar/USB-Extend-pci-resume-function-to-handle-PM-events/20230427-185141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230427104805.3560591-2-Basavaraj.Natikar%40amd.com
patch subject: [PATCH v2 1/2] USB: Extend pci resume function to handle PM events
config: arc-randconfig-r043-20230427 (https://download.01.org/0day-ci/archive/20230427/202304272113.D8iiep8w-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c56600f81d90e04002ac435d27ccd0358b560d88
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Basavaraj-Natikar/USB-Extend-pci-resume-function-to-handle-PM-events/20230427-185141
        git checkout c56600f81d90e04002ac435d27ccd0358b560d88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304272113.D8iiep8w-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/host/xhci-histb.c: In function 'xhci_histb_resume':
>> drivers/usb/host/xhci-histb.c:370:34: error: incompatible type for argument 2 of 'xhci_resume'
     370 |         return xhci_resume(xhci, 0);
         |                                  ^
         |                                  |
         |                                  int
   In file included from drivers/usb/host/xhci-histb.c:19:
   drivers/usb/host/xhci.h:2143:53: note: expected 'pm_message_t' {aka 'struct pm_message'} but argument is of type 'int'
    2143 | int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg);
         |                                        ~~~~~~~~~~~~~^~~


vim +/xhci_resume +370 drivers/usb/host/xhci-histb.c

c508f41da07882 Jianguo Sun 2018-05-21  360  
c508f41da07882 Jianguo Sun 2018-05-21  361  static int __maybe_unused xhci_histb_resume(struct device *dev)
c508f41da07882 Jianguo Sun 2018-05-21  362  {
c508f41da07882 Jianguo Sun 2018-05-21  363  	struct xhci_hcd_histb *histb = dev_get_drvdata(dev);
c508f41da07882 Jianguo Sun 2018-05-21  364  	struct usb_hcd *hcd = histb->hcd;
c508f41da07882 Jianguo Sun 2018-05-21  365  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
c508f41da07882 Jianguo Sun 2018-05-21  366  
c508f41da07882 Jianguo Sun 2018-05-21  367  	if (!device_may_wakeup(dev))
c508f41da07882 Jianguo Sun 2018-05-21  368  		xhci_histb_host_enable(histb);
c508f41da07882 Jianguo Sun 2018-05-21  369  
c508f41da07882 Jianguo Sun 2018-05-21 @370  	return xhci_resume(xhci, 0);
c508f41da07882 Jianguo Sun 2018-05-21  371  }
c508f41da07882 Jianguo Sun 2018-05-21  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
