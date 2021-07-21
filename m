Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEA53D063A
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 02:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhGUAGX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 20:06:23 -0400
Received: from mga11.intel.com ([192.55.52.93]:22690 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229629AbhGUAGV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Jul 2021 20:06:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="208233041"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="gz'50?scan'50,208,50";a="208233041"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 17:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="gz'50?scan'50,208,50";a="511186540"
Received: from lkp-server02.sh.intel.com (HELO 1b5a72ed9419) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2021 17:46:54 -0700
Received: from kbuild by 1b5a72ed9419 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m60Ny-0000TT-3r; Wed, 21 Jul 2021 00:46:54 +0000
Date:   Wed, 21 Jul 2021 08:46:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     kbuild-all@lists.01.org, Michal Simek <monstr@monstr.eu>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v14 4/6] usb: Specify dependencies on USB_XHCI_PLATFORM
 with 'depends on'
Message-ID: <202107210812.LLUZpfu9-lkp@intel.com>
References: <20210719152055.v14.4.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20210719152055.v14.4.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthias,

I love your patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on robh/for-next driver-core/driver-core-testing linus/master v5.14-rc2 next-20210720]
[cannot apply to char-misc/char-misc-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthias-Kaehlcke/usb-misc-Add-onboard_usb_hub-driver/20210720-144614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: i386-randconfig-a003-20210720 (attached as .config)
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/1ac4caccda0f2e6904b0e1462bc9735c690d719f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthias-Kaehlcke/usb-misc-Add-onboard_usb_hub-driver/20210720-144614
        git checkout 1ac4caccda0f2e6904b0e1462bc9735c690d719f
        # save the attached .config to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/usb/dwc3/core.o: in function `dwc3_resume_common':
>> drivers/usb/dwc3/core.c:1853: undefined reference to `dwc3_gadget_resume'
   ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_resume':
>> drivers/usb/dwc3/core.c:1912: undefined reference to `dwc3_gadget_process_pending_events'
   ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend_common':
>> drivers/usb/dwc3/core.c:1750: undefined reference to `dwc3_gadget_suspend'


vim +1853 drivers/usb/dwc3/core.c

fe8abf332b8f66 Masahiro Yamada        2018-05-16  1739  
c4a5153e87fdf6 Manu Gautam            2018-01-18  1740  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
7415f17c9560c9 Felipe Balbi           2012-04-30  1741  {
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1742  	unsigned long	flags;
bcb128777af5e9 Manu Gautam            2018-05-09  1743  	u32 reg;
7415f17c9560c9 Felipe Balbi           2012-04-30  1744  
689bf72c6e0dc9 Manu Gautam            2017-09-27  1745  	switch (dwc->current_dr_role) {
689bf72c6e0dc9 Manu Gautam            2017-09-27  1746  	case DWC3_GCTL_PRTCAP_DEVICE:
0227cc84c44417 Li Jun                 2020-02-20  1747  		if (pm_runtime_suspended(dwc->dev))
0227cc84c44417 Li Jun                 2020-02-20  1748  			break;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1749  		spin_lock_irqsave(&dwc->lock, flags);
7415f17c9560c9 Felipe Balbi           2012-04-30 @1750  		dwc3_gadget_suspend(dwc);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1751  		spin_unlock_irqrestore(&dwc->lock, flags);
41a91c606e7d2b Marek Szyprowski       2019-03-27  1752  		synchronize_irq(dwc->irq_gadget);
689bf72c6e0dc9 Manu Gautam            2017-09-27  1753  		dwc3_core_exit(dwc);
51f5d49ad6f011 Felipe Balbi           2016-05-16  1754  		break;
689bf72c6e0dc9 Manu Gautam            2017-09-27  1755  	case DWC3_GCTL_PRTCAP_HOST:
bcb128777af5e9 Manu Gautam            2018-05-09  1756  		if (!PMSG_IS_AUTO(msg)) {
c4a5153e87fdf6 Manu Gautam            2018-01-18  1757  			dwc3_core_exit(dwc);
c4a5153e87fdf6 Manu Gautam            2018-01-18  1758  			break;
bcb128777af5e9 Manu Gautam            2018-05-09  1759  		}
bcb128777af5e9 Manu Gautam            2018-05-09  1760  
bcb128777af5e9 Manu Gautam            2018-05-09  1761  		/* Let controller to suspend HSPHY before PHY driver suspends */
bcb128777af5e9 Manu Gautam            2018-05-09  1762  		if (dwc->dis_u2_susphy_quirk ||
bcb128777af5e9 Manu Gautam            2018-05-09  1763  		    dwc->dis_enblslpm_quirk) {
bcb128777af5e9 Manu Gautam            2018-05-09  1764  			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
bcb128777af5e9 Manu Gautam            2018-05-09  1765  			reg |=  DWC3_GUSB2PHYCFG_ENBLSLPM |
bcb128777af5e9 Manu Gautam            2018-05-09  1766  				DWC3_GUSB2PHYCFG_SUSPHY;
bcb128777af5e9 Manu Gautam            2018-05-09  1767  			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
bcb128777af5e9 Manu Gautam            2018-05-09  1768  
bcb128777af5e9 Manu Gautam            2018-05-09  1769  			/* Give some time for USB2 PHY to suspend */
bcb128777af5e9 Manu Gautam            2018-05-09  1770  			usleep_range(5000, 6000);
bcb128777af5e9 Manu Gautam            2018-05-09  1771  		}
bcb128777af5e9 Manu Gautam            2018-05-09  1772  
bcb128777af5e9 Manu Gautam            2018-05-09  1773  		phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
bcb128777af5e9 Manu Gautam            2018-05-09  1774  		phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
bcb128777af5e9 Manu Gautam            2018-05-09  1775  		break;
f09cc79b4b338e Roger Quadros          2018-02-27  1776  	case DWC3_GCTL_PRTCAP_OTG:
f09cc79b4b338e Roger Quadros          2018-02-27  1777  		/* do nothing during runtime_suspend */
f09cc79b4b338e Roger Quadros          2018-02-27  1778  		if (PMSG_IS_AUTO(msg))
f09cc79b4b338e Roger Quadros          2018-02-27  1779  			break;
f09cc79b4b338e Roger Quadros          2018-02-27  1780  
f09cc79b4b338e Roger Quadros          2018-02-27  1781  		if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
f09cc79b4b338e Roger Quadros          2018-02-27  1782  			spin_lock_irqsave(&dwc->lock, flags);
f09cc79b4b338e Roger Quadros          2018-02-27  1783  			dwc3_gadget_suspend(dwc);
f09cc79b4b338e Roger Quadros          2018-02-27  1784  			spin_unlock_irqrestore(&dwc->lock, flags);
41a91c606e7d2b Marek Szyprowski       2019-03-27  1785  			synchronize_irq(dwc->irq_gadget);
f09cc79b4b338e Roger Quadros          2018-02-27  1786  		}
f09cc79b4b338e Roger Quadros          2018-02-27  1787  
f09cc79b4b338e Roger Quadros          2018-02-27  1788  		dwc3_otg_exit(dwc);
f09cc79b4b338e Roger Quadros          2018-02-27  1789  		dwc3_core_exit(dwc);
f09cc79b4b338e Roger Quadros          2018-02-27  1790  		break;
7415f17c9560c9 Felipe Balbi           2012-04-30  1791  	default:
51f5d49ad6f011 Felipe Balbi           2016-05-16  1792  		/* do nothing */
7415f17c9560c9 Felipe Balbi           2012-04-30  1793  		break;
7415f17c9560c9 Felipe Balbi           2012-04-30  1794  	}
7415f17c9560c9 Felipe Balbi           2012-04-30  1795  
7415f17c9560c9 Felipe Balbi           2012-04-30  1796  	return 0;
7415f17c9560c9 Felipe Balbi           2012-04-30  1797  }
7415f17c9560c9 Felipe Balbi           2012-04-30  1798  
c4a5153e87fdf6 Manu Gautam            2018-01-18  1799  static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
7415f17c9560c9 Felipe Balbi           2012-04-30  1800  {
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1801  	unsigned long	flags;
57303488cd37da Kishon Vijay Abraham I 2014-03-03  1802  	int		ret;
bcb128777af5e9 Manu Gautam            2018-05-09  1803  	u32		reg;
7415f17c9560c9 Felipe Balbi           2012-04-30  1804  
689bf72c6e0dc9 Manu Gautam            2017-09-27  1805  	switch (dwc->current_dr_role) {
689bf72c6e0dc9 Manu Gautam            2017-09-27  1806  	case DWC3_GCTL_PRTCAP_DEVICE:
fe8abf332b8f66 Masahiro Yamada        2018-05-16  1807  		ret = dwc3_core_init_for_resume(dwc);
51f5d49ad6f011 Felipe Balbi           2016-05-16  1808  		if (ret)
5c4ad318de3b8e Felipe Balbi           2016-04-11  1809  			return ret;
5c4ad318de3b8e Felipe Balbi           2016-04-11  1810  
7d11c3ac666940 Roger Quadros          2018-03-16  1811  		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1812  		spin_lock_irqsave(&dwc->lock, flags);
7415f17c9560c9 Felipe Balbi           2012-04-30  1813  		dwc3_gadget_resume(dwc);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1814  		spin_unlock_irqrestore(&dwc->lock, flags);
689bf72c6e0dc9 Manu Gautam            2017-09-27  1815  		break;
689bf72c6e0dc9 Manu Gautam            2017-09-27  1816  	case DWC3_GCTL_PRTCAP_HOST:
c4a5153e87fdf6 Manu Gautam            2018-01-18  1817  		if (!PMSG_IS_AUTO(msg)) {
fe8abf332b8f66 Masahiro Yamada        2018-05-16  1818  			ret = dwc3_core_init_for_resume(dwc);
c4a5153e87fdf6 Manu Gautam            2018-01-18  1819  			if (ret)
c4a5153e87fdf6 Manu Gautam            2018-01-18  1820  				return ret;
7d11c3ac666940 Roger Quadros          2018-03-16  1821  			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
bcb128777af5e9 Manu Gautam            2018-05-09  1822  			break;
c4a5153e87fdf6 Manu Gautam            2018-01-18  1823  		}
bcb128777af5e9 Manu Gautam            2018-05-09  1824  		/* Restore GUSB2PHYCFG bits that were modified in suspend */
bcb128777af5e9 Manu Gautam            2018-05-09  1825  		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
bcb128777af5e9 Manu Gautam            2018-05-09  1826  		if (dwc->dis_u2_susphy_quirk)
bcb128777af5e9 Manu Gautam            2018-05-09  1827  			reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
bcb128777af5e9 Manu Gautam            2018-05-09  1828  
bcb128777af5e9 Manu Gautam            2018-05-09  1829  		if (dwc->dis_enblslpm_quirk)
bcb128777af5e9 Manu Gautam            2018-05-09  1830  			reg &= ~DWC3_GUSB2PHYCFG_ENBLSLPM;
bcb128777af5e9 Manu Gautam            2018-05-09  1831  
bcb128777af5e9 Manu Gautam            2018-05-09  1832  		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
bcb128777af5e9 Manu Gautam            2018-05-09  1833  
bcb128777af5e9 Manu Gautam            2018-05-09  1834  		phy_pm_runtime_get_sync(dwc->usb2_generic_phy);
bcb128777af5e9 Manu Gautam            2018-05-09  1835  		phy_pm_runtime_get_sync(dwc->usb3_generic_phy);
f09cc79b4b338e Roger Quadros          2018-02-27  1836  		break;
f09cc79b4b338e Roger Quadros          2018-02-27  1837  	case DWC3_GCTL_PRTCAP_OTG:
f09cc79b4b338e Roger Quadros          2018-02-27  1838  		/* nothing to do on runtime_resume */
f09cc79b4b338e Roger Quadros          2018-02-27  1839  		if (PMSG_IS_AUTO(msg))
f09cc79b4b338e Roger Quadros          2018-02-27  1840  			break;
f09cc79b4b338e Roger Quadros          2018-02-27  1841  
0e5a3c8284a30f Gary Bisson            2021-01-25  1842  		ret = dwc3_core_init_for_resume(dwc);
f09cc79b4b338e Roger Quadros          2018-02-27  1843  		if (ret)
f09cc79b4b338e Roger Quadros          2018-02-27  1844  			return ret;
f09cc79b4b338e Roger Quadros          2018-02-27  1845  
f09cc79b4b338e Roger Quadros          2018-02-27  1846  		dwc3_set_prtcap(dwc, dwc->current_dr_role);
f09cc79b4b338e Roger Quadros          2018-02-27  1847  
f09cc79b4b338e Roger Quadros          2018-02-27  1848  		dwc3_otg_init(dwc);
f09cc79b4b338e Roger Quadros          2018-02-27  1849  		if (dwc->current_otg_role == DWC3_OTG_ROLE_HOST) {
f09cc79b4b338e Roger Quadros          2018-02-27  1850  			dwc3_otg_host_init(dwc);
f09cc79b4b338e Roger Quadros          2018-02-27  1851  		} else if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
f09cc79b4b338e Roger Quadros          2018-02-27  1852  			spin_lock_irqsave(&dwc->lock, flags);
f09cc79b4b338e Roger Quadros          2018-02-27 @1853  			dwc3_gadget_resume(dwc);
f09cc79b4b338e Roger Quadros          2018-02-27  1854  			spin_unlock_irqrestore(&dwc->lock, flags);
c4a5153e87fdf6 Manu Gautam            2018-01-18  1855  		}
f09cc79b4b338e Roger Quadros          2018-02-27  1856  
c4a5153e87fdf6 Manu Gautam            2018-01-18  1857  		break;
7415f17c9560c9 Felipe Balbi           2012-04-30  1858  	default:
7415f17c9560c9 Felipe Balbi           2012-04-30  1859  		/* do nothing */
7415f17c9560c9 Felipe Balbi           2012-04-30  1860  		break;
7415f17c9560c9 Felipe Balbi           2012-04-30  1861  	}
7415f17c9560c9 Felipe Balbi           2012-04-30  1862  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1863  	return 0;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1864  }
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1865  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1866  static int dwc3_runtime_checks(struct dwc3 *dwc)
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1867  {
689bf72c6e0dc9 Manu Gautam            2017-09-27  1868  	switch (dwc->current_dr_role) {
c4a5153e87fdf6 Manu Gautam            2018-01-18  1869  	case DWC3_GCTL_PRTCAP_DEVICE:
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1870  		if (dwc->connected)
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1871  			return -EBUSY;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1872  		break;
c4a5153e87fdf6 Manu Gautam            2018-01-18  1873  	case DWC3_GCTL_PRTCAP_HOST:
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1874  	default:
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1875  		/* do nothing */
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1876  		break;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1877  	}
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1878  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1879  	return 0;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1880  }
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1881  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1882  static int dwc3_runtime_suspend(struct device *dev)
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1883  {
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1884  	struct dwc3     *dwc = dev_get_drvdata(dev);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1885  	int		ret;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1886  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1887  	if (dwc3_runtime_checks(dwc))
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1888  		return -EBUSY;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1889  
c4a5153e87fdf6 Manu Gautam            2018-01-18  1890  	ret = dwc3_suspend_common(dwc, PMSG_AUTO_SUSPEND);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1891  	if (ret)
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1892  		return ret;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1893  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1894  	device_init_wakeup(dev, true);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1895  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1896  	return 0;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1897  }
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1898  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1899  static int dwc3_runtime_resume(struct device *dev)
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1900  {
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1901  	struct dwc3     *dwc = dev_get_drvdata(dev);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1902  	int		ret;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1903  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1904  	device_init_wakeup(dev, false);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1905  
c4a5153e87fdf6 Manu Gautam            2018-01-18  1906  	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1907  	if (ret)
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1908  		return ret;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1909  
689bf72c6e0dc9 Manu Gautam            2017-09-27  1910  	switch (dwc->current_dr_role) {
689bf72c6e0dc9 Manu Gautam            2017-09-27  1911  	case DWC3_GCTL_PRTCAP_DEVICE:
fc8bb91bc83ef8 Felipe Balbi           2016-05-16 @1912  		dwc3_gadget_process_pending_events(dwc);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1913  		break;
689bf72c6e0dc9 Manu Gautam            2017-09-27  1914  	case DWC3_GCTL_PRTCAP_HOST:
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1915  	default:
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1916  		/* do nothing */
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1917  		break;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1918  	}
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1919  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1920  	pm_runtime_mark_last_busy(dev);
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1921  
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1922  	return 0;
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1923  }
fc8bb91bc83ef8 Felipe Balbi           2016-05-16  1924  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--gBBFr7Ir9EOA20Yy
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICM9N92AAAy5jb25maWcAjDzLcty2svt8xZSzSRZx9LB9XHVLCwwJcpAhCBoARyNtWLI8
dlTHlnL1OCfe3G+/3QAfANgcJwtHg24ADaDfaPDnn35esZfnh283z3e3N1+/fl99OdwfHm+e
D59Wn+++Hv5nlatVreyK58K+BuTq7v7l79/vzt+/W719ffrm9clvj7enq+3h8f7wdZU93H++
+/IC3e8e7n/6+adM1YUouyzrdlwboerO8r29ePXl9va305PVL+3Hl/vnl9XpyetzGOj0xf08
/b+zk9cnb37tm18FowjTlVl28X1oKqeRL05PTs5PTkbkitXlCBubmXFj1O00BjQNaGfnb0/O
hvYqR9R1kU+o0ESjBoCTgNyM1V0l6u00QtDYGcusyCLYBohhRnalsooEiBq68hmoVl2jVSEq
3hV1x6zVE4rQH7pLpQMi1q2ocisk7yxbQxejtJ2gdqM5g7XXhYJ/AMVgVzjMn1elY42vq6fD
88tf0/GKWtiO17uOadgLIYW9OD8D9IFGJRukzHJjV3dPq/uHZxxh3DyVsWrYvVevqOaOteF+
OPo7wyob4G/YjndbrmtedeW1aCb0ELIGyBkNqq4loyH766UeagnwhgZcG4vsNG5NQG+4Mync
UX0MAWk/Bt9fH++tjoPfEMcWr6hvzHnB2so6jgjOZmjeKGNrJvnFq1/uH+4Pv44I5pI14b6Y
K7MTTUZS1Sgj9p380PKWE3RdMpttOgcNR8y0MqaTXCp9hQLCsg3RuTW8EuuwH2tB7xGY7lSZ
hqkcBhAM7FoNggIyt3p6+fj0/en58G0SlJLXXIvMiSTI6zoQ5BBkNuqShvCi4JkVOHVRdNKL
ZoLX8DoXtZN7ehApSg2aB6SNBIv6D5wjBG+YzgFk4Jw6zQ1MEKuXXEkm6rjNCEkhdRvBNe7b
VQyVRnRCSdku0MyshlOHLQa1YJWmsZA2vXNr66TKeTxFoXTG816/wQ5NUNMwbfjyjuV83ZaF
cXxxuP+0evicnPBkdVS2NaqFiTwj5iqYxrFLiOLE5DvVeccqkTPLu4oZ22VXWUXwilPhu4n1
ErAbj+94bc1RYLfWiuUZTHQcTcLpsfyPlsSTynRtgyQnms+La9a0jlxtnEEZDJITFnv37fD4
RMkLmMdtp2oOAhHMCcZuc41WRToeHUUVGhsgRuUiIwTW9xJ5FakF10qqmY0oN8hQPdkxTs8E
M8pHC9UUyTZwaOr+cMftFg0/oxWP8yJef6QkXf04JD3xoIHK1JzLxsJqa07r1B5hp6q2tkxf
ERvY40zrGjplCvrMmiMFMqDmV6D+nc8zqfpsA0KZKR1R5nekaX+3N0//Xj3DPq9uYI1PzzfP
T6ub29sHcBTv7r8krIJcxjJHTyTfKMNOWCigOx5PBdsNanPabpOjqs44WA/obcntQ5ZGb87Q
m2sEeVr/YHmjaoCFCaOqQW277dFZuzKE0MBedwCb737UCD86vgeBCY7ORBhuoKQJF+q69oJP
gGZNbc6pdqtZxuc0wT5W1STdAaTmcESGl9m6EqEOQljBatU6t3PW2FWcFRen72KIsV72w7NG
yFopQx+yI0FlazyMZS6YltU5N1quybOPz27k063/I+Dc7XiGKgubNzA4qKUgNlHoGIPu2IjC
XpydhO3IPpLtA/jp2cQcorYQjLCCJ2Ocnkci0tamDxe8xKJlGFjR3P55+PTy9fC4+ny4eX55
PDxN/NhCKCabIY6IG9ctWBcwLV6FvJ32hxgwsqKXrLbdGi0skNLWksEE1borqtZsAotaatU2
wSY1rOR+Mh64EOAVZmXyc3BJo7Yt/C9SDtW2n4PQlx7gd2saqGBCdyQkK8ASszq/FLkN1qAt
jR5sq0eIvF3fpRG5WaZM5y7gSTsVIPbXXFP9GvCPQ2cCmRIn6SHpxoPftBMZJ+YA/EVlOtDO
dbFMuxQmI8Z1jhrRy6hsO+IwGy0bAxJwAEHDU9NteLZtFIgI+gLgeEar6a0GBKczJghDGTjY
nIMSBs+V58QkmlcscIeRq2DnnHeoQ08bfzMJo3knMQiwdD7EvJO6yo+EjQBcDBkBFoeLYR+V
TEHHhgCI40LQqugnxLotyzoFfoIU1xx9c3fiSktWJyyToBn4g0oj5J3SzYbVoBt0YDnQl7KB
d+x1mchP36U4YA4z7hwXr8RTRzYzzRaoBCOMZE7Q0YqOJLvhCRolBMECJEVHTFRyi5Ec5fVF
PDRz9AtYbeLPem977rJGyj4UYKf8aynC7EpwRouLXjMImIo2Iqe1fJ/8BO0QbFSjQnwjyppV
YX7N0R02uMgjbDAbr4IHWyAihhSqa2FFJcnXLN8JoLnfRWp3YOg101qEtmGLuFfSzFu66CzG
VrcxKNEYpkdMAefu0iAFpQOcVcNU3kQEkFpnzjMOpslkYJUgaI2cVaf+XCu5AzAyz3NSBXkO
BwK7NGB0jUB7t5Mu+g554/TkzeAB9Ang5vD4+eHx28397WHF/3O4B3eWgUXP0KGFUGnyCsi5
PP3EjKNf8A+nmda8k36WwerTLjqmKBk4FHpLSV/FopSQqdo1reortV7oD8eqwfXoE2HxaABF
m4tObadBopVcGmREw4QMOOBRLtFs2qIA98z5OGOihNYmlktnBzFrLQqRsTRcw1xyFCU5jegM
YZQGiTPCA/L+/bvuPEizwu/QjBmrW5dhgv3IVB6KG/jrDbjszg7Yi1eHr5/Pz37Dy4YwL7wF
a9qZtmmivDV4p9nWe98zWJRXcqIm0WXUNRhJ4VMbF++Pwdk+iCBihIF3fjBOhBYNN2aaDOvy
MAc9ACKN7EdlV4NR6oo8m3cBFSfWGhNIeexcjHoGYwJUU3sCBocPotI1JTBCsIs+UubWe2c+
2oYgJ8jMYIQ2gJy2gaE0JrA2bXgLEuE5fiXRPD1izXXtc3pg3YxYh6kwh2Jag0nPJbCLFdzG
sKrbtGBuq3XEm8CrnQn1aj+qYyJMa2GqNlBTBZhYznR1lWGeMbRHTelDpAp0TmUuxiCrv6Yx
rOaeT3FjeeYTmU5/No8Pt4enp4fH1fP3v3w2YB5KRUQi4QVnttXc+7AxSDYuqRlqiFJVeSEM
lfjW3IJxjq6WcBDPJOAc6SocCEFrUQI5pB5EMN9bOBI85t51WMQElYKXDI2hVTOiMDmN0wcV
JK5QpoCIWxALxGHGE+2vASAWq9rYo++5QWhBU+M9fiUF6CjwxTG9ifRTanZzBRwOLge4rGXL
w4QFHAzbidhlHNrmIcwcxTSidrnihXVudij/1Rr4DBR8FqXLt2AQE3J8WrppMTcKbFrZ2E1r
dhuS0CShRnmbA+qQKxgHkW/evzN7cpUIogFvjwCsoS+LECblwkzvlgYEbQJ+uhTiB+DjcJrl
BygVN8ntu2iXtv+ih9i+p9sz3RpFi4bkBdh5rmoaeinqbCOabGFDevB5vjB2xRbGLTnY93J/
egTaVQvHk11psV/c5J1g2XlHh7cOuLB36E8v9AJ/aVlN9ZZ1QeScEqhxNRkDFdFn0N6GKNXp
MgysdVlLdFPDsBQh6Ac3YC18JsK0MgZbkyUaWzb7bFO+e5NYA1EL2Uqn0AsmRXU1ESAYaDy0
JF0UKGO3ndzPbExwaeDS4hiS84pn1C0pTgda1+v4IPLvm90JR57iAAGNP2/cXJWhlzqOAvvG
Wj0HgDNYG8nBzaWmaGVGtl9vmNqHt5mbhnttp5M2DvE8uljaBoeQh7F07Vwcg249ODlrXsK4
ZzQQL1Xfp6AhXkgBU4M3SEbGMYVrlEvM6korOtaIhHcgfJ43aq7BKfepl7VWW177bA7eByc8
ls1MKTRhTrniJcuuFkVLuqtQ4JAFehEeMYQTmToTKDAy4zMy3B2v2YC7QxDUX3DPbpvCmPLb
w/3d88NjdMMURKy9z9LWcXA+x9CsqY7BM7w1WhjBOT3qsk8W9fHWApHxIv12g/C+p5JQ/qSb
Cv/hOspnWwW6ac2ITuL9NmUL5ALwhH1+fVKiIgO1AIpw6SyNvkhdTBEdU63w6hVcNMqn8pA3
QTy0k6apwB07L8NBplZMHpKcN6Cc0d7WBP7hCKe08wNCrYoC8+Inf2cn/r9kISl7Zg3zZWHG
ioxy75yvVoDWgc6gMhgRDDm3fxnsVPXgAWORRMCgokLWqQanFqsQWn5xEl+KN5b2MBz9aKQg
NFB4paN167KplKNjdZQDxd8YHQkrkquHaHgIoOnUHq5snjqJ+hoIxBeB4MwtA72oWrN324Vn
+o9RqbUTeH1525SoK2inZ3PdnZ6cLIHO3i6CzuNe0XAngVW7xirKkUm3fM/D+kTNzKbL2zAI
dSjdH1Fbs7kyAi0McLJG5j/teX+6OOAuO4XsSUnO0N95RdD/LBYdZZuqdfY6vmDAcEOG4GBl
PrNIw/rMzC430SFkMseAGIemKzHg6ERx1VW5pQs2BpV9JLKPkzqbBuUSE0Y+r4ASOgqxt1EP
/z08rkD933w5fDvcP7vRWNaI1cNfWHIb5ApmyRN/Yxzky3zWZNYwXABGDkUPMlvRuLQ0qZv9
XHwMPgP/ICAkHDekz9SswUIfDPAprpDATznGlFbYuFQUQRXnIQv2LXHGBFpR0gbcyZGV3SXb
8qWQupEJ8tItI4CyKrCTlx+8Ae9c7OW8lSkBPIg6RBXlTBHHCSg84AA2+zUYfCdQBtw7tW3T
bJYEzW37qkXs0oRZQ9fSp4U9xc4vMUEiddK1iOt2oCTTHn6sJtOenHSS+Jxcm+a7Tu241iLn
YQ4vnhLUTF+GtzQpS1e0Zhas2FXa2lobc6Fr3sHsamnogs07WEZHw36DgJeWBnMxmObAHMYk
tE0hVeoZJuC+jo0EJu2xvozJnAZkZamBi+gbA7/eDXiLLGVSV5jutwMTn21TapanpKUwgpmW
t7LJkG0UFV767VQQ/oGiXlq3UH1QEw9r1nSGz/flR842a41VEhS03agjaJrnLdab4l3NJdPo
DVRUXd0kk6zhgWTH7f0dbTwFAo7wYGNpT8XL095CaHZkle7vYqGkDdx8cIuBY2j/rpeo8PLA
+W8yjaNdJAfNaL+D84tVLiKAJwCxlrtEHawRNS9qZzUZzWgIV0SXky6H6yfAm2dX3bpi9Tbt
i/dpl+i2RfsxVCmuisfD/74c7m+/r55ub75GYeMg7XGiwcl/qXburUYX186E4HmV6whGBUFf
Zg4YQ9k9DhQUVyzkaeZd0BIYFt9ik5h4Kq6E5p/T41IUrRVUzB/tQFwVQmIEdFLwkboFuKpz
DuPn5DL9IdR9Xfnu6OZF6xpcNmSPzyl7rD493v0nug+fooJm0Pxx6IMvh5oW51m+Jumty1Ek
t1s1MPN2KTkwYfwrEd8JMHghcYp070RTKko0XQzWcJ6Dl+FzdlrUKp5gDk+diBhLZJslkAnT
cI74N/4aAqibR91uy7ravRA4WyC+UnWp2zrtjM0bYOvlm7CJQfVMeTz9efN4+DT33uPF+Dcp
JMhd4WI5JkQNLvoOs0W0ahrZUnz6eogVVVoeP7Q51q5Yni/VBU5Yktft4hCW0y+NIqThCoq0
lR40XFeli3UrCu4DnUClOn+KzH4YTflS/ZenoWH1C3gjq8Pz7etfw5p9dFFKhWkP2lo6sJT+
5xGUXGg6j+7BrA58WWzCGeMWP0LcNkwcRTHQntXrsxPY8w+tIOtesB5h3QYT9AUKmCQOx4Lm
hbtSjNxJkKoWHndByE/fBtXcvn17Qt8jlVyRQYHMu3qdyivW0tE12Qvn7Hng7v7m8fuKf3v5
epOIap8+cFcJ01gz/NitAwcSKz6UdEXGbori7vHbf0EbrPLRNkwJoZx2NAuhpfMtfd6A2IRc
iji9Cg2+npBGhlNjdSdZtsHcRw1xOS8w/vER/cQLxWWXFX1lYjh82D6kUOhDU6qs+LiCmWa0
hy+PN6vPw6Z4g+kgw+MbGmEAz7YzOoDtLvIw8Za6Bd67ZgsJS4xydvu3p8F9EdZzbNhpV4u0
7eztu7TVNqw1YxpnqJq6ebz98+75cIvJoN8+Hf4C0lENzayBz7wllYAu8xa3DSGPvw4apcOX
BKFFvQoXvfV1LcRqMZ8H6n7No6oP/14ZJr4ymEYu0ve8KSKmgUjEHm1WV+MfSo25krZ2CUCs
sM4wSk0iT7wZxZfAVtTdOq7WdwMJ2BrMpRE1TFty5i0WwVAA1dDt/TCYrSuoiuGirX2ZG9ca
Y3bqYSWgRdW307tSN+JGqW0CRA2MMa8oW9USL/sMnJ2zpf6hIxGvg5tjMXPZl5HPESAe6fOP
C0BvZjo523RPuX9B7sv8usuNsDx+sTOWZZnhRZh/x+B7kHi18oWDCfD8bC0spuS79IzxtTz4
ev0L8vToIHIFicaMJlZj9QzWG7YIz4SRW3yq+Np9sePmslvDLvi3AwlMCvTYJrBx5CRILtIF
jmx1DYuH84rKktN6XYKJMO+ADq97FuGLzVwPahBi/qEKV/dbFOf9p8OOdMURaFgT3aNJ2XYl
w7xSnyHCzDMJxudUFErPlF6I/BumvgAiIaZv9VffC7BctQvFg6LJOv9EePhOAbFUwzN0BY6A
+rrKSKd6yGJayPXG/a+AWZKhZ4WEk/qN20PFHEBQ3BRZuBWnnyur/Oc0lvLTIwJIflg4ge34
5JTakkuBuD1vuVK6lAF//GhTKuTTNiebZdo8KNUab0jRvmApKN7SUieOMBwDzblOFwBqZbhr
5RmWTwc8q/IWc/BonMDyIdOnp6YKi0sDBaIu+w0gtKzr7G40xTW5gVGBcmpD96AUSfUf9xqr
SHpXP9ZjEC7j9RfQBw5aHsyh8OsbouzTcOczAEus3Ogho67GI6XWMy6223qm6O/Ow/dGNMqQ
V1piZGe0LJhGO3y0Ql/uQ3FZBKXd/emS3SnQtLgG+OD8bLj3jO0R6ujwjULq5/SPQsB/y/RV
MyvHnnytVIHP3lzPuHzpzVQs3v2rDJCU5AFILwNYAgG28N34FqTM1O63jzdPh0+rf/v3Gn89
Pny+6/OiUwQAaP22Hzs6hzZ83cYvc3p+cGSmaDPwQ0HoGouafL7wA0d8GErDOeOrplBXufc+
Bl+qTJ/+6bVAyLs9f7gMExz5wt1Rj9XWxzAGl+bYCEZn47dzFj4kMGAKygL0QJRcjQ5Or8bT
ziN88Qs2KeLCl2hSNHw+eAzR5+OlMAY/dTI+4eyEdDxLr8i561hEsrl49fvTx7v73789fAKG
+Xh4FdRAaSHhAECB56BmruTCWE7Luxfy6XXrui92Hn+CX5sZvA/6ENddD+8816YkG5Mv0UzP
Qi0vtbB0Pd2AdQ0HRqVh3ZPlvrLBuTQ6nvtybWcNnfwwJwR1wsLtkFsylsk3jJJsBPvvWA06
LakKIBHGHMS8cO/m8fkOBXVlv/8VPpcYawXw7R9eIESJEAaxcz3h0Okosf8BBr44+MEYEizi
j3As04LGGViOZUHtQyiJJlfmB8NXuTw6uClFNPgQoFfuozsExLQ1Tc2Wabmw2B4D00nUiFdm
9+49PWjAr9Qih2xuwgYhu8kPmPGMGRvaMO0jVNzsrh79R5zU9BmCgKugn1C+wjYHByt+NBMA
t1frULiG5nXxIbRA8SRTxqg+Dc6h7qUBH3444zBzGadaEZ9Z1DL4gpSzWb6z9zpDuvSlAedi
Aeh8kwXYmIRx39rKp1cpE8oyJO2sL+mus/bRLcDUJFaNVKxp0AawPHeWI7npm1y44TFtt+bF
cJUcfyQqwHXlXN2lhsHDNU+lUY5D+N+H25fnm49fD+5biStXmvsc8Mpa1IW06MxPY8CPOGvX
I5lMiybyd3sAfuuAvjVRWGOQPsLqGWuJNke4PHx7ePy+ktPVxyzneLRQdKhAlaxuWZwkHMtP
PYzQAH3nQPbHPuknEX3CBT/WUrbx1ziQqPCLOOER+uv/Aev/Ofu25rZxpO2/4tqr3ap33hVJ
UaIu5oLiQULMkwlKonzD8iTeHdc6cd7E2Zn59x8a4AEAu6nUdzEZC08DxBmNRh96oaj+OeBY
q0ZObqlNv7YK3gN7YZ1JKkndZSJib5vA6WtSD7hOYHUaN1jEC1skpXqdxWXvxaVAn9HK+Ko0
n2buudafwzu7vOwpr11x/et6tdvgewZtDmciSIuX79MYKpp3Ca8Gb4yS5cpeH5/4WSKOczCm
wV9FatGRIBHGhsjyeSJOK0qdb8TMFw5Iph5QABPtCPmv2ynDY0VpkD5yZeGOlDRK7cHOdJBl
69WQIl7ZUyAovsct8CZrX2l5pA4RQ6AwUgDDKGXLhjLKkKp/WeyI0laGdHh1ANsb6nFAioZB
FaprjpW0KsE1+oZ6VU2i5Cy63O4eZrYly+NJVCfNoFTf74L0RjdkK/Tmih+C8zzUxmsDJCZD
mtw+i+f3P96+/QcUOaZ9c+qfEJwaYQ8eBdOkA/BLbPrGO5RMi1mIPxI3GWEim9a5PM6ol1N4
s8EeeAtTvsIq5aEEXAGiRQmCgZPupFUQpg0giKpC26zV7y4+RpX1MUiWitvUx4CgDmscl2NV
EddOBYpBEys4P7VINRVF15yKwnrmusIuX96zBO9tlfHc4Jp3gKYl7iCsx6bP4h+AYenCI42J
uy4NsooQKEt0bK6eCBPOSmqiakg2iz/FFT1BJUUdXm5QACrGBcTP+CUWvi7+PIyzDTt5Bpro
tNdZhuHwG/Bf//bxx28vH/9mlp7HPi74ECO7MafpedPPdZCo4QqVkkg5KQLDnS4mhDfQ+s3S
0G4Wx3aDDK5Zh5xVuAWvRK05q0OcNbNWi7RuU2N9L+EiFnxpBzavzbVKZrnVTFuoKuw0Vdb7
oCZWgiSUvU/jPDlsuuxy63uS7Ciu0TRJXWXLBeWVmDv4XgIOTeEIysPaUB4doOp4laJvcWrm
FeWiSBCrJyJcrFItgGJPiaOI3El5ROyydYx3fWO5Xx6O5cbUzG3A5IHYgwHMQkL9A8B97W6C
NQpnLlHffc3iA16k3FoIXaSzqEgXrFznAWlUnETWSahS6DMuy7QdR/xwzU4JM0yfqnV9LVNY
GdK96ig4LfzU3WTlpQqx+wZLkgQa5WvW3lNaV2T9H9JDGQP7cp1h0ijBP57OB4llYpcL/TG4
IJTczsOP5x/PggX6Zy+/sKT7PX0X7bEuH9Bjs599ojumpnO/IV3MmYWiqloX5Qypcpt5wEqr
0WNlQHmKVIynaElN8oDdc0d4n86LivZ8niiW/zyxCfGWCeYmnqfGvN+BrHTxf/3KPZLXNdJn
D/gX+f2+B+ajfCzv6VUJFA8prpM8lgAShoVeTB8UCdKV4X0yT00fkIl1TLHKVwy72g4oeh+Q
2ZRUYVZcgr4/jD0+dwE2sCwpvjkN4Nj+WUZO9O2Ai4MjLaUcZeEDfQV//du//q/7+Pbp+fVv
vabw69P37y//evloBfUA+iiz+kUkwIuYzpANyU3Eilg6CDR6DCC5z+IHwUCSXhbhk4epbY/l
83M1rxCkbubJaSa9788+QTp6HdtdzWbXUN7C1QxIcnBki7t+lPy+xK0LqUzr1Qcmt8caZHgK
1NKL/bVJUOSku8PQ0sGFBgrIYC5Wk4evhwWj9ldochhZ126R0IELqiiZpx8M6oMkrcu9/WlI
z1lNb+xAwAX/ZfmA75EixJbHWDcIgDOvGmd5hRUm9soktt20WzQRP+H26mNjKuKKOBCcM5Qv
GGDDDb1WM2UDYaWzFOl5xQyD/AAbFXseiSJk8bMTqAew06OH+t2BbG0TARVYrS2dEWKbM/bH
CPPHGBegcMdLiC6jiVkFdxHKl0JT7DukDn9itsk6VRZiZYK3RaJc1Jhaw/M+MgOWlzad1IhA
PkjdOMoqKc78who0HMpZ8YWG+HNIm93xbTwry8rUGVfPbXqpOIBYvYkRljGTSMGCvVS0mVFw
w4HZkdObseoJywDdoMg8CLsC0gDcTP2hbgyVO/gNq4gg7fIjs1dEEdkBA4Y7Aohd4XG/TtKo
wBZCrTs7r1MZskBnmaQf7LpVr2ugvlsZbxKtnr13lw01stetBkVZyDm509fgc55fO9Oj3P7B
4uLgiOwDR5kS1rv35+/vyMWium8OCf7WLW+BdVl1YgYxy5x5FAvPircAXbKrzZwwr8OYYVbi
Uai/44iFV4cXM2Ef5WbCwSL44Oy8nZnEeNmM9iEi4S5+/u/LR91CRCM+R6aRukxrI8IzG6A8
i9DjAzAxzcy6RGEWgdYgCLmKg/2h+3MIqsJVxJIUl31ViikgPhd1SO1VrLRFB5IaWYQJtyQe
bberWdmQaJsuzfC532s5LCmD/+t+qaXRDNaG/EblcqONeO5G/LNuffxwlNmT8B7pe32oP4S9
qxcjY5LzhbopNI9YaOdLA2dDGGOZs+FmlYlP9zD27SprF0vum0qapek02NzSyUBXV98gtUTB
vekrk1eiRuB8+l9PH5+N5yDIc2Se42CvEHKQo8r1ndaaTCpxNseGZOUt6aq/dSHVGKt34vuF
6gVwqEgSor9gJli4jvIYUNesqrg0cAH5gdWygyzKTOsnzCw9j/bhPFVOjlnqaVh9WndYzTYb
pXTYlDtZPL4TsuWOZ5jJkoHv8CQm5LYQgoZG0BAdoHTHU/t+JVLDklcWE6zDiIsUHV6wxhLo
4OlRFjJM7v3rj+f3t7f33+8+qZ6Yma7vG9u/I3SHftyJ33Vj4seI7RtjDLVE5abH9k+kE+zN
d1MdyhtM+KpTqLpYmU9hTXQL5Ityd+W1s7pUYhuZp6ZIu+Imc+ZN8aJZWnZKorCO5xU8H4lN
D+ZKfSaihYkZ0xw9okdEV0GzjTqMOnGTLSs1AzSRdypYvZqy6U0hbAFSgwurk8wQrV3E1LZs
GmWSGf0oSg8gndb6U0m6Hal10Ot0TUu9p4aVnmTg81Bqu4stHNXgGKijBIzketf4XVno2jYj
Eej0ikbIUBbwJp4c4j1CBopug30BkEgbSoRONLUOJ5KY1eDlat4SQSHql2WnLKzF2VIQehgG
vXQUIM3oUBP+qZN6kSFWv0kbZtZbdRzO3e6P8EVtZMNdTb0uOPooDWldHYHKEm9qVBqskw2S
1L/1gkr+9vn57o+Xb8+vz9+/D5P0DtwfiLS7pzsIanz38e3L+7e317un13+/fXt5/92IvTeW
niccf6QdKex9e06xtBXrH+KDDg+uwmOWN3OvMMJFqZREl4o4J/W+5NMGj9Qny5MFqcJIxxta
b2okOjYLX4JIaj/xIbbn/PaXKj5+yYaaOKNBaMYRbKshOppUjBptOOr0numXVvVbjvsskRXV
ybRUUumHCr0swhV1Zwlnd9VMG7lPtuoehcwQM8PvhY6UsCgJl1ZIVJ1WU46kOoLHEaziqS7X
T8USZAdmvClCYhGZIg2V1EnWFLuw9zhxAAN8nJfIj3FmHDe92ODp21368vwKsWA+f/7xpX+1
uPu7yPOP/vwy2F8oq6nT7W67wq6C8lMst78O25yD+tQEtPcm0HeEBqRxZZckkjrmogFL4TuF
73mzj0Miya5PFMvFup159EM6sBHzFJPVHlNF8WYqhFREBkqmLlSmJ+DVfNa0FUBkM7mXXurC
t8tGaAJ3Nr2sSu78o6XbM0qEfmpKDS2qxvcFbRUbovVBw2SeYsrrYwiIAmqb2ssH+IEX574e
iyRkGajB//p5alHSHJuyzAah6WyVUFIkZTsq7s1T8fNf3Tnbg0AwNy7GEgGnMn2GqS4yS78g
6hJ14ydpCsQE2LDZsH/0AaVNl/QRk5rW+xPqyFOgIa9yoxiZgr3KjtjovomQa+lkwAP9FDHu
js0g7KoGF3pJpz4cE50AIt352L2yFFYEFl9zwvZ7gEBLHpj0KXyfkZOVuKwcMDFLaCzEpcby
k7bnEdkbYJ8s1snMAbNNQwylxMBDAN3fQPFTA6MIk9qFf1CywROLJahS9moirWdDIcDpdJ/u
F+f3l39/uYDnGiCM3sQf/MfXr2/f3nXvN0tkysTj7TdR7ssrwM9kMQtU6pR8+vQMvuYlPFUa
Yl7PyrpNO5pq4T0w9k7y5dPXt5cv77aPraSIpcMMdKM2Mo5Fff/j5f3j73h/m0vg0r/+NElE
lk+XpvFPbdZR+09/sx9/9/JN47e0Du4ipl+zRDZl7tG365ePT98+3f327eXTv0125go6XvjE
jTdbd4dCLHBXOyJQaFgx68Vj8mD08rE/Q+5K23ropAzaj0lm2E8Zyb0l7ujGWbCoTV6ZxhZD
WpeDaTzSp4KDL+Iws8yTq1p9aPSPBY6C4lkrRh9Rr29i7n6bqp9e5CgYpl9DkjS6iCFOsnb8
yYv78DWtTVMu6Upl7I+xpigBauuKZBnMpZF+AT9cPfMwd4nVN3cUsYTSM/V5NCjTK6gsrXUU
rVQvTK3ZGVWYHGWtdWKNL6SD2KbP29UJ+O9AvyHJQmnI1xNLi27kc2MYPAhRd2pKSafxURp8
PmUQGW7PMtYwnQOpk4Ph30j9NtnePo3rbjP6tIszS8pz/Xo3lFdrimrS/gY8jsj5lZpTBcA0
KSIlLcBdGhLrcvRjON2AhqvwkfWWZNPdWyUt3c57CumWcB4XyfCoZzPI4n/FzDGNDCStPBlh
o1noMkL41Ym1YhgEycQc4phjAGd1iiOnfTsBU/sI5wMlxnjY7tWVryBTEEYlCGKjG/pUVSPs
BBmzzXRdNEjyoKjkQSOaHT49FLZBsN1tsKIdN8Cilg1wUfbtGdJ1KyBpAtRLsKTIazrNvr29
v318e9UN94vK9HLfezUwhOK9o4PilGXwAxd/90TUm3QIPucXcwK/x3kspgSrPLfF32AHYlB5
WSSI6z1ek7E1N3De4qHfBrwOiXfyuC5zUJuI4jPhs7wJpT013B5Rgl5J51ZX32phzc1OVHKb
c55o7OlwdRapw2vAvKcgCyJRgDzKtgS4i7+M9OMl1+1tZVoa7sX2xe1UUwEdkgjTDwmF9cEw
I5wS4aLDm2N9wlGYMfMvKSwlpBoaSWNbfAxCC70/1XXg5fvH+e7Pk4KXNe8yxr3svHJNBxmx
7/ptJ1huXHAieIH8CucXzlTuc/DBh6+7o+A4iFg9DUtzOehIZ4tx2nkuX6+MpwNxJGYlh4dL
8NI9f8wdrmTirM3QCA9VzHfByg11uQrjmbtbrQzhm0pzMbHf0JGNIPF9LbjMAOyPjtJCsdLl
x3crQy36mEcbz8cZ8pg7mwCHQMOmOqIX+SxsGtExXRJV3nSRH6oiNg2Dz7h0rQwODXsfeYEf
7mK0pW8LIaTF8RqnCSb7i1zrsUj+FrNKVCesO9eR3aj8LCSCQciNO+cw9hIRm5eLnUwTqlne
9IkqZsosOQ/bTbD1jfmlkJ0XtZjL9BFu2/UGycfipgt2xyrhmAJIT5QkzkoGU5/8N5ht1rby
/dZZzVZI7zP3z6fvd+zL9/dvPz7LqOi9f/H3b09fvkM5d68vX57vPonN4OUr/Kn3ZQNyIHQ7
+f8oF9thet5Zu1o0gvOGK1xFGO5J/905EeRiRLucMA8cCZoWpzir2+E5J6TMSXTEHZaDTw5R
/6iktZwkSQ0xvm5TUML8Y7gPi7ALMVnfCXQ7DTbtXIUFwYkb2796LQUt0/5B/7t98kqHVZan
/DpksQxXgbHokEHbUSC7EcpcpvTyaCtV8v7pyA7KevUVUhGz/i6m1X/+5+796evz/9xF8S9i
WfxD0z4ZOCMzfsOxVqmEpsyQCZfejbmJN7UBjnBOSTZL/A2yCfRCIwmy8nCwNCllunTAHdpB
tqa+aYY1990aLw4RYWB8rA5OIzSZyX8xhIO3ayI9Y3vxv3mlZRbKD3xPcCzF/Z2jxumKpq7G
744z126zVW5WXmSwdfrL8RFdEdj8HzkC3d6Fw1EIVdfvSiJJKcLqrolE4vDCLj0+G3udAKXz
P4wBEZgdT0N+9bEqY0xILsEqn1SDNWHrHy/vvwv6L7/wNL378vT+8t/nSQVO3+5lIeERVcEc
MVQzVaJMbDXOxsUvRCo/iC1nXzBpOMvQk1tiaTpuCqItH+1Gfvzx/f3t853YZ/AGVrGY+BKl
vv7AZwriRuVaqmr7XO1uqnIw8dEaSjK9SnLcGMMYAfnF+BLNOlqkSceqVktsEktNYEw/z1Qw
JJTjzzYSKxYwYEootzzDiC6BOG+uwDNu4yfBU7Ywi85sYZDPTHCofM4sVT8/bHK9h0QNFJhT
EgYA64aQCyi4ETNiEa+CzRZfaJIgyuPNegnnvu/igThG3LuF+zdw3O+Ewq8zKbVJkKQhvgwl
eqwab7NQPOBL3QN46+JmEBOBR+OsCVznFr5QgQ8yKPJCBcR9Rxxh+LqRBIJzipYJWPEh9Ih7
oSTgwXbtLAyi2GLsnckiqBpG7aaSQOy37spdGgnYkctsYaWAeQ2/LsyUOsaFIhLkkUMFnOlx
nF9TYCLGoAZfHQufF5vbJlj6ArG/KYZhHl3bIqhZmhE2kNXSPifBCyv2ZTF/5KpY+cvbl9e/
7L1utsHJbWRF3lbUTF2eI2qWLXQQTKKF+SFl0qiIGVCEFVGT4hGMOWYNH95C/vX0+vrb08f/
3P3z7vX5308f/0KfgAcmjBSOog8deu55lPvhnqcrsfc3j9y4ruSxfKZScRrQEqTvtlB7jxRJ
cCNbWcVAmoOXICGMfu1jcg0BInJUkSrVKzTJyd7SUlK/bYakT+1FdTOVzB5Wr3sQV5I3tnvE
UYieD3FfMEx/TLM/InOmpi3jQKX8NoPXyvCQ1FLtBVfIhUJYCcotXK9dLJV6xAbQyDi/xhUi
Bo/S4Ci+SqxYTJ10b4x/ZQiIbOWQcRMEG3Zm4N6bMuyFom0HiRN0qQVTNL0PT0Cyx+6rANRm
eyL7yV2kge09wU8LFGYahT0mNSaZhTK1KWh8a0jvUN8rBoV+dTOAI7c7d8JYiW1EcrZk4dWc
ZSfrC+JuZCYovQcjKc1Cw6peJInzZzDpshPl/9Kr1KCTCsucCCQ35cClrjCvpJqL8eWsPKg5
wa2vLzsb718hbFnkiKcnbjlKVY6VkyS5c7zd+u7v6cu354v47x+YcDdldQI2InjZPdgVJbdq
N7hWXvqMtgmC5j2czb1SAWFG3tuJac84STN/nBIHMLki4bkERaAZh1NY48sjeZCRyRZciBAP
RcyOc6dlaRLioVD0hu1UYiqwIqFzSyFwbBL6HPuwTk4xfvM5EP6/RP24raA1tUv8xUvC2M4y
wtfTu7MczLrknDLVO1vPokOyehQF92GaAm6R5QS7D5oTlJ+vsI4K1G8o+Err56YpUsoXJhWg
s+dBDRPjFVLMDgQboTFYeWCfQ8wgIHkMCdVVAAsGwc3x6Qw4i5vt1iXev4AgzPch52FMnDVA
cixr9kg62xffwBlp2TyxpsU1gnZbR3gdBkhMPiIGqDLTIDeYBMJcFbYrWnFoiEZ2XlQaTG+S
EZdRpT/oRf4Wd6Y0EQS4JuC5rBviAtJcq2OJer3WahrGYSUYC/MVWSbBK0+dMvRZVy9A8F7G
jpo0jodaTuuZsjCSDI3BJPCMRSWqG2dkbRLT00gYJbNHlAFS71UNv9WIPHw09Ax0yHxiz+PA
AcM/Queigh2ButarwSzyiNp6IQBqe0AV5PQqifOlaEw7+/CB8HCu56sjvIkwlUtrp8qo1Zzh
XgQAoJZZ5lDDc2Oe7OsyjK21tF/jS2Uf5XByEc9HRYu3J6KmTsMOZYGvWiiMkKJfxWVCBrSh
MlLOkKYGR6FpDbsvUDOnKQ9kKMyHRXHmotZgeqYzO+XodBB3jIxb7mNUUtcQHiQGGO+vEcYH
boLPmLaeXjNxXTE1HyMe7P5Erbr0XDwyWmNvF0gW6fvfdGTRduL+RejV4FyAVmCczPxjNifL
DSuSq398nT6UubguFz8VsW0BMS8vEZcl05/fPnFv1j15jI6sQqdKevrAGm6Yt/abXJqfPzjB
jeWtIgqjJR9P4SVhKMQC129bHOq9GkxDjdv8JbZrFZlA6CQccKZcpJ8J59ItlcXe2ydkTX79
xlSVkmrwcKI35wOuaaflUvJrY88455bdwDS77gkHvvz+SnlxHD4kvhIWpTHp8qxdd4QzKIH5
9PVUoPyyCJteJ/HuMqfIPQ+CNX44AOTjW56CxBdxEf89fxSlzhRJiOHr15e2QUVu8GGDS2UF
2LprgeKw6O3t2rux8NSkSXJ8geXX2njZht/OipgCaRJmxY3PFWHTf2zaAVUSfi3kgRegSnt6
mUkDKtMGJ8hdYgKf28ONBSH+rMuizPHdqDDrzgSTlvSCR/DR3Nl8x7yEwNutkG0ybCmOpUjc
mbslO3dFXD/1mp9ZbHKKUqchxi/HWsbynpn1PXbU5iXKQiOiaKWpCBuinw6sMEVWx1CGrkcL
viZgypKyG3xtlRQcAo2iQ/eQlQdmHL4PWei1hF74Q0YyhKLMNik6Cn4gfZgOFTmB9llu8LIP
EWgSUi7u6/zm8Nax0bR6s1rfWDd1Apcig6sICclN4Hg7Qh4BUFPii60OnM3uViXELAg5OmA1
uJSsUYiHuWB0TNUIOFLt2xiSM0ke8CLLTNxyxX8G/8wJAR0H+38YxhszkrPMdCzHo5278rBn
HiOXqabF+I7Y5AXk7G4MNM9Nn+z9nsHzaOdEhPFgUrHIob4pyts5xKu5BNe39mxeRmLHNjzL
6GgjjyWjC5ocwijeHt5TYe4pVXXNk5DQaxFTKKGcE0J4UuJUYqcblbgWZcXNQFmgz9NmB2uF
z/M2yfHUGBuuSrmRy8zBuqgS7BEEruCEfl1Dux/uyzybp4X42dVHRsSEABRcNEXWe8O82At7
LMyIDSqlu/jUhBsJPNxvx1S40lvXC+812WFrzRgRi6SnCVtGb8E9TZaJ8bg5iC2rLVlFv+YA
cCtczJjGMT7fBE9I+V8Bv7d7+wV9+ujxajmDmTg5yf0C87rb+YRmCNwCeh97Ot7bMfO5UznN
3nqGarWigo5UFZ7O8esxuINTHmNn4nWAxBUdH0kA78WdkpDbAVwlh5Cf8GHqvdAFjo93+oTj
OyvgwJoHBOMBuPiP4gYBPnL8vAWMVUd8k7xkup9b+DVJfnObD4jzwHWwQ8rIZ77swssrbXcK
KPgy60OaK5NpSKB9oIksPi7kkAjJEwt0R+bb3XdHYmJEYZ3tnC0+rCLr5h7fSsPa911c4HVh
2cYllGpEic4Kr+clKrwNMT8gm4M5BTSHJjfvtjKBKG+7ifzVzJABKRUXwhKi0bU3V6qZ0DrK
ObXVApjie6xem5k0L2Q1vi4A6CLsOUEvbyYyYtXFpY4kwCiFNXbJ1rsNrq8nMG+3JrELS7GT
3q5mLdhKg80pwRAHPzySOies6ip/3btrx+Ga8dzH1Kj16iDyI3HmJHUT4h8dQKkLA14X8KMH
OoJ4zcovWXBr/ueJuOtam1ouJvrKwcP7Afbnagkj5EyAuUsYXebKo/M5Po1tPLLM3UK+netg
kg+j1zARlNjCIulw2XICh+SvQ1tMXTdui/JsRrb5RVQeoIS2psK2SKECkf5W+KyonUv4BOpR
Qiu+Rwk7c0C3rhcuooSkRDUiSBa/u4CK43nhu9BefJIA2rYtBV6C4NZgceOqIX52O/SRV89k
6mpFF1vXF8li3mgumeMS8leAiKNSQBSXdckIO2W9Do/XOJzxlY+xqD1eFYAcp8YEz3qx8tE2
KcxXpYemgDNvyXBX3iDq8BoR27kiEAeMT9Rv8u554QzfeAemuoYQkbLWxHWvFvcx67CaOvdG
xDuMZdfQNLxPMuLdZKIKm2BTpy5h/KAR5oJq/WF9ky6KXMrUwvgsZfCpE8Xp1iWeEvQvhgHF
HOr1j2p3hd/QNKrZkMr72GVwqSuGRFfPu1zsge1vbkYGbbxzEE/jnF7/9NfRMXfFHdKqnHZ/
xbwgMh6jwomz/k59zrtqn93PU0wn6OzL1x/vpLXszP2rTKBcuyswTSG4uun9WiEQCZ0n94bv
IYXkYVOztkdkvU7fn7+9PoleN3z7m5lKcUsyonmY6eCx8tSSKBdX/KTo2l+dlbteprn+ut0E
JsmH8mq5bVHpyRn3Rzugs66nXFaqDPfJdV8artWGFLGKKt8PAhLZYUhzvzfUdEbkoXFWxJXd
oCHufxqN62yw02ukiPtwR/Um8JEqZvdUFQmfwwYu4/EkeP4mCjdrBzMI0EmCtYP1qZqhWH3z
wHM9AvAwIA/bredjw5Pr3lqm1KoWBycCFMml0bWxRgBiX8EBjpWGvA1MWFNewkuIX0onqlNx
v8cecUYK9sA3bosPQu52TXmKjnjg9pGutWeqtjLJ5SUWJUSpNnjlIa0LizArcenLRONh7Zrg
WHsIHlOjcl+H6CcPqYtdxSa8Ni8TBtCh5uQTyYmJmZ6XDVIjeQk2IguOEGdxcoGAdDUCNnkc
YcXJp1C0ogoivTzYdC6h8TfSXcK6ZiXmZ28kycOD1JVA6yOOmCgp6xu1kVT7kNBJmMggGg7q
9G/qsQuLxQ+k0x6PSXE8hQgS73dI6iHMk0hfzdM3TvW+PNRh2iJgyAU76yAAHFCWw8MRa6tw
cZ5XHChM538I2KUpWnzV1rjoaqR4uDCGCbBGgpSzcKP55lbrWwZU12a1+i25cjGgURjjEKus
+7MGHsNC8HKYNZRGdL8XP9Cye1E4UrjydCcmdFTmmJSobxFshYrL0MqfErsgqPJgY3pR0vEw
5ttgjR1qJtU22G7xL0hsR5cPKOmIHCHFBSEGIUhbu1x/3jTgkzjGWRuxGsf3J3EtcLwF0CWb
A+Kbskg6FhWBv8IFjQb9NYiaPHRQbYE54cExzRBNiqbhFeUAbE65tsLFYBSGy06MwFjCOkEc
7lbemsZ8l2oHPFFUqFGbTnUM84ofGdWAJGmIiokFBeFcbJ+WBkkbeZZeog73N64bFTyUZawz
dEblxSGZVAR2FYni3/WmJRcly5iYhZjYx6JS+xKC8Q2/bjcODh5OxSPVr/dN6jrulqpZgr9r
myQlXrbcyrpLsDKd1M1J8IgIOp1ggR0nWBHtE2ywr8YXA3PuOMTEFdtKGvIuZxVFwA/uxgsI
UP4gx7RIWkJrzijkfutgqp46jeDOpdNnYghjcYdu/Ha1wXH5dw1eWRfwCyuohqit9WZDLnET
bNv2JwZTPieXeVVy1hDTMo8cbxt4VJWgBLXub1ZLHrph8YFhCl82oZfj1ZEvwU2+WB3Jdf1U
deRy/CnKOI+6hkfOrcNE1q8epiNFEI8PA1TFwK5f8CA3CjqUjemq0yb4AGGBf2YWkFuHBF22
9JHHKyiWsttshhod8BC69ql7h03/c2tXlhzyq0y70Vz5N2tcig8RwyzPMKJDBOyuVu3CEa8o
iH1Mgf4SSB4BVRRiF0udpM47PYi1cTCxLAljqmzO+E9sGLxxxEWQLKPJU0LlwSA71alg+r2f
4Dd5G2z8NfW9puIbf7W9dVo/Js3Gdckt7HHmAg0lq8tj3vOo3i324IEb5hvG18AOnxn8Ry8f
YZzSkWVr3LXm8enbJ+k7n/2zvLO975kzGHEIblHInx0LVmvXThT/mm5RVXLUBG60NdlmhVRh
fU+4XO4JIlZx7LBVcMb2Ara/Z4SvVkm99aMitr/BXfCcQH5EdEmHfEXJIvX0k9VTcN83+2NI
6Qru+wGSnhlzeExO8pOzusfftEaiNA/sZ6/+TQMb/9HRAPY6oF5Kfn/69vTxHeKE2K6XG9PT
wxnrvFPB2l3QVY0eLVJpxJCJYvoC0+T6mxGLpbPSU1NC2IhBrs6fv708vc6jufY38iSsM+Dh
zSETQOCa7o3HxC5OqhqM2pJYuvkpC47TKb/wxgwaIGfj+6uwO4ciidLo0ulTkOFhwkOdKFJO
AYhKG15K9Vrq4aZ0IGnDmqo/8aqqk+SS0cO0pHSqopYBy/ivawytxQizPBlJ0A8lbZMUMWpH
YHTARewAVHtiwiOfXpfGDVDLPJ0oqzgxGXI2zsji7csvkCYKkVNTeoBF3IL02cXtyCO1y3US
QsdckUAX2jq9JoXJfGiJ2sSyS/1AOD7v4QwMrnG36T0Fj6KC8Ak4UjgbxreEakJPJGbJPqnj
kHBq0VPto3zjLRfUb/4fmvBABtIzSW+RgQnQzaIICWkP1xUuJ+/hlIuerm59Q1KxAhyv3SKF
pfvoEJ4Qh2GpbDcug79Zc7+15lMeNbWKF4rMpkK5Eo4pDzEQUx2fb0X5WFJmcRA3o0EV7fvP
wtPu/jRftzIWEFRX5O7P5omLEwdQVYtdGduUJWDGtMmqYRXh6iiV9U5sKI8AX7SQmVU5A8l1
nBG+cwTBvtdNV49B6SysTk95vAiOqIiJkAVhVYGvCWLJl8W1woLASVd3HxEGYcp6LSL5DEwc
K6CmlodFt16hmlATvNZP7Kh21yZPXA2BuNGJS9Z0KiG/WAEPh+GLgq23+XOY18PME9yIPdPF
KOSEFU1xtoKaTFns2XesCIV3MQsO0TGBZyJxbmJvVU0k/qtMYQckEQ4de4y6VvWouOR1Ua3z
Szoy6FcjEGi1FonOfelocTqXjQ0Wpn0WJNH62oAO3yAJohrjUgA5NxDCsi7b67yCvPG8x8pd
04gdBmCGE52aZBF45ZsKblmWXSEOVZSF3HhdGhCkGAkNIY+HyIULc1ut+66pT7zp9mXZqNhr
swUNF/q5ZpD+8gDeJeX4lRU4ONQHEFLli74YFGNdyBlU5hXhKkLCR5GP2CUBz08YdwZIH2wO
bgZmVXhu7PtysmaHci+92o2tHa9EEOZranq/vd2JQkT672/f329EX1TFM4fyMTziG1x3bMQJ
H74Sz+Otj/sQ7mHww7OEdznBbcj1Ors26iDld1aBOT204GwV93IitwEpTKErpYy1xVaLK+rK
gWbiEr2ju13gG0o5UsG7Dc43Aky5q+0x63lMTgnpgZWYIzzK5+eoXHZ/fX9//nz3G0SbU1nv
/v5ZzLvXv+6eP//2/OnT86e7f/ZUv4hLxsffX77+w1ikXQTbiHlMQXKccHYoZIwQ29WfBfMM
PwItMsyHrU1CWCQBWXJwV/R0SfLkjAl6ALMP3CFNeXMVh8EHGZSPyH2f5FUWm31TDrpT5pSN
Jke9RGGc5cpHmJY22lyqeD9/ir34i+CWBfRPtY88fXr6+m7sH3rvsRJUo0+uVWqcFe5sN63c
jekHW6/9GKfPyFOX+7JJT4+PXckZ4aVFkDVhyTvByBCFN6y49rHUZSvL999Fg6YmavPX4AKj
P93VqrN8ME3CJ2onthYPHuFZQjB1rQMgk6HAZQgiDIGYTyfl5NSaxuBJl/SoMpHAcXKDZG/b
TmoNtgN2ME8b+SguOKSI6z9vdA2u+GImT118jjQErVfO4PAWNETADCt6R4VE3NYwpAqQmsyV
r4EXyp++w9SfonzM9WBl7Bd58dY4/TFttnlpUJxi/nMlQatiyig3G2a5ghXYh3oAeJl4auAS
lV3tT/U+xYjvTHufWZwYLiWdM7v1Qu6QPQxhVmlcbAlEPYq26kAMYGiDADC7lou0LN+uuixD
Y9kALCU8HeeRWVSptgG7tKoNLfsTDQQXFqbPLEjlkROI03nlWsksZWerI/PWdFkCaU1Zibtl
moIchuysFiz7aFTu2ST8eC0e8qo7PODsvJxh+SSOhnn+4/X95evr859ihs9DUkFDTq1OP0QO
7ReIuWtWcvJSjLEco7KsIMjyLIKd3k1ZsnHbld171GkvZ5gyTtaHILc2B5BLMM68zRa7tx/1
UFrih3EzUI9RnFme/Kfk1xcI0Db1GxQAV4SpyKoyTm3xc75XKSa+4kN5mBwWMoo5BB6L7mfX
aoxKPkRgYoKJZB4od8L6ZThW7d/g3//p/e3b/PbRVKLibx//g1a7qTrHD4JO3iZnjU6+PP32
+nzXuz0A24oiaSAshPSEAe3kTZhX4OX5/U1ke74Tx7hgTz69QKhlwbPID3//Xy2arfFBWHD6
3XNe1zEfK0DMpvUFK3LdVAMIxF/aG1gf13oGqBN1KnDqDJVkx6+x0FwwTR5fBeZ9doYaG6eN
Yl/lreMT4vmBZB9emzokYgoNRNExqevrmSX4c8VAll3FFg8xKxepwkxc78E5+3K96rJtKKPn
oVphUZTFzaKiJA5rwS/jZvwDlThBz0l965NJdn+EF41b30zEIdnw/anGVf0HskOSs4LdLI1F
yU2aDyGvfqJfgSBlCRUkZqBKLux27fmpqBlPbg95ww7zqsndoBZ7zPen73dfX758fP/2ivkp
oUhmCwHERhp7BtuZenozE8SNjDcyBEHGxCD96juuTtGZkbGHTKx+MHkEteRt1kWWwK88xcWa
Eo5w2yyJ9TuM+X1lq7Maz+b8+fPbt7/uPj99/Spu3tIgCbnXqMbkcYWPjYTjS1jhuksShqdY
Gh13Q+Q6alLm+2DDUd0WBSfFo9IWNXqRmX4oZeK5DXxcnDI0t0tthmsI0Un3mjrUxNnwS4+C
EsJivzqrNdyKu3WAsSkjCQMaZ2O1rEdEZgtIt04QtFai6qJ81hWsMe3rrTkYHT0HtfmWcB/M
yPrUhTubaB0Yx+dSr4wSIpn6/OdXcZyjs1AZCS5MEDnBcUHYREC4cVZaLlG481FHmhOsx4fu
U9PA385nWVOxyA1sq1/tfmy1V63KNL7ZD9JpPuYgWsL7WNTRyS9nq5qjJryRaMleZKKSI1Hl
Z5W3W3tWOVkVbD17zo17qVl8HfmNH+BS4L7jQIstwAxBJnznzCveXDLbGeK0cOcd28vA2c0O
X5A7qy5vKOcDqh/E2Vvi97d+Ai2CbNgAFokSReXikmjV8XHkzULgje+Hs24Yb3Cz7rHWlOfs
nPnYw1p07NTI84JgtoAYL3k9G822BlsVD60uUi1las332Gj2uRBUwueXb+8/xKVg+RA8HOrk
EOLiV9U6cXE4Vfq+hxY85LlovXNx4JF8OJqdX/546eWEyKVZ0CrJlDTkLVGPHCNJzN216YXW
xAJMzqKTOJfcqGYPmFL4KZ0fmN4BSEv0FvLXp//q6nainF50Cc6MrForhFvyNxuHRunaxCYQ
oGUqCLzTxCBquFW8ridtlrEhAJfIEZA19ewx0yDUW5tB4dGZvS6qUX9bBlWAV8tftTiw1Re1
CThUXYJkhW9WJpGzRXcAcwZpt4XyIt3NcdSNrkL5qapM+aeevuDaziA7XnLUJ2wVh4pw6hGx
GwY71x+Tp1f1hDcqFSloH4Kk9qrbTfYIiIog/h2wRCvdtGrIEl3clePP02FENis8PTCmnIFg
M84gcLGsHA1TN9RdoPN67B/cbatriluArZVgw8f4YaGqA1XcdCcxSqLze0cj81aDSSHOSeok
PrZ7agSOj/Q1GIxtDW0fC3EJxHWQKUBPDsGXismhu20YEMYr+M4ckPN0heQA/k6/Ww3p5jEw
FSPDM+odOxbUeBsfm04TQbR2Nm6GVs5Z+9stViywG9vNDrNDMNq2Q9ogZsXa8ZEOlMBuhQOu
TxS19XwU8NU3ZlUHKNjhc02n2QWo+phGsWmRRvB876232Bw/hKdDAv3t7tY4cztSllmcMo7Z
EQ0kdeOvzGNnqEDd7NY+9pQ7Vj3e7Xa+Nhvlxmr97M7MsNRRif1L5tH0Gqv0lJ/eBbuFPtUm
BS9r3oV71pwOpxpXvJhRYXNrJIq3nmNYNGjI2sFs5g2CAM+aOysXWysmhTbdTGBDATsC8Byq
Hs4WlxJoNDsXNSyfKJpt66ywLzei81b4lxs7UDFK4eClrjcuWSrh+8ekwWbtSHFs0NZwb4sm
R9uNi9WzZV0aFsD9C14+w+p7H0B8qcXq3jurmzRpmDv+kWQ2xgoJ3ibheYT2nPRAvZSZV4np
sWhEmrZamsqR+CdkdRdVdTnvpQGtzLhDAyydzN3sgJhvUGf1E+6gQxQnWSa20RxBJAsgJgva
W8y/hyCIC18ESd3KT+cFSxGemx6wYtOt7219yoRF0fQ2ylCzpc/z6Jijo5U24jJ3aoBDWvzO
IfOdgGP3MY3CXXGk7w6CDw3RZHeeemTHjeOhewTzfdK8ZJw8tycHKQcdCD5Ea9w8T8FiWdWO
66JVlEHB0WA0I4U8hJGNXAFbEjDf+mzQ1JHQwR2yRykA6X3Jkvno2QCQiypqGRQuUapLtHnt
bvAKCgBZodIFg4NWECAX8yCrE2xWG6QeEnGQs1ICmwAHdshgSRnZFusEhXhIYwWyUdsR1qbN
xsNjgxo0izNWUvjUl+lm7NA5nkeVt8ys5FkLTuBTK0hKjzbRBnVAPeIVd70AHfx6K7YYbw6I
zU9niMdZlG8QYtAUQlM9dNrni7yBgLElm29RPi/LCffHGsES8ylgnyh3eUvLcjSejAZjyzbf
od23810P5YAltF6aGYoCWYHKMgUZFwDWpmeYASqaSEkPGcdFtSNh1IhFjLQFgO0W7VIBbYPV
0qoCip1+tR6BKsq32HyUz0c7bWJXuWXP1dP1ySh/7m7w1wGDZkvZxCmafZJ1Vbp0TO2rsKv5
ZoWMSMqrzrvO09k+76I0rdCaxxXfuatwiUViBa9OdccqXiF9wmrPd/FNUkCb5Q1JUASrDTJU
rK64v17hxfJsEwjmanE6u/5qg1y+5AFL7AEKgjAZp4x4Y9BovcAhDizfw+vdH3O4wNU82FaL
u3jYuivqwBKIjx/P4twI8Bp76/UaP1HCNtgQz70jTeUGt0l2/4+yK2lyG1fS9/crdJpbx3CR
KGom+gBxkdDFrQhQonxRVNtyu2LKLkfZjun+94MEF2FJsN4c2l3KL5HEjgSQyHyn4ze0XIfB
spimjLbRmi+1S9NnQl9Ay/K4WbM/fC8mS1MH402aJhEqQCx/a0/oUcsr5CaMtoi+0iXpzvAx
pkKu4BYTT582mb/46Q+FKDcqn+05c5gBTxxiH720lgoc25QJcvg3+sUjX/+9LC9BRwjyysac
rspM6GroqpOJHZdxV2lzBD6mpggggtN6pIwlS9bbEs/tiO0We5Rk2oc7NM9i97eJgmUVQfKE
y2sL45xt0TPdez7KCNOwhYbmB3Ea+4guLZ1BBi5gix2liIqMsb5CKxJ4yLgAuu74TkHCYHHx
4MkWWTn4sUw2+AAuG39RcZAMSPeQdKQaBN2xRAGynPey2fjIpyCyW9J0sFfG5Ao4iiPM7mTm
4BAVAU3L4wC9t5wYznG43YYHO1MAxH6KAzsnEKDnGhLCLU80lqVZQDAUYjHjiDoyQFGFF0OM
tSNy1jMgmYQWX9fN/RxeqFrHeMiJ24Pn4+7ZQD0m2lnjSAI3/fCWHRU88TBOOAXXttjt3sSU
lVl7yCrwdgM5rfMcztHI5Vqy3z2T2Tjwn8jnlkoHtFfeUlX7m/A0G57FHeqTyFTWXM+UZVip
VMYczhHZkTgeP2FJZAAz6Wd5MYlbOsK4mF9ggIc78p93BN0z55I0XFqToqgTU7Oc+dPslLfZ
45RusZwQUZ6A5yDrzoV++3l7AUv7t69PL+gDUQi8NWQoKQjqFFwoffOXTvK1473hAWse4Na8
bOZe/NUUz+rkmnKGleU+vgRruPb6dzILLHidjFYIi7KscifHxQoeuHgCj8nrglYH9JN4JU9V
dCY8Oaa1MgNNFMNFzkyu6jO51HpojBkcHHPIF/XXrILBiNkFzuzgrF++vgB5ngVLk2b8O618
m3Jt2mxMbjXb+ennxy+fXv9aNW+3n89fb6+/fq4Or6Lw314N+6hJ6F0YjAO3QCtsxX0urXM+
y8MHznAFgPGMHGCX7EU7tWXuWU0JB++kqOgxDumC6A+UtmAnYzd6WfQg904YH/chrOkZS096
cDaEIKJOO7QsJHnsaJuZxZnQ9AShkMQIGLJ1T1bQEpwKOKsBGLa+5zsEZ3sxXMJ4bcqVdyux
lZ170zYQhFaMNscrRCE2p7xJ8Lad+bKuradi4YN6vxWfwfNO9yXRDR/PJBejwCkrCj0vY3s3
Qxb1vRsVhXXlhAuVOsj1PgNEs1qPzVKHHCyHzTQsgShgzmzJwzw/dOLVyWylEYi8vre+tU+E
PuWqcIFug7VnDI2m2+gU2DdNtu82Em7327liprXxsYTFycgMKNSuUk0K4RJDvN1a+B3djag6
apPjByPDoh9nTS+GCDpoK7rzQnePqWiy9fzYiYOvLRJYQ3MyrP7tz6cft0/3iTZ5evukza/g
9TJZHF9CsvGQeLLzdQkfEwqOu2ilPsDncs0Y3Wu+BtleZ2H6m3qZKqEQfBNPPaEmEZwymanu
fVVjwbor+FmWAdRAvvRm55Kjs+FT2p3NEX5on5QE/QIAVhvIh8Cff337CE8q7RDRUxfJU+th
u6SxjcuVDMBgR+EwuW8gqLB8DOKI4SbTEx7EW8/t5QCYRLE2Ow990i1h5SWFLrxvAs/lThwY
zFdkd5p+YavQDd8EQxWtt4XvriOJL9ShxON3cIfl2R3HDi1kE0gbSfWh60RUX5mAnFFH0m6j
Fbph0jkj7owDHOEudWYYO4sbQc0qU9KGVzBqoyR+2OtnQwrZ4ftK5bCbuQki1fDqyMGRCaNJ
qNNEwsGJi/bhYWvw2JH2YXYKg5a/aIQIx3sSwJxejuatEzTjv8FyTY78/O8ypuBQwdleAz94
H5VnG/8On8u5xJ2tKbEZVeJWRC+g/kGqD9ekrFN0ZgQO070O0KT1redhxA1C1Ox0h8E/27Tq
VGnNanU/oMeOMNwjQ7zzsMupGQ021rd0s9g7Mba+z6Mwcs8XAO/w82QJZ1Ue+PsSmzSzD710
5m5+8USbrJWeFRxlgu2InnfF7FnRMwaaaRBlMzgHlvyY/YBKRfk6Dn09M7NZrEob3r/pREbX
28j0oS+BcqMf885E1youGR4usehYxqwm9t9JXZnCOLj4CMNND972cYsxYJvf/WmJwTDccQM3
yi5KRxBraCtSlAQ9RmxY5Hu6wfTwLBA/0Rz93uvFnd4RWgWWdNT2Ycrz9JzRThc7XKnNDDs0
hwocILkUVHvJmBFr5RSImHV0c11+LtZeaGs8dxjeRiI9DMIqb0MEKMpwE1ot/o63Yskid0NO
2Hp+rapWw+NWPSMjEdMUJogtrBtSj3E8jJQVUG6MuxkLdrbpuRxnTyMJTJ/uJGv9tnSkhr6l
U2IsS0UFlo33npTdbqEyknQXrl1znNhPBdYiNhLN5pFHU0iUMGSxLn3vaiwM94e7S9uM+6nU
aDehHlSNpDlIsAXktM9Ed6wLTg4ZxgD+izvpSLxiXZmh0uEAXp6/L3KJ5f8gpg4HpOsQBhTp
8U/uKEl4HEe4mqxwpZtwh8/QCtPQhEir33nQ7ZBSy3I78M537EdTOFOADjiDxUfblFRiX7nZ
YJjpZ+OOUFbsQkcMPY0rCrY+7i/zzgYr5Ra77DRYAiyP8qUV2k8AwcsFFkFakGQdirYRBmHv
qXR045jENa44Wu8Wyyp5IrR/AxSr9oQ6NCirjs/u0Md3Bs/OXTrHDK3xTFo4jsUBXq/jFlBf
UHV8G+NiBRTvAkeemzje4Fa/CpPQwR3nJgbTe50dnF2sN8vDcFTZEbr59FDBTnHs4d1BQrEb
2uHQucQr7BEC+IEft3dKKvkgYNYJd0Z952wJa/bgxUr65lOjgJr+ApU0trsLm0dsHXQtX8dQ
0wmVRd9lqEjk43UtkMHmFv1keUKfytxZ7A2GghUHuFtBPwtWan4UOrr4pPYvfhqYglC3k9PR
DR6RymTaotOssmvAMX8p95sA1Z0MJm0ToGGTWm9hs9aId9+C7OleixDTJq6tQJIlxuQElKrm
NKf6q90yA9/UgMKb99oReGPgQjjkMfHh7en7l+ePqHNCcsBMAE4HIvR65UR+JMCsC46y2e9+
pFyyCJCdKQf3cjW2H05b5SRf/Bi8xKZ7qlPT5kq6fnLUrtaCROVL0xINcTDDLCtyeNGvC34o
2ejEHRcqPlwyCJ/c1EV9uIiWdfj9giT5HgJ7oCYYGh/4v7+KdkmFktuW4LbVlfMG2lfP8SEr
r3AVMOfaKI0Lg3TsWIp/MZSJFpo9icIO5fbt4+un29vq9W315fbyXfwFPr+1CyJIN7jP33oe
5hBoYmC08KO1WcHSwXrfXLnQF3do/COLazTfU9w0ubI5GJO0pRYUZLILUch6llqSusI5AEzK
1OUKHuCq7k4ZceN051jXATwdUNcpEhLNalbeqTwfclyhl41dEtfLO4C7FDdykYVk+EQiB+eB
HFwWyYA/9m65+1qsyO7iD8FojOpVGBpSyVAfsiHT5x/fX57+WTVP324vWtsaiCph39JU3UnO
Uu+IJhxsed4+P4kN7f7t+dNfqiscWU8VETMC7cUf/TZWH49oaKr5HHLLVhNnvCInak1zI3nR
TAn4Etq2Hbs+ZqWrMg+lH3Rh4BlzAC2bItNmZNCcADr2cbjZpjZAC7oL9J2ACoXo2yKVY60u
5hNQUi+Iw0eOiW2zhjQO88qJh/HtBnVRpjBsw40155/2dX+iYg5w1VuX6lU2BA00xfB0YWi2
vuM1wzjAFoaIG2PkhD9ilf2mHyIzghIjFkCGDYG6BQfBctm6gqnQg8EFDjKHOC7TMMnfnr7e
Vn/++vwZvKmbsRnzvViI0kLzei5oUo+5qCTl73EtlCujlkpauJ0yNusxGpqI/3JaFG2W2EBS
Nxchk1gALUWF7QuqJ2EXhssCAJUFgCprbhbIldDj6KG6ZpXQwTBvRNMXa9WCNoeIWrnYyGTp
VXXgIujHLOn2+vfBJ1ahB+kW1LJOs3GdZ0amOC1kXrlhw2g36pcpJgJifwm1KKcZtEsKtCnx
kyRIeBHbtACPuCVg0iZGlolQICCapUsgFSqaExQqqMM7nwA76FV4NgDR++5aN5+H9nAMVwGB
taUM7+Fodj+1LrHhGzLgjEtmS09OjG5N34p3rMhib7PFZx3oLJanOu2jbp0ImoZfXPPZgLog
hl+UAmLNZRrqCCcGLeauuSqrxRil+MG7wB8uLX6zKLDQNZvDJ+s6rWv8SAdgHkeBs6BcqB2Z
u1cThztrObicQhOh3YpZ1wUfMjEzOLrkeJmpUljS5WYfNZRHpQvuxQrZ8/VGv0CRLSOP6p0d
MIOQ7HXpzDV4F8ajO0AumRhK+jG8zPvWN2agUQdDFy45t+2fPv7Py/NfX36u/mNVJKkZj3he
3AQ2BEwbQx/eKw2QYp17XrAOuKddz0moZEKvOeQedsMmGfgp3HiPJ13ioGT1NlFT4YDI0zpY
l+ZnT4dDsA4Dgr3hB1wJqaRQScnCaJcfVMeJYyFER3nI1QdRQB90RJ1W8zIU6qEykc7rlaMG
7/gDT4NNiCHz3aeFNKpDzDt5toaaq0XHHLced6bxwPsdLumeB6njO4c8DjoXWYrlcrZRQEQz
ciQttlIpX0+bONZP3gwQjZVx57GtYJSKRQw3tAaJQm85e5Jn50jfxJsNPskqVTCeai5+Rfd5
p3zhtAm8bdFg2D6NfG/rqLc26ZOqQieSd6aL6UPHVA9eIvaFNSrPOoybJLC6Ux15y5/XmjEz
sLJGhxcWYohR1VJWk1KlQyhPndQkeoLr8ZxmjU5qybkUeopO/IOogSUnypVWTcevw6Gdgolc
wjmZTixpn7UAWVlyEsXc1R1ohYBT2eZ6B2CMLCO+VNUtppoB07jJuNaFmAQbo5hNWydX/aEM
kE9gCcUyCTtOCHU2R4BfmcnxSlzPuTyOHNM7Eia8uJ5IQVO5jzMljM0BUero5J7PIehkxv2S
OSjF/uuw73JTMMseO3i/4njyCEmlZbOrvoc48VoCkvpx7HCiA3DBXL7kR9gM6GvgdLPe4Fqb
xBk9Ouw4JMwpdUUWn2G5BXNEfgKmLra8zxuww4B6gh0eUCV8dkT1BuwDD53+FAS+5/EWn4ll
DyOe7zlenANcUmdkMRj0/eWQ4VsJmZqtg9jdKgKOXCHWq9Fm3V0ng0k76VJXZDM5fvrcnfuU
tAVZaJSDfMruhAtyWUw+iHf4AJnEu+FBvBsvjagEOujYOQGWJcc6xN9/AEyrlDoCEd7hhTof
GNI/3pXgbvlJhJtDLDW+9+DuWiO+IKBifuhySznjCx9g/i50DzqAIzecl67guHKBTpl7MgLQ
PQsJzdu3tkkmvtCppIFY3LvrZWJwZ+Ghbg9+sJCHoi7cnbPoo3W0djlChJ5NMiY2lw63AoPO
QRxXpwBXZeAIejysXP3Rveq1tOE0dbz3AbzMQne5Bbpzf1mijm3LsCY7TGElSNnW893LK6sr
mpzofqFel84upAZBSRwszNYj/s4qKc8NauaePU59ELgr4VLm2Pu0Y/ob+fXp+VV7TCzHChk6
LKqdz6n+ZSQRerZ8vy+q9UN2f1gtK9LUHjvtLdtAuMpFySZ3xDd8iEwA6wPtXM3AE0LJI5ZQ
AoNGvpC8Y34QFHZ+opxqu42RfKQ5SQz6PkkDzcZkYoYLgcgmN3WK5VeQj3gUs4mD11VmGjYY
LCfSUtKb4oenfQsjAPXNKpA+NvI/3FxOtyJHmtrnRUf1PkP8uDvh521WHfhRQ8XuSs1tByKx
fIKgMUCX1cXZ99vH56cXmR3r1R8kJGt4GK3niiStGhtxJl3z3KDCOYdB6mAUGKXMigda6bQh
zqBJo+KXdosmybX0K4y0w4B2B9KaaUqSiLGIDQ5AxeYspQ/ZhVmfklYyri9dxAhXt59AFK10
qGVsPPWebKJZNZaVzKYVWaK+Y5W0DyJ7OumQlXvaGh3okLdGykNRt7TujGyeqNgPqjt1IIpP
SPs4g3oxmvRMCl43przsLFcHswYPl9Zt8wIMFJwcOGqYcuPTf5C9+kITSPxMq6PunnQoS8Wo
GEJosA9gKBIj3Ick6n6wB1JVn7B7XwnWB2qPl4kKPxrtddSM5DkiEdC2K/dF1pA00PoFQIfd
2rOI52OWFXYfkpcapWj2zKQXcKRuEi95QdjRLHqbDT3X2XYlTdoa3G04qkfsLcR0llkjuOwK
TmVXcySsuNE1xVSePeikhlRg8CC6tzIGFKJVJ03GCcQpNahijikSq9lH8jXH/FyqDOo9KyoB
TgCXRYheZ808DYS5bmFEYacjI8eFcetERyHjvWyY8GhJjIoQc6pVx4yUrFM9Y0liVo6cWo6l
F3nTD5WK84wYc5Mgic4rFqrMKr/4bFM4bpFl3yyxx7xyxgHjXsKoHsNuIhp1on+zFBr/H/XF
/LA629BTbcw/dcOyzJiG+VHMPUZhO1jArw0LzaKeKS1r7poDe1qVxic/ZG0NeVQFTTR3m3+4
pGLVNsf+4Hjseuz2KD3pGAd7bPnLWNmL0T/sFN0NUS3m8G66+nPXYaSe6FZjGh3TxO1fBXWO
U24pMyD6Ya+NayDJORHV49+Ra7LNZ/GTYaSjiGCnOGhM5smhYq2opZ03FupXlCLUx4RewVCj
yEYLknvDAG7ZwkgVvy41d21S6c7kfu2gU7uioVfNmfGQvqqMSxS5RWlhmSPsekxSDdHZjJNc
mbKq6g6cG1XZebzsY1Zbl88/Pt5eXp6+3V5//ZBV//odXpQZ7Tz5fQOrFsqMkudCPq0oh1fH
40yjJtUO/s1M1hw/4BoxqTh2CS8o6glk4kopkx7xsl6shhW4zuv2Vksw2RQQWgecoFjtRzpe
s07MsfLIX8zxvwf/0rr1HIdQdtDXHz9XyRzGHvOSJRs12vaeB23nLGUPne2ILmEAZyOsZ1ZS
WzDOEiW9cm5Wq8Q5h6aX9sVLwpGuI+k5w6wN1Dwh19eyRfou8L1jM2ZbkwwxtvyoXyhwLhpU
JMcSS7/Igb+QuEZrq57zm1AHwswBVSNl1DLTLbcbK2LfxwoxA6IuMK33zpNYo6WNSRRtdtuF
794Lo68BYKIAUfVKwwpl7tGju7fk5enHD8zuTI6RBLOUlvMPXKupyn4n/XFZtcZLe8tcibX5
v1ay3LxuwQLp0+27mKJ/rF6/rVjC6OrPXz9X++IBZrErS1dfn4TUIe3Ty4/X1Z+31bfb7dPt
038LoTdN0vH28n31+fVt9fX17bZ6/vb51SzTxInVCf369Nfzt780U3a1P6ZJjNrSSRBUd0OL
E3S68PJXzhhpxbBHI6pk2aBpm+i1PZAHb0uDq6mXp5+i6F9Xh5dft1Xx9M/tbaq2UrZ4SUS1
fLqpxZJCIGprXaGbeTmjn5PQbFegyYXNqkc9F8M8uWLmQc0swxqiknokjTUYBIBZJMhKPFKh
2Kj2oir1qruk0iDr8zNSstKB3OPKW1PdVvcLMncsKDyuUXWMbfV4ObKTig8gPjtBlL6COwau
2FBErsoSmPpiU47ztOPqgdSQhRPLDuaqeqi5vsmXZHMCHg9yxP+3SWT1neQi7eod2aPptMvW
EuU8pVexTON7Z1kIOCsTmgHs1xDZEr6WOQQaY3yIumeUmAp9YH86GN2oMArHWyK0rBPdt+NL
e70X1GfSthQNXSBTDw+jjOWXZXyYrnPa825huqAMdsb52clwEakx8z35nQ+yJvvAWi066Ij7
YOP3e6fkIxNanfgj3KAe3lWWdaTG/hiPox/g5jRrr/rTMNly3BhqcudrnJzJntPDMamhXWfk
UGSWiF78MxDnkdN8+efH80exoZJTIz4cm6NyKFjVzSAryehJFy8jXZ80pZ6T46keNfW54mai
nISu+8ukWi+0cOOH5iWkslVylEIXciDpAY38yy+N+sxN/rzypCkRmjo1DsSW+1vf1461FG7Q
1yh+xTRw5dB7UPfvA96JtV+pZvHrmiSafY6kmRs/PSfyYWncm1k/piFjoRGabIAYF/nyDb8P
c6/h/3y//ZYM/je+v9z+vr39Z3pTfq3Y/z7//PjFvosYhJddL9bXUJZ8Mz6ZVVrz/yvdzBZ5
+Xn7P8qepDlxpNm/Qvg0X0TPG1YbH+YgpAI01mZJYNwXBe2m3cS4wYHxN9Pv17/MWqRasmi/
i7Eys/YtKyuX02F73vVSONndOS0qgUadSY2soN0tQg1ew1K18xSir4cyh81V2J86TCygKunh
BC8/5ARJSX9YKUvRw7rBUymYq1YlOJ0dcH4/q/P+6W/qcGxTr7IqmDOMkL3yaEOn6P2ymSU5
GQo9rQRKbTB6uR+4LLb1qON5CpnRNVBEf3HmMmtGU4/XJUVYTkhHhSgRkDJRCeH3Y64XbEjT
W2jD5ddkYRoRFzuHeUKedpxuVuJ5lSEzsHxAq+Js0Vm/ohttYox4QqUi68s4KFZWa7iucp8C
DingyGk46s2O6TdujkdXEJMR1b8cbbtVEXmiuzBSG1xhJ07tiklfN3KU/c3gHEmDOLEQvFKm
hzAd7vOO1tJcj+yibIeWLdCpaRSEg+G46usxjUTGpi8KDiNjOpkks2g49Xig4njpUbEaD8lb
mOi9ejTRnZVwoONrRIiHwgDdH9jQJJzcDpwBcBwEtjNp8q8FzOshf5G35ji/ln552R/+/m3w
H769lotZT7qSfz+gbTUh8e391om//6MZRvD+Qq7K7ek02aDzTF8PiQiETip04OTvenSBPJ15
V6NwcNfJRM3ElD8LYQT3sn373tvCgVMfT3DKmRtC23/1af/8bBxrunjP3tWU1M9RSzawOexJ
y5xmwwxCuFHQ1kEG1ZIFZT0DNtTbQ5KQfN0yKELSMtsgCcI6Xsf1o6fl5E7UtkeKdonAFfvX
8/bLy+6tdxYd3k3MbHf+tkcuoPd0PHzbP/d+w3E5b0/Pu7M9K9v+h3tShbaunlqGQWp4BzaQ
RSCevilcxmpDy91KiAofxBxUXefVSzUrX5N3yDBk6BY6TkTnKw2Q7d/vr9gzb8eXXe/tdbd7
+q6bynsotCcN+JvFsyCjFi2DbRauSDkK1Su4/miCS45yXicQqrefUwn7aRF7gmw+p/Kpqktk
iMauqRljRVQvjTxB9RT6xqMlx/HsZuPRYJPoyfACOp4OpzcTWjNTEdzeeKxeBMHIp8Qu0T5X
DALNRoOLBBuPQqpIPRlfzBwa53E2y/HldHh9Mf3kctMmg4vomxF51JZ1iIbq3ZxDAAZ/u54O
pi7GYTQRuAzrHKajJ3fA1PkyNPORQGXKdnU6P/WvdALbx2GNNxzgjtVaBUBvrzxCaOcJEgJ3
MW9js9hwtDYhwJaLHB3erGLGPdR4GhiVayUKaV88sXoEQ6zIKZ6YJqJ9GEqKYDabfGbms3mH
Y/ln0pFdS7CZ6oZrCh5V0jSUhDchnAMrXR1Nx+sx5Ey4HUpCw17feBwoShKM3XLrmdsajW1s
SFHcTt36OfygQpTVJBwZTg0lIq4S2CamVHMEigwuqUg2QDBxM+Vhc4cjD6J/7cOMrsnh5zjS
abxBMSUTp+NB7YnhrEhm96MhdZtuF4Tr+kt1q+0uWiEquMvd9gOqQvN0NBj5ti+eKcxlM1Sp
hplMSXdzWlLLL6PEsHTUJ2Ott0nXQEBMKYSPiIlTotM/quURrKxpy4YUsbV/EMNzS2TD4Z4V
2B96Vp/XS6hG4vHQbpDQftJ1EtJBtbHIB9dEn93e9KlZtBnDsHoW7Zhe5rCLEIMC62A4oBZe
GhY3t9ZKRZWVoNVSb4cLLz7utu/0wWhIzQoBt4MGmtWjtiecfLchOa4CJ7K8OPWvB4P2gtu+
911sRZjmDgMgR3joc6/akUx8vjw1kskvZ9v1dNLMgzQmHzo1upuxZ9YPx32ayW1JHAt3e8nW
d4ObOqAm2nhaT4mJjPARsfEjfHJLwKv0ekg3YHY/9olX2qEtJiEZ+FoR4AwhN0xltu5cKo+H
3/FGe3F2zGv4T+zETraGa9V2jSmXLq0pQLWDu9XpcjGLPInmcaU9KkUYdoZrSult6qAeITO+
pDuOmNBql2ULwxETwlrv2csgy1hSmVh8zOggQVJjFJy0WgCuAwvBVwww07kfhlKMUtq4okg2
Nk5iuGuEJebWpItUuzh2CK2OD5iL7SlTQo1Ok4SWHZDELqtVY+RbAU9NtDERsLaXw5f97nDW
ejmoHrOwqTdmbvBheZxsB6MpgzjSspyt5q7OG890HlsBpR44nH6pkzlROIFq0nzNpBuuS2TO
DLMJlDtN6qYkSZYsKMx51UL5nYmlHmSYBvqbj9U9XVWC1YZ4We/mGno2o96ETTkUfDZhTKnT
IqbgS5RlcXnf1RYREbrSbBFGbgHzDA/gKlaGucf5ES8vjCmrHoMmYzX5mI7Jy5V5p0VgOr/2
GHHyhsypTlrPARXnabrib3Iad4IYvQROmeWcliyEE9ALkKNSQ26GG5NyGGAUM8s3ixXzeKfM
4rrMYW3BnX5N+txqzbSMb4x7szJKEWBPbQVyhuZ+Onsj4dywzi0hpYpNcdIJB3kNsdevo4Le
P9f8wR5r7b4x7p9Ox7fjt3Nv+fN1d/p93Xt+372dKWXlJYxouTYLUBEdfpGLasiiZI+GooEE
NKzS2ELYuplufiS+bYFICxUyYL69xJ9Zczf7c9gfTy+QASOsU/a7JkriNK5Cyv2ETRdXwUfI
cHV+iAytCz9CuWrj/l0kmw4nk4b0VCcJ7sSvIeOSKMvnow5t2CZIC/N8MfAZ6veuap8hcB0s
nEjIEsfDQUulVUrvW+3RqZAiGzVYllCHNjWVLGVJEmT5htD9FQ9JzTKv0TWMnq/EkC+P1apE
M9auUOPIlciRDNedF5CPz9hNES8Kj+W3xMsKXqQpynwE87yuf1FWsIDVt7CfMdVix1AvYaKb
/EgImi4XgeFrnD+VSWqxY7wcW50F/laI3pPL3bfdaXfAWC+7t/2zzrPEoc7wYCFVMR0Yfps/
mGX7kJLewdIeDala4gZwO9ZfejVcFU9G44E1t3XkhLpTmDTjMZl1GIXsRneMpuMqtH1uQsMi
EBEyytPlMg0PZjLK9DrUtAqWD3BJz3QlD9Gf1fH9RMX4hEyrkkvsdWdqAGXr2obyz0bm3VHO
kqiltEbRKlVbbEGczHKKTRFMRZyvdTabwwxnSwLUPSMJf/W7w+60f+oJZqPYPu/426Cmydt5
0/oFqVkOP5FMt04KIW1OgqqqYWNaLShjRkmrM/+KKUBMK+jf/Tied6+n4xMpUGdoH4YyffJk
JhKLTF9/vD2T+RVwY5P1oHM0UmrbCjoSe4hLVx0d7eJ/q36+nXc/evmhF37fv/4HHw6f9t+g
qyPzkTz48XJ8BnB1NN8PlBt2Ai3cMJ6O269Pxx++hCRe6PBvij/mp93u7WkLI31/PMX3vkx+
RSqenv8n3fgycHAcyQ58kiX7805gZ+/7F3yrbjuJyOrjiXiq+/ftCzTf2z8kXh9dO+AnT7zZ
v+wP//rypLDtQ/KHJkV34iM7MC/ZfXv9FZ+9xREID0d985KoZpGvpXvyJs8ilga6JzudCPha
PL5RF9pDgCd4BQcgjW4DhhlCBD097APArrnCF9mIyN5/u/Y2bG3oHbBNHXb2XOzf89PxoAxg
COU8Qd7MqwBOPOoUkQS2noUES2lNVo/Gt5RrdElGBZ7qUKMRGRywI3BCo3YofJjypy3qbDKY
9ImkZT29vRlRvK8kqNLJRBeGS7BSiKYQsAJQ91V3nwrX+Vx/CpwXiwDvxmiZYLi8iz2aGllN
a6mvgZelYxcZZz18tO+8nQjjIb0giuFYT5xfxPFguqRbTsS6MUMF9EIE345AssmerLkKH+fK
xCNyec/DcrjayCrutpShKFNZm17r/AK9GPpCQaHBAnzUZZ4kZqg/xKThsgBuNCg3ExtVx138
VfF+sHwETuHLG9/VuvpKyYxUyO/EKGhLsEgRTPfb8rEJg0woH6HaPqMY9VmYNncYLxONHkyd
f8yg2ATNcJql3J7BGDYdiWmpUQGaNpTWsjJz1hBuzlwNnQ75h2gpIIXGszQN9VE0u7BNg/uv
FUw4jmBfF54pKWlirdsB4Bcqo2kLNzRsG+DTI75BTFKE7RDvTvhCtMU7x4/jYX+Gm8iby0de
ImsnUWDbhY2dAyI4fD0d9181mXEWlbnuGUgCmlkMR1wJUz304XRlECuVEiZdfdmjjtyn7//I
f/57+Cr+u9IEqE6JrVyXZBhVG9rB0J1LoHaJAVA6LvqnrcoigUUKCzAKHOpS05JZPvTOp+0T
WkI6+0hVGxIE+MS7c42yuiomXTm1FBiAobYTR6s0JV1sAQ6441IGFM11N0gartW7JLFz2AZ0
9kQsodowUVAw71bcEnjsTlq84V6qhVae4tKKluF29akvltb5rlXeDdxR009YvRLymanAieg3
T+XncrooW/LKG3TXJg3XVESzlkretsVzuJtJGoTLTT60S9PJ7BBDslxg/thn5mBleUXJdRhX
hXFk8fyEmMnlSQguZZ4yp9YSjrX31ViR2HUzkL5qNMF8RUCzOFda8XBaN9mobwUEUIS+uV0z
yksKN+uATtrwbhIib80kyRF8oI1TEC1ubod6xGoBrAbj/tSEtmyzHtrYylvj6fNCd4od5xvz
C1kUi/uskjg1JOYIEGdvWJeJvRxL+D+jT0SYLNLMvU0x6I+b+1UQNbROJ8+wXBXAHmX0A4oY
r3tGrZA0N61D8VvwCxFtWMcJQjgQ/Ngqi8gjxrr/CIX8Paoncz5CvxuGsCBZ84A+oIQKtCZ8
EV6wYa8FXjUoK2NlVSiU0R/w4V4wtHx6S1CzCeqaWjyAHzX6QSYBwN9UGBMsTFxUxcJVaejH
A2Zs5zL25zK+kIv1pPLXLBqaXzYFZJXOeBfq7S5ZXCF/0Xj0sf9yUGoz4whtc5u3DgSa9diE
36/y2tj5N3qT6ecEoPC4aUVUnvGXNK6I7qmc41UdgXCZZxgaK6gD6hF0Ma/siYHu3Yd0F8zq
0uoEBTHGs82qxcIYcNfsNVvgyJKtbInLFdx4gwzoGt/7u6B1GizAoskXqo8xLtHRvAjUpb2w
Jt6Wz4eq4d0mjyB0UHYxhVhfTjrfdLBotKVgphcd6pnCIjUX6rbe8C8UAvszdxtgnoASmXzO
KeCYahGAl54ARJLic1VTphZaYaXOcOIY6/y2b9/ANWhuMgIiTEUbM/hYDFcxBMe6OziUt+Hr
0qMHD3mxLCwfi9rsJR0MzNCi8uFisX75t9F3FZ+JpNnLvLKjyUU2IBYALtXTig5aurYgviWR
g8MxqHLBnQXwgxTf3CgNJqQMa63v0ZvTvDK3eAGzV8sKnYbS8zWHHkiCRwstJIPbp++6shfU
stt2tbuUAMNiNAbA2fwlSFCSPS7wy7iq80WpX9cUytl0FCKf4VJrbBda3QMZUuHsqki2QLZU
tDr6vczTP6J1xDkDhzGIq/z2+rpv9PpfeRIzrUs+A5GOX0VzNSSqRLoUIezNqz/gzPiDbfAv
cFRkPeZ889NWUQXpDMjaJsFv9eKEZk1FAEz5eHRD4eMc3YVU0Kqr/dsRw8//PriiCFf1fKqv
frtQASGyfT9/m7Y5ZrUzaznIZ5zFkeWD3qUXu03IZN5271+PvW9Ud3aRV3TAnakCyGHrVAI7
QVYHlhISvOJTvC6nRFlgnTgZ4GigC7aYfmjnNOEyTqKSZVaVCnQNiE70cG2t7EaExQoFkfIa
IDF3rMz05lqSkzotzNHggF+wUYLGYWo7xaDVAja6GXlkpyydR7BFs6A2NAbwp5saSmrmDmSb
D6rk8JXOdQC1JuUlGuI70yyIfExnMHeIGT9DaPKlxZ7Bt/ClaeQwY77iZlZ6Zn2HsCW63+KY
NSMgwVWtWlpRhCRMHLF8O6QEUAZVFMtApW4uKFJIiwadIyceRRSLlN+vLxWp0+FDmyGFbakU
R2fDPwvdJLd44IsulWqwWF0pn8m8bA7KpRhz/20zrt3x+WIPs3TGokh3+dp1fhksUpbVjTwv
0fH/qN3U7atQGmewJHVIntozsbAA99lm7MxtAF775mbp5CkgaNnNInTxMzP1OgQaeC8LXqAr
OmZ/t8fDHeoUzB7h6vHnoD8c912yBO/dimt28oHhvIQcX0QuQz96Oh7qyG7nFmicGS2e2rwF
2YUc7KZd9JlEtPZj9OP/L73WJ1QKfycpaqcnHYIrSHblEFnibwlHnROi82AnpNbaY7U25uzK
mfMC0jzAJcDjf4ziQbrjoMz9wgzgix/y8k4/jChGRjeOgI+uWzS2q8szqVrOrQHOjS5YJ7r5
ENENbdlmEE0ntJ2jRUQb21hE1DO/RWLoCJg4j224RUSbT1lEH6ktaRtqkYzNQdQwkwvtoDQl
LJJbT8a3o2tvxrcT6j3VSj70ZTy+9df4hjpMkQQuPDhZm6kn18Fw0vejBnaJQRXGtPReL4xS
sNTxVhMVeGSXphC0FYNO4Zu3Cn9Nl+jMZYWgrM6NFnrrOvjVSAwmZl3u8njalARsZReBFk1w
fnvcTiqKkKEfLE8lBEFWs1WZm0VyTJkHdWyG22hxj2WcJBczXgQsMTUJWkzJGGVqrfBwM0sM
5a4Wka3i2tsPcUCJ8BRJvSrvDAM7RMhbcafkldBvGassDnM7ipcKJa0/TAgFyd3T+2l//uka
c9lxZ/AbLn33aNLisvvd+Sl8nSOzCSlKYOepM6ouV0ATqULU4ScEbB1cL7yJlhikXoRtofJE
Gi4oi0NBY3DcUvSKZlAV16Kpyzj0xAOTtBQDIFEGL4za6cugjFjGIi66C/PiseExtqRv05bS
IrqAauaQwcyIUevS4G5XFbqj/XlecgmieLo3egCDb4Q8LTopXLKkILV6FOPc9ViguxCq0j+v
XraHr6hN/Qn/fD3+c/j0c/tjC1/br6/7w6e37bcdZLj/+gmdhDzj9Pr05fXblZhxd7vTYffS
+749fd0d8Jm9m3maC8De/rA/77cv+//dIlYTlqHLfGhLeAeDnRlaCTG6YxL9rvlncinwedsk
6B5R6cIV2l/3VrfUXk+q8E1eipuLcd+G2d6G4gpPP1/Px94Tutw+nnrfdy+v3PW0QYxSaUPt
3AAPXTgLIhLoklZ3YVwsdcGzhXCTLAN9l9KALmmpy987GEnocvqq4t6aBL7K3xWFS32nP4ar
HPAa4ZLCZg2LzM1Xwg0TcYmyfcCRCdvoC7a5k6BazAfDqRFwWiKyVUIDqZoU/NdfF/5DzI9V
vYS9mMjQ1rSyJkqctjbCxfuXl/3T73/vfvae+MR+xmjhP535XFYBUU5EGS1IHAtDp8YsjNyJ
CMAqIKAlBa5SqgNhC1yz4WRiBp8U+nHv5++7w3n/tD3vvvbYgbcSlnzvn/35ey94ezs+7Tkq
2p63TrNDPWy5GnMCFi7hpA2G/SJPHtFdCLGWFzF6fyAqX7H7eH2pH5cBbIlrNWIzbiCDru3f
3OrO3D4P5zMXVrsrJSSmNwvdtAkXvpuwnCijoCqzIQoBhuChDNyVni39vYlha+pVSvQmPqmu
nVmwRNeLnj5LA7eeSwq4oVq0FpTi/Wb/vHs7uyWU4WhIDAwHCw0ZGklDoWcTasvZbMh9fpYE
d2zojo+Au8MBZdSDfhTP3YlP5u8dpDQaEzCCLoYZzhL8JcazTKPBNWncJlfPMhg4WQJwOLmm
wJMBcaIug5ELTAlYDSzJLF8Q1XwoJmawYcEr7F+/m1ZzajeoiDwA2pCicg2fxe2EsZMD2/KA
Dj/od1A5uAGauJIxKVsKvDdY4Z403IQoGeG0Wxt1TpBGuhI5V8/z9JbqjgIrC8PgxYQ3VcWG
zWRKDH/qTsj6ITedpJhwX08otChGjPXxx+tp9/ZmsMFt+7mM191L9UcICZuO3RkqVD8c2JJa
MPZbhTDmg6vA8Ucve//xZXcSNowWw67mWIZ+6AuKDYzK2UI5NiAwS8tFioGz3GsTJNSRhAgH
+FeMPk8ZWmPoNzONqZMGnxS/h6hf1KYl0xhtb1ZlRr1R21SSu/fmwjLOYuYzFH2Tofw0nh39
p9qXkZf9l9MWLkSn4/t5fyAOuSSeyU2HgJchMbsAIU8ILQSMl4bEiRVMRZBxiC5tHpyKZPBc
OnUYAb+Kj2eDSySXmqUdav5Kd+ze5Uq1p5Gd1fKBSBhUj2mKseZCLipBLyldFTVksZolkqZa
zbxkaNdC0mwm/dsmZKWUxLBOobUTEt2F1RSjX60Rj7kIGkpSJIuxtWIxixvYNaoKJb50ETci
Ggwkp0Q58QJlKQUTT9NcgVBKjtpFsDud0SYU2Pg3bviPhv7b8ztc0J++757+3h+ededH+CCj
S7ZKQ+fMxVd/XmkPMRLPNjVq/nfd5xNR5VkUlI92eTS1yBqWFHrNrmqaWOkRfaDRqk2zOMM6
8DBmc9VriXfPQB9S101h+B9SsGYGN07Y6ktK2orKdkHZcHUL86kz4Jp9lO5DDDwVuinRZqay
hgN2KwtRxFZyOzJ9WukkCcs82IyhllKsP7Qp1DzOIvhTYpiaWOcl8jLS9wQMdcvg4p7ODN/r
QrypRyZvTfjC2NYDVygL3Aa/xBBNygwh1tvBKVCFD5bz/1V2ZLtxI8dfMfYpD1nDcmRlN4Ae
eM0MMxyS4qGR/EJo7YkgeOU1LAlw8vWpo5vs6q6mdh8EaLqKTfZVd1XTjZfDbDGdCUkGOmo5
CGkoO7uQGKE8Dx8zjJN8SuobqGjYpC1JuggCpKdIb/WsAIGieSsMQtIdWSjynoQF0R+6EHxK
cq3Mva2gTEOdK3M8VL6qBDs2bw5yxAbk+f+dVo5bke0YjYIMWkp71BrIgHrIArZqPesxDLHg
BcRWv88NV/CaNfybj9js/8YqPEEbZWC2gs0bSJlEyqUbeNLpLpIFPOzgAGoB+IyBybfhR6bZ
v4M2r27ePOJp+7FsVYAQ0Z12nLLwiCvehAFYRV/gUdbapv2hVdvTg9q8cS/qo6jh66SaUC91
xpp0XXLLFMWVCfomK4GAXBcTISwgJEJAnNysSm6iNAtBtLDdL0YoQ73rAthczwAgzSJPENts
FT6nqS06oLAECjSX/PSfu5ffn/E6geeH+xe8BvCRrf933093wPX+d/qXI+5CL1S5C+PIQEfA
OFe3epcF92hvoHAjjdK4WE5H/411VOoOU4mUaEVrECWpQMTBsK/LX+S0oGoQC4OlepZJu7Bj
R4LZVrwPHeqHgaBiHfMrl3dVjYihw99qxq5d4koG42XVx2lIHBNT2V2hCO284tDKImKYHoz5
f8DAxUaEzWnP0nXeN+EJ2xYD3nXSbHJ3B7vPTC4jE4CBeLkb+4qJ440bWW9iabP9MXFLW1FT
XrTN4LWxSgZCA/Dt93PUWg8sTEw3ujHrrWSoRpAL5LDlwNZn6Gtt8iUzcfZsWamWWr99f/j6
/IUqLH9+PD3dh15iEv32NAFCtsHGLDFVDVwfZLanbOIpHUus0qTlj2QcqjVVzbYCEa6a3UH/
jGJcjRgtfz5vCqMWBD2cO2GzeA+0+VK6uVo9avYe7pX6oi5GkAY8S+CHtEGtqug6QBfFXPAx
+ANZNW16cXlcdPpnu9DD76efnx8ejWj+RKifuP17uFj8LqPmB21wbPIxK4RBwYFaBlXoAasO
Zg/SploYYUHJj0m3mQY4IuSEcBx+WoeErXN6H0vTmNtkh5sFOQx92pQOokDKNk8xE69s9SSS
DtZrgr5rCiB1NzM8AocJawRErp7riiQnCwxg6fHrBRYUwexjOBqVljvGA+w57Qtj0Q/J4HJ8
H0JfSvcQh5O5aSidf6wzk+AE/GG6ONcEIB5123j3U18fQBUbbwzrVrs/FskemZt/A9OiYP7Z
fSsqqBkClZ9+e7mn26XLr0/P318eZV3jQ7ItKR3CrX7rNM5uf7aMXb77caZh8cXBeg8MQ+fa
WGDVpp9+kkslw0FtGzHO47S2xhgXWvaMd8CM6ZV+MPRBSxhISAZD6Q82tfs8/tZsQlZVHNM+
MXmaKFgklXAEEFRdzD+1PHKcmCci/QzcjnkWgZRmAjLmfh3OgwQe5NeiNqmOXncIJ2lFpQjw
bHOsPZMRWZKasm9q3aawdIw5p+EruyZPhiTmJJ/nmpGPNz4RdltmrX/AvB+HtdJvr464aVxq
AopuOZMt1qxophK+ESqAhNHlcMp+t3CMVo7Oo0XqspHoYLwbzt2wZQRe7dBYvS1POfO77atE
Owt0eMwWBZWlAjoWfpKFrDAjFt9GFEA0SSDboRpDOEWdc+qvYrvhvq4PU7sdiFR5S3B9CFvI
Z2ySJH1QlyqN7XZTJVtlAZf3vr6RTWV+pRMGrEwV1zCjwKwVLMNMkOmo1dvNwoDSgjpyIHRz
dmnvYBhOpTIxDWvl23bldgejWN9OtNqYFrsB2u0vQwSYZTTF+wTpcuhRYCieLxT/62ah3Hku
LS0OT9gUosyg/tsGCsrQTAuj8suzfQAkonceBujbM8V5/+FD0DfZOPiSdjydPWnRMvpuIfbB
0dphqbVQkwf8N80f357+/qb649OXl28sUOzuvt67qgpehojxf40wK4hmLMQxOu4dBpJeOA6X
81gxjm9EgjvAOF2bTN9shhAodI42AdHKRaR3aBbsKLL5Ssf+gKGh3nvVk4KgaTfWeKV6v3e3
IotFM2gesyhSvnzSgvj653u489cbxOMVyKwgueYy/oH2CI9JlTzWV52Dm0G6/PxCd0c78sMi
wBMpjhlCGCqVJWqzeelLzKfyGnnGcTL3RdEKh5AhbsBeD+1cMBhH4khRf3v69vAV47JgkI8v
z6cfJ/jn9Pzp7du37oWhjb3Ie0vGAD+fvu3wEo2lCsIi8RCgS47cRQ1THvMhEQIOPUqB0aI3
DsVNEYgaTgFoSf519OORIcCom2ObCDsfv+nYizxcbqUv9OxTnMnaBg3oCugvzz74zaSN9gZ6
4UOZaxv7BaH8uoZCFhzGOw9eVILYUyXdBFrEaHt779M7gx2dcnufaVUUCiszC84xByvXn9DE
AcUYxo7DUS8fl66WxVAL7c0HYyN6UE/sX9nbs4WaZhKovhVU1PapPpTh+C1UO9yzIcp9jFRn
2EF4rX1R5HD82X+zwv/3zOtexwCNAeTGXinES3TsC+tPn++e796g4vQJHa6inK5Z01LVLQwt
QWg4D31cl+F8CU+GJ1m6nkiXAUUDy3AFlwcIIhz5ePmqrIMZrQfQnXtL7OAIqJodUyW3iPzc
NJkh2m0gd601uwBeDxKc1h7b5wjDQkLLc8qkIRJKomSsmVnk+zPZDe2ryNPFlVvoyNY1F/Pg
Lx/wR5ZEO8WmIjC5Pg7oxJgyrro64dvNPQ5EywtbfdYhkNBaZ7dD4xBNiidybLdhwZam5VGL
ZJdrx9a0Dt12SbvTcax51S9CqQCnYzns0PjvS78aGpciIBu1j27QDqRvQn/ouvdQsOAGbQHE
JCuZ30lmHuRePMKFxRlvJm9E/NbMy3pHAp6Om407MVSXm/CFQIFriYvfwwCzcDqdrowVqT+6
rgQjiaCLRR1W8D5ro/BfZBDDbeKvIYqI5DpZup53tLdzdK6zMFs1dKjjO0loWHDwt1t5cwyM
FCTrTbyD+VE7QE90XPm03REOUrznpq+bsi/CqUODyvKk+0q8gimgLMt0mZPJ+1JPuaON19eg
Re+acEdawKxuy91hpB5giLC1gBxvsBioLNfmwoqYidKCTdQJlnqg52Rcj+krOn9YDwPr95aN
f4pGeEFa8BFxRURDAvx2D9sJmaqBSHC7vsAYR2XuudcxeMb4rIbFoiUanTU9BGphLc75Xce0
b04qcuXifK9umiEBntgqgpvy5hiygjoXtaQznhfVIMtOOwSHHHDxD0D2X+bF1Oyy8uwfv56T
l9q3GtmVIxOFXEy2Wrxy/Z7BcpYtcouUi8cOxNfxKDAi+rVWSFQ+eneEw1Ake9oha+/Zb8qN
XujfIPCvSGkJgzPfbzcdhkhhxxAzb/8C5rTRbx0IkdMm261+rLUarJsoqS53aRwn0rvJOcAG
JxDMf/xyoUmnnuYRMLlQMwlxiqSrbq3zeewd0yxeQ2Y8wcQex1Z/KtJXnm4jD1D925s8lbeN
snWiSjfVqIaukygzcx5nIEssFXwwRi9hPfZVFRFvbqRT/u5GvQ3EgctVmgFj3E0/40S4jpGP
yeWPNimZJdMma/59ehTTAiIRAqxIHcq1wBaeJXLhtaI6QjtiUjLq8VFD1Fgfudy975Od9Qe5
U914juH09Iy6NhrGMryu5u7+5CqV+zFmereaIUYsNJ1eeXRhJK9WJzUG6x7YenNtaadjqOlA
SCZJkE1QwT2X1T4fdD2c7ISHsqa7WOMYfRMpx0vQvLyOhBKmi9YDy7vCI1OMlVuBU/RaUzV4
cVr8kLiBdyv8kB1iMUcjWYUuztUwWxrurrjxywl6s8VhRVwkQJUmDVaftbdB93sADOpdagSe
w8VFX1lS+21zsJPsfhxLPQaFoDcBq5Vw62qJY3RouAucX94MJpF8OIKC2BMHVvuVjQxDbtqI
PInw60Pg0/YmB3V1LA6x8o5Wv3GZgZgkQPEysXLoFOGelq+Jq+zjKbvDMVFDonjVg8KVPIg4
pTcbb3ZRxZH2h2ZlmwDHz0DPWj0DlFwQoY+2k3UEKjVBVTpiM7BxixJSC1kAzNUbjmPElWww
dB/eLd32S4Nfr0LnAkFRCw79+z+W63m3HyICAA==

--gBBFr7Ir9EOA20Yy--
