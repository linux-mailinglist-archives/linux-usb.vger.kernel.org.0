Return-Path: <linux-usb+bounces-23404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D4A9A95A
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 12:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88C097A3F28
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 10:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFE721FF35;
	Thu, 24 Apr 2025 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpF0JIIX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5511F4617
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489100; cv=none; b=hhfluxjeoQeh8ATUD1okmXJfDmKS0TCWUR4P2WKWmMUs9bA/tK3MUOM3Dcw7HeM9D+Y3s8i2NOYmeKEgwROxKdjpeOpkeHJS7V10k3sc+QNX5gRcp7hDAXSlOmpQXgVwNfgsXa7TXSZFY7w82E8cdTJnfqiEsuwxHa9vboxlmm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489100; c=relaxed/simple;
	bh=LhUwtsAphbQLajTaX7YQnixZHP29lafMuSWHj/hbX4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ah4izK4YeQ1vUVTLTXarCwFgIaEcqoeQelllDhP/IsBxRkJAGlf44sJ9U0Nw93GckvkN6CPYXMdcilH6ZUwF0q0iRUk7/Hg8Eu+piKd1XqSvYPnKMMhUG/riDdkcnNpR99PKrEEYlR52PNci5LVNRw5mUnyPjLEx589dlUubGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpF0JIIX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745489098; x=1777025098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LhUwtsAphbQLajTaX7YQnixZHP29lafMuSWHj/hbX4Q=;
  b=OpF0JIIXBRiNKyI5HmkXDWJ83sWEl9zKvjwAVA0TgxnzHWXHLFAnPn0R
   6Rrt0yOKrQQGIuc4vmqGI2Whzwod1e0eaFc+t2LLS6csKNrBcVnr7OxtR
   QjdTQdp+SiPpVFUNB+Ved/onYDysuVqu1dDkdfrhi73GI7kmGWYVTe/Xv
   UX5Q75xpfB+OSbJmAuYxJNMqu7i2KHFT28sLG51NsRKJZxJ3co+23S46u
   Skq+tt0dQw2cE/mNUTOZQYd6j9mEhaBPB/NL/1grvPpquHpUO/Dtxd977
   /H1ZgFmTaThOWTrIiAzyBCMkCZuTR8Blpw1dhdCXgJtFEFYuwajvPflC6
   Q==;
X-CSE-ConnectionGUID: zZHYsdYSRqiRjoN06FTrCg==
X-CSE-MsgGUID: +Ca6Ox9pQ1OBvTbBUrR/Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46997351"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="46997351"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:04:57 -0700
X-CSE-ConnectionGUID: BKRnWp2BQ2OqM+wMW8fKpQ==
X-CSE-MsgGUID: 9Nqu/yUVRzy1e+IWo6xo/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="133089034"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Apr 2025 03:04:55 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7tRt-00044L-0M;
	Thu, 24 Apr 2025 10:04:53 +0000
Date: Thu, 24 Apr 2025 18:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Rui Miguel Silva <rui.silva@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v1] usb: isp1760: increase buffer size to avoid overflow
Message-ID: <202504241715.9VNxWTQq-lkp@intel.com>
References: <20250423111040.GC857@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423111040.GC857@altlinux.org>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-V-Vissarionov/usb-isp1760-increase-buffer-size-to-avoid-overflow/20250423-191222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250423111040.GC857%40altlinux.org
patch subject: [PATCH v1] usb: isp1760: increase buffer size to avoid overflow
config: i386-buildonly-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504241715.9VNxWTQq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241715.9VNxWTQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241715.9VNxWTQq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/isp1760/isp1760-hcd.h:8,
                    from drivers/usb/isp1760/isp1760-core.h:21,
                    from drivers/usb/isp1760/isp1760-udc.c:22:
>> drivers/usb/isp1760/isp1760-regs.h:271:23: warning: comparison between 'enum isp176x_device_controller_fields' and 'enum isp176x_host_controller_fields' [-Wenum-compare]
     271 |         (DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
         |                       ^
   drivers/usb/isp1760/isp1760-hcd.h:53:41: note: in expansion of macro 'DC_HC_FIELD_MAX'
      53 |         struct regmap_field     *fields[DC_HC_FIELD_MAX];
         |                                         ^~~~~~~~~~~~~~~
>> drivers/usb/isp1760/isp1760-regs.h:271:23: warning: comparison between 'enum isp176x_device_controller_fields' and 'enum isp176x_host_controller_fields' [-Wenum-compare]
     271 |         (DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
         |                       ^
   drivers/usb/isp1760/isp1760-udc.h:72:37: note: in expansion of macro 'DC_HC_FIELD_MAX'
      72 |         struct regmap_field *fields[DC_HC_FIELD_MAX];
         |                                     ^~~~~~~~~~~~~~~


vim +271 drivers/usb/isp1760/isp1760-regs.h

   269	
   270	#define	DC_HC_FIELD_MAX	\
 > 271		(DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

