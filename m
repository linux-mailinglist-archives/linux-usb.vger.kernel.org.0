Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB60C1DBCA2
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 20:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgETSUv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 14:20:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:47285 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727017AbgETSUu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 14:20:50 -0400
IronPort-SDR: lruQtvMDlVsBlpSO7R/mlVDQRZ4GXVyJN9a/iudPi4wz4VmMSoM0opA1HKECsk7qFN4mfAfRFS
 wcs4cAUqlWsw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 11:20:49 -0700
IronPort-SDR: YEuzpoVu+3qFg0hA0Kg3k++O4seF86ufqOjT4c9llP3a7SFJ5/E247heG8Ec22ef9OtVlOCP5X
 LeZRINc7wGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="264776165"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 May 2020 11:20:47 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jbTKg-0007Eu-RJ; Thu, 21 May 2020 02:20:46 +0800
Date:   Thu, 21 May 2020 02:20:38 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     kbuild-all@lists.01.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] usb: typec: Ensure USB_ROLE_SWITCH is a dependency for
 tps6598x
Message-ID: <202005210211.0PCV77KB%lkp@intel.com>
References: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bryan,

I love your patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on balbi-usb/testing/next peter.chen-usb/ci-for-usb-next v5.7-rc6 next-20200519]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Bryan-O-Donoghue/usb-typec-Ensure-USB_ROLE_SWITCH-is-a-dependency-for-tps6598x/20200521-011740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: i386-tinyconfig
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        make ARCH=i386  tinyconfig
        make ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/of/Kconfig:69:error: recursive dependency detected!
drivers/of/Kconfig:69: symbol OF_IRQ depends on IRQ_DOMAIN
kernel/irq/Kconfig:68: symbol IRQ_DOMAIN is selected by REGMAP
drivers/base/regmap/Kconfig:7: symbol REGMAP default is visible depending on REGMAP_I2C
drivers/base/regmap/Kconfig:19: symbol REGMAP_I2C is selected by TYPEC_TPS6598X
drivers/usb/typec/Kconfig:64: symbol TYPEC_TPS6598X depends on USB_ROLE_SWITCH
drivers/usb/roles/Kconfig:3: symbol USB_ROLE_SWITCH is selected by USB_MUSB_MEDIATEK
drivers/usb/musb/Kconfig:119: symbol USB_MUSB_MEDIATEK depends on GENERIC_PHY
drivers/phy/Kconfig:8: symbol GENERIC_PHY is selected by PHY_BCM_NS_USB3
drivers/phy/broadcom/Kconfig:41: symbol PHY_BCM_NS_USB3 depends on MDIO_BUS
drivers/net/phy/Kconfig:13: symbol MDIO_BUS depends on MDIO_DEVICE
drivers/net/phy/Kconfig:6: symbol MDIO_DEVICE is selected by PHYLIB
drivers/net/phy/Kconfig:243: symbol PHYLIB is selected by ARC_EMAC_CORE
drivers/net/ethernet/arc/Kconfig:19: symbol ARC_EMAC_CORE is selected by ARC_EMAC
drivers/net/ethernet/arc/Kconfig:25: symbol ARC_EMAC depends on OF_IRQ
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

vim +69 drivers/of/Kconfig

5ab5fc7e35705c Grant Likely         2010-07-05  14  
19fd74879a32fb Grant Likely         2014-11-04  15  config OF_UNITTEST
19fd74879a32fb Grant Likely         2014-11-04  16  	bool "Device Tree runtime unit tests"
6019a3d07d7258 Rob Herring          2017-07-25  17  	depends on !SPARC
6019a3d07d7258 Rob Herring          2017-07-25  18  	select IRQ_DOMAIN
649e0a77e28a77 Rob Herring          2015-05-28  19  	select OF_EARLY_FLATTREE
2eb46da2a760e5 Grant Likely         2014-10-02  20  	select OF_RESOLVE
53a42093d96ef5 Grant Likely         2011-12-12  21  	help
53a42093d96ef5 Grant Likely         2011-12-12  22  	  This option builds in test cases for the device tree infrastructure
5d9270869b6cd3 Geert Uytterhoeven   2013-12-24  23  	  that are executed once at boot time, and the results dumped to the
53a42093d96ef5 Grant Likely         2011-12-12  24  	  console.
53a42093d96ef5 Grant Likely         2011-12-12  25  
53a42093d96ef5 Grant Likely         2011-12-12  26  	  If unsure, say N here, but this option is safe to enable.
53a42093d96ef5 Grant Likely         2011-12-12  27  
1b7c501b51a8c8 Rob Herring          2015-10-06  28  config OF_ALL_DTBS
1b7c501b51a8c8 Rob Herring          2015-10-06  29  	bool "Build all Device Tree Blobs"
1b7c501b51a8c8 Rob Herring          2015-10-06  30  	depends on COMPILE_TEST
1b7c501b51a8c8 Rob Herring          2015-10-06  31  	select DTC
1b7c501b51a8c8 Rob Herring          2015-10-06  32  	help
1b7c501b51a8c8 Rob Herring          2015-10-06  33  	  This option builds all possible Device Tree Blobs (DTBs) for the
1b7c501b51a8c8 Rob Herring          2015-10-06  34  	  current architecture.
1b7c501b51a8c8 Rob Herring          2015-10-06  35  
1b7c501b51a8c8 Rob Herring          2015-10-06  36  	  If unsure, say N here, but this option is safe to enable.
1b7c501b51a8c8 Rob Herring          2015-10-06  37  
e169cfbef46d62 Grant Likely         2009-11-23  38  config OF_FLATTREE
e169cfbef46d62 Grant Likely         2009-11-23  39  	bool
5ab5fc7e35705c Grant Likely         2010-07-05  40  	select DTC
e6a6928c3ea1d0 Rob Herring          2014-04-02  41  	select LIBFDT
08d53aa58cb162 Ard Biesheuvel       2014-11-14  42  	select CRC32
e169cfbef46d62 Grant Likely         2009-11-23  43  
e6ce1324e4f08b Stephen Neuendorffer 2010-11-18  44  config OF_EARLY_FLATTREE
e6ce1324e4f08b Stephen Neuendorffer 2010-11-18  45  	bool
ff4c25f26a71b7 Christoph Hellwig    2019-02-03  46  	select DMA_DECLARE_COHERENT if HAS_DMA
e6ce1324e4f08b Stephen Neuendorffer 2010-11-18  47  	select OF_FLATTREE
e6ce1324e4f08b Stephen Neuendorffer 2010-11-18  48  
3cfc535c5df812 Andres Salomon       2010-10-10  49  config OF_PROMTREE
3cfc535c5df812 Andres Salomon       2010-10-10  50  	bool
3cfc535c5df812 Andres Salomon       2010-10-10  51  
b56b5528f5b3c3 Rob Herring          2017-10-04  52  config OF_KOBJ
b56b5528f5b3c3 Rob Herring          2017-10-04  53  	def_bool SYSFS
b56b5528f5b3c3 Rob Herring          2017-10-04  54  
0f22dd395fc473 Grant Likely         2012-02-15  55  # Hardly any platforms need this.  It is safe to select, but only do so if you
0f22dd395fc473 Grant Likely         2012-02-15  56  # need it.
fcdeb7fedf89f4 Grant Likely         2010-01-29  57  config OF_DYNAMIC
121c92cad33db2 Geert Uytterhoeven   2015-01-23  58  	bool "Support for dynamic device trees" if OF_UNITTEST
b56b5528f5b3c3 Rob Herring          2017-10-04  59  	select OF_KOBJ
121c92cad33db2 Geert Uytterhoeven   2015-01-23  60  	help
121c92cad33db2 Geert Uytterhoeven   2015-01-23  61  	  On some platforms, the device tree can be manipulated at runtime.
121c92cad33db2 Geert Uytterhoeven   2015-01-23  62  	  While this option is selected automatically on such platforms, you
121c92cad33db2 Geert Uytterhoeven   2015-01-23  63  	  can enable it manually to improve device tree unit test coverage.
fcdeb7fedf89f4 Grant Likely         2010-01-29  64  
6b884a8d50a6ee Grant Likely         2010-06-08  65  config OF_ADDRESS
6b884a8d50a6ee Grant Likely         2010-06-08  66  	def_bool y
6019a3d07d7258 Rob Herring          2017-07-25  67  	depends on !SPARC && (HAS_IOMEM || UML)
6b884a8d50a6ee Grant Likely         2010-06-08  68  
e3873444990dd6 Grant Likely         2010-06-18 @69  config OF_IRQ
e3873444990dd6 Grant Likely         2010-06-18  70  	def_bool y
63c60e3a6dc3ec Geert Uytterhoeven   2015-04-05  71  	depends on !SPARC && IRQ_DOMAIN
e3873444990dd6 Grant Likely         2010-06-18  72  

:::::: The code at line 69 was first introduced by commit
:::::: e3873444990dd6f8a095d1f72b5ad45192f8c506 of/irq: Move irq_of_parse_and_map() to common code

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
