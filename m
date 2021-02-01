Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4632130AD66
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 18:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhBARHc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 12:07:32 -0500
Received: from mga04.intel.com ([192.55.52.120]:58599 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229763AbhBARH3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 12:07:29 -0500
IronPort-SDR: BOWO7eQyDod3Z+WjASz6Q8vZWUkwiqc008TBxgEW9ohyoBzxeJyBl/323gFu8Ddl5Der1cA+RH
 XisiaaQ6kW8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="178155186"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="gz'50?scan'50,208,50";a="178155186"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 09:06:42 -0800
IronPort-SDR: p3ino7V7kmCykxJVsyspFtrsWkKaLzQvi1KHhDqtRqt1BOIgPCyZtIeU3QpWpdOT2GdG/3CeWV
 kIFomdOAYJJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="gz'50?scan'50,208,50";a="432428072"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Feb 2021 09:06:40 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l6ceu-0008JB-27; Mon, 01 Feb 2021 17:06:40 +0000
Date:   Tue, 2 Feb 2021 01:06:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [usb:usb-testing 64/146] drivers/usb/chipidea/../host/ehci.h:767:17:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202102020104.3V5j8uZ1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   29b01295a829fba7399ee84afff4e64660e49f04
commit: fc53d5279094e38e6363506339772a7021da2df8 [64/146] usb: chipidea: tegra: Support host mode
config: arm-randconfig-s031-20210201 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-215-g0fb77bb6-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=fc53d5279094e38e6363506339772a7021da2df8
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout fc53d5279094e38e6363506339772a7021da2df8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/usb/chipidea/ci_hdrc_tegra.c: note: in included file:
>> drivers/usb/chipidea/../host/ehci.h:767:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:743:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:743:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:743:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:767:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:743:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:743:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:743:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:767:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:767:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:743:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:743:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:743:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:767:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:743:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:743:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:743:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:767:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:767:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/chipidea/../host/ehci.h:767:17: sparse:     got unsigned int *
   drivers/usb/chipidea/../host/ehci.h:766:36: sparse: sparse: context imbalance in 'tegra_usb_internal_port_reset' - unexpected unlock

vim +767 drivers/usb/chipidea/../host/ehci.h

91bc4d31e81b15 Vladimir Barinov       2007-12-30  737  
083522d76662cd Benjamin Herrenschmidt 2006-12-15  738  static inline unsigned int ehci_readl(const struct ehci_hcd *ehci,
083522d76662cd Benjamin Herrenschmidt 2006-12-15  739  		__u32 __iomem *regs)
083522d76662cd Benjamin Herrenschmidt 2006-12-15  740  {
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  741  #ifdef CONFIG_USB_EHCI_BIG_ENDIAN_MMIO
083522d76662cd Benjamin Herrenschmidt 2006-12-15  742  	return ehci_big_endian_mmio(ehci) ?
68f50e52554a0a Al Viro                2007-02-09 @743  		readl_be(regs) :
68f50e52554a0a Al Viro                2007-02-09  744  		readl(regs);
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  745  #else
68f50e52554a0a Al Viro                2007-02-09  746  	return readl(regs);
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  747  #endif
083522d76662cd Benjamin Herrenschmidt 2006-12-15  748  }
083522d76662cd Benjamin Herrenschmidt 2006-12-15  749  
feffe09f510c47 Peter Chen             2014-01-10  750  #ifdef CONFIG_SOC_IMX28
feffe09f510c47 Peter Chen             2014-01-10  751  static inline void imx28_ehci_writel(const unsigned int val,
feffe09f510c47 Peter Chen             2014-01-10  752  		volatile __u32 __iomem *addr)
feffe09f510c47 Peter Chen             2014-01-10  753  {
feffe09f510c47 Peter Chen             2014-01-10  754  	__asm__ ("swp %0, %0, [%1]" : : "r"(val), "r"(addr));
feffe09f510c47 Peter Chen             2014-01-10  755  }
feffe09f510c47 Peter Chen             2014-01-10  756  #else
feffe09f510c47 Peter Chen             2014-01-10  757  static inline void imx28_ehci_writel(const unsigned int val,
feffe09f510c47 Peter Chen             2014-01-10  758  		volatile __u32 __iomem *addr)
feffe09f510c47 Peter Chen             2014-01-10  759  {
feffe09f510c47 Peter Chen             2014-01-10  760  }
feffe09f510c47 Peter Chen             2014-01-10  761  #endif
083522d76662cd Benjamin Herrenschmidt 2006-12-15  762  static inline void ehci_writel(const struct ehci_hcd *ehci,
083522d76662cd Benjamin Herrenschmidt 2006-12-15  763  		const unsigned int val, __u32 __iomem *regs)
083522d76662cd Benjamin Herrenschmidt 2006-12-15  764  {
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  765  #ifdef CONFIG_USB_EHCI_BIG_ENDIAN_MMIO
083522d76662cd Benjamin Herrenschmidt 2006-12-15  766  	ehci_big_endian_mmio(ehci) ?
68f50e52554a0a Al Viro                2007-02-09 @767  		writel_be(val, regs) :
68f50e52554a0a Al Viro                2007-02-09  768  		writel(val, regs);
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  769  #else
feffe09f510c47 Peter Chen             2014-01-10  770  	if (ehci->imx28_write_fix)
feffe09f510c47 Peter Chen             2014-01-10  771  		imx28_ehci_writel(val, regs);
feffe09f510c47 Peter Chen             2014-01-10  772  	else
68f50e52554a0a Al Viro                2007-02-09  773  		writel(val, regs);
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  774  #endif
083522d76662cd Benjamin Herrenschmidt 2006-12-15  775  }
8cd42e97bf451b Kumar Gala             2006-01-20  776  

:::::: The code at line 767 was first introduced by commit
:::::: 68f50e52554a0a55dfe2e3fdf659ee0569d73c3f [PATCH] hci_{read,write}l() does force casts to wrong type for no reason

:::::: TO: Al Viro <viro@ftp.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--rwEMma7ioTxnRzrJ
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--rwEMma7ioTxnRzrJ--
