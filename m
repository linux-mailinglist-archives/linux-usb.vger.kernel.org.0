Return-Path: <linux-usb+bounces-15597-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 154BA98AC94
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 21:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBE86B2454F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 19:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09130199928;
	Mon, 30 Sep 2024 19:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUK1bbf2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C60A194C92
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727723674; cv=none; b=tFu2Dn4cEGKGQvJ7hLkY49sWjehAxgar/XY76Fgz8VF3mnrRixUzTXz1igToZgUXRW4yiSbKiLk5eBaFaYVH/lf8AiKTmo+6WKq4mkAHxeY8BTXIVAMNuIKu/9MLnRuUQDCt4HJ06Vq/i1Bq/ZtO/V+z82nW8QmHNtTc++M0IzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727723674; c=relaxed/simple;
	bh=OjKUslVUCJ4eU21ADOfxYoAE48haos5MJ2gfkxKDLQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szA4X300RWtqgXq+I+aWtIz+fn0k7kyb3h9Gzkjse8bagNNgwt/FYbE7AnbIJ1CnoWt5z/V1of1hf1sTsUxJv+H9b4UsyxTvlo9gPq7AmhlLMt6OXrBi1bYHe7Do/52tzACqjVW6pXNomhbT4X/sdrllsyUdA9hYWuIaAhHeIWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUK1bbf2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727723672; x=1759259672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OjKUslVUCJ4eU21ADOfxYoAE48haos5MJ2gfkxKDLQg=;
  b=SUK1bbf2hbcmteFb4m5PBpTHki6yzj7PECTPXJaQQVhCz8TitpJftwKn
   tLGt11UCU/MpDvWTnyhIe9g2P0veg+u6SlB255JD5UxyhodfKVvIDJMCP
   +3jg/y8CTC68ebEGkEM0JHZrSDrOJwQwrS0+An381nSBMAaelaT5wNmmY
   h70w1qbTmjmgrauhbw42EkuZeSkqD2PcpaOSgKpCsL4nvis/LpFUyGvIx
   +BviPqsThk5qrabwt8nyFizxeWs8tHdhZq7VgoAp8vmvfgJF2GGtXt2WU
   aOc+/Lk8MMNntp3MY9WOcXd5vHcUVUdYq6HeDkiytFMLXieb/cTxkDDxB
   A==;
X-CSE-ConnectionGUID: /QuO6aIyQuCl+WeXrs/7eg==
X-CSE-MsgGUID: yiERXrS8T5SqOw/zzzIQOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38221381"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="38221381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 12:14:32 -0700
X-CSE-ConnectionGUID: UQ7d0S1SSveaehgf7VyOfQ==
X-CSE-MsgGUID: pJln8eV0RYKfWudq+RGyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73068292"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2024 12:14:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svLqm-000Pnd-2N;
	Mon, 30 Sep 2024 19:14:28 +0000
Date: Tue, 1 Oct 2024 03:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: "mike.seo" <mikeseohyungjin@gmail.com>, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] r8152: Add mac address pass-thru for lg laptops
Message-ID: <202410010249.Gzfm9BQC-lkp@intel.com>
References: <ZvpImQ_8jh5fyorl@mikeseo-0-1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvpImQ_8jh5fyorl@mikeseo-0-1>

Hi mike.seo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.12-rc1 next-20240930]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mike-seo/r8152-Add-mac-address-pass-thru-for-lg-laptops/20240930-144644
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/ZvpImQ_8jh5fyorl%40mikeseo-0-1
patch subject: [PATCH] r8152: Add mac address pass-thru for lg laptops
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241001/202410010249.Gzfm9BQC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010249.Gzfm9BQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010249.Gzfm9BQC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'rtl8152_supports_lg_macpassthru',
       inlined from 'rtl8152_probe_once.isra' at drivers/net/usb/r8152.c:9881:23:
>> drivers/net/usb/r8152.c:9800:14: warning: argument 2 null where non-null expected [-Wnonnull]
    9800 |         if (!strncmp("LG Electronics", board, sizeof("LG Electronics"))) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/r8152.c:9800:14: note: in a call to built-in function '__builtin_strcmp'


vim +9800 drivers/net/usb/r8152.c

  9793	
  9794	static bool rtl8152_supports_lg_macpassthru(struct usb_device *udev)
  9795	{
  9796		int product_id = le16_to_cpu(udev->descriptor.idProduct);
  9797		int vendor_id = le16_to_cpu(udev->descriptor.idVendor);
  9798		const char *board = dmi_get_system_info(DMI_BOARD_VENDOR);
  9799	
> 9800		if (!strncmp("LG Electronics", board, sizeof("LG Electronics"))) {
  9801			if (vendor_id == VENDOR_ID_REALTEK && product_id == 0x8153)
  9802				return 1;
  9803		}
  9804		return 0;
  9805	}
  9806	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

