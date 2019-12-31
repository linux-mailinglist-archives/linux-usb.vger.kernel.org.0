Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4DC12D760
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2019 10:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfLaJYJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Dec 2019 04:24:09 -0500
Received: from mga07.intel.com ([134.134.136.100]:7759 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbfLaJYJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Dec 2019 04:24:09 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Dec 2019 01:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,378,1571727600"; 
   d="scan'208";a="393487846"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Dec 2019 01:24:06 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1imDl0-0007lq-7r; Tue, 31 Dec 2019 17:24:06 +0800
Date:   Tue, 31 Dec 2019 17:23:57 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 36/41] drivers/usb/host/ohci-at91.c:449:39: sparse:
 sparse: invalid assignment: &=
Message-ID: <201912311748.JrMLtW49%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Krzysztof,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   4e52af1ccaa2d979894d4d059037ff9ec4d26a83
commit: 88eaaecc44461f9fb147bf7ee6ccc6d4e9fc23e0 [36/41] usb: host: Enable compile testing for some of drivers
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-129-g341daf20-dirty
        git checkout 88eaaecc44461f9fb147bf7ee6ccc6d4e9fc23e0
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/host/ohci-at91.c:449:39: sparse: sparse: invalid assignment: &=
>> drivers/usb/host/ohci-at91.c:449:39: sparse:    left side has type unsigned int
>> drivers/usb/host/ohci-at91.c:449:39: sparse:    right side has type restricted __le32
   drivers/usb/host/ohci-at91.c:452:39: sparse: sparse: invalid assignment: |=
   drivers/usb/host/ohci-at91.c:452:39: sparse:    left side has type unsigned int
   drivers/usb/host/ohci-at91.c:452:39: sparse:    right side has type restricted __le32
   drivers/usb/host/ohci-at91.c:455:39: sparse: sparse: invalid assignment: |=
   drivers/usb/host/ohci-at91.c:455:39: sparse:    left side has type unsigned int
   drivers/usb/host/ohci-at91.c:455:39: sparse:    right side has type restricted __le32
--
>> drivers/usb/host/ohci-s3c2410.c:277:39: sparse: sparse: invalid assignment: |=
>> drivers/usb/host/ohci-s3c2410.c:277:39: sparse:    left side has type unsigned int
>> drivers/usb/host/ohci-s3c2410.c:277:39: sparse:    right side has type restricted __le32
   drivers/usb/host/ohci-s3c2410.c:280:39: sparse: sparse: invalid assignment: |=
   drivers/usb/host/ohci-s3c2410.c:280:39: sparse:    left side has type unsigned int
   drivers/usb/host/ohci-s3c2410.c:280:39: sparse:    right side has type restricted __le32
--
>> drivers/usb/host/ehci-mv.c:178:23: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/usb/host/ehci-mv.c:178:20: sparse: sparse: incorrect type in assignment (different address spaces)
>> drivers/usb/host/ehci-mv.c:178:20: sparse:    expected struct ehci_caps [noderef] <asn:2> *caps
>> drivers/usb/host/ehci-mv.c:178:20: sparse:    got struct ehci_caps *

vim +449 drivers/usb/host/ohci-at91.c

2e2aa1bc7eff90 Wenyou Yang       2016-08-23  323  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  324  /*
aa6e52a35d388e Thomas Petazzoni  2011-07-13  325   * Look at the control requests to the root hub and see if we need to override.
aa6e52a35d388e Thomas Petazzoni  2011-07-13  326   */
aa6e52a35d388e Thomas Petazzoni  2011-07-13  327  static int ohci_at91_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
aa6e52a35d388e Thomas Petazzoni  2011-07-13  328  				 u16 wIndex, char *buf, u16 wLength)
aa6e52a35d388e Thomas Petazzoni  2011-07-13  329  {
d4f09e28d7bc5c Jingoo Han        2013-07-30  330  	struct at91_usbh_data *pdata = dev_get_platdata(hcd->self.controller);
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  331  	struct ohci_at91_priv *ohci_at91 = hcd_to_ohci_at91_priv(hcd);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  332  	struct usb_hub_descriptor *desc;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  333  	int ret = -EINVAL;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  334  	u32 *data = (u32 *)buf;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  335  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  336  	dev_dbg(hcd->self.controller,
aa6e52a35d388e Thomas Petazzoni  2011-07-13  337  		"ohci_at91_hub_control(%p,0x%04x,0x%04x,0x%04x,%p,%04x)\n",
aa6e52a35d388e Thomas Petazzoni  2011-07-13  338  		hcd, typeReq, wValue, wIndex, buf, wLength);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  339  
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  340  	wIndex--;
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  341  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  342  	switch (typeReq) {
aa6e52a35d388e Thomas Petazzoni  2011-07-13  343  	case SetPortFeature:
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  344  		switch (wValue) {
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  345  		case USB_PORT_FEAT_POWER:
aa6e52a35d388e Thomas Petazzoni  2011-07-13  346  			dev_dbg(hcd->self.controller, "SetPortFeat: POWER\n");
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  347  			if (valid_port(wIndex)) {
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  348  				ohci_at91_usb_set_power(pdata, wIndex, 1);
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  349  				ret = 0;
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  350  			}
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  351  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  352  			goto out;
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  353  
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  354  		case USB_PORT_FEAT_SUSPEND:
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  355  			dev_dbg(hcd->self.controller, "SetPortFeat: SUSPEND\n");
85550f9148a852 Jelle Martijn Kok 2017-02-21  356  			if (valid_port(wIndex) && ohci_at91->sfr_regmap) {
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  357  				ohci_at91_port_suspend(ohci_at91->sfr_regmap,
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  358  						       1);
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  359  				return 0;
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  360  			}
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  361  			break;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  362  		}
aa6e52a35d388e Thomas Petazzoni  2011-07-13  363  		break;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  364  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  365  	case ClearPortFeature:
aa6e52a35d388e Thomas Petazzoni  2011-07-13  366  		switch (wValue) {
aa6e52a35d388e Thomas Petazzoni  2011-07-13  367  		case USB_PORT_FEAT_C_OVER_CURRENT:
aa6e52a35d388e Thomas Petazzoni  2011-07-13  368  			dev_dbg(hcd->self.controller,
aa6e52a35d388e Thomas Petazzoni  2011-07-13  369  				"ClearPortFeature: C_OVER_CURRENT\n");
aa6e52a35d388e Thomas Petazzoni  2011-07-13  370  
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  371  			if (valid_port(wIndex)) {
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  372  				pdata->overcurrent_changed[wIndex] = 0;
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  373  				pdata->overcurrent_status[wIndex] = 0;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  374  			}
aa6e52a35d388e Thomas Petazzoni  2011-07-13  375  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  376  			goto out;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  377  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  378  		case USB_PORT_FEAT_OVER_CURRENT:
aa6e52a35d388e Thomas Petazzoni  2011-07-13  379  			dev_dbg(hcd->self.controller,
aa6e52a35d388e Thomas Petazzoni  2011-07-13  380  				"ClearPortFeature: OVER_CURRENT\n");
aa6e52a35d388e Thomas Petazzoni  2011-07-13  381  
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  382  			if (valid_port(wIndex))
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  383  				pdata->overcurrent_status[wIndex] = 0;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  384  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  385  			goto out;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  386  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  387  		case USB_PORT_FEAT_POWER:
aa6e52a35d388e Thomas Petazzoni  2011-07-13  388  			dev_dbg(hcd->self.controller,
aa6e52a35d388e Thomas Petazzoni  2011-07-13  389  				"ClearPortFeature: POWER\n");
aa6e52a35d388e Thomas Petazzoni  2011-07-13  390  
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  391  			if (valid_port(wIndex)) {
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  392  				ohci_at91_usb_set_power(pdata, wIndex, 0);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  393  				return 0;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  394  			}
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  395  			break;
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  396  
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  397  		case USB_PORT_FEAT_SUSPEND:
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  398  			dev_dbg(hcd->self.controller, "ClearPortFeature: SUSPEND\n");
85550f9148a852 Jelle Martijn Kok 2017-02-21  399  			if (valid_port(wIndex) && ohci_at91->sfr_regmap) {
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  400  				ohci_at91_port_suspend(ohci_at91->sfr_regmap,
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  401  						       0);
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  402  				return 0;
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  403  			}
2e2aa1bc7eff90 Wenyou Yang       2016-08-23  404  			break;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  405  		}
aa6e52a35d388e Thomas Petazzoni  2011-07-13  406  		break;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  407  	}
aa6e52a35d388e Thomas Petazzoni  2011-07-13  408  
42b59eba718a14 Laurent Pinchart  2014-04-16  409  	ret = ohci_hub_control(hcd, typeReq, wValue, wIndex + 1, buf, wLength);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  410  	if (ret)
aa6e52a35d388e Thomas Petazzoni  2011-07-13  411  		goto out;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  412  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  413  	switch (typeReq) {
aa6e52a35d388e Thomas Petazzoni  2011-07-13  414  	case GetHubDescriptor:
aa6e52a35d388e Thomas Petazzoni  2011-07-13  415  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  416  		/* update the hub's descriptor */
aa6e52a35d388e Thomas Petazzoni  2011-07-13  417  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  418  		desc = (struct usb_hub_descriptor *)buf;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  419  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  420  		dev_dbg(hcd->self.controller, "wHubCharacteristics 0x%04x\n",
aa6e52a35d388e Thomas Petazzoni  2011-07-13  421  			desc->wHubCharacteristics);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  422  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  423  		/* remove the old configurations for power-switching, and
aa6e52a35d388e Thomas Petazzoni  2011-07-13  424  		 * over-current protection, and insert our new configuration
aa6e52a35d388e Thomas Petazzoni  2011-07-13  425  		 */
aa6e52a35d388e Thomas Petazzoni  2011-07-13  426  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  427  		desc->wHubCharacteristics &= ~cpu_to_le16(HUB_CHAR_LPSM);
a9c49bcd0a4fe6 Sergei Shtylyov   2015-01-19  428  		desc->wHubCharacteristics |=
a9c49bcd0a4fe6 Sergei Shtylyov   2015-01-19  429  			cpu_to_le16(HUB_CHAR_INDV_PORT_LPSM);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  430  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  431  		if (pdata->overcurrent_supported) {
aa6e52a35d388e Thomas Petazzoni  2011-07-13  432  			desc->wHubCharacteristics &= ~cpu_to_le16(HUB_CHAR_OCPM);
a9c49bcd0a4fe6 Sergei Shtylyov   2015-01-19  433  			desc->wHubCharacteristics |=
a9c49bcd0a4fe6 Sergei Shtylyov   2015-01-19  434  				cpu_to_le16(HUB_CHAR_INDV_PORT_OCPM);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  435  		}
aa6e52a35d388e Thomas Petazzoni  2011-07-13  436  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  437  		dev_dbg(hcd->self.controller, "wHubCharacteristics after 0x%04x\n",
aa6e52a35d388e Thomas Petazzoni  2011-07-13  438  			desc->wHubCharacteristics);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  439  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  440  		return ret;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  441  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  442  	case GetPortStatus:
aa6e52a35d388e Thomas Petazzoni  2011-07-13  443  		/* check port status */
aa6e52a35d388e Thomas Petazzoni  2011-07-13  444  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  445  		dev_dbg(hcd->self.controller, "GetPortStatus(%d)\n", wIndex);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  446  
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  447  		if (valid_port(wIndex)) {
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  448  			if (!ohci_at91_usb_get_power(pdata, wIndex))
aa6e52a35d388e Thomas Petazzoni  2011-07-13 @449  				*data &= ~cpu_to_le32(RH_PS_PPS);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  450  
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  451  			if (pdata->overcurrent_changed[wIndex])
aa6e52a35d388e Thomas Petazzoni  2011-07-13  452  				*data |= cpu_to_le32(RH_PS_OCIC);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  453  
0ee6d1eeef7bf4 Nicolas Ferre     2012-03-21  454  			if (pdata->overcurrent_status[wIndex])
aa6e52a35d388e Thomas Petazzoni  2011-07-13  455  				*data |= cpu_to_le32(RH_PS_POCI);
aa6e52a35d388e Thomas Petazzoni  2011-07-13  456  		}
aa6e52a35d388e Thomas Petazzoni  2011-07-13  457  	}
aa6e52a35d388e Thomas Petazzoni  2011-07-13  458  
aa6e52a35d388e Thomas Petazzoni  2011-07-13  459   out:
aa6e52a35d388e Thomas Petazzoni  2011-07-13  460  	return ret;
aa6e52a35d388e Thomas Petazzoni  2011-07-13  461  }
aa6e52a35d388e Thomas Petazzoni  2011-07-13  462  

:::::: The code at line 449 was first introduced by commit
:::::: aa6e52a35d388e730f4df0ec2ec48294590cc459 at91: at91-ohci: support overcurrent notification

:::::: TO: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
