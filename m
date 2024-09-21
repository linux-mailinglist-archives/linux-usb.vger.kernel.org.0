Return-Path: <linux-usb+bounces-15276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5D97DBEF
	for <lists+linux-usb@lfdr.de>; Sat, 21 Sep 2024 09:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E884C1C211DF
	for <lists+linux-usb@lfdr.de>; Sat, 21 Sep 2024 07:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFA614EC7E;
	Sat, 21 Sep 2024 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2AEDzg7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CD538F9C
	for <linux-usb@vger.kernel.org>; Sat, 21 Sep 2024 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726902698; cv=none; b=bdcOdukJMF2TR8ySpeQtjgMUUMmkdaZIUu53uQ9w+YzLVxOxqFCK//+X5A4/9kjEsryhermiHaeqx56MeB2c5cFv11UyhNX15AwfrjULWAP8cN06Jfcg6GUC6/CbrjdRNNMLkCeB06sCCg+FDvc5DX+z2XHoXMiHI6UgviifVrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726902698; c=relaxed/simple;
	bh=hH41RHYKw4lqHr7XX6POAThxUbZ8bCohv68dNVoXk5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTRD9Lb4zG7Zr8pJzzTlYb4KvqXOKF6Sr+Kd/wV0MZDDBWZeDd5B86G26lGu8rIT9BUoSXKmlnlYr/1D+GdX7OZ9ZVgbwcBGdtyCsgsFl7YLNI4qP7AOSZEIB7hwefnM+m53KyW3WoLnlVxPnqpNkh44oo7mCsvmKT8C6mdF+hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2AEDzg7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726902695; x=1758438695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hH41RHYKw4lqHr7XX6POAThxUbZ8bCohv68dNVoXk5I=;
  b=k2AEDzg7Hm7JvZtAfqeFlNhVDMl2FKXbk889soEJfmA+HNoN6/uFPunV
   0fjw3X98c2tkhGlt+Tk455nM7Y4xYAszZRo+u4LWEysDQkBeFG8n1/InE
   2nmBjnqrvPTgB1pLcLKFSqg6qxrOU4JndwMjnwaVqYGNzV6t55bBzh9vH
   RyyD8nRwMkHgc72/xMHwzZn7lYHaHDoYF5DPqJcuRP7FObwe+78vOWmko
   Hi0SfIHkRlKZhXUllPKPZQbk6KVOJb6Jqqj6hI+FaYDeuQ+4cpgFeC6M2
   UVm5WlSznm5+MCKGaKTzfPUG/GqCa/d6uNL+Ep2T6pDCXwcv2vth7leWP
   w==;
X-CSE-ConnectionGUID: +5Xoj8OjTrG+ObNU5aWGvA==
X-CSE-MsgGUID: IMdsF2qRTMe07VDHTa0nwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37048611"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="37048611"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 00:11:34 -0700
X-CSE-ConnectionGUID: LW2f+v8+QbK2TXDTZwLecw==
X-CSE-MsgGUID: 0cus1x7xSPqo0v/a888WbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="70682292"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2024 00:11:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sruHA-000FBb-2d;
	Sat, 21 Sep 2024 07:11:28 +0000
Date: Sat, 21 Sep 2024 15:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
Message-ID: <202409211431.LpvxyX25-lkp@intel.com>
References: <20240910101527.603452-7-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101527.603452-7-ukaszb@chromium.org>

Hi Łukasz,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus lee-mfd/for-mfd-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.11 next-20240920]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ukasz-Bartosik/platform-chrome-Update-ChromeOS-EC-header-for-UCSI/20240910-182729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240910101527.603452-7-ukaszb%40chromium.org
patch subject: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
config: x86_64-buildonly-randconfig-005-20240921 (https://download.01.org/0day-ci/archive/20240921/202409211431.LpvxyX25-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211431.LpvxyX25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211431.LpvxyX25-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "genl_register_family" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!
>> ERROR: modpost: "genl_unregister_family" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!
>> ERROR: modpost: "__alloc_skb" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!
>> ERROR: modpost: "genlmsg_put" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!
>> ERROR: modpost: "nla_put" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!
>> ERROR: modpost: "skb_trim" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!
>> ERROR: modpost: "sk_skb_reason_drop" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!
>> ERROR: modpost: "init_net" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!
>> ERROR: modpost: "netlink_broadcast_filtered" [drivers/usb/typec/ucsi/cros_ec_ucsi.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

