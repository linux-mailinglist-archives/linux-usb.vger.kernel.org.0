Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91CF545EC05
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 11:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbhKZLCn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 06:02:43 -0500
Received: from mga01.intel.com ([192.55.52.88]:37427 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhKZLAl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Nov 2021 06:00:41 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="259550782"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="259550782"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 02:57:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="457631761"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Nov 2021 02:57:26 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqYuy-0007ze-UW; Fri, 26 Nov 2021 10:57:24 +0000
Date:   Fri, 26 Nov 2021 18:56:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Keeping <john@metanate.com>
Cc:     kbuild-all@lists.01.org,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3] usb: f_fs: Fix use-after-free for epfile
Message-ID: <202111261849.Pw2UJeFw-lkp@intel.com>
References: <1637905644-32618-1-git-send-email-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637905644-32618-1-git-send-email-quic_ugoswami@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Udipto,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on balbi-usb/testing/next peter-chen-usb/for-usb-next v5.16-rc2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Udipto-Goswami/usb-f_fs-Fix-use-after-free-for-epfile/20211126-135108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20211126/202111261849.Pw2UJeFw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5bcd8f0f07e0a91b72a538d1d76369ed4d410901
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Udipto-Goswami/usb-f_fs-Fix-use-after-free-for-epfile/20211126-135108
        git checkout 5bcd8f0f07e0a91b72a538d1d76369ed4d410901
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/gadget/function/f_fs.c: In function 'ffs_func_eps_disable':
>> drivers/usb/gadget/function/f_fs.c:1958:27: error: 'epfile' undeclared (first use in this function); did you mean 'epfiles'?
    1958 |                         ++epfile;
         |                           ^~~~~~
         |                           epfiles
   drivers/usb/gadget/function/f_fs.c:1958:27: note: each undeclared identifier is reported only once for each function it appears in


vim +1958 drivers/usb/gadget/function/f_fs.c

ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1937  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1938  static void ffs_func_eps_disable(struct ffs_function *func)
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1939  {
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1940  	struct ffs_ep *ep;
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1941  	struct ffs_epfile *epfiles;
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1942  	unsigned short count;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1943  	unsigned long flags;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1944  
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz  2016-05-21  1945  	spin_lock_irqsave(&func->ffs->eps_lock, flags);
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1946  	count = func->ffs->eps_count;
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1947  	epfiles = func->ffs->epfiles;
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1948  	ep = func->eps;
08f37148b6a915a drivers/usb/gadget/function/f_fs.c Vincent Pelletier  2017-01-09  1949  	while (count--) {
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1950  		/* pending requests get nuked */
8704fd73bf5658b drivers/usb/gadget/function/f_fs.c Greg Kroah-Hartman 2020-11-27  1951  		if (ep->ep)
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1952  			usb_ep_disable(ep->ep);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1953  		++ep;
18d6b32fca3841f drivers/usb/gadget/function/f_fs.c Robert Baldyga     2014-12-18  1954  
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1955  		if (epfiles) {
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1956  			epfiles->ep = NULL;
5bcd8f0f07e0a91 drivers/usb/gadget/function/f_fs.c Udipto Goswami     2021-11-26  1957  			__ffs_epfile_read_buffer_free(epfiles);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05 @1958  			++epfile;
18d6b32fca3841f drivers/usb/gadget/function/f_fs.c Robert Baldyga     2014-12-18  1959  		}
08f37148b6a915a drivers/usb/gadget/function/f_fs.c Vincent Pelletier  2017-01-09  1960  	}
a9e6f83c2df1991 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz  2016-10-04  1961  	spin_unlock_irqrestore(&func->ffs->eps_lock, flags);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1962  }
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz  2010-05-05  1963  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
