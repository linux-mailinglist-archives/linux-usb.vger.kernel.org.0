Return-Path: <linux-usb+bounces-10222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 384518C2B3A
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 22:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA8F1C23635
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566F950293;
	Fri, 10 May 2024 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP4FLWBc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEF150A62
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715373455; cv=none; b=HQ2D2SzbjRESo25Qv95Xrb3YxhUth8RFRR2goeQBYPV4id3D+8kyjo2PjsiviiL8CEkj6+u8xVjHCidNmAQij6N8fgLCxEgEPH2MBSiJDj/YuX3WzFyvG+vo0Y7cAzm6aAckgUBTr8q+5YZhvWUNJo9Ykr5fTXEDlHPXzc+j3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715373455; c=relaxed/simple;
	bh=5QeR9EnivGuex1ZRrWJkamTawpP6E4a5dW/fwkOUBhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JOMQJZOMYHDhewyeI9nXqrPKV0kiVRcWIGxR1eWgpa8jWZ09dFaAFVMqQgPKj9VBtspT1j0zwqfVrxXcCUsVoYAAyOsIpacomXgPAKOsT6kvZuHdm5gualndJ1rZbqfLQ0JHT9XYpdgk2VeWkyXPzW57BRPG1mwOYiw3c6aRs1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP4FLWBc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715373452; x=1746909452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5QeR9EnivGuex1ZRrWJkamTawpP6E4a5dW/fwkOUBhQ=;
  b=UP4FLWBcAzi5NAD7+bSzF2SFQwgg43WNC+DbcGdUrFAIm084dmETaPSm
   jf27aQKsrRWGG2CK+BY6QNnyTDulTag2fNLCT2ho18zdsObgQSunQrG+4
   JP+xow3OeA0knMoTm9D/BCJBPIG/3WMCq0G983nRGijujwOxgZetx13zn
   SFk6ZrkYQV5YAdfeKz2dBOKbgJvCnpl6sIxBTQOnlvdAXxxqIBmOG37u6
   mF3vJh7EMzr0i7PJVVtWu54/fIM1V6/n4oJxodLWMsLvwVUsF5r1LAyVZ
   B3HHjL8keFde5TU/o7XhPX84Kdrj5CbjF1VnNMRi/Yb3Ut2Xlh/zYSiBA
   Q==;
X-CSE-ConnectionGUID: 1w3lEQkiR0OsCun61Sv9YA==
X-CSE-MsgGUID: gRFC+8xVTG+W6F+5eBumxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11209823"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11209823"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 13:37:32 -0700
X-CSE-ConnectionGUID: Hc+ffktbQVilhd2WmokswA==
X-CSE-MsgGUID: 9QLQqzaZRwuW4cCta+0L4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34402308"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2024 13:37:30 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Wzf-0006Xr-2r;
	Fri, 10 May 2024 20:37:27 +0000
Date: Sat, 11 May 2024 04:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [usb:usb-testing 5/12]
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: passing
 argument 1 of 'devm_drm_dp_hpd_bridge_add' from incompatible pointer type
Message-ID: <202405110428.TMCfb1Ut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   344f74cf531d90245e1296b3ffbaa7df99dd18f6
commit: 718b36a7b49acbba36546371db2d235271ceb06c [5/12] usb: typec: qcom-pmic-typec: split HPD bridge alloc and registration
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240511/202405110428.TMCfb1Ut-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110428.TMCfb1Ut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110428.TMCfb1Ut-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c: In function 'qcom_pmic_typec_probe':
>> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: passing argument 1 of 'devm_drm_dp_hpd_bridge_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
     113 |         ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
         |                                          ~~~~^~~~~
         |                                              |
         |                                              struct device *
   In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:21:
   include/drm/bridge/aux-bridge.h:36:71: note: expected 'struct auxiliary_device *' but argument is of type 'struct device *'
      36 | static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:15: error: too many arguments to function 'devm_drm_dp_hpd_bridge_add'
     113 |         ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/bridge/aux-bridge.h:36:19: note: declared here
      36 | static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/devm_drm_dp_hpd_bridge_add +113 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c

    36	
    37	static int qcom_pmic_typec_probe(struct platform_device *pdev)
    38	{
    39		struct pmic_typec *tcpm;
    40		struct device *dev = &pdev->dev;
    41		struct device_node *np = dev->of_node;
    42		const struct pmic_typec_resources *res;
    43		struct regmap *regmap;
    44		struct auxiliary_device *bridge_dev;
    45		u32 base;
    46		int ret;
    47	
    48		res = of_device_get_match_data(dev);
    49		if (!res)
    50			return -ENODEV;
    51	
    52		tcpm = devm_kzalloc(dev, sizeof(*tcpm), GFP_KERNEL);
    53		if (!tcpm)
    54			return -ENOMEM;
    55	
    56		tcpm->dev = dev;
    57		tcpm->tcpc.init = qcom_pmic_typec_init;
    58	
    59		regmap = dev_get_regmap(dev->parent, NULL);
    60		if (!regmap) {
    61			dev_err(dev, "Failed to get regmap\n");
    62			return -ENODEV;
    63		}
    64	
    65		ret = of_property_read_u32_index(np, "reg", 0, &base);
    66		if (ret)
    67			return ret;
    68	
    69		ret = qcom_pmic_typec_port_probe(pdev, tcpm,
    70						 res->port_res, regmap, base);
    71		if (ret)
    72			return ret;
    73	
    74		if (res->pdphy_res) {
    75			ret = of_property_read_u32_index(np, "reg", 1, &base);
    76			if (ret)
    77				return ret;
    78	
    79			ret = qcom_pmic_typec_pdphy_probe(pdev, tcpm,
    80							  res->pdphy_res, regmap, base);
    81			if (ret)
    82				return ret;
    83		} else {
    84			ret = qcom_pmic_typec_pdphy_stub_probe(pdev, tcpm);
    85			if (ret)
    86				return ret;
    87		}
    88	
    89		platform_set_drvdata(pdev, tcpm);
    90	
    91		tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
    92		if (!tcpm->tcpc.fwnode)
    93			return -EINVAL;
    94	
    95		bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
    96		if (IS_ERR(bridge_dev))
    97			return PTR_ERR(bridge_dev);
    98	
    99		tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
   100		if (IS_ERR(tcpm->tcpm_port)) {
   101			ret = PTR_ERR(tcpm->tcpm_port);
   102			goto fwnode_remove;
   103		}
   104	
   105		ret = tcpm->port_start(tcpm, tcpm->tcpm_port);
   106		if (ret)
   107			goto port_unregister;
   108	
   109		ret = tcpm->pdphy_start(tcpm, tcpm->tcpm_port);
   110		if (ret)
   111			goto port_stop;
   112	
 > 113		ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
   114		if (ret)
   115			goto pdphy_stop;
   116	
   117		return 0;
   118	
   119	pdphy_stop:
   120		tcpm->pdphy_stop(tcpm);
   121	port_stop:
   122		tcpm->port_stop(tcpm);
   123	port_unregister:
   124		tcpm_unregister_port(tcpm->tcpm_port);
   125	fwnode_remove:
   126		fwnode_remove_software_node(tcpm->tcpc.fwnode);
   127	
   128		return ret;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

