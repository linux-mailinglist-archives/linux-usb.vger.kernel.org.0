Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B2237563E
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 17:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbhEFPJd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 11:09:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:5793 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234901AbhEFPJc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 11:09:32 -0400
IronPort-SDR: AZdFtQ2xAxis7i5njyY6x2vRV6FgSnfe1ZSptY8fsmP2e/Mwb9lLgu/LqlOW8dSmxGnYGKj3Rh
 jFhxRY7zm9sA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="283939060"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; 
   d="gz'50?scan'50,208,50";a="283939060"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 08:08:32 -0700
IronPort-SDR: PTFrRS23cuP9zjI707tpMszFE+nSGq/Nkp05vvaW/k+kOMSpFHus0rmbPcYeEV0rrAMQ43M+og
 e7oOvE9QO3vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; 
   d="gz'50?scan'50,208,50";a="389641205"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 May 2021 08:08:30 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lefc5-000AjB-Cx; Thu, 06 May 2021 15:08:29 +0000
Date:   Thu, 6 May 2021 23:08:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 7/9] include/linux/regmap.h:1210:37: warning:
 initialized field overwritten
Message-ID: <202105062308.oMWocSH3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   83a9d2a05296bf5a5fee13206dc4499a40978908
commit: 54dacbcc6b8921a211bd736d2f208d3c78594241 [7/9] usb: isp1760: move to regmap for register access
config: h8300-randconfig-r036-20210506 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=54dacbcc6b8921a211bd736d2f208d3c78594241
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 54dacbcc6b8921a211bd736d2f208d3c78594241
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=h8300 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/isp1760/isp1760-core.h:17,
                    from drivers/usb/isp1760/isp1760-if.c:22:
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:286:21: note: in expansion of macro 'REG_FIELD'
     286 |  [HW_OTG_DISABLE] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
         |                     ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[37]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:286:21: note: in expansion of macro 'REG_FIELD'
     286 |  [HW_OTG_DISABLE] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
         |                     ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:287:22: note: in expansion of macro 'REG_FIELD'
     287 |  [HW_SW_SEL_HC_DC] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
         |                      ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[38]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:287:22: note: in expansion of macro 'REG_FIELD'
     287 |  [HW_SW_SEL_HC_DC] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
         |                      ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:288:19: note: in expansion of macro 'REG_FIELD'
     288 |  [HW_VBUS_DRV]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
         |                   ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[39]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:288:19: note: in expansion of macro 'REG_FIELD'
     288 |  [HW_VBUS_DRV]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
         |                   ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:289:21: note: in expansion of macro 'REG_FIELD'
     289 |  [HW_SEL_CP_EXT]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
         |                     ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[40]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:289:21: note: in expansion of macro 'REG_FIELD'
     289 |  [HW_SEL_CP_EXT]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
         |                     ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:290:21: note: in expansion of macro 'REG_FIELD'
     290 |  [HW_DM_PULLDOWN] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
         |                     ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[41]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:290:21: note: in expansion of macro 'REG_FIELD'
     290 |  [HW_DM_PULLDOWN] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
         |                     ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:291:21: note: in expansion of macro 'REG_FIELD'
     291 |  [HW_DP_PULLDOWN] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
         |                     ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[42]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:291:21: note: in expansion of macro 'REG_FIELD'
     291 |  [HW_DP_PULLDOWN] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
         |                     ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:292:20: note: in expansion of macro 'REG_FIELD'
     292 |  [HW_DP_PULLUP]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
         |                    ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[43]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:292:20: note: in expansion of macro 'REG_FIELD'
     292 |  [HW_DP_PULLUP]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
         |                    ^~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-hcd.h:8,
                    from drivers/usb/isp1760/isp1760-core.h:19,
                    from drivers/usb/isp1760/isp1760-if.c:22:
   drivers/usb/isp1760/isp1760-regs.h:241:31: warning: 'isp1761_dc_reg_fields' defined but not used [-Wunused-const-variable=]
     241 | static const struct reg_field isp1761_dc_reg_fields[] = {
         |                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:202:41: warning: 'isp176x_dc_volatile_table' defined but not used [-Wunused-const-variable=]
     202 | static const struct regmap_access_table isp176x_dc_volatile_table = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:107:31: warning: 'isp1760_hc_reg_fields' defined but not used [-Wunused-const-variable=]
     107 | static const struct reg_field isp1760_hc_reg_fields[] = {
         |                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:70:41: warning: 'isp176x_hc_volatile_table' defined but not used [-Wunused-const-variable=]
      70 | static const struct regmap_access_table isp176x_hc_volatile_table = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/usb/isp1760/isp1760-core.h:17,
                    from drivers/usb/isp1760/isp1760-core.c:21:
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:286:21: note: in expansion of macro 'REG_FIELD'
     286 |  [HW_OTG_DISABLE] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
         |                     ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[37]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:286:21: note: in expansion of macro 'REG_FIELD'
     286 |  [HW_OTG_DISABLE] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
         |                     ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:287:22: note: in expansion of macro 'REG_FIELD'
     287 |  [HW_SW_SEL_HC_DC] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
         |                      ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[38]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:287:22: note: in expansion of macro 'REG_FIELD'
     287 |  [HW_SW_SEL_HC_DC] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
         |                      ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:288:19: note: in expansion of macro 'REG_FIELD'
     288 |  [HW_VBUS_DRV]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
         |                   ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[39]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:288:19: note: in expansion of macro 'REG_FIELD'
     288 |  [HW_VBUS_DRV]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
         |                   ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:289:21: note: in expansion of macro 'REG_FIELD'
     289 |  [HW_SEL_CP_EXT]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
         |                     ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[40]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:289:21: note: in expansion of macro 'REG_FIELD'
     289 |  [HW_SEL_CP_EXT]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
         |                     ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:290:21: note: in expansion of macro 'REG_FIELD'
     290 |  [HW_DM_PULLDOWN] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
         |                     ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[41]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:290:21: note: in expansion of macro 'REG_FIELD'
     290 |  [HW_DM_PULLDOWN] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
         |                     ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:291:21: note: in expansion of macro 'REG_FIELD'
     291 |  [HW_DP_PULLDOWN] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
         |                     ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[42]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:291:21: note: in expansion of macro 'REG_FIELD'
     291 |  [HW_DP_PULLDOWN] = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
         |                     ^~~~~~~~~
>> include/linux/regmap.h:1210:37: warning: initialized field overwritten [-Woverride-init]
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:292:20: note: in expansion of macro 'REG_FIELD'
     292 |  [HW_DP_PULLUP]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
         |                    ^~~~~~~~~
   include/linux/regmap.h:1210:37: note: (near initialization for 'isp1761_dc_reg_fields[43]')
    1210 | #define REG_FIELD(_reg, _lsb, _msb) {  \
         |                                     ^
   drivers/usb/isp1760/isp1760-regs.h:292:20: note: in expansion of macro 'REG_FIELD'
     292 |  [HW_DP_PULLUP]  = REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
         |                    ^~~~~~~~~


vim +1210 include/linux/regmap.h

67252287871113d Srinivas Kandagatla 2013-06-11  1209  
67252287871113d Srinivas Kandagatla 2013-06-11 @1210  #define REG_FIELD(_reg, _lsb, _msb) {		\
67252287871113d Srinivas Kandagatla 2013-06-11  1211  				.reg = _reg,	\
67252287871113d Srinivas Kandagatla 2013-06-11  1212  				.lsb = _lsb,	\
67252287871113d Srinivas Kandagatla 2013-06-11  1213  				.msb = _msb,	\
67252287871113d Srinivas Kandagatla 2013-06-11  1214  				}
67252287871113d Srinivas Kandagatla 2013-06-11  1215  

:::::: The code at line 1210 was first introduced by commit
:::::: 67252287871113deba96adf7e4df1752f3f08688 regmap: Add regmap_field APIs

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@st.com>
:::::: CC: Mark Brown <broonie@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--u3/rZRmxL6MmkK24
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
VNtnIgfLqXBzkt07BppG7fd/Dkt4tnxpAQA=

--u3/rZRmxL6MmkK24--
