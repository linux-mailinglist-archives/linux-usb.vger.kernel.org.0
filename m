Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8D83757A9
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 17:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235293AbhEFPko (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 11:40:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:56516 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235798AbhEFPkM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 11:40:12 -0400
IronPort-SDR: TG8amDxaw9lLkguzyEr14+CK2d1Nn8JLsaN9J0Egch/810p46RyoER6XBfdKulu9n97K11ukUc
 ck85DvggFZjg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="259782139"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; 
   d="gz'50?scan'50,208,50";a="259782139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 08:37:34 -0700
IronPort-SDR: lw5dQuutLSf0334lBQuHxJ9uTiNQvNcW2+K3S0rW2yBOrdGjfsWqUeWnPXkMFucZYLzyGG6xVH
 z83Og9o5CJLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; 
   d="gz'50?scan'50,208,50";a="430609078"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 May 2021 08:37:32 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1leg4B-000Ajr-Ke; Thu, 06 May 2021 15:37:31 +0000
Date:   Thu, 6 May 2021 23:37:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 7/9] drivers/usb/isp1760/isp1760-hcd.c:485:42:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202105062309.R5efCyjE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   83a9d2a05296bf5a5fee13206dc4499a40978908
commit: 54dacbcc6b8921a211bd736d2f208d3c78594241 [7/9] usb: isp1760: move to regmap for register access
config: h8300-randconfig-s032-20210506 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=54dacbcc6b8921a211bd736d2f208d3c78594241
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 54dacbcc6b8921a211bd736d2f208d3c78594241
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=h8300 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c: note: in included file (through include/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restricted __le32
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/isp1760/isp1760-hcd.c:301:38: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:301:38: sparse:     expected unsigned int [usertype] b
   drivers/usb/isp1760/isp1760-hcd.c:301:38: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:322:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:322:30: sparse:     expected unsigned int [usertype] b
   drivers/usb/isp1760/isp1760-hcd.c:322:30: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:346:50: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int const [usertype] *[assigned] src @@     got restricted __dw * @@
   drivers/usb/isp1760/isp1760-hcd.c:346:50: sparse:     expected unsigned int const [usertype] *[assigned] src
   drivers/usb/isp1760/isp1760-hcd.c:346:50: sparse:     got restricted __dw *
   drivers/usb/isp1760/isp1760-hcd.c:350:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int const [usertype] *[assigned] src @@     got restricted __dw * @@
   drivers/usb/isp1760/isp1760-hcd.c:350:60: sparse:     expected unsigned int const [usertype] *[assigned] src
   drivers/usb/isp1760/isp1760-hcd.c:350:60: sparse:     got restricted __dw *
>> drivers/usb/isp1760/isp1760-hcd.c:485:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct usb_hcd *hcd @@     got void [noderef] __iomem *regs @@
   drivers/usb/isp1760/isp1760-hcd.c:485:42: sparse:     expected struct usb_hcd *hcd
   drivers/usb/isp1760/isp1760-hcd.c:485:42: sparse:     got void [noderef] __iomem *regs
   drivers/usb/isp1760/isp1760-hcd.c:486:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct usb_hcd *hcd @@     got void [noderef] __iomem *regs @@
   drivers/usb/isp1760/isp1760-hcd.c:486:42: sparse:     expected struct usb_hcd *hcd
   drivers/usb/isp1760/isp1760-hcd.c:486:42: sparse:     got void [noderef] __iomem *regs
   drivers/usb/isp1760/isp1760-hcd.c:587:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw0 @@     got int @@
   drivers/usb/isp1760/isp1760-hcd.c:587:18: sparse:     expected restricted __dw [usertype] dw0
   drivers/usb/isp1760/isp1760-hcd.c:587:18: sparse:     got int
   drivers/usb/isp1760/isp1760-hcd.c:588:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:588:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:588:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:589:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:589:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:589:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:590:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:590:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:590:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:593:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw1 @@     got unsigned int @@
   drivers/usb/isp1760/isp1760-hcd.c:593:18: sparse:     expected restricted __dw [usertype] dw1
   drivers/usb/isp1760/isp1760-hcd.c:593:18: sparse:     got unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:594:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:594:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:594:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:595:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:595:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:595:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:598:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:598:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:598:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:600:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:600:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:600:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:605:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:605:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:605:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:607:34: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:607:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:607:34: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:609:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:609:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:609:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:610:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:610:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:610:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:615:34: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:615:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:615:34: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:620:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:620:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:620:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:623:34: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:623:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:623:34: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:627:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:627:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:627:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:628:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:628:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:628:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:631:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:631:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:631:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:632:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:632:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:632:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:635:34: sparse: sparse: invalid assignment: &=
   drivers/usb/isp1760/isp1760-hcd.c:635:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:635:34: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:637:34: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:637:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:637:34: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:640:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:640:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:640:18: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:642:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:642:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:642:18: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:687:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw5 @@     got int @@
   drivers/usb/isp1760/isp1760-hcd.c:687:26: sparse:     expected restricted __dw [usertype] dw5
   drivers/usb/isp1760/isp1760-hcd.c:687:26: sparse:     got int
   drivers/usb/isp1760/isp1760-hcd.c:693:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:693:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:693:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:694:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw4 @@     got unsigned int [assigned] [usertype] usof @@
   drivers/usb/isp1760/isp1760-hcd.c:694:18: sparse:     expected restricted __dw [usertype] dw4
   drivers/usb/isp1760/isp1760-hcd.c:694:18: sparse:     got unsigned int [assigned] [usertype] usof
   drivers/usb/isp1760/isp1760-hcd.c:1027:13: sparse: sparse: bad assignment (>>=) to restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:1032:16: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1037:33: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1058:29: sparse: sparse: bad assignment (>>=) to restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:1071:16: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1072:24: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1074:26: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1089:17: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1089:47: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1095:14: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1095:49: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1173:40: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1176:41: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1186:38: sparse: sparse: restricted __dw degrades to integer

vim +485 drivers/usb/isp1760/isp1760-hcd.c

   463	
   464	/* one-time init, only for memory state */
   465	static int priv_init(struct usb_hcd *hcd)
   466	{
   467		struct isp1760_hcd *priv = hcd_to_priv(hcd);
   468		u32 isoc_cache;
   469		u32 isoc_thres;
   470	
   471		int i;
   472	
   473		spin_lock_init(&priv->lock);
   474	
   475		for (i = 0; i < QH_END; i++)
   476			INIT_LIST_HEAD(&priv->qh_list[i]);
   477	
   478		/*
   479		 * hw default: 1K periodic list heads, one per frame.
   480		 * periodic_size can shrink by USBCMD update if hcc_params allows.
   481		 */
   482		priv->periodic_size = DEFAULT_I_TDPS;
   483	
   484		/* controllers may cache some of the periodic schedule ... */
 > 485		isoc_cache = isp1760_hcd_read(hcd->regs, HCC_ISOC_CACHE);
   486		isoc_thres = isp1760_hcd_read(hcd->regs, HCC_ISOC_THRES);
   487	
   488		/* full frame cache */
   489		if (isoc_cache)
   490			priv->i_thresh = 8;
   491		else /* N microframes cached */
   492			priv->i_thresh = 2 + isoc_thres;
   493	
   494		return 0;
   495	}
   496	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--VS++wcV0S1rZb1Fb
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
dMEUf5vCK4dpUm4YMl9PcZcE31BqoW+wMzYdDmlvVhZGo2Ft/RRrnpSYuoIt16SzKFszPc/a
9t43z6u2380OFZ44x6fWEwfvBMLz8/P55W9ahHUp7QpFSA//aaCvytM1+ijJX53HGZMsmOz5
7oKQhf9H2ZM1t43k/P79CleedqsmE92SH/JAkZTEiJdJSpb9wlJsJVZNfJQl7072139ANw+g
G3QyVVPjCAD7bjQajSMK2PSTxwuG04qrPK1ranrBLptA0NSkOyK9JXBKDG9LQ9VadRjSO++J
jGNrycBVsm/1bqZ3BmySvd7Y8gYb9yYjLq+N5bTsiKDrHX6PBn0qho1Ho4lR1Ggk2x0Canw5
6Nh7iBtKWw4xPSbOjieDUWbeIsfMaF7/tl9Ex5NL60G0RU7H7M4Lv2esyOmkb/weGcVPO8Xq
8XTa6+z6tFvklmM4AS+esax4aYJpQGha5Hw0orcAkJb6E5qsA8WnCXVMjCaDIfvt7Mb9qSEq
jWcdXoEg6IymYv4gxFwOSMFwUEJTe7OB8qx75ODxeNo3SafDvpF2SEEnfUmM0EeuHgvyGPzO
xmi4x/3b4+PPSllpsQKd80tFqRCZpVWA9qXCIJKHp7ufzQP0/9C9zPPyT2kY1kpx/bqwxOfd
/fn59ZN3PJ1fj1/f8C2eq3QuDa9L44Giowhtw/ywPx0+hkB2uL8In59fLv4FTfj3xbemiSfS
RF7tAqR8+XKucFM5Bs0/rbFNgvTuoDFW9/3n6/Pp7vnlAFXbp75ScvU6LoGI6w8Zd9MgxkiU
moy7qDreLssHl3KpgBqNDV3Vst+h2ljsnHwANxTTRMM+LJc3WVIOpYBUUboZ9qgkXAFMtU51
buiCUFEkHWXFcjjoMe1F90BraeCw/3F+IGduDX09X2Q6MsDT8fzMzp+FPxr16H1bAUbsJjfs
mRc3hAyYoCBVQpC0XbpVb4/H++P5J1kqdQuiwbDPdD7eqhAzAq3wktNjL+MAGvT60mpgUe+j
wAsKml6iyAf0LNW/q1njMKb6WBWbAWGReTBl+iv8PWAzaHVbMzzgFGd0e3087E9vr4fHA9wA
3mAYhR3UpWqtsB2Lu8KKCQQrHDVTnUdBn2WTUr9N2VrBjOy6i12Sz2AUbFMnk0DWVK+j3YQd
MEG8LQM3GsG+7y6UEckFIwnsxonajexlhCKY4EcQRi+r/Rvm0cTLOyL6d88plR5x8LmTLIW2
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

--VS++wcV0S1rZb1Fb--
