Return-Path: <linux-usb+bounces-9697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF48B00C9
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 07:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CACDE1F23C89
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 05:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF2A1552FC;
	Wed, 24 Apr 2024 05:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhumiuNE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81181154BFB
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 05:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713935056; cv=none; b=ndfK1LXEiBPuFaX3na1LG8PIqpsG4PD40+2qWvUKzZAfmKG/QNkZZ5yKssApOr+DLGZvuM4/GkhCkQALvSJJq7b5LI7ZHcen9rHJJcXU+bIcMPcpzxqKnTwmz2ToRoaukoG0YdInk7nh8t6G6lgQCesmKEVYcKZWkssgc3emTX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713935056; c=relaxed/simple;
	bh=w2s6+GD9x0ESMek+h6hNKm6/PRiAeMHcEF/lndj+Gl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YcPnlc/eJQg82s6zeUqkbwPH3Pxw1ZMjmmnZ/kNS7E1g3Yzk3UNkHEFtTopshlfmqpbX7po0VWsIVgCGEeENpeXn7crCTWCzJgRgSHaERq/cD/Ig+7pv0BtXWlMv72dPrrnwrUliHAIOjVfl7hs74ibRqZC+dd281xrIdNFoRQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhumiuNE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713935055; x=1745471055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w2s6+GD9x0ESMek+h6hNKm6/PRiAeMHcEF/lndj+Gl4=;
  b=UhumiuNEWA+90oXvv6vLgcREwOUDhyO7aCYxYmfdsnLt/uV+vMnuS4VM
   A/b5JWFJXz/M/FIfzm1hfJvDr7j/6jrINdzldHGFEexfISZrWjVjDDHvQ
   Nuk9KOl1v268UEzDg4K1NshAvt4E2WiR2ttbGqHPoz+o6vi78kI9/MBJN
   YbMfWSfRCBWQicQKqpP/P9FFsgEkMfBrfA+PCtlnfhGcv1UpaGCyHQABh
   JJl0o6d9ZH9kFTVnr1KVdvVPOsgUBWk4UfrfImQSxzsRAVlNHGr5lBdxp
   srlSzi9vhz0LlqRKK9QC1mrVk9B/fjwNACnI1WMzrLuiTs8zLa7fDnplC
   A==;
X-CSE-ConnectionGUID: t5+AHNhcTsWvxHru3F5SSw==
X-CSE-MsgGUID: ur7uzWGyQt6rmB+AenUyRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9398361"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9398361"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 22:03:59 -0700
X-CSE-ConnectionGUID: +ps7u2rFRuWzagZBEl+dBg==
X-CSE-MsgGUID: UK52IAAeTiiDvECd1DQR/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="24625373"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Apr 2024 22:03:57 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzUnT-0000si-1c;
	Wed, 24 Apr 2024 05:03:55 +0000
Date: Wed, 24 Apr 2024 13:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [usb:usb-testing 7/12] drivers/usb/dwc3/core.c:1482:69: warning:
 '%d' directive output may be truncated writing between 1 and 11 bytes into a
 region of size 4
Message-ID: <202404241215.Mib19Cu7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   a160e1202ca318a85c70cf5831f172cc79a24c57
commit: 846b4bacf2d48212f271fc1ef7488bcdf2c75bcb [7/12] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240424/202404241215.Mib19Cu7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241215.Mib19Cu7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241215.Mib19Cu7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/core.c: In function 'dwc3_core_get_phy':
>> drivers/usb/dwc3/core.c:1482:69: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 4 [-Wformat-truncation=]
    1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
         |                                                                     ^~
   drivers/usb/dwc3/core.c:1482:63: note: directive argument in the range [-2147483641, 254]
    1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
         |                                                               ^~~~~~~~~
   drivers/usb/dwc3/core.c:1482:25: note: 'snprintf' output between 7 and 17 bytes into a destination of size 9
    1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1499:68: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 4 [-Wformat-truncation=]
    1499 |                         snprintf(phy_name, sizeof(phy_name), "usb3-%d", i);
         |                                                                    ^~
   drivers/usb/dwc3/core.c:1499:62: note: directive argument in the range [-2147483641, 254]
    1499 |                         snprintf(phy_name, sizeof(phy_name), "usb3-%d", i);
         |                                                              ^~~~~~~~~
   drivers/usb/dwc3/core.c:1499:25: note: 'snprintf' output between 7 and 17 bytes into a destination of size 9
    1499 |                         snprintf(phy_name, sizeof(phy_name), "usb3-%d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1482 drivers/usb/dwc3/core.c

  1445	
  1446	static int dwc3_core_get_phy(struct dwc3 *dwc)
  1447	{
  1448		struct device		*dev = dwc->dev;
  1449		struct device_node	*node = dev->of_node;
  1450		char phy_name[9];
  1451		int ret;
  1452		int i;
  1453	
  1454		if (node) {
  1455			dwc->usb2_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
  1456			dwc->usb3_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 1);
  1457		} else {
  1458			dwc->usb2_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
  1459			dwc->usb3_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB3);
  1460		}
  1461	
  1462		if (IS_ERR(dwc->usb2_phy)) {
  1463			ret = PTR_ERR(dwc->usb2_phy);
  1464			if (ret == -ENXIO || ret == -ENODEV)
  1465				dwc->usb2_phy = NULL;
  1466			else
  1467				return dev_err_probe(dev, ret, "no usb2 phy configured\n");
  1468		}
  1469	
  1470		if (IS_ERR(dwc->usb3_phy)) {
  1471			ret = PTR_ERR(dwc->usb3_phy);
  1472			if (ret == -ENXIO || ret == -ENODEV)
  1473				dwc->usb3_phy = NULL;
  1474			else
  1475				return dev_err_probe(dev, ret, "no usb3 phy configured\n");
  1476		}
  1477	
  1478		for (i = 0; i < dwc->num_usb2_ports; i++) {
  1479			if (dwc->num_usb2_ports == 1)
  1480				snprintf(phy_name, sizeof(phy_name), "usb2-phy");
  1481			else
> 1482				snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
  1483	
  1484			dwc->usb2_generic_phy[i] = devm_phy_get(dev, phy_name);
  1485			if (IS_ERR(dwc->usb2_generic_phy[i])) {
  1486				ret = PTR_ERR(dwc->usb2_generic_phy[i]);
  1487				if (ret == -ENOSYS || ret == -ENODEV)
  1488					dwc->usb2_generic_phy[i] = NULL;
  1489				else
  1490					return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
  1491								phy_name);
  1492			}
  1493		}
  1494	
  1495		for (i = 0; i < dwc->num_usb3_ports; i++) {
  1496			if (dwc->num_usb3_ports == 1)
  1497				snprintf(phy_name, sizeof(phy_name), "usb3-phy");
  1498			else
  1499				snprintf(phy_name, sizeof(phy_name), "usb3-%d", i);
  1500	
  1501			dwc->usb3_generic_phy[i] = devm_phy_get(dev, phy_name);
  1502			if (IS_ERR(dwc->usb3_generic_phy[i])) {
  1503				ret = PTR_ERR(dwc->usb3_generic_phy[i]);
  1504				if (ret == -ENOSYS || ret == -ENODEV)
  1505					dwc->usb3_generic_phy[i] = NULL;
  1506				else
  1507					return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
  1508								phy_name);
  1509			}
  1510		}
  1511	
  1512		return 0;
  1513	}
  1514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

