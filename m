Return-Path: <linux-usb+bounces-29940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD81C24596
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 11:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 621D418925B7
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 10:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB2C334395;
	Fri, 31 Oct 2025 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUNwMtp3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0627F759
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904888; cv=none; b=HPV8USt60DIzG8ooRTTIPmXaWP00C6swkJTH+CNpr6AWvqiD5pV51H7h2ITAKsU0BQJkzq4fhgBQ9KE1qmEbqigN9eLehLwUKHRj/tEVBMwfzcq3WXAV/AORnLVOakANaOKLR8KBkeo3SlerDPgcu5aBLewLHk9hDWrWghOwJ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904888; c=relaxed/simple;
	bh=lpRTAu5u96Fl2qSsJAb0TRm4JUAZjs5tGp1K4FEegto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNZ9Q+gr0Lu48v8ACRIiVEu8w5MmtpKY8vGV3oBNN7eiQesQcZm6YUjXWsROMqWGEeEf450xtEgrhTbDAfx6uASaBDWQVRUQk8OGboqudIineJl0WcsGAzO5/skcWZOX9SZPxXI8RBZ3T37mZHlcsAh2OI8w6gwuyifIbLHJ0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUNwMtp3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761904886; x=1793440886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lpRTAu5u96Fl2qSsJAb0TRm4JUAZjs5tGp1K4FEegto=;
  b=KUNwMtp3u8+OQNDJLUja5YxGlMgc/mXV6h+1/eZxApLNwkzdNn5WUzIs
   n28WW9Zut6z2+XSApjwOVCX7nK0EX/j1Pl1SGAutY9XCxP3frfdG3f3Cc
   mLEYjsKDplUHy5Ng9ASAwvmTo0Rbm18hYP0qduJotL45I6zFpbtQ4kVgb
   yCiRcbR9vJHviroWy7uGUcze1e1juKHffPh7EcC461YC7A/Q0/vmJredn
   j5i7bSV8PQoq1t5RPuz7ulLoWr3VA0sbJ898anjajSk72GXOPh/Zfoday
   qWxy0KXunggOiCl5ynnelfzURB05pzwBCkueTCx9sQlFXUbTOuDkCoIg+
   g==;
X-CSE-ConnectionGUID: Kj9Kx+EDS6WHsmxRSBpPMQ==
X-CSE-MsgGUID: CfneyYbzSFeIG5SOux/GSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51636286"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="51636286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:01:04 -0700
X-CSE-ConnectionGUID: GFOAN0ddQXa5pkW0RShgog==
X-CSE-MsgGUID: 2C3OJHvNR5u8/lRtrcy8tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="185887156"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2025 03:01:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vElwJ-000Myg-1C;
	Fri, 31 Oct 2025 10:00:59 +0000
Date: Fri, 31 Oct 2025 17:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
	gustavo@embeddedor.com, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCHv2 1/1] uapi: cdc.h: cleanly provide for more interfaces
 and countries
Message-ID: <202510311740.AvZo1SI1-lkp@intel.com>
References: <20251030132149.2575138-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030132149.2575138-1-oneukum@suse.com>

Hi Oliver,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus staging/staging-testing staging/staging-next staging/staging-linus westeri-thunderbolt/next linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/uapi-cdc-h-cleanly-provide-for-more-interfaces-and-countries/20251030-212514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20251030132149.2575138-1-oneukum%40suse.com
patch subject: [PATCHv2 1/1] uapi: cdc.h: cleanly provide for more interfaces and countries
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251031/202510311740.AvZo1SI1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311740.AvZo1SI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311740.AvZo1SI1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/usb/cdc.h:109:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     109 |                 DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);
         |                 ^~~~~~~~~~~~~~~~~~
   ./usr/include/linux/usb/cdc.h:122:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     122 |                 DECLARE_FLEX_ARRAY(__le16, wCountryCodes);
         |                 ^~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

