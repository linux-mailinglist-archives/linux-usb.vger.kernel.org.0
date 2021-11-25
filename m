Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7040E45DBE5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 15:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355580AbhKYOI4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 09:08:56 -0500
Received: from mga18.intel.com ([134.134.136.126]:42932 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239907AbhKYOG4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 09:06:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="222390843"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="222390843"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 06:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="675272630"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2021 06:03:42 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqFLe-0006SP-BB; Thu, 25 Nov 2021 14:03:38 +0000
Date:   Thu, 25 Nov 2021 22:03:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kbuild-all@lists.01.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: drd: Add support for usb-conn-gpio based
 usb-role-switch
Message-ID: <202111252223.hSDDVm5l-lkp@intel.com>
References: <20211125104748.1418934-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125104748.1418934-1-alexander.stein@ew.tq-group.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexander,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexander-Stein/usb-dwc3-drd-Add-support-for-usb-conn-gpio-based-usb-role-switch/20211125-185107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20211125/202111252223.hSDDVm5l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4f8eca1973568289a7d33683cda0a0fc3db187ee
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexander-Stein/usb-dwc3-drd-Add-support-for-usb-conn-gpio-based-usb-role-switch/20211125-185107
        git checkout 4f8eca1973568289a7d33683cda0a0fc3db187ee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash drivers/phy/freescale/ drivers/usb/dwc3/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/dwc3/drd.c: In function 'dwc3_setup_role_switch':
>> drivers/usb/dwc3/drd.c:564:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     564 |         ret = devm_of_platform_populate(dwc->dev);
         |         ^~~
         |         net
   drivers/usb/dwc3/drd.c:564:9: note: each undeclared identifier is reported only once for each function it appears in


vim +564 drivers/usb/dwc3/drd.c

   541	
   542	static int dwc3_setup_role_switch(struct dwc3 *dwc)
   543	{
   544		struct usb_role_switch_desc dwc3_role_switch = {NULL};
   545		u32 mode;
   546	
   547		dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
   548		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
   549			mode = DWC3_GCTL_PRTCAP_HOST;
   550		} else {
   551			dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
   552			mode = DWC3_GCTL_PRTCAP_DEVICE;
   553		}
   554	
   555		dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
   556		dwc3_role_switch.set = dwc3_usb_role_switch_set;
   557		dwc3_role_switch.get = dwc3_usb_role_switch_get;
   558		dwc3_role_switch.driver_data = dwc;
   559		dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
   560		if (IS_ERR(dwc->role_sw))
   561			return PTR_ERR(dwc->role_sw);
   562	
   563		/* populate connector entry */
 > 564		ret = devm_of_platform_populate(dwc->dev);
   565		if (ret) {
   566			dev_err(dwc->dev, "DWC3 platform devices creation failed: %i\n", ret);
   567			return ret;
   568		}
   569	
   570		dwc3_set_mode(dwc, mode);
   571		return 0;
   572	}
   573	#else
   574	#define ROLE_SWITCH 0
   575	#define dwc3_setup_role_switch(x) 0
   576	#endif
   577	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
