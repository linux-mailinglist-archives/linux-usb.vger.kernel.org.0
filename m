Return-Path: <linux-usb+bounces-5040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CF82D30F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 03:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61A612814CE
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 02:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A31F17CD;
	Mon, 15 Jan 2024 02:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llTkPPSF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E08D15BB
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 02:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705284812; x=1736820812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fm9i5TogIdhWQ/36IgxPmKZxyiRSWG/Q28sJZ6BBpLQ=;
  b=llTkPPSFA9YlHvxystLDssmYqqKkyY9pPjsxqLQU/Sq4ujUDUQy35Fy7
   fSo4m+1OA2359UGA6Lh5Ao+VotBwusELixHX4recEeQAOuAUJj2v8l8aw
   0JNBDnhV+pn3DSVhUer9q44WV1GL8/jYutpA6kImaP0gmBXUGZbZMHoF4
   9HcnYL38tS0D0q/xg8J+8jm33YTn1Ox6mdEe1dgYPVTa7l83BAYdiOGlh
   yRzEpyFh333mYWGPESKcfxxrGj3HE2MKsLIeKvRC/FSOGMv2z5ePSXtLg
   LxiulY9DNQSM5QTA4ylAbd3PKOVhQL7hYGYqIzUgncER4kjIPCPXTVTW7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403280542"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="403280542"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 18:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="926981145"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="926981145"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2024 18:13:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPCTZ-000C1I-0p;
	Mon, 15 Jan 2024 02:13:22 +0000
Date: Mon, 15 Jan 2024 10:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
	benjamin.tissoires@redhat.com, hdegoede@redhat.com,
	ivan.orlov0322@gmail.com, heikki.krogerus@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <202401151012.Dzvmty7a-lkp@intel.com>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112080108.1147450-1-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus hid/for-next westeri-thunderbolt/next linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/usb-roles-try-to-get-put-all-relevant-modules/20240112-155735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240112080108.1147450-1-xu.yang_2%40nxp.com
patch subject: [PATCH] usb: roles: try to get/put all relevant modules
config: i386-randconfig-061-20240115 (https://download.01.org/0day-ci/archive/20240115/202401151012.Dzvmty7a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151012.Dzvmty7a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151012.Dzvmty7a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/roles/class.c:37:6: sparse: sparse: symbol 'usb_role_switch_get_modules' was not declared. Should it be static?
>> drivers/usb/roles/class.c:46:6: sparse: sparse: symbol 'usb_role_switch_put_modules' was not declared. Should it be static?

vim +/usb_role_switch_get_modules +37 drivers/usb/roles/class.c

    36	
  > 37	void usb_role_switch_get_modules(struct device *dev)
    38	{
    39		while (dev) {
    40			if (dev->driver)
    41				WARN_ON(!try_module_get(dev->driver->owner));
    42			dev = dev->parent;
    43		}
    44	}
    45	
  > 46	void usb_role_switch_put_modules(struct device *dev)
    47	{
    48		while (dev) {
    49			if (dev->driver)
    50				module_put(dev->driver->owner);
    51			dev = dev->parent;
    52		}
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

