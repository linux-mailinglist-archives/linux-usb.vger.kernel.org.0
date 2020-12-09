Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10002D4292
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 14:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731931AbgLINCC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 08:02:02 -0500
Received: from mga03.intel.com ([134.134.136.65]:7404 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731861AbgLINCC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 08:02:02 -0500
IronPort-SDR: 7y9couZvV2gnz8DLv4JJ/uNCRXdfk1ivj2sW8Vw1Wt+6GliS+yyZr+hPJj/Jg36TPyfbkPP/qp
 AOTRubLpA4Tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="174189960"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="gz'50?scan'50,208,50";a="174189960"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 05:01:20 -0800
IronPort-SDR: pXaCvPMooB97vnJHqZK9EGk9uH8QLMdYaxIdw5uu7LDQUNMBfDVp/HC3UOt2Ss0/fpSGgzj4vA
 V7Xtpwefv5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="gz'50?scan'50,208,50";a="318274307"
Received: from lkp-server01.sh.intel.com (HELO 2bbb63443648) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2020 05:01:17 -0800
Received: from kbuild by 2bbb63443648 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmz5o-0000HS-Cx; Wed, 09 Dec 2020 13:01:16 +0000
Date:   Wed, 9 Dec 2020 21:01:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>
Subject: [peter.chen-usb:for-usb-next 20/30] drivers/usb/cdns3/drd.c:382:32:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202012092100.m9vAjS6C-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git for-usb-next
head:   94e0623337a6d52721e3a842cbfe7196e9f34144
commit: e89eb2bc2ed451edebf7767490416987e9f06d99 [20/30] usb: cdns3: Refactoring names in reusable code
config: parisc-randconfig-s031-20201209 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-179-ga00755aa-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/commit/?id=e89eb2bc2ed451edebf7767490416987e9f06d99
        git remote add peter.chen-usb https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
        git fetch --no-tags peter.chen-usb for-usb-next
        git checkout e89eb2bc2ed451edebf7767490416987e9f06d99
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/usb/cdns3/drd.c:42:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:42:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:42:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:44:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:44:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:44:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:46:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:46:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:46:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:65:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:65:50: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:65:50: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:67:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:67:50: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:67:50: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:90:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:90:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:90:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:100:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:100:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:100:30: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:133:24: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:133:24: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:133:24: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:143:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:143:48: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:143:48: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:159:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:159:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:159:21: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:167:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:167:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:167:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:167:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:167:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:167:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:187:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:187:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:187:21: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:190:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:190:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:190:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:190:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:190:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:190:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:209:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:209:47: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:209:47: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:218:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:218:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:218:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:218:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:218:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:218:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:245:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:245:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:245:21: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:247:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:247:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:247:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:247:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:247:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:247:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:266:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:266:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:266:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:335:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:335:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:335:26: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:354:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:354:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:354:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:377:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_legacy_regs *otg_v0_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:377:27: sparse:     expected struct cdns3_otg_legacy_regs *otg_v0_regs
   drivers/usb/cdns3/drd.c:377:27: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:378:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:378:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:378:25: sparse:     got restricted __le32 *
>> drivers/usb/cdns3/drd.c:382:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns_otg_common_regs *otg_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:382:32: sparse:     expected struct cdns_otg_common_regs *otg_regs
   drivers/usb/cdns3/drd.c:382:32: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:385:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:385:32: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:385:32: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:386:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:386:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:386:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:390:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_regs *otg_v1_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:390:35: sparse:     expected struct cdns3_otg_regs *otg_v1_regs
   drivers/usb/cdns3/drd.c:390:35: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:391:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdnsp_otg_regs *otg_cdnsp_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:391:38: sparse:     expected struct cdnsp_otg_regs *otg_cdnsp_regs
   drivers/usb/cdns3/drd.c:391:38: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:395:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/drd.c:402:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:402:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:402:40: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:406:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:406:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:406:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:406:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:406:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:406:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:411:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:411:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:411:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:440:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:440:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:440:28: sparse:     got restricted __le32 *

vim +382 drivers/usb/cdns3/drd.c

7733f6c32e36ff Pawel Laszczak 2019-08-26  357  
e89eb2bc2ed451 Pawel Laszczak 2020-12-07  358  int cdns_drd_init(struct cdns *cdns)
7733f6c32e36ff Pawel Laszczak 2019-08-26  359  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  360  	void __iomem *regs;
7733f6c32e36ff Pawel Laszczak 2019-08-26  361  	u32 state;
27afe166127521 Pawel Laszczak 2020-07-13  362  	int ret;
7733f6c32e36ff Pawel Laszczak 2019-08-26  363  
7733f6c32e36ff Pawel Laszczak 2019-08-26  364  	regs = devm_ioremap_resource(cdns->dev, &cdns->otg_res);
7733f6c32e36ff Pawel Laszczak 2019-08-26  365  	if (IS_ERR(regs))
7733f6c32e36ff Pawel Laszczak 2019-08-26  366  		return PTR_ERR(regs);
7733f6c32e36ff Pawel Laszczak 2019-08-26  367  
7733f6c32e36ff Pawel Laszczak 2019-08-26  368  	/* Detection of DRD version. Controller has been released
21f969177b7ea3 Pawel Laszczak 2020-12-07  369  	 * in three versions. All are very similar and are software compatible,
21f969177b7ea3 Pawel Laszczak 2020-12-07  370  	 * but they have same changes in register maps.
21f969177b7ea3 Pawel Laszczak 2020-12-07  371  	 * The first register in oldest version is command register and it's
21f969177b7ea3 Pawel Laszczak 2020-12-07  372  	 * read only. Driver should read 0 from it. On the other hand, in v1
21f969177b7ea3 Pawel Laszczak 2020-12-07  373  	 * and v2 the first register contains device ID number which is not
21f969177b7ea3 Pawel Laszczak 2020-12-07  374  	 * set to 0. Driver uses this fact to detect the proper version of
7733f6c32e36ff Pawel Laszczak 2019-08-26  375  	 * controller.
7733f6c32e36ff Pawel Laszczak 2019-08-26  376  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  377  	cdns->otg_v0_regs = regs;
7733f6c32e36ff Pawel Laszczak 2019-08-26  378  	if (!readl(&cdns->otg_v0_regs->cmd)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  379  		cdns->version  = CDNS3_CONTROLLER_V0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  380  		cdns->otg_v1_regs = NULL;
21f969177b7ea3 Pawel Laszczak 2020-12-07  381  		cdns->otg_cdnsp_regs = NULL;
7733f6c32e36ff Pawel Laszczak 2019-08-26 @382  		cdns->otg_regs = regs;
e89eb2bc2ed451 Pawel Laszczak 2020-12-07  383  		cdns->otg_irq_regs = (struct cdns_otg_irq_regs *)
21f969177b7ea3 Pawel Laszczak 2020-12-07  384  				     &cdns->otg_v0_regs->ien;
7733f6c32e36ff Pawel Laszczak 2019-08-26  385  		writel(1, &cdns->otg_v0_regs->simulate);
eed6ed6e7085b8 Peter Chen     2020-03-31  386  		dev_dbg(cdns->dev, "DRD version v0 (%08x)\n",
7733f6c32e36ff Pawel Laszczak 2019-08-26  387  			 readl(&cdns->otg_v0_regs->version));
7733f6c32e36ff Pawel Laszczak 2019-08-26  388  	} else {
7733f6c32e36ff Pawel Laszczak 2019-08-26  389  		cdns->otg_v0_regs = NULL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  390  		cdns->otg_v1_regs = regs;
21f969177b7ea3 Pawel Laszczak 2020-12-07  391  		cdns->otg_cdnsp_regs = regs;
21f969177b7ea3 Pawel Laszczak 2020-12-07  392  
7733f6c32e36ff Pawel Laszczak 2019-08-26  393  		cdns->otg_regs = (void *)&cdns->otg_v1_regs->cmd;
21f969177b7ea3 Pawel Laszczak 2020-12-07  394  
21f969177b7ea3 Pawel Laszczak 2020-12-07  395  		if (cdns->otg_cdnsp_regs->did == OTG_CDNSP_DID) {
e89eb2bc2ed451 Pawel Laszczak 2020-12-07  396  			cdns->otg_irq_regs = (struct cdns_otg_irq_regs *)
21f969177b7ea3 Pawel Laszczak 2020-12-07  397  					      &cdns->otg_cdnsp_regs->ien;
21f969177b7ea3 Pawel Laszczak 2020-12-07  398  			cdns->version  = CDNSP_CONTROLLER_V2;
21f969177b7ea3 Pawel Laszczak 2020-12-07  399  		} else {
e89eb2bc2ed451 Pawel Laszczak 2020-12-07  400  			cdns->otg_irq_regs = (struct cdns_otg_irq_regs *)
21f969177b7ea3 Pawel Laszczak 2020-12-07  401  					      &cdns->otg_v1_regs->ien;
7733f6c32e36ff Pawel Laszczak 2019-08-26  402  			writel(1, &cdns->otg_v1_regs->simulate);
21f969177b7ea3 Pawel Laszczak 2020-12-07  403  			cdns->version  = CDNS3_CONTROLLER_V1;
21f969177b7ea3 Pawel Laszczak 2020-12-07  404  		}
21f969177b7ea3 Pawel Laszczak 2020-12-07  405  
eed6ed6e7085b8 Peter Chen     2020-03-31  406  		dev_dbg(cdns->dev, "DRD version v1 (ID: %08x, rev: %08x)\n",
7733f6c32e36ff Pawel Laszczak 2019-08-26  407  			 readl(&cdns->otg_v1_regs->did),
7733f6c32e36ff Pawel Laszczak 2019-08-26  408  			 readl(&cdns->otg_v1_regs->rid));
7733f6c32e36ff Pawel Laszczak 2019-08-26  409  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  410  
7733f6c32e36ff Pawel Laszczak 2019-08-26  411  	state = OTGSTS_STRAP(readl(&cdns->otg_regs->sts));
7733f6c32e36ff Pawel Laszczak 2019-08-26  412  
7733f6c32e36ff Pawel Laszczak 2019-08-26  413  	/* Update dr_mode according to STRAP configuration. */
7733f6c32e36ff Pawel Laszczak 2019-08-26  414  	cdns->dr_mode = USB_DR_MODE_OTG;
21f969177b7ea3 Pawel Laszczak 2020-12-07  415  
21f969177b7ea3 Pawel Laszczak 2020-12-07  416  	if ((cdns->version == CDNSP_CONTROLLER_V2 &&
21f969177b7ea3 Pawel Laszczak 2020-12-07  417  	     state == OTGSTS_CDNSP_STRAP_HOST) ||
21f969177b7ea3 Pawel Laszczak 2020-12-07  418  	    (cdns->version != CDNSP_CONTROLLER_V2 &&
21f969177b7ea3 Pawel Laszczak 2020-12-07  419  	     state == OTGSTS_STRAP_HOST)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  420  		dev_dbg(cdns->dev, "Controller strapped to HOST\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  421  		cdns->dr_mode = USB_DR_MODE_HOST;
21f969177b7ea3 Pawel Laszczak 2020-12-07  422  	} else if ((cdns->version == CDNSP_CONTROLLER_V2 &&
21f969177b7ea3 Pawel Laszczak 2020-12-07  423  		    state == OTGSTS_CDNSP_STRAP_GADGET) ||
21f969177b7ea3 Pawel Laszczak 2020-12-07  424  		   (cdns->version != CDNSP_CONTROLLER_V2 &&
21f969177b7ea3 Pawel Laszczak 2020-12-07  425  		    state == OTGSTS_STRAP_GADGET)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  426  		dev_dbg(cdns->dev, "Controller strapped to PERIPHERAL\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  427  		cdns->dr_mode = USB_DR_MODE_PERIPHERAL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  428  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  429  
7733f6c32e36ff Pawel Laszczak 2019-08-26  430  	ret = devm_request_threaded_irq(cdns->dev, cdns->otg_irq,
e89eb2bc2ed451 Pawel Laszczak 2020-12-07  431  					cdns_drd_irq,
e89eb2bc2ed451 Pawel Laszczak 2020-12-07  432  					cdns_drd_thread_irq,
7733f6c32e36ff Pawel Laszczak 2019-08-26  433  					IRQF_SHARED,
7733f6c32e36ff Pawel Laszczak 2019-08-26  434  					dev_name(cdns->dev), cdns);
7733f6c32e36ff Pawel Laszczak 2019-08-26  435  	if (ret) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  436  		dev_err(cdns->dev, "couldn't get otg_irq\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  437  		return ret;
7733f6c32e36ff Pawel Laszczak 2019-08-26  438  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  439  
7733f6c32e36ff Pawel Laszczak 2019-08-26  440  	state = readl(&cdns->otg_regs->sts);
ecf4f823fb7050 Pawel Laszczak 2020-07-13  441  	if (OTGSTS_OTG_NRDY(state)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  442  		dev_err(cdns->dev, "Cadence USB3 OTG device not ready\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  443  		return -ENODEV;
7733f6c32e36ff Pawel Laszczak 2019-08-26  444  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  445  
27afe166127521 Pawel Laszczak 2020-07-13  446  	return 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  447  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  448  

:::::: The code at line 382 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--fUYQa+Pmc3FrFX/N
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--fUYQa+Pmc3FrFX/N--
