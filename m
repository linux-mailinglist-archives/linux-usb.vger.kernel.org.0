Return-Path: <linux-usb+bounces-10228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE5A8C2FC2
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2024 08:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B86C1F23070
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2024 06:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034044CB2E;
	Sat, 11 May 2024 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grV1l9Rm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB22B47779
	for <linux-usb@vger.kernel.org>; Sat, 11 May 2024 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715407373; cv=none; b=fFwqNkoWAqUO6B67wFWNwY89365pkAy0zkYfwY4rys1YklJi8/6PY048NXv2BfrFxg0SGoxEtK0mejkSqJ/Ur7zFeEBhm7JaSFh2L23xmH+ZJiCi40EhvJbMUbp9ehQ53gIhjkDYM/fu1iNll44vdQ2k7KnTheJWD0B74cNrfus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715407373; c=relaxed/simple;
	bh=1wZG6LaLotadk6a2e/CF0OMS1V6UkI30VjGQ3B17trk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mm5I1MiG0Yct/baCRS2+qFw6HpzmONqH2WcVSwnaa9a0ZOZDBZMLLvTBc7lBHzeT0N6mzqaw4h2Bho2ch389JU2V9Rn8maWYha7mwMx1hvIJ0yhpf/y4/GaiCSmBcN3iCdu4AMnEWuyULC9fN+Okoo72kziDYtzbHiC3lTBwBcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grV1l9Rm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715407372; x=1746943372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wZG6LaLotadk6a2e/CF0OMS1V6UkI30VjGQ3B17trk=;
  b=grV1l9RmZjZAd9hTXOpNtkpbZtSTYkdSxGPqmvaOMu5ze374OOqDtc0h
   DRK41y8O4OaKDYlMe9rpuwn+Dxv2RKWDtUYTuQxoziE23sVX7iAW62PFN
   c9S00sGiShFnKD+l6JwuzT9x1wMU6fftc6gvch1TJqJAkMr+FWH3rCco3
   znsdzezvaQXFQlIIOqeFGxbF5UZI8X0u5ssYzA9huu4wak6n5bAMnR+LE
   qWmlyifb+H2LCAa+s30drPGG36k308kebfAbaUfNITEQMfHDYBrUj8+yG
   u9uA2U1GDgjyOzAB+QUcSJ0AhlJhZabDxj6f5eAuLMP97PHbYQn4+BJ46
   Q==;
X-CSE-ConnectionGUID: LUC0v4LgSUWz6SZWtUAc8Q==
X-CSE-MsgGUID: 7SSqrwCDT1CdR5hNb/DTEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22815107"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="22815107"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 23:02:51 -0700
X-CSE-ConnectionGUID: pkYHzexGRgmYwCdx8qL4xw==
X-CSE-MsgGUID: zwKnwuhYRwK0v66X4NSsjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="61007822"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 May 2024 23:02:49 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5fok-00070d-2Z;
	Sat, 11 May 2024 06:02:46 +0000
Date: Sat, 11 May 2024 14:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [usb:usb-testing 5/12]
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: too many
 arguments to function call, expected single argument 'adev', have 2
 arguments
Message-ID: <202405111302.6y9oqb58-lkp@intel.com>
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
config: arm-randconfig-002-20240511 (https://download.01.org/0day-ci/archive/20240511/202405111302.6y9oqb58-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111302.6y9oqb58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111302.6y9oqb58-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:15:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: too many arguments to function call, expected single argument 'adev', have 2 arguments
     113 |         ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~            ^~~~~~~~~~
   include/drm/bridge/aux-bridge.h:36:19: note: 'devm_drm_dp_hpd_bridge_add' declared here
      36 | static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
         |                   ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/adev +113 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c

  > 15	#include <linux/regulator/consumer.h>
    16	#include <linux/slab.h>
    17	#include <linux/usb/role.h>
    18	#include <linux/usb/tcpm.h>
    19	#include <linux/usb/typec_mux.h>
    20	
    21	#include <drm/bridge/aux-bridge.h>
    22	
    23	#include "qcom_pmic_typec.h"
    24	#include "qcom_pmic_typec_pdphy.h"
    25	#include "qcom_pmic_typec_port.h"
    26	
    27	struct pmic_typec_resources {
    28		const struct pmic_typec_pdphy_resources	*pdphy_res;
    29		const struct pmic_typec_port_resources	*port_res;
    30	};
    31	
    32	static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
    33	{
    34		return 0;
    35	}
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

