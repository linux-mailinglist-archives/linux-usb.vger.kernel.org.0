Return-Path: <linux-usb+bounces-4106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A274810C09
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 09:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E18CA1F211BC
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 08:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E08A1CABB;
	Wed, 13 Dec 2023 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVYMC1lY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E33B2
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 00:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702455006; x=1733991006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ignz5BgAlWWZlNn5QU5DLY4bYA5XmU6BAPgjMHUuIwA=;
  b=mVYMC1lYQuRs4JwIOv4sK/ox/7oVOEJMyVzp6LsJpAurCqy70a176WI2
   Rb0mBNUA5MUJyfRVHNIke3qYuFhaRGABH1J3ciz4SLwC67esTxlNoEdCL
   HdgI3zHeP3ca9I0gA7MCJv7eJfnxREpHGXHm+g2nDeDlpbq82LZHoQrDZ
   Fpjnbr7OT8kpVZMzR/Ht9WVXncE0nKDbfhraE8CWrZgDRyWCiuoBmf+jJ
   02XPZ7MXyoqVVZG1pcKyIfA+8UBmYaWUXUwi66d+5hFp7Wv/SezISCbsa
   fdKVlCE+TlfFwPUh4AqsZ7sZ7PlQKRRwZqtsJbGDE/Cp1y76Pb3pTzolp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="375083555"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="375083555"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:10:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773861027"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="773861027"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2023 00:10:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDKJU-000KFN-2I;
	Wed, 13 Dec 2023 08:09:54 +0000
Date: Wed, 13 Dec 2023 16:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>,
	Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH] usb: gadget: f_fs: fix fortify warning
Message-ID: <202312131514.x4csSoVu-lkp@intel.com>
References: <20231212112923.61799-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212112923.61799-1-dmantipov@yandex.ru>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/usb-gadget-f_fs-fix-fortify-warning/20231212-193946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231212112923.61799-1-dmantipov%40yandex.ru
patch subject: [PATCH] usb: gadget: f_fs: fix fortify warning
config: x86_64-randconfig-001-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131514.x4csSoVu-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131514.x4csSoVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131514.x4csSoVu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:32:
>> ./usr/include/linux/usb/functionfs.h:76:2: error: expected specifier-qualifier-list before 'struct_group'
      76 |  struct_group(IDs,
         |  ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

