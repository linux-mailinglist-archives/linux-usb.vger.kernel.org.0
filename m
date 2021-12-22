Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B4047CF62
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 10:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243973AbhLVJgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 04:36:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:8821 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229987AbhLVJgm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Dec 2021 04:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640165802; x=1671701802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qPEXBUbe94rfErhQd+lmgtaMAUXWpXgWeaLE4m2ThfI=;
  b=CzClOOffLqRXz04gFxS8ZxyQVSG1EzeKTcuKUFOK06NhUbRNXRsy5hxx
   WImM8iQhtTQ9DoTbro5AnlyCBdW7VcobbTedQaE3SCrYHW4AvFAjRUxkz
   +JLAMxtGa5iJ6VgGzrfSEZg7bBmaWAvUUMyhHNn1cttZHNTEjHUlPhbPz
   enbTPZ8x4g8Va2hnIlD2z0J6CGgt8mhZID/e4BSCVpFQ2NE5ek/p6dxgJ
   TkEGhOFxytcG1WIP0ivRnNYZoI8aS4K81E2obyx/tr+eL3Ba3PsgJmUNq
   FuGKlOm/925RQ+uLcIgv3nqsp1vJrV/lI0WTZ2k6Q/DrARrGpbcG0MYVJ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="264781505"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="264781505"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 01:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="468116047"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Dec 2021 01:36:39 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzy34-0000Jx-Na; Wed, 22 Dec 2021 09:36:38 +0000
Date:   Wed, 22 Dec 2021 17:36:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 5/9] drivers/usb/renesas_usbhs/mod.c:195:6: warning:
 variable 'intenb0' set but not used
Message-ID: <202112221724.CBz2Bjz2-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   ce1d37cb7697abcc3d892558acd33a1333596534
commit: 22ae6415c702680b1d3170717ce34ee31656f8b6 [5/9] usb: renesas_usbhs: Use platform_get_irq() to get the interrupt
config: hexagon-randconfig-r041-20211222 (https://download.01.org/0day-ci/archive/20211222/202112221724.CBz2Bjz2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=22ae6415c702680b1d3170717ce34ee31656f8b6
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-next
        git checkout 22ae6415c702680b1d3170717ce34ee31656f8b6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/renesas_usbhs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/renesas_usbhs/mod.c:195:6: warning: variable 'intenb0' set but not used [-Wunused-but-set-variable]
           u16 intenb0, intenb1;
               ^
   1 warning generated.


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
