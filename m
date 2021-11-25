Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F6345DFFC
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 18:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347221AbhKYRwi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 12:52:38 -0500
Received: from mga12.intel.com ([192.55.52.136]:47148 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354068AbhKYRuh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 12:50:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215572168"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="215572168"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 09:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="650791084"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2021 09:39:46 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqIin-0006j3-Mu; Thu, 25 Nov 2021 17:39:45 +0000
Date:   Fri, 26 Nov 2021 01:39:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Oliver Neukum <oneukum@suse.com>,
        syzbot <syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com>,
        kuba@kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH] usbnet: sanity check for endpoint types
Message-ID: <202111260112.7MrCT7S6-lkp@intel.com>
References: <8b395185-b18c-caf9-0418-78e96797b474@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b395185-b18c-caf9-0418-78e96797b474@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oliver-Neukum/usbnet-sanity-check-for-endpoint-types/20211125-214053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5f53fa508db098c9d372423a6dac31c8a5679cdf
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20211126/202111260112.7MrCT7S6-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/66c033857b47c1dceaaa6d9daacaabc12ab8ee09
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Oliver-Neukum/usbnet-sanity-check-for-endpoint-types/20211125-214053
        git checkout 66c033857b47c1dceaaa6d9daacaabc12ab8ee09
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=arc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/usb/usbnet.c:94:6: warning: no previous prototype for 'usbnet_validate_endpoints' [-Wmissing-prototypes]
      94 | bool usbnet_validate_endpoints(struct usbnet *dev, struct usb_interface *intf, const struct driver_info *info)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/usbnet_validate_endpoints +94 drivers/net/usb/usbnet.c

    93	
  > 94	bool usbnet_validate_endpoints(struct usbnet *dev, struct usb_interface *intf, const struct driver_info *info)
    95	{
    96		struct usb_host_interface *alt = intf->cur_altsetting;
    97		struct usb_host_endpoint *e;
    98	
    99		e = alt->endpoint + info->in;
   100		if (!e)
   101			return false;
   102		if (!usb_endpoint_is_bulk_in(&e->desc))
   103			return false;
   104	
   105		e = alt->endpoint + info->out;
   106		if (!e)
   107			return false;
   108		if (!usb_endpoint_is_bulk_out(&e->desc))
   109			return false;
   110	
   111		return true;
   112	}
   113	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
