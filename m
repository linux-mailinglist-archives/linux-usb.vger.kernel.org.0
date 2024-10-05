Return-Path: <linux-usb+bounces-15758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D61C2991511
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 09:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4051C21BD0
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 07:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C41136337;
	Sat,  5 Oct 2024 07:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvV1/0DA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECC526296
	for <linux-usb@vger.kernel.org>; Sat,  5 Oct 2024 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728113166; cv=none; b=fjG9txtcWY77qlQ3pMPMRs2VDWFU/UKyec4ZmurscYtUK/p79FDGxZLbK/9pWNB76XcQ18rshwstkW1mfLQT/5d9F6GxUmX5yTC1dp+EuoejObxXvNINSNLm1cHiKvN+R+shYl8n6/xd5cRpoSxe4fHNBgV9NBhTjt/UTmjTvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728113166; c=relaxed/simple;
	bh=BXom0R4HZ+jbjvMGJfsUEpflm5rY+ggC/lLjNUK3miM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGyQKkwoMDH0VOW6h2fFe7pXlaVlY+KSrr3jjPLNd89WltO/37ZXnerYaGvfu2ZwBmnbg/a0jfw7C96cI2G9QXhKcWsqfdUmuoRJhTbO9D0SzaZFlMaMxg6W8lUxniThQikz904rPMljk4DOTWdEgMkhttLrzO0QUrhE15lUbVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvV1/0DA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728113165; x=1759649165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BXom0R4HZ+jbjvMGJfsUEpflm5rY+ggC/lLjNUK3miM=;
  b=WvV1/0DAl8mn8M7VOcib96+SGZ90Jr0846GyebS0Ic7+SLBLp9egHEIP
   x5ELIDJBdkk7N7ewgOshU5iDNunIgofSiYvVxf+VD77ah6yYcd/ClFdXg
   yp/93mOXifD+WarzVXIxtCS2qldZkno7IsclTCgoDziGP9sz3B/vvh79T
   mtF/ffo/B3NNjFgjIAerDEp6BgMuvka6FlJCOivFLV73b3gijNQ4A5ImT
   LB9qO4wKw5PUcOIdxEYvjPR26TRZoujhTOUtmDFqEeg3801bxu4YWenS7
   OZyclDuM373PBW2UKqS4UkLmojOeqHWvmWsdnDfGckfdqJ7tA4HrmjYNz
   Q==;
X-CSE-ConnectionGUID: RqywkqcCQyWmiHvztHhbSQ==
X-CSE-MsgGUID: nqbXUFa9QA+Ye4nMjXuzwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27465813"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27465813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 00:26:04 -0700
X-CSE-ConnectionGUID: XVXvkuxgSIKSVKcvkJweXw==
X-CSE-MsgGUID: lVpH3bD4Tfy0cFdpE9/lTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="112398313"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2024 00:26:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzAt-0002jo-1n;
	Sat, 05 Oct 2024 07:25:59 +0000
Date: Sat, 5 Oct 2024 15:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
Message-ID: <202410051504.tccjB1Cp-lkp@intel.com>
References: <20241004140440.1882311-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004140440.1882311-3-heikki.krogerus@linux.intel.com>

Hi Heikki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/usb-typec-Add-attribute-file-showing-the-USB-Modes-of-the-partner/20241004-230547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20241004140440.1882311-3-heikki.krogerus%40linux.intel.com
patch subject: [PATCH v1 2/4] usb: typec: Add attribute file showing the USB Modes of the partner
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241005/202410051504.tccjB1Cp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051504.tccjB1Cp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051504.tccjB1Cp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/class.c:630: warning: Function parameter or struct member 'usb_mode' not described in 'typec_partner_set_usb_mode'
>> drivers/usb/typec/class.c:630: warning: Excess function parameter 'mode' description in 'typec_partner_set_usb_mode'


vim +630 drivers/usb/typec/class.c

   620	
   621	/**
   622	 * typec_partner_set_usb_mode - Assign active USB Mode for the partner
   623	 * @partner: USB Type-C partner
   624	 * @mode: USB Mode (USB2, USB3 or USB4)
   625	 *
   626	 * The port drivers can use this function to assign the active USB Mode to
   627	 * @partner. The USB Mode can change for example due to Data Reset.
   628	 */
   629	void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_mode usb_mode)
 > 630	{
   631		if (!partner || partner->usb_mode == usb_mode)
   632			return;
   633	
   634		partner->usb_capability |= BIT(usb_mode - 1);
   635		partner->usb_mode = usb_mode;
   636		sysfs_notify(&partner->dev.kobj, NULL, "usb_mode");
   637	}
   638	EXPORT_SYMBOL_GPL(typec_partner_set_usb_mode);
   639	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

