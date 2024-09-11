Return-Path: <linux-usb+bounces-14953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C75BA9754E6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 16:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04FEEB278F4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 14:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AB5190671;
	Wed, 11 Sep 2024 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzYgItTM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8887E583
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726063262; cv=none; b=Z52Vq/6x0vdNU8k2PlTzs7xdi+HUsMNs/lyKq2QquwgO5K7U7XITU5M1OCspcp34+heXkWcx3FjHgTwFTmj8ie+4mPHkTiBQ+A7bnIukzi+GttZRT4z7iWXJxuwQgYYK1ywxdm0YuwAqXHzs9oQ+jcHLIctsrmKk/R5VHiaYyiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726063262; c=relaxed/simple;
	bh=qN+cH6Xt0cHn3OYrwSWb7ux4N743VnFfarN7TgyzE8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ont7AntVApwHI++jSK/0H5GjQOIuOAPRRamBqEPkk1a4iwJFRrmYXdEb5sfI7XPwFxWTnRcdfuv34ZZhGpgg4xb27CUH7DLhN9KT/HN1qnKwFtq/HR4GY+5cpOp26VHxPRNHruba6YsW++7Rjq+lOWLrlAWp/hUDYAzbi6Exl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzYgItTM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726063260; x=1757599260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qN+cH6Xt0cHn3OYrwSWb7ux4N743VnFfarN7TgyzE8U=;
  b=MzYgItTMcNfH2vw+yhy0A1YdBXB1eaPRBum5lfAfll0EK051mdCB6kom
   EbsbJEbRZHsyk+qs402+LLFzeoLEmSojsFIVC/RSj1sn/+8OKXznA753Z
   trMKOOVWjim+xv8xGeuMtWG6lVP/HdvjaMppm86hxtXNZtSibd4+UXz7Y
   9klZmdcOIoT+/EbO/bZkNFLZN3qUQpLi4qQ2EyETcR/Vs4u4Dr2gWvenp
   S44WtkHvGZcw6pSqfwbWtXGKJ5rtmGPE25N7932v3cGn4UyYGh2ejNDKO
   pQeu7fMwHlAqtI5bVaKXcO7LbkY9pT9kF6kKhnSYOP5las04KfgXQbL1/
   g==;
X-CSE-ConnectionGUID: V+nUKuebSM6FxBeQotqnWg==
X-CSE-MsgGUID: FBFjyRxwR++TxBQUWmYDPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36219564"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="36219564"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:00:59 -0700
X-CSE-ConnectionGUID: vwrrdKfjSIiJr8ux9DJlQg==
X-CSE-MsgGUID: 8D3yFtwMRfqRgJ4Fba3qtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72170008"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2024 07:00:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soNtu-0003fi-1V;
	Wed, 11 Sep 2024 14:00:54 +0000
Date: Wed, 11 Sep 2024 22:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
Message-ID: <202409112121.GHL72j84-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus lee-mfd/for-mfd-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.11-rc7 next-20240910]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ukasz-Bartosik/platform-chrome-Update-ChromeOS-EC-header-for-UCSI/20240910-182729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240910101527.603452-7-ukaszb%40chromium.org
patch subject: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
config: x86_64-randconfig-121-20240911 (https://download.01.org/0day-ci/archive/20240911/202409112121.GHL72j84-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409112121.GHL72j84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112121.GHL72j84-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/cros_ec_ucsi_main.c:178:24: sparse: sparse: symbol 'cros_ucsi_ops' was not declared. Should it be static?

vim +/cros_ucsi_ops +178 drivers/usb/typec/ucsi/cros_ec_ucsi_main.c

ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10  177  
ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10 @178  struct ucsi_operations cros_ucsi_ops = {
ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10  179  	.read_version = cros_ucsi_read_version,
ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10  180  	.read_cci = cros_ucsi_read_cci,
ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10  181  	.read_message_in = cros_ucsi_read_message_in,
ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10  182  	.async_control = cros_ucsi_async_control,
ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10  183  	.sync_control = cros_ucsi_sync_control,
ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10  184  };
ef8d61204d9db5 drivers/usb/typec/ucsi/cros_ec_ucsi.c Pavan Holla 2024-09-10  185  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

