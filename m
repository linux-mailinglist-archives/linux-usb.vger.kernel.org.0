Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8812F47BF63
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 13:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbhLUMH6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 07:07:58 -0500
Received: from mga04.intel.com ([192.55.52.120]:60098 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230380AbhLUMH6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Dec 2021 07:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640088478; x=1671624478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+3UOPNze5WBOvoIzscH9ZGtz5uYzjD08yP9m/w8wEk=;
  b=nvs1hYrsYbkhJ38eMfULauTMbmLWErLhzsz7/hwoWmJcEHyLg5vTo28C
   3fDk+Gn2IfqIHZO4WYrjBk89U3fmtNpWnISe0L6Rg0qmrCNhYDDSYhNLE
   d4R72qWCPfVfrSHCpfbmHEBuBYS0ut46DRNOeJDdnnmfBCG74qfsH/BzN
   tScmfzSlMsyyQjVEVVt/MJFkwB4gJJ3o2e6JUYiUWpl/HE3FlcxhKw7ok
   tXqCDlV4XWW0vxv2O61eAyUCseuxTJdbnZMLMs1D+DCQgiAeWrmRaWkzR
   lLg1quJt5WKPqi/5ZQtVg1ojYUjWyFBdSllCl1v5h0RrR8p00CJaPiGSw
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="239128967"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="239128967"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 04:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="508051990"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Dec 2021 04:07:56 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzdvv-00094I-P8; Tue, 21 Dec 2021 12:07:55 +0000
Date:   Tue, 21 Dec 2021 20:07:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 5/9] drivers/usb/renesas_usbhs/mod.c:195:13:
 warning: variable 'intenb0' set but not used
Message-ID: <202112211923.EfvDjyKL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   ce1d37cb7697abcc3d892558acd33a1333596534
commit: 22ae6415c702680b1d3170717ce34ee31656f8b6 [5/9] usb: renesas_usbhs: Use platform_get_irq() to get the interrupt
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20211221/202112211923.EfvDjyKL-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=22ae6415c702680b1d3170717ce34ee31656f8b6
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 22ae6415c702680b1d3170717ce34ee31656f8b6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash drivers/usb/renesas_usbhs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/renesas_usbhs/mod.c: In function 'usbhs_status_get_each_irq':
>> drivers/usb/renesas_usbhs/mod.c:195:13: warning: variable 'intenb0' set but not used [-Wunused-but-set-variable]
     195 |         u16 intenb0, intenb1;
         |             ^~~~~~~


vim +/intenb0 +195 drivers/usb/renesas_usbhs/mod.c

f1407d5c66240b Kuninori Morimoto  2011-04-04  190  
697d5c004e3901 Shimoda, Yoshihiro 2012-08-20  191  static int usbhs_status_get_each_irq(struct usbhs_priv *priv,
f1407d5c66240b Kuninori Morimoto  2011-04-04  192  				     struct usbhs_irq_state *state)
f1407d5c66240b Kuninori Morimoto  2011-04-04  193  {
f1407d5c66240b Kuninori Morimoto  2011-04-04  194  	struct usbhs_mod *mod = usbhs_mod_get_current(priv);
697d5c004e3901 Shimoda, Yoshihiro 2012-08-20 @195  	u16 intenb0, intenb1;
c4d8199ba1a7aa Yoshihiro Shimoda  2014-08-22  196  	unsigned long flags;
f1407d5c66240b Kuninori Morimoto  2011-04-04  197  
c4d8199ba1a7aa Yoshihiro Shimoda  2014-08-22  198  	/********************  spin lock ********************/
c4d8199ba1a7aa Yoshihiro Shimoda  2014-08-22  199  	usbhs_lock(priv, flags);
f1407d5c66240b Kuninori Morimoto  2011-04-04  200  	state->intsts0 = usbhs_read(priv, INTSTS0);
697d5c004e3901 Shimoda, Yoshihiro 2012-08-20  201  	intenb0 = usbhs_read(priv, INTENB0);
88a25e02f35e56 Nobuhiro Iwamatsu  2015-01-09  202  
88a25e02f35e56 Nobuhiro Iwamatsu  2015-01-09  203  	if (usbhs_mod_is_host(priv)) {
88a25e02f35e56 Nobuhiro Iwamatsu  2015-01-09  204  		state->intsts1 = usbhs_read(priv, INTSTS1);
697d5c004e3901 Shimoda, Yoshihiro 2012-08-20  205  		intenb1 = usbhs_read(priv, INTENB1);
672bfdaa310004 Arnd Bergmann      2015-05-22  206  	} else {
672bfdaa310004 Arnd Bergmann      2015-05-22  207  		state->intsts1 = intenb1 = 0;
88a25e02f35e56 Nobuhiro Iwamatsu  2015-01-09  208  	}
697d5c004e3901 Shimoda, Yoshihiro 2012-08-20  209  
5ea68d541df200 Kuninori Morimoto  2011-04-28  210  	/* mask */
5ea68d541df200 Kuninori Morimoto  2011-04-28  211  	if (mod) {
f1407d5c66240b Kuninori Morimoto  2011-04-04  212  		state->brdysts = usbhs_read(priv, BRDYSTS);
f1407d5c66240b Kuninori Morimoto  2011-04-04  213  		state->nrdysts = usbhs_read(priv, NRDYSTS);
f1407d5c66240b Kuninori Morimoto  2011-04-04  214  		state->bempsts = usbhs_read(priv, BEMPSTS);
f1407d5c66240b Kuninori Morimoto  2011-04-04  215  
f1407d5c66240b Kuninori Morimoto  2011-04-04  216  		state->bempsts &= mod->irq_bempsts;
f1407d5c66240b Kuninori Morimoto  2011-04-04  217  		state->brdysts &= mod->irq_brdysts;
f1407d5c66240b Kuninori Morimoto  2011-04-04  218  	}
c4d8199ba1a7aa Yoshihiro Shimoda  2014-08-22  219  	usbhs_unlock(priv, flags);
c4d8199ba1a7aa Yoshihiro Shimoda  2014-08-22  220  	/********************  spin unlock ******************/
697d5c004e3901 Shimoda, Yoshihiro 2012-08-20  221  
697d5c004e3901 Shimoda, Yoshihiro 2012-08-20  222  	return 0;
5ea68d541df200 Kuninori Morimoto  2011-04-28  223  }
f1407d5c66240b Kuninori Morimoto  2011-04-04  224  

:::::: The code at line 195 was first introduced by commit
:::::: 697d5c004e390102efbf9320a5416873679bea81 usb: renesas_usbhs: modify the irq handler for sharing irq

:::::: TO: Shimoda, Yoshihiro <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
