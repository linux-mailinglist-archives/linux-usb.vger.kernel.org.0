Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A91214AF1
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jul 2020 09:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgGEHcs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 03:32:48 -0400
Received: from mga04.intel.com ([192.55.52.120]:46935 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgGEHcs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Jul 2020 03:32:48 -0400
IronPort-SDR: yRM/Fb/7ShAFadLuRD7AsgWmecx/sdjDe0psQdH6VkhV6kY9vW9xn2HiFVNhXaeM2dgJge6bQh
 6oawq7xkZBBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9672"; a="144804037"
X-IronPort-AV: E=Sophos;i="5.75,314,1589266800"; 
   d="gz'50?scan'50,208,50";a="144804037"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2020 00:08:37 -0700
IronPort-SDR: qoyj8oqKYOYyFxYjJtW0saeYTEuxR2MuPPX3xbRicMOt3dEMbla7KLQC4zjcQRYweJXpAxhhmO
 SJJ/VtirPCog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,314,1589266800"; 
   d="gz'50?scan'50,208,50";a="282727522"
Received: from lkp-server01.sh.intel.com (HELO 6dc8ab148a5d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Jul 2020 00:08:33 -0700
Received: from kbuild by 6dc8ab148a5d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jrylM-0001fl-Eu; Sun, 05 Jul 2020 07:08:32 +0000
Date:   Sun, 5 Jul 2020 15:07:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Peter Chen <peter.chen@nxp.com>, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, pawell@cadence.com, rogerq@ti.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v4 3/9] usb: cdns3: imx: add glue layer runtime pm
 implementation
Message-ID: <202007051547.gY4yuM5g%lkp@intel.com>
References: <20200703062653.29159-4-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20200703062653.29159-4-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on balbi-usb/testing/next shawnguo/for-next v5.8-rc3 next-20200703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Peter-Chen/usb-some-PM-changes-for-cdns3-and-xhci-plat/20200703-143054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: ia64-randconfig-s031-20200705 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-3-gfa153962-dirty
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=ia64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/cdns3/cdns3-imx.c:256:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *otg_regs @@     got struct cdns3_otg_common_regs *otg_regs @@
>> drivers/usb/cdns3/cdns3-imx.c:256:38: sparse:     expected void [noderef] __iomem *otg_regs
>> drivers/usb/cdns3/cdns3-imx.c:256:38: sparse:     got struct cdns3_otg_common_regs *otg_regs
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [usertype] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le32

vim +256 drivers/usb/cdns3/cdns3-imx.c

   249	
   250	static int cdns_imx_platform_suspend(struct device *dev,
   251			bool suspend, bool wakeup)
   252	{
   253		struct cdns3 *cdns = dev_get_drvdata(dev);
   254		struct device *parent = dev->parent;
   255		struct cdns_imx *data = dev_get_drvdata(parent);
 > 256		void __iomem *otg_regs = cdns->otg_regs;
   257		void __iomem *xhci_regs = cdns->xhci_regs;
   258		u32 value;
   259		int ret = 0;
   260	
   261		if (cdns->role != USB_ROLE_HOST)
   262			return 0;
   263	
   264		if (suspend) {
   265			/* SW request low power when all usb ports allow to it ??? */
   266			value = readl(xhci_regs + XECP_PM_PMCSR);
   267			value &= ~PS_MASK;
   268			value |= PS_D1;
   269			writel(value, xhci_regs + XECP_PM_PMCSR);
   270	
   271			/* mdctrl_clk_sel */
   272			value = cdns_imx_readl(data, USB3_CORE_CTRL1);
   273			value |= MDCTRL_CLK_SEL;
   274			cdns_imx_writel(data, USB3_CORE_CTRL1, value);
   275	
   276			/* wait for mdctrl_clk_status */
   277			value = cdns_imx_readl(data, USB3_CORE_STATUS);
   278			ret = readl_poll_timeout(data->noncore + USB3_CORE_STATUS, value,
   279				(value & MDCTRL_CLK_STATUS) == MDCTRL_CLK_STATUS,
   280				10, 100000);
   281			if (ret)
   282				dev_warn(parent, "wait mdctrl_clk_status timeout\n");
   283	
   284			/* wait lpm_clk_req to be 0 */
   285			value = cdns_imx_readl(data, USB3_INT_REG);
   286			ret = readl_poll_timeout(data->noncore + USB3_INT_REG, value,
   287				(value & LPM_CLK_REQ) != LPM_CLK_REQ,
   288				10, 100000);
   289			if (ret)
   290				dev_warn(parent, "wait lpm_clk_req timeout\n");
   291	
   292			/* wait phy_refclk_req to be 0 */
   293			value = cdns_imx_readl(data, USB3_SSPHY_STATUS);
   294			ret = readl_poll_timeout(data->noncore + USB3_SSPHY_STATUS, value,
   295				(value & PHY_REFCLK_REQ) != PHY_REFCLK_REQ,
   296				10, 100000);
   297			if (ret)
   298				dev_warn(parent, "wait phy_refclk_req timeout\n");
   299	
   300			cdns3_set_wakeup(data, wakeup);
   301		} else {
   302			cdns3_set_wakeup(data, false);
   303	
   304			/* SW request D0 */
   305			value = readl(xhci_regs + XECP_PM_PMCSR);
   306			value &= ~PS_MASK;
   307			value |= PS_D0;
   308			writel(value, xhci_regs + XECP_PM_PMCSR);
   309	
   310			/* clr CFG_RXDET_P3_EN */
   311			value = readl(xhci_regs + XECP_AUX_CTRL_REG1);
   312			value &= ~CFG_RXDET_P3_EN;
   313			writel(value, xhci_regs + XECP_AUX_CTRL_REG1);
   314	
   315			/* clear mdctrl_clk_sel */
   316			value = cdns_imx_readl(data, USB3_CORE_CTRL1);
   317			value &= ~MDCTRL_CLK_SEL;
   318			cdns_imx_writel(data, USB3_CORE_CTRL1, value);
   319	
   320			/* wait CLK_125_REQ to be 1 */
   321			value = cdns_imx_readl(data, USB3_INT_REG);
   322			ret = readl_poll_timeout(data->noncore + USB3_INT_REG, value,
   323				(value & CLK_125_REQ) == CLK_125_REQ,
   324				10, 100000);
   325			if (ret)
   326				dev_warn(parent, "wait CLK_125_REQ timeout\n");
   327	
   328			/* wait for mdctrl_clk_status is cleared */
   329			value = cdns_imx_readl(data, USB3_CORE_STATUS);
   330			ret = readl_poll_timeout(data->noncore + USB3_CORE_STATUS, value,
   331				(value & MDCTRL_CLK_STATUS) != MDCTRL_CLK_STATUS,
   332				10, 100000);
   333			if (ret)
   334				dev_warn(parent, "wait mdctrl_clk_status cleared timeout\n");
   335	
   336			/* Wait until OTG_NRDY is 0 */
   337			value = readl(otg_regs + OTGSTS);
   338			ret = readl_poll_timeout(otg_regs + OTGSTS, value,
   339				(value & OTG_NRDY) != OTG_NRDY,
   340				10, 100000);
   341			if (ret)
   342				dev_warn(parent, "wait OTG ready timeout\n");
   343		}
   344	
   345		return ret;
   346	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--x+6KMIRAuhnl3hBn
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--x+6KMIRAuhnl3hBn--
